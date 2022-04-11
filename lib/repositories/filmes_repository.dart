import 'package:get/get.dart';
import 'package:infinite_scroll/models/filme_model.dart';

class FilmesRepository extends GetConnect {
  Future<List<FilmeModel>> findByPage(int page) async {
    final response = await get(
        'https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=e9c398e4760352cb1163131e5fae3715&page=$page');

    if (response.hasError) {
      throw Exception();
    }

    return response.body['results']
        .map<FilmeModel>((f) => FilmeModel.fromMap(f))
        .toList();
  }
}
