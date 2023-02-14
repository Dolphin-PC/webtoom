import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoom/models/webtoon_detail_model.dart';
import 'package:webtoom/models/webtoon_episode_model.dart';
import 'package:webtoom/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodayWebtoon() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(res.body);
      for (var webtoon in webtoons) {
        final toon = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(toon);
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getWebtoonById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final webtoons = jsonDecode(res.body);
      return WebtoonDetailModel.fromJson(webtoons);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatesEpisodesById(String id) async {
    final url = Uri.parse('$baseUrl/$id/episodes');
    final res = await http.get(url);

    if (res.statusCode == 200) {
      List<WebtoonEpisodeModel> episodesInstance = [];
      final episodes = jsonDecode(res.body);
      for (var episode in episodes) {
        episodesInstance.add(WebtoonEpisodeModel.fromJson(episode));
      }

      return episodesInstance;
    }
    throw Error();
  }
}
