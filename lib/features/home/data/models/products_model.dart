import '../../domain/entities/product_entity.dart';
import 'rating_model.dart';

class ProductsModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  RatingModel? rating;

  ProductsModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  ProductsModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is num) {
      id = (json["id"] as num).toInt();
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["price"] is num) {
      price = (json["price"] as num).toDouble();
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["category"] is String) {
      category = json["category"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["rating"] is Map) {
      rating =
          json["rating"] == null ? null : RatingModel.fromJson(json["rating"]);
    }
  }

  static List<ProductsModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(ProductsModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["price"] = price;
    _data["description"] = description;
    _data["category"] = category;
    _data["image"] = image;
    if (rating != null) {
      _data["rating"] = rating?.toJson();
    }
    return _data;
  }

  ProductEntity toEntity() => ProductEntity(
    id: id,
    title: title,
    price: price,
    description: description,
    category: category,
    image: image,
    rating: rating?.toEntity(),
  );

  ProductsModel.fromEntity(ProductEntity entity)
    : id = entity.id,
      title = entity.title,
      price = entity.price,
      description = entity.description,
      category = entity.category,
      image = entity.image,
      rating =
          entity.rating != null ? RatingModel.fromEntity(entity.rating!) : null;
}
