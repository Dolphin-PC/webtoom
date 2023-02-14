import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webtoom/models/webtoon_detail_model.dart';
import 'package:webtoom/models/webtoon_episode_model.dart';
import 'package:webtoom/models/webtoon_model.dart';
import 'package:webtoom/services/api_service.dart';
import 'package:webtoom/widgets/episode.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.webtoon}) : super(key: key);

  final WebtoonModel webtoon;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoonDetailInfo;
  late Future<List<WebtoonEpisodeModel>> episodesInfo;

  @override
  void initState() {
    super.initState();
    webtoonDetailInfo = ApiService.getWebtoonById(widget.webtoon.id);
    episodesInfo = ApiService.getLatesEpisodesById(widget.webtoon.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(widget.webtoon.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: widget.webtoon.id,
                  child: Container(
                    width: 250,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 15,
                          offset: const Offset(10, 10),
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ],
                    ),
                    child: Image.network(widget.webtoon.thumb),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
                future: webtoonDetailInfo,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(snapshot.data!.about,
                            style: const TextStyle(fontSize: 18)),
                        const SizedBox(
                          height: 20,
                        ),
                        Text('${snapshot.data!.genre} / ${snapshot.data!.age}',
                            style: const TextStyle(fontSize: 18)),
                      ],
                    );
                  }
                  return const Text('...');
                }),
            const SizedBox(
              height: 50,
            ),
            FutureBuilder(
              future: episodesInfo,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var episode in snapshot.data!) Episode(episode: episode, webtoonId : widget.webtoon.id)
                    ],
                  );
                }
                return Container();
              },
            ),
          ]),
        ),
      ),
    );
  }
}
