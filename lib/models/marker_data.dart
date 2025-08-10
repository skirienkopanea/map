class MarkerData {
  final int id;
  final String name;
  final String? wpName;
  final String address;
  final double latitude;
  final double longitude;
  final int subCategoryId;
  final int categoryId;
  final String categorySlug;
  final String? description;
  final String? website;
  final String? picture;
  final String? googleMapsUrl;
  final String? email;
  final String? phone;
  final String? openingHours;
  final double? averageScore;
  final int? totalReviews;

  MarkerData({
    required this.id,
    required this.name,
    this.wpName,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.subCategoryId,
    required this.categoryId,
    required this.categorySlug,
    this.description,
    this.website,
    this.picture,
    this.googleMapsUrl,
    this.email,
    this.phone,
    this.openingHours,
    this.averageScore,
    this.totalReviews,
  });

  factory MarkerData.fromJson(Map<String, dynamic> json) {
    return MarkerData(
      id: json['id'],
      name: json['name'],
      wpName: json['wp_user_login'],
      address: json['address'],
      latitude: double.parse(json['latitude'].toString()),
      longitude: double.parse(json['longitude'].toString()),
      subCategoryId: json['subcategory_id'] ?? 0,
      categoryId: json['category_id'] ?? 0,
      categorySlug: json['category_slug'] ?? '',
      description: json['description'],
      website: json['website'],
      picture: json['picture'],
      googleMapsUrl: json['google_maps_url'],
      email: json['email'],
      phone: json['phone'],
      openingHours: json['opening_hours'],
      averageScore: json['average_score'] != null
          ? double.tryParse(json['average_score'].toString())
          : null,
      totalReviews: json['total_reviews'],
    );
  }
}
