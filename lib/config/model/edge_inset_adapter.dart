import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class EdgeInsetsAdapter extends TypeAdapter<EdgeInsets> {
  @override
  final typeId = 3;

  @override
  EdgeInsets read(BinaryReader reader) {
    final top = reader.readDouble();
    final left = reader.readDouble();
    final bottom = reader.readDouble();
    final right = reader.readDouble();
    return EdgeInsets.fromLTRB(left, top, right, bottom);
  }

  @override
  void write(BinaryWriter writer, EdgeInsets value) {
    writer.writeDouble(value.top);
    writer.writeDouble(value.left);
    writer.writeDouble(value.bottom);
    writer.writeDouble(value.right);
  }

}
