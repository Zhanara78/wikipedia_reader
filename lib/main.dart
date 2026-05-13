import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/Repository/RandomArticleRepository.dart';
import 'ui/ArticlePage/view_models/ArticleCubit.dart';
import 'ui/ArticlePage/widgets/ArticlePage_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ArticleCubit(
          RandomArticleRepository(),
        ),
        child: const ArticleView(),
      ),
    );
  }
}