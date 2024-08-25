import 'package:bookly_app/Features/home/presentation/views/widgets/vertical_list_book_item.dart';
import 'package:bookly_app/Features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custome_error_text.dart';
import 'package:bookly_app/core/widgets/custome_loading_indecator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBooksListView extends StatelessWidget {
  const SearchBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          if (state.books.isEmpty) {
            return const Center(
              child: Text(
                "There is no book match that name",
                style: Styles.textStyle18,
              ),
            );
          } else {
            return ListView.separated(
              itemBuilder: (context, index) {
                return VerticalListBookItem(
                  bookModel: state.books[index],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 8,
                );
              },
              itemCount: state.books.length,
            );
          }
        } else if (state is SearchInitial) {
          return const Center(
            child: Text(
              "Search For Books",
              style: Styles.textStyle18,
            ),
          );
        } else if (state is SearchFailure) {
          return CustomeErrorText(
            errMsg: state.errMsg,
          );
        } else {
          return const CustomeLoadingIndecator();
        }
      },
    );
  }
}
