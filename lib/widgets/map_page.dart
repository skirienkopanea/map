import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../models/category.dart';
import '../models/marker_data.dart';
import '../services/api_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import '../localization/hints.dart';


class MapPage extends StatefulWidget {
  final String? categoryId;
  final String? lang;

  const MapPage({super.key, this.categoryId, this.lang});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final GlobalKey _filterButtonKey = GlobalKey();
  final MapController mapController = MapController();
  List<Category> categories = [];
  List<MarkerData> markers = [];
  Set<int> selectedSubCategoryIds = {};
  bool showFilterBox = true;
  MarkerData? selectedMarker;
  final ScrollController _sidebarScrollController = ScrollController();
  final ScrollController _filterScrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  num filterButtonY = 0;

  @override
void initState() {
  super.initState();

  WidgetsBinding.instance.addPostFrameCallback((_) {
    final RenderBox box = _filterButtonKey.currentContext!.findRenderObject() as RenderBox;
    final Offset position = box.localToGlobal(Offset.zero);
    setState(() {
      filterButtonY = position.dy;
    });
  });



  print('lang from widget: ${widget.lang}');
  loadData();
}


  Future<void> searchMarkers(String searchTerm) async {
    final String languageId = widget.lang ?? WidgetsBinding.instance.platformDispatcher.locale.languageCode;
    final int categoryId = int.tryParse(widget.categoryId ?? '0') ?? 0;

    try {
      final results = await ApiService.searchMarkers(languageId, categoryId, searchTerm);
      setState(() {
        markers = results;
        selectedMarker = null;
      });
    } catch (e) {
      print('Search error: \$e');
    }
  }

  @override
  void dispose() {
    _sidebarScrollController.dispose();
    _filterScrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> loadData() async {
    final String languageId = widget.lang ?? WidgetsBinding.instance.platformDispatcher.locale.languageCode;
    final int categoryId = int.tryParse(widget.categoryId ?? '0') ?? 0;

    
      final fetchedCategories = await ApiService.fetchCategories(languageId, categoryId);
      final fetchedMarkers = await ApiService.fetchMarkers(languageId, categoryId);
      setState(() {
        categories = fetchedCategories;
        selectedSubCategoryIds = categories.map((e) => e.subCategoryId).toSet();
        markers = fetchedMarkers;
      });
    
  }

  @override
  Widget build(BuildContext context) {
    final String languageId = widget.lang ?? WidgetsBinding.instance.platformDispatcher.locale.languageCode;
    final hints = HintTexts.of(languageId);
    print('lang from widget: ${languageId}');

    final filteredMarkers =
        markers
            .where((m) => selectedSubCategoryIds.contains(m.subCategoryId))
            .toList();

    
    


    // Determine screen layout
    final media = MediaQuery.of(context);
    final isWideScreen = media.size.width >= media.size.height;

    double sidebarWidth = isWideScreen ? 340 : media.size.width;
    double? sidebarHeight = isWideScreen ? null : media.size.height * 0.45;



    return Scaffold(
      //appBar: AppBar(title: const Text("🦩 Flamencos.eu - Costa Blanca Guide")),
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: LatLng(38.4, -0.35),
              initialZoom: 9.0,
              minZoom: 8.5,
              initialRotation: 0.0,
              interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
              ),
              cameraConstraint: CameraConstraint.contain(
                bounds: LatLngBounds(
                  LatLng(36.32378, -9.78182),
                  LatLng(42.02022, 6.56696),
                ),
              ),
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png',
                subdomains: const ['a', 'b', 'c'],
                userAgentPackageName: 'com.example.flamencos',
              ),
              MarkerLayer(
                markers:
                    filteredMarkers.map((m) {
                      final category = categories.firstWhere(
                        (cat) => cat.categoryId == m.categoryId,
                        orElse:
                            () =>
                                Category(categoryId: 0, subCategoryId: 0, name: 'Unknown', iconUrl: null),
                      );
                      final iconUrl = category.iconUrl;

                      return Marker(
                        point: LatLng(m.latitude, m.longitude),
                        width: 50,
                        height: 50,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedMarker = m;
                              });
                            },
                            child:
                                (iconUrl != null && iconUrl.isNotEmpty)
                                    ? Image.network(
                                      iconUrl,
                                      width: 50,
                                      height: 50,
                                    )
                                    : const Icon(
                                      Icons.location_on,
                                      color: Colors.red,
                                    ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ],
          ),
          // Credits to CARTO (bottom-left)
          Positioned(
            left: 10,
            bottom: 10,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () async {
                  final url = Uri.parse('https://carto.com/');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    '© CARTO',
                    style: TextStyle(fontSize: 12, color: Colors.black87),
                  ),
                ),
              ),
            ),
          ),
          
