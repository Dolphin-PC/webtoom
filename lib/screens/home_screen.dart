import 'package:flutter/material.dart';
import 'package:webtoom/services/api_service.dart';
import 'package:webtoom/models/webtoon_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  Future<List<WebtoonModel>> webtoons = ApiService.getTodayWebtoon();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          if (snapshot.hasData) {
            return ListView.separated(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var webtoon = snapshot.data![index];
                return Text(webtoon.title);
              },
              separatorBuilder: (context, index) => SizedBox(height: 20),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
