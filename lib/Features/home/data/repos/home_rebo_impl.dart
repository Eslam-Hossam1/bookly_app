import 'package:bookly_app/Features/home/data/models/book_model/book_api_response.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_rebo.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

//   "volumes?q=love&filter=free-ebooks&orderBy=newest&key=AIzaSyDhyTUznXiLfEcJpuRexRWCZkIbygF1h5c",

class HomeReboImpl implements HomeRebo {
  final ApiService apiService;

  HomeReboImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      BookApiResponse bookApiResponse = BookApiResponse.fromJson(
        await apiService.get(
          endpoint:
              "volumes?q=subject:health&key=AIzaSyDhyTUznXiLfEcJpuRexRWCZkIbygF1h5c",
        ),
      );
      List<BookModel> books = bookApiResponse.books!;
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeuturedBooks() async {
    try {
      BookApiResponse bookApiResponse = BookApiResponse.fromJson(
        await apiService.get(
          endpoint:
              "volumes?q=subject:sports&filter=free-ebooks&key=AIzaSyDhyTUznXiLfEcJpuRexRWCZkIbygF1h5c",
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

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      BookApiResponse bookApiResponse = BookApiResponse.fromJson(
        await apiService.get(
          endpoint:
              "volumes?q=$category&filter=free-ebooks&orderBy=relevance&key=AIzaSyDhyTUznXiLfEcJpuRexRWCZkIbygF1h5c",
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
