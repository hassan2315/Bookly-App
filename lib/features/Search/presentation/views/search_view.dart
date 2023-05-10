import 'package:bookly_app/features/Search/presentation/views/widgets/search_body.dart';
import 'package:flutter/material.dart';

class SeaarchView extends StatelessWidget {
  const SeaarchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SearchViewBody()),
    );
  }
}
