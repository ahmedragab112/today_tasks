import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:notehive/views/home/add_note_bottomsheet_view.dart';
import 'package:notehive/views/home/manager/add_note_cubit.dart';
import 'package:notehive/views/home/notview.dart';

class HomeNote extends StatelessWidget {
  const HomeNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Today Tasks'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8))),
            builder: (context) =>  BlocProvider(
              create: (context) => AddNoteCubit(),
              child:const BottomSheetBody(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: NoteView(),
    );
  }
}
