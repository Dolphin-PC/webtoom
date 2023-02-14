import 'package:flutter/material.dart';
import 'package:webtoom/models/webtoon_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.webtoon}) : super(key: key);

  final WebtoonModel webtoon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(webtoon.title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400)),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: webtoon.id,
                  child: Container(
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
                ),
              ],
            )
          ]
        ),
      ),
    );
  }
}
