import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/models/bookmodel/bookmodel.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Bookmodel>>> fetchNewsetBooks();
  Future<Either<Failure, List<Bookmodel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<Bookmodel>>> fetchSimilarBooks(
      {required String category});
}
