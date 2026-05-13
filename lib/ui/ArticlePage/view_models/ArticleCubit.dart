import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../summary.dart';
import '../../../data/Repository/RandomArticleRepository.dart';

class ArticleCubit extends Cubit<Summary?> {
  final RandomArticleRepository repo;

  ArticleCubit(this.repo) : super(null);

  Future<void> getNewArticle() async {
    final summary = await repo.getRandomArticle();
    emit(summary);
  }
}