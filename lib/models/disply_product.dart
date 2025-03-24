class ProductDM {
  final String id;
  final double rating;
  final String name;
  final String slug;
  final String price;
  final String description;
  final String careGuide;
  final String image;
  final int quantity;
  final String category;
  final String createdAt;

  ProductDM({
    required this.id,
    required this.rating,
    required this.name,
    required this.slug,
    required this.price,
    required this.description,
    required this.careGuide,
    required this.image,
    required this.quantity,
    required this.category,
    required this.createdAt,
  });

  factory ProductDM.fromJson(Map<String, dynamic> json) {
    return ProductDM(
      id: json['id'],
      rating: json['rating']?.toDouble() ?? 0.0,
      name: json['name'],
      slug: json['slug'],
      price: json['price'],
      description: json['description'],
      careGuide: json['care_guide'],
      image: json['image'],
      quantity: json['quantity'],
      category: json['category'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rating': rating,
      'name': name,
      'slug': slug,
      'price': price,
      'description': description,
      'care_guide': careGuide,
      'image': image,
      'quantity': quantity,
      'category': category,
      'created_at': createdAt,
    };
  }
}
