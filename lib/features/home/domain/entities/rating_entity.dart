import 'package:hive_ce/hive.dart';
part 'rating_entity.g.dart'; // Ensure this line is present

@HiveType(typeId: 3)
class RatingEntity {
  @HiveField(0)
  final double? rate;
  @HiveField(1)
  final int? count;

  const RatingEntity({this.rate, this.count});

  RatingEntity copyWith({double? rate, int? count}) =>
      RatingEntity(rate: rate ?? this.rate, count: count ?? this.count);
}
