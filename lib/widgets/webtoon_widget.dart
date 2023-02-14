import 'package:flutter/material.dart';
import 'package:webtoom/models/webtoon_model.dart';

class Webtoon extends StatelessWidget {
  const Webtoon({
    Key? key,
    required this.webtoon,
  }) : super(key: key);

  final WebtoonModel webtoon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 250,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 15,
                offset: Offset(10, 10),
                color: Colors.black.withOpacity(0.5),
              ),
            ],
          ),
          child: Image.network(webtoon.thumb),
        ),
        SizedBox(height: 10),
        Text(
          webtoon.title,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
