
import 'package:flutter/material.dart';
import 'package:notehive/constant/constant.dart';
import 'package:notehive/helper/colors_list.dart';
import 'package:notehive/model/note_model.dart';

class EditNoteColorsList extends StatefulWidget {
  const EditNoteColorsList({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
  late int currentColor;
  @override
  void initState() {
    currentColor = colors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        itemExtent: 100,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            currentColor = index;
            widget.note.color = colors[index].value;
            setState(() {});
          },
          child: BuildColor(
            selectColor: currentColor == index ? true : false,
            color: colors[index],
          ),
        ),
        itemCount: 5,
      ),
    );
  }
}
