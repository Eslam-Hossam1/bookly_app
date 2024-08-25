import 'package:bookly_app/Features/search/data/repos/search_repo_impl.dart';
import 'package:bookly_app/Features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_rebo_impl.dart';
import 'package:bookly_app/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/Features/home/presentation/views/home_view.dart';
import 'package:bookly_app/Features/search/presentation/views/search_view.dart';
import 'package:bookly_app/Features/splash/presentation/views/splash_view.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kHomeView = "/homeview";
  static const String kDetailsView = "/detailsview";
  static const String kSearchView = "/searchview";
  // GoRouter configuration
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchCubit(getIt.get<SearchRepoImpl>()),
          child: const SearchView(),
        ),
      ),
      GoRoute(
        path: kDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeReboImpl>()),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      )
    ],
  );
}
