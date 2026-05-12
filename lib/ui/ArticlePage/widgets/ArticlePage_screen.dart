import 'package:flutter/material.dart';

import '../../../summary.dart';
import '../../../data/Repository/RandomArticleRepository.dart';
import '../view_models/ArticleViewModel.dart';
import 'ArticlePage.dart';

class ArticleView extends StatefulWidget {
  const ArticleView({super.key});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final viewModel = ArticleViewModel(RandomArticleRepository());

  @override
  void initState() {
    super.initState();
    viewModel.fetchArticle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wikipedia"),
      ),
      body: Center(
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, _) {
            return switch ((
              viewModel.isLoading,
              viewModel.summary,
              viewModel.error,
            )) {
              (true, _, _) => const CircularProgressIndicator(),

              (_, _, Exception e) => Text("Error: $e"),

              (_, Summary summary, _) => ArticlePage(
                  summary: summary,
                  nextArticle: viewModel.fetchArticle,
                ),

              _ => const Text("Something went wrong"),
            };
          },
        ),
      ),
    );
  }
}