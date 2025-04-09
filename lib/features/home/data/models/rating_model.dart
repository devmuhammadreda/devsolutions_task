import '../../domain/entities/rating_entity.dart';

class RatingModel {
  double? rate;
  int? count;

  RatingModel({this.rate, this.count});

  RatingModel.fromJson(Map<String, dynamic> json) {
    if (json["rate"] is num) {
      rate = (json["rate"] as num).toDouble();
    }
    if (json["count"] is num) {
      count = (json["count"] as num).toInt();
    }
  }

  static List<RatingModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(RatingModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["rate"] = rate;
    _data["count"] = count;
    return _data;
  }

  RatingEntity toEntity() => RatingEntity(
        rate: rate,
        count: count,
      );

  RatingModel.fromEntity(RatingEntity entity)
      : rate = entity.rate,
        count = entity.count;
}