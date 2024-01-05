import 'package:flutter/material.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/images.dart';
import 'package:healthy_app/screen/home/cover.dart';
import 'package:healthy_app/screen/home/introduce.dart';
import 'package:healthy_app/screen/home/schedule.dart';
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
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageConstant.homeCover),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: CoverInformation(),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30.0)),
                ),
                child: Column(children: [
                  IntroduceHome(),
                  ScheduleList(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
