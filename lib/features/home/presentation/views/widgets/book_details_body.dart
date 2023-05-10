import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/bookmodel/bookmodel.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_list_view.dart';
import 'package:flutter/material.dart';

import 'books_action.dart';
import 'books_list_view.dart';
import 'custom_book_details.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key, required this.book});
  final Bookmodel book;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const CustomBookDetails(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * .2),
                  child: CustomListView(
                      imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? ''),
                ),
                const SizedBox(
                  height: 43,
                ),
                Text(
                  book.volumeInfo.title!,
                  style:
                      Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 8,
                ),
                Opacity(
                  opacity: .7,
                  child: Text(
                    book.volumeInfo.authors![0],
                    style: Styles.textStyle18.copyWith(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                BookRating(
                  rating: book.volumeInfo.averageRating ?? 0,
                  count: book.volumeInfo.ratingsCount ?? 0,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                const SizedBox(
                  height: 37,
                ),
                BooksAction(
                  bookmodel: book,
                ),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'You can also Like',
                    style: Styles.textStyle14
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const BooksListView(),
                const SizedBox(height: 20)
              ],
            ),
          ),
        )
      ],
    );
  }
}
