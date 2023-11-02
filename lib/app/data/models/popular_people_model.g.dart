// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_people_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PopularPeopleAdapter extends TypeAdapter<PopularPeople> {
  @override
  final int typeId = 0;

  @override
  PopularPeople read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PopularPeople(
      adult: fields[0] as bool,
      gender: fields[1] as int,
      id: fields[2] as int,
      knownForDepartment: fields[3] as String,
      name: fields[4] as String,
      originalName: fields[5] as String,
      popularity: fields[6] as double,
      profilePath: fields[7] as String,
      knownFor: (fields[8] as List).cast<KnownFor>(),
    );
  }

  @override
  void write(BinaryWriter writer, PopularPeople obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.gender)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.knownForDepartment)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.originalName)
      ..writeByte(6)
      ..write(obj.popularity)
      ..writeByte(7)
      ..write(obj.profilePath)
      ..writeByte(8)
      ..write(obj.knownFor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PopularPeopleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class KnownForAdapter extends TypeAdapter<KnownFor> {
  @override
  final int typeId = 1;

  @override
  KnownFor read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return KnownFor(
      title: fields[0] as String?,
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, KnownFor obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KnownForAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
