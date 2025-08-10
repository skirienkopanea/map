class Category {
  final int categoryId;
  final int subCategoryId;
  final String name;
  final String? iconUrl;

  Category({required this.categoryId, required this.subCategoryId, required this.name, this.iconUrl});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        
        categoryId: json['category_id'],
        subCategoryId: json['subcategory_id'],
        name: json['name'],
        iconUrl: json['icon_url'],
      );
}