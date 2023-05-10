import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/Search/presentation/views/search_view.dart';
import 'package:bookly_app/features/home/data/models/bookmodel/bookmodel.dart';
import 'package:bookly_app/features/home/data/repos/Home_implementation.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/Splash/presentation/splash.dart';
import '../../features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';

abstract class AppRouter {
  static const KbookDetailsView = '/bookdetailsView';
  static const KsearchView = '/searchView';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: '/homeView',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: KsearchView,
      builder: (context, state) => const SeaarchView(),
    ),
    GoRoute(
      path: KbookDetailsView,
      builder: (context, state) => BlocProvider(
        create: (context) => SimilarBooksCubit(
          getIt.get<HomeImplementation>(),
        ),
        child: BookDetailsView(
          bookModel: state.extra as Bookmodel,
        ),
      ),
    )
  ]);
}
