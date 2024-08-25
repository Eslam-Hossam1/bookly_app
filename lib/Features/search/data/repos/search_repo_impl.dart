import 'package:bookly_app/Features/search/data/repos/search_repo.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/models/book_model/book_api_response.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;
  const SearchRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks(
      {required String searchText}) async {
    try {
      BookApiResponse bookApiResponse = BookApiResponse.fromJson(
        await apiService.get(
          endpoint:
              "volumes?q=$searchText&filter=free-ebooks&orderBy=relevance&key=AIzaSyDhyTUznXiLfEcJpuRexRWCZkIbygF1h5c",
        ),
      );
      List<BookModel> books = bookApiResponse.books ?? [];
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
