// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RatingEntityAdapter extends TypeAdapter<RatingEntity> {
  @override
  final int typeId = 3;

  @override
  RatingEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RatingEntity(
      rate: (fields[0] as num?)?.toDouble(),
      count: (fields[1] as num?)?.toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, RatingEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.rate)
      ..writeByte(1)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RatingEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