/*   
// Top search input
Positioned(
  top: MediaQuery.of(context).padding.top + 10,
  left: isWideScreen && selectedMarker != null ? sidebarWidth + 40 : 10,
  right: 65,
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 14),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: TextField(
  controller: _searchController,
  textInputAction: TextInputAction.search,
  decoration: InputDecoration(
    icon: const Icon(Icons.search),
    hintText: hints.searchHint,
    border: InputBorder.none,
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(vertical: 14),
    suffixIcon: _searchController.text.isNotEmpty
        ? IconButton(
            icon: const Icon(Icons.clear),
            tooltip: 'Clear search',
            onPressed: () {
              _searchController.clear();
              //setState(() {}); // Update UI to hide clear button
              loadData();      // Reset map to all markers
            },
          )
        : null,
  ),
  onSubmitted: (value) {
    if (value.trim().isNotEmpty) {
      searchMarkers(value.trim());
    }
  },
),


  ),
),
*/   
          // Zoom buttons
          Positioned(
  top: MediaQuery.of(context).padding.top + 10,
  right: 10,
  child: Column(
    children: [
      // Zoom In
      FloatingActionButton(
        mini: true,
        heroTag: "zoomIn",
        tooltip: hints.zoomInTooltip,
        onPressed: () {
          final currentZoom = mapController.camera.zoom;
          mapController.move(
            mapController.camera.center,
            currentZoom + 1,
          );
        },
        child: const Icon(Icons.add),
      ),
      const SizedBox(height: 8),

      // Zoom Out
      FloatingActionButton(
        mini: true,
        heroTag: "zoomOut",
        tooltip: hints.zoomOutTooltip,
        onPressed: () {
          final currentZoom = mapController.camera.zoom;
          mapController.move(
            mapController.camera.center,
            currentZoom - 1,
          );
        },
        child: const Icon(Icons.remove),
      ),
      const SizedBox(height: 8),

      // Filter Toggle
      FloatingActionButton(
        key: _filterButtonKey, // ✅ attach the key here
        mini: true,
        heroTag: "filterToggle",
        tooltip: showFilterBox ? hints.hideFilter : hints.showFilter,
        onPressed: () {
          setState(() {
            showFilterBox = !showFilterBox;
          });
        },
        child: Icon(showFilterBox ? Icons.layers_clear : Icons.layers),
      ),
    ],
  ),
),

