import 'package:bookly_app/features/home/data/models/bookmodel/bookmodel.dart';
import 'package:equatable/equatable.dart';

abstract class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

class SimilarBooksInitial extends SimilarBooksState {}

class SimilarBooksFailure extends SimilarBooksState {
  final String errMessage;

  const SimilarBooksFailure(this.errMessage);
}

class SimilarBooksSuccess extends SimilarBooksState {
  final List<Bookmodel> books;

  const SimilarBooksSuccess(this.books);
}

class SimilarBooksLoading extends SimilarBooksState {}
