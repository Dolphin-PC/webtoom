import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webtoom/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiService().getTodayWebtoon();

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "Today's Webtoom",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400
          ),
        ),
      ),
    );
  }
}