// final double boxHeight = (categories.length * 48.0) + 38;
// final double buttonBottom = showFilterBox ? boxHeight : 10;

          



          // Category filter box
          if (showFilterBox)
  Positioned(
    right: 10,
    bottom: 10,
    child: LayoutBuilder(
      builder: (context, constraints) {
        //final screenHeight = MediaQuery.of(context).size.height;
        //final double zoomButtonsHeight = 96; // ~40 per button + 8px spacing + margins
        //final double maxFilterHeight = screenHeight - zoomButtonsHeight - 40;

        return SizedBox(
          width: 250,
          child: Card(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height - 40 - 24 - filterButtonY ,
              ),
              child: Scrollbar(
  controller: _filterScrollController,
  thumbVisibility: true,
  child: SingleChildScrollView(
    controller: _filterScrollController,
    padding: const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: categories.map((cat) {
        return CheckboxListTile(
          dense: true,
          controlAffinity: ListTileControlAffinity.leading,
          title: Row(
            children: [
              if (cat.iconUrl != null && cat.iconUrl!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Image.network(
                    cat.iconUrl!,
                    width: 20,
                    height: 20,
                    errorBuilder: (_, __, ___) =>
                        const Icon(Icons.image_not_supported, size: 20),
                  ),
                ),
              Flexible(child: Text(cat.name)),
            ],
          ),
          value: selectedSubCategoryIds.contains(cat.subCategoryId),
          onChanged: (bool? val) {
            setState(() {
              if (val == true) {
                selectedSubCategoryIds.add(cat.subCategoryId);
              } else {
                selectedSubCategoryIds.remove(cat.subCategoryId);
              }
            });
          },
        );
      }).toList(),
    ),
  ),
),

            ),
          ),
        );
      },
    ),
  ),
    // Sidebar
          if (selectedMarker != null)
  Positioned(
    top: isWideScreen ? media.padding.top : null,
    bottom: 0,
    left: isWideScreen ? 0 : null,
    right: isWideScreen ? null : 0,
    height: sidebarHeight,
    width: sidebarWidth,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Scrollbar(
        controller: _sidebarScrollController,
        thumbVisibility: true,
        child: SingleChildScrollView(
          controller: _sidebarScrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
  // Name
  Text(
    selectedMarker!.name,
    style: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  ),

  const SizedBox(height: 10),

  // Picture (customize if you use selectedMarker!.picture)
  Row(
    children: [
      Expanded(
        child: Image.network(
          selectedMarker!.picture?.isNotEmpty == true
              ? selectedMarker!.picture!
              : 'https://app.flamencos.eu/images/markers/default.png',
          fit: BoxFit.contain,
        ),
      ),
    ],
  ),

  const SizedBox(height: 10),



  // Address
  Text(selectedMarker!.address),
  const SizedBox(height: 10),
// Average Score with colored stars
if (selectedMarker!.averageScore != null)
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // ⭐ Star Row
      Row(
        children: [
          Row(
            children: List.generate(5, (index) {
              final score = selectedMarker!.averageScore!;
              if (score >= index + 1) {
                return const Icon(Icons.star, color: Color(0xFF8B0F44), size: 20);
              } else if (score > index && score < index + 1) {
                return const Icon(Icons.star_half, color: Color(0xFF8B0F44), size: 20);
              } else {
                return const Icon(Icons.star_border, color: Color(0xFF8B0F44), size: 20);
              }
            }),
          ),
          const SizedBox(width: 6),
          Text(
            selectedMarker!.averageScore!.toStringAsFixed(1),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF8B0F44),
            ),
          ),
        ],
      ),

      const SizedBox(height: 4),

      // 💬 Reviews link with icon
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () async {
                  final url = 'https://flamencos.eu/$languageId/directories/${selectedMarker!.categorySlug}/${selectedMarker!.wpName}';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
                  }
                },
                child: Text(
                  '${selectedMarker!.totalReviews ?? 0} ${(selectedMarker!.totalReviews ?? 0) == 1 ? hints.review : hints.reviews}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF8B0F44),
                    decoration: TextDecoration.underline,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.open_in_browser, size: 18),
            tooltip: hints.openDirectory,
            onPressed: () async {
              final url = 'https://flamencos.eu/$languageId/directories/${selectedMarker!.categorySlug}/${selectedMarker!.wpName}';
              if (await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
              }
            },
          ),
        ],
      ),
    ],
  )
else
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Flexible(
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () async {
              final url = 'https://flamencos.eu/$languageId/directories/${selectedMarker!.categorySlug}/${selectedMarker!.wpName}';
              if (await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
              }
            },
            child: Text(
              '${0} ${hints.reviews}',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF8B0F44),
                decoration: TextDecoration.underline,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ),
      IconButton(
        icon: const Icon(Icons.open_in_browser, size: 18),
        tooltip: hints.openDirectory,
        onPressed: () async {
          final url = 'https://flamencos.eu/$languageId/directories/${selectedMarker!.categorySlug}/${selectedMarker!.wpName}';
          if (await canLaunchUrl(Uri.parse(url))) {
            await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
          }
        },
      ),
    ],
  ),




  const SizedBox(height: 10),

  if (selectedMarker!.description != null) ...[
    const SizedBox(height: 10),
    Text(selectedMarker!.description!),
  ],



  if (selectedMarker!.openingHours != null) ...[
  const SizedBox(height: 10),
  Text(
    hints.openingHours,
    style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
  ),
  const SizedBox(height: 8),
  Table(
    columnWidths: const {
      0: IntrinsicColumnWidth(), // Weekday column
      1: FlexColumnWidth(),      // Time column
    },
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: () {
      final parts = selectedMarker!.openingHours!.split('|');
      final weekdays = [
        hints.monday, hints.tuesday, hints.wednesday,
        hints.thursday, hints.friday, hints.saturday, hints.sunday
      ];
      return List.generate(weekdays.length, (index) {
        final time = (index < parts.length) ? parts[index].trim() : '-';
        return TableRow(children: [
  Padding(
    padding: const EdgeInsets.only(right: 16.0, top: 4, bottom: 4),
    child: Text(
      weekdays[index],
      style: const TextStyle(fontWeight: FontWeight.w500),
    ),
  ),
  Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Text(time),
  ),
]);

      });
    }(),
  ),
],

