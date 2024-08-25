import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchRepo) : super(SearchInitial());
  final SearchRepo _searchRepo;
  Future<void> fetchSearchBook(String searchText) async {
    emit(SearchLoading());
    var result = await _searchRepo.fetchSearchBooks(searchText: searchText);
    result.fold((failure) {
      emit(SearchFailure(failure.errMsg));
    }, (books) {
      emit(SearchSuccess(books));
    });
  }
}
