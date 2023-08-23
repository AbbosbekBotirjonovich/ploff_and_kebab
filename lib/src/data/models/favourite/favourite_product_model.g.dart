// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavouriteProductModelAdapter extends TypeAdapter<FavouriteProductModel> {
  @override
  final int typeId = 0;

  @override
  FavouriteProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavouriteProductModel(
      id: fields[0] as String?,
      image: fields[1] as String?,
      title: fields[2] as FavouriteDescription?,
      description: fields[3] as FavouriteDescription?,
      price: fields[4] as int?,
      outPrice: fields[5] as int?,
      count: fields[6] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, FavouriteProductModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.outPrice)
      ..writeByte(6)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavouriteProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FavouriteDescriptionAdapter extends TypeAdapter<FavouriteDescription> {
  @override
  final int typeId = 1;

  @override
  FavouriteDescription read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavouriteDescription(
      uz: fields[0] as String?,
      ru: fields[1] as String?,
      en: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FavouriteDescription obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.uz)
      ..writeByte(1)
      ..write(obj.ru)
      ..writeByte(2)
      ..write(obj.en);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavouriteDescriptionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
