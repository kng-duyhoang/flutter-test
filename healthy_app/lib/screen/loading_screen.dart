// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:healthy_app/apis/authorize/index.dart';
import 'package:healthy_app/bloc/user/user_bloc.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/router/index.dart';
import 'package:healthy_app/store/index.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void _onCheck() async {
    final loginResponse = await AuthorizeApi().check();
    if (loginResponse.status == "200") {
      UserBloc.instance.add(UserEventSuccess(loginResponse.user));
      if (loginResponse.user.username == "") {
        Navigator.pushNamed(context, Routes.startScreen);
      } else {
        Navigator.pushNamed(context, Routes.navigator);
      }
    } else {
      Store.instance.remove(StoreKeys.token);
      Navigator.pushNamed(context, Routes.loginScreen);
    }
  }

  @override
  void initState() {
    super.initState();
    _onCheck();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
                color: AppColor.lightSecondColor,
                size: 200,
              ),
        ),
      ),
    );
  }
}
