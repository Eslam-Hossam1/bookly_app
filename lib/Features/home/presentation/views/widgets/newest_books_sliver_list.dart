import 'package:bookly_app/Features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/vertical_list_book_item.dart';
import 'package:bookly_app/core/widgets/custome_error_text.dart';
import 'package:bookly_app/core/widgets/custome_loading_indecator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksSliverList extends StatelessWidget {
  const NewestBooksSliverList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SliverList.separated(
            itemCount: state.books.length,
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
          );
        } else if (state is NewestBooksFailure) {
          return SliverToBoxAdapter(
              child: CustomeErrorText(errMsg: state.errMsg));
        } else {
          return const SliverToBoxAdapter(child: CustomeLoadingIndecator());
        }
      },
    );
  }
}
