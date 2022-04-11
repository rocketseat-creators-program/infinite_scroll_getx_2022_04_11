import 'dart:developer';

import 'package:get/get.dart';
import 'package:infinite_scroll/models/filme_model.dart';
import 'package:infinite_scroll/repositories/filmes_repository.dart';

class HomeController extends GetxController with ScrollMixin {
  final _filmeRepository = FilmesRepository();

  final _filmes = <FilmeModel>[].obs;
  final _page = 0.obs;
  final _loading = false.obs;

  List<FilmeModel> get filmes => _filmes;
  bool get loading => _loading.value;

  @override
  void onReady() {
    super.onReady();
    ever<int>(_page, (page) => _findAll(page));
    _page(1);
  }

  Future<void> _findAll(int page) async {
    _loading(true);
    try {
      final filmes = await _filmeRepository.findByPage(page);
      _filmes.addAll(filmes);
    } catch (e, s) {
      log('Erro ao buscar filmes', error: e, stackTrace: s);
    } finally {
      _loading(false);
    }
  }

  @override
  Future<void> onEndScroll() async {
    final nextPage = _page.value + 1;
    _page(nextPage);
  }

  @override
  Future<void> onTopScroll() async {}
}
