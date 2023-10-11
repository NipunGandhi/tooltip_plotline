// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tooltip_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomToolTipParamsAdapter extends TypeAdapter<CustomToolTipParams> {
  @override
  final int typeId = 1;

  @override
  CustomToolTipParams read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomToolTipParams(
      message: fields[0] as String,
      imageURL: fields[1] as String?,
      imageRadius: fields[2] as double?,
      gap: fields[11] as double?,
      width: fields[7] as double,
      padding: fields[8] as EdgeInsets,
      textSize: fields[3] as double,
      textColor: fields[4] as String,
      bgColor: fields[5] as String,
      radius: fields[6] as double,
      arrowWidth: fields[9] as double,
      arrowHeight: fields[10] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CustomToolTipParams obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.message)
      ..writeByte(1)
      ..write(obj.imageURL)
      ..writeByte(2)
      ..write(obj.imageRadius)
      ..writeByte(3)
      ..write(obj.textSize)
      ..writeByte(4)
      ..write(obj.textColor)
      ..writeByte(5)
      ..write(obj.bgColor)
      ..writeByte(6)
      ..write(obj.radius)
      ..writeByte(7)
      ..write(obj.width)
      ..writeByte(8)
      ..write(obj.padding)
      ..writeByte(9)
      ..write(obj.arrowWidth)
      ..writeByte(10)
      ..write(obj.arrowHeight)
      ..writeByte(11)
      ..write(obj.gap);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomToolTipParamsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
