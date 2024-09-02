// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UsersAdapter extends TypeAdapter<Users> {
  @override
  final int typeId = 1;

  @override
  Users read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Users(
      id: fields[0] as String,
      name: fields[1] as String,
      family: fields[2] as String,
      numberPhone: fields[3] as String,
      medinaRoom: fields[4] as String,
      meccaRoom: fields[5] as String,
      busNumber: fields[6] as String,
      description: fields[7] as String,
      imagePath: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Users obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.family)
      ..writeByte(3)
      ..write(obj.numberPhone)
      ..writeByte(4)
      ..write(obj.medinaRoom)
      ..writeByte(5)
      ..write(obj.meccaRoom)
      ..writeByte(6)
      ..write(obj.busNumber)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.imagePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
