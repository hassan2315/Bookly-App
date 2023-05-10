import 'package:bloc/bloc.dart';

import '../../../data/repos/home_repo.dart';
import 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBookState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.errMessage));
    }, (books) {
      emit(FeaturedBooksSucess(books));
    });
  }
}
