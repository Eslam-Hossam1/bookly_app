import 'package:bookly_app/Features/home/presentation/views/widgets/vertical_list_book_item.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/custom_text_field.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/search_books_list_view.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/search_text_field.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 12,
          ),
          SearchTextField(),
          SizedBox(
            height: 16,
          ),
          Text(
            "Search Result",
            style: Styles.textStyle18,
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(child: SearchBooksListView())
        ],
      ),
    );
  }
}
