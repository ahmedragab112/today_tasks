import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel extends HiveObject {
  @HiveField(0)
   String title;
  @HiveField(1)
   String descritpion;
  @HiveField(2)
  final String time;
  @HiveField(3)
   int color;
  NoteModel({
    required this.color,
    required this.title,
    required this.descritpion,
    required this.time,
  });
}
