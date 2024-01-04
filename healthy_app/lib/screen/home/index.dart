import 'package:flutter/material.dart';
import 'package:healthy_app/bloc/user/user_bloc.dart';
import 'package:healthy_app/bloc/user_status/userinfor_bloc.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/images.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/router/index.dart';
import 'package:healthy_app/store/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userName = UserBloc.instance.state;
  void removeToken() {
    Store.instance.remove(StoreKeys.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightColor1,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: const Color(0xff7c94b6),
                      image: DecorationImage(
                        image: AssetImage(ImageConstant.avt),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.message),
                          color: AppColor.white1),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.notification_add),
                          color: AppColor.white1),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(padding: EdgeInsets.all(20.0), child: Column(
            children: [
              Text('hi $userName', style: AppText.textLight,),
              Text('Have you'),
              Text('exercised today?')

            ],
          ),)
        ]),
      ),
    );
  }
}
