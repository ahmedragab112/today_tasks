import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notehive/constant/constant.dart';
import 'package:notehive/views/home/manager/add_note_cubit.dart';

class BuildColor extends StatelessWidget {
  const BuildColor({super.key, required this.selectColor, required this.color});
  final bool selectColor;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return selectColor == true
        ? SelectedColor(
            color: color,
          )
        : Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: color,
            ),
          );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentColor = 0;
 
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
            BlocProvider.of<AddNoteCubit>(context).color = colors[index];
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

class SelectedColor extends StatelessWidget {
  const SelectedColor({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: color,
          ),
        ),
        const Icon(
          Icons.check,
          color: Colors.black,
        )
      ],
    );
  }
}
