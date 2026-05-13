import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../summary.dart';
import '../view_models/ArticleCubit.dart';
import 'ArticlePage.dart';

class ArticleView extends StatefulWidget {
  const ArticleView({super.key});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  void initState() {
    super.initState();
    context.read<ArticleCubit>().getNewArticle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wikipedia"),
      ),
      body: Center(
        child: BlocBuilder<ArticleCubit, Summary?>(
          builder: (context, summary) {
            if (summary == null) {
              return const CircularProgressIndicator();
            }

            return ArticlePage(
              summary: summary,
              nextArticle: () {
                context.read<ArticleCubit>().getNewArticle();
              },
            );
          },
        ),
      ),
    );
  }
}