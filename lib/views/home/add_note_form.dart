import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notehive/views/home/manager/add_note_cubit.dart';
import 'package:notehive/views/home/manager/add_note_state.dart';

import 'package:notehive/widgets/custom_button.dart';
import 'package:notehive/widgets/custom_textfiled.dart';

class AddNoteForm extends StatelessWidget {
  const AddNoteForm({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<AddNoteCubit>(context);
    return Form(
      key: bloc.formKey,
      autovalidateMode: bloc.autovalidateMode,
      child: Column(
        children: [
          CustomTextFiled(
            hintText: 'enter task title',
            type: 'title',
            onSaved: (value) {
              bloc.title = value;
            },
            inputType: TextInputType.name,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFiled(
            hintText: 'enter task description',
            type: 'description',
            onSaved: (value) {
              bloc.description = value;
            },
            maxLines: 5,
            inputType: TextInputType.name,
          ),
          const SizedBox(
            height: 30,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                  isLoading: state is AddNoteLoadingState ? true:false,
                  type: 'Add Task',
                  function: () {
                    bloc.checkForm();
                  });
            },
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
