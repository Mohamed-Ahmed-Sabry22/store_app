class ProductModel {
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String image;
  final RatingModel? rating;
  final String category;

  ProductModel({
    required this.id,
    required this.description,
    required this.image,
    required this.price,
    required this.title,
    this.rating,
    required this.category,
  });

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      description: jsonData['description'],
      image: jsonData['image'],
      price: (jsonData['price'] as num).toDouble(),
      title: jsonData['title'],
      category: jsonData['category'],
      rating: jsonData['rating'] != null
          ? RatingModel.fromJson(jsonData['rating'])
          : null,
    );
  }
}

class RatingModel {
  final double rate;
  final int count;
  RatingModel({required this.count, required this.rate});

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
      count: jsonData['count'],
      rate: (jsonData['rate'] as num).toDouble(),
    );
  }
}
