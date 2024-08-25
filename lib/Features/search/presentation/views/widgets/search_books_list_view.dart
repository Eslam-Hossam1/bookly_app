import 'package:bookly_app/Features/home/presentation/views/widgets/vertical_list_book_item.dart';
import 'package:flutter/material.dart';

class SearchBooksListView extends StatelessWidget {
  const SearchBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        //return const VerticalListBookItem();
        return Text("data");
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 8,
        );
      },
      itemCount: 20,
    );
  }
}
