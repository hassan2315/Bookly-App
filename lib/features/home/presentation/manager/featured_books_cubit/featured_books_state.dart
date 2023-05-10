import 'package:bookly_app/features/home/data/models/bookmodel/bookmodel.dart';
import 'package:equatable/equatable.dart';

abstract class FeaturedBookState extends Equatable {
  const FeaturedBookState();
  @override
  List<Object> get props => [];
}

class FeaturedBooksInitial extends FeaturedBookState {}

class FeaturedBooksLoading extends FeaturedBookState {}

class FeaturedBooksFailure extends FeaturedBookState {
  final String errMessage;
  const FeaturedBooksFailure(this.errMessage);
}

class FeaturedBooksSucess extends FeaturedBookState {
  final List<Bookmodel> books;
  const FeaturedBooksSucess(this.books);
}
