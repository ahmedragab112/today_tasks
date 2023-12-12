import 'package:flutter/material.dart';
import 'package:notehive/widgets/note_item.dart';

class NoteView extends StatelessWidget {
  const NoteView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => const NoteItem(
          color: Colors.green,
        ),
        itemCount: 20,
      ),
    );
  }
}