if (selectedMarker!.phone != null) ...[
  Row(
  children: [
    const Text('📞'),
    const SizedBox(width: 4),
    Expanded(
      child: GestureDetector(
        onTap: () {
          Clipboard.setData(ClipboardData(text: selectedMarker!.phone!));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(hints.phoneNumberCopied)),
          );
        },
        child: Text(
          selectedMarker!.phone!,
          style: const TextStyle(
            color: Color(0xFF8B0F44),
            //decoration: TextDecoration.underline,
          ),
        ),
      ),
    ),
    IconButton(
      icon: const Icon(Icons.copy, size: 18),
      tooltip: hints.copyPhoneNumber,
      onPressed: () {
        Clipboard.setData(ClipboardData(text: selectedMarker!.phone!));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(hints.phoneNumberCopied)),
        );
      },
    ),
  ],
),
],
if (selectedMarker!.email != null) ...[
Row(
  children: [
    const Text('📧'),
    const SizedBox(width: 4),
    Expanded(
      child: GestureDetector(
        onTap: () {
          Clipboard.setData(ClipboardData(text: selectedMarker!.email!));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(hints.emailCopied)),
          );
        },
        child: Text(
          selectedMarker!.email!,
          style: const TextStyle(
            color: Color(0xFF8B0F44),
            //decoration: TextDecoration.underline,
          ),
        ),
      ),
    ),
    IconButton(
      icon: const Icon(Icons.copy, size: 18),
      tooltip: hints.copyEmail,
      onPressed: () {
        Clipboard.setData(ClipboardData(text: selectedMarker!.email!));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(hints.emailCopied)),
        );
      },
    ),
  ],
),
],
  if (selectedMarker!.website != null) ...[
  const SizedBox(height: 10),
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Row(
          children: [
            const Text('🔗'),
            const SizedBox(width: 4),
            Flexible(
              child: InkWell(
                child: Text(
                  selectedMarker!.website!,
                  style: const TextStyle(color: Color(0xFF8B0F44)),
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () async {
                  final url = selectedMarker!.website!;
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(
                      Uri.parse(url),
                      mode: LaunchMode.externalApplication,
                    );
                  } else {
                    print('Could not launch');
                  }
                },
              ),
            ),
          ],
        ),
      ),
      IconButton(
        icon: const Icon(Icons.open_in_browser, size: 18),
        tooltip: hints.openWebsite,
        onPressed: () async {
          final url = selectedMarker!.website!;
          if (await canLaunchUrl(Uri.parse(url))) {
            await launchUrl(
              Uri.parse(url),
              mode: LaunchMode.externalApplication,
            );
          } else {
            print('Could not launch');
          }
        },
      ),
    ],
  ),
],

  if (selectedMarker!.googleMapsUrl != null) ...[
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          const Text('🧭'),
          const SizedBox(width: 4),
          InkWell(
            child: Text(
              hints.mapsDirections,
              style: TextStyle(color: Color(0xFF8B0F44)),
            ),
            onTap: () async {
              final url = selectedMarker!.googleMapsUrl!;
              if (await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(
                  Uri.parse(url),
                  mode: LaunchMode.externalApplication,
                );
              } else {
                print('Could not launch');
              }
            },
          ),
        ],
      ),
      IconButton(
        icon: const Icon(Icons.map_outlined, size: 18),
        tooltip: hints.openMaps,
        onPressed: () async {
          final url = selectedMarker!.googleMapsUrl!;
          if (await canLaunchUrl(Uri.parse(url))) {
            await launchUrl(
              Uri.parse(url),
              mode: LaunchMode.externalApplication,
            );
          } else {
            print('Could not launch');
          }
        },
      ),
    ],
  ),
],
            ],



          ),
        ),
      ),
    ),
  ),
           if (selectedMarker != null)
  Positioned(
    top: isWideScreen ? media.padding.top + 10 : null,
    bottom: isWideScreen ? null : (sidebarHeight!= null ? sidebarHeight -45 : null),
    left: isWideScreen ? sidebarWidth -45  : null,
    right: isWideScreen ? null : 10,
    child: IconButton(
      icon: const Icon(Icons.close),
      tooltip: "Close details",
      onPressed: () {
        setState(() {
          selectedMarker = null;
        });
      },
    ),
  ),


        ],
      ),
    );
  }
}