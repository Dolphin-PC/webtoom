import 'package:flutter/material.dart';
import 'package:webtoom/services/api_service.dart';
import 'package:webtoom/models/webtoon_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  Future<List<WebtoonModel>> webtoons = ApiService.getTodayWebtoon();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "Today's Webtoom",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
      ),
      body: FutureBuilder(
        initialData: [],
        future: webtoons,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return Text('there is data');
          }
          return Text('Loading...');
        },
      ),
    );
  }
}
