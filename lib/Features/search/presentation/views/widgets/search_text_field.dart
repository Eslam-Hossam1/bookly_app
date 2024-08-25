import 'package:bookly_app/Features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late TextEditingController textEditingController;
  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomeTextField(
      textEditingController: textEditingController,
      label: "search",
      onSubmitted: (value) {
        BlocProvider.of<SearchCubit>(context).fetchSearchBook(value);
      },
      onPressedIcon: () {
        FocusManager.instance.primaryFocus?.unfocus();

        BlocProvider.of<SearchCubit>(context)
            .fetchSearchBook(textEditingController.text);
      },
    );
  }
}
