import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notehive/model/note_model.dart';
import 'package:notehive/observer.dart';
import 'package:notehive/router/router.dart';
import 'package:notehive/theme/apptheme.dart';
import 'package:notehive/views/home/manager/read_notes_cubit.dart';

import 'constant/constant.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = MyBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(hiveBox);
  runApp(const TodayTasks());
}

class TodayTasks extends StatelessWidget {
  const TodayTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReadNotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        onGenerateRoute: AppRouter.generatRoute,
      ),
    );
  }
}
