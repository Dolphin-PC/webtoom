import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webtoom/models/webtoon_episode_model.dart';

class Episode extends StatelessWidget {
  const Episode({Key? key, required this.episode, required this.webtoonId})
      : super(key: key);

  final WebtoonEpisodeModel episode;
  final String webtoonId;

  onButtonTap() async {
    final url = Uri.parse(
        'https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}');
    await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 260,
                child: Text(
                  episode.title,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                  ),
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.green,
              )
            ],
          ),
        ),
      ),
    );
  }
}
