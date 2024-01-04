import 'package:flutter/material.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/screen/home/cover.dart';
import 'package:healthy_app/screen/home/introduce.dart';
import 'package:healthy_app/store/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void removeToken() {
    Store.instance.remove(StoreKeys.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightColor1,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: CoverInformation(),
          ),
          const IntroduceHome()
        ]),
      ),
    );
  }
}
