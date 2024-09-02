

import 'package:hive/hive.dart';

part 'users.g.dart';

@HiveType(typeId: 1)
class Users extends HiveObject{

  Users(
      {
        required this.id,
        required this.name,
        required this.family,
        required this.numberPhone,
        required this.medinaRoom,
        required this.meccaRoom,
        required this.busNumber,
        required this.description,
      required this.imagePath});

  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String family;
  @HiveField(3)
  String numberPhone;
  @HiveField(4)
  String  medinaRoom;
  @HiveField(5)
  String  meccaRoom;
  @HiveField(6)
  String  busNumber;
  @HiveField(7)
  String  description;
   @HiveField(8)
  String  imagePath;





}