import 'package:hive_ce/hive.dart';

import 'rating_entity.dart';
part 'product_entity.g.dart'; // Ensure this line is present
@HiveType(typeId: 2)
class ProductEntity {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final double? price;
  @HiveField(3)
  final String? description;
  @HiveField(4)
  final String? category;
  @HiveField(5)
  final String? image;
  @HiveField(6)
  final RatingEntity? rating;
  @HiveField(7)
  final bool? isFavorite;

  const ProductEntity({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
    this.isFavorite,
  });

  ProductEntity copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    RatingEntity? rating,
    bool? isFavorite,
  }) => ProductEntity(
    id: id ?? this.id,
    title: title ?? this.title,
    price: price ?? this.price,
    description: description ?? this.description,
    category: category ?? this.category,
    image: image ?? this.image,
    rating: rating ?? this.rating,
    isFavorite: isFavorite ?? this.isFavorite,
  );
}
