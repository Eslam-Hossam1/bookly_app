import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_rebo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this._homeRepo) : super(FeaturedBooksInitial());
  final HomeRebo _homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await _homeRepo.fetchFeuturedBooks();
    result.fold(
      (failure) {
        emit(FeaturedBooksFailure(failure.errMsg));
      },
      (books) {
        emit(FeaturedBooksSuccess(books));
      },
    );
  }
}
