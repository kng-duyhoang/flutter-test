// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/authorize/index.dart';
import 'package:healthy_app/model/user/index.dart';

class ResultStatusScreen extends StatefulWidget {
  final UserInforModel data;
  const ResultStatusScreen(this.data, {super.key});

  @override
  State<ResultStatusScreen> createState() => _ResultStatusScreenState();
}

class _ResultStatusScreenState extends State<ResultStatusScreen> {
  bool isLoading = false;

  // void _updateUser() async {
  //   final data = ;
  //   EasyLoading.show(status: 'loading...');
  //   setState(() {
  //     isLoading = true;
  //   });

  //   final loginResponse = await AuthorizeApi().login(data);
  //   if (loginResponse.token != null) {
  //     AuthorizeBloc.instance.add(AuthorizeEventSuccess(loginResponse.token));
  //     UserBloc.instance.add(UserEventSuccess(loginResponse.user));
  //     Navigator.pushNamed(context, Routes.homeScreen);
  //   } 
  //   setState(() {
  //     isLoading = false;
  //   });
  //   EasyLoading.dismiss();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result', style: AppText.titleLarge),
      ),
      body: Container(alignment: Alignment.center, child: Column(children: [
        FormValue('User Name', widget.data.userName),
        FormValue('Height', widget.data.height),
        FormValue('Weight', widget.data.weight),
        FormValue('Gender', widget.data.gender),
        FormValue('Birthday', widget.data.birthday),
        // ElevatedButton(onPressed: onPressed, child: child)
      ]),),
    );
  }

  SizedBox FormValue(String label, String value) {
    return SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            Text('$label: '),
            const SizedBox(width: 10),
            Text(value)
          ],
        ),
      );
  }
}
