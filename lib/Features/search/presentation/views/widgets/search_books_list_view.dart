import 'package:bookly_app/Features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';

class SearchBooksListView extends StatelessWidget {
  const SearchBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return const VerticalListBookItem();
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
