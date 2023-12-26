// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_app/bloc/user_status/userinfor_bloc.dart';
import 'package:healthy_app/constant/text.dart';

class ResultStatusScreen extends StatefulWidget {
  late Function(int) goPage;

  ResultStatusScreen(this.goPage, {super.key});

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
          leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => widget.goPage(1),
        ),

        ),
        body: BlocBuilder<UserInforBloc, UserInforState>(
            builder: (context, state) {
          return Container(
            alignment: Alignment.center,
            child: Column(children: [
              FormValue('User Name', state.userName),
              FormValue('Height', state.height),
              FormValue('Weight', state.weight),
              FormValue('Gender', state.gender),
              FormValue('Birthday', state.birthday),
              // ElevatedButton(onPressed: onPressed, child: child)
            ]),
          );
        }));
  }

  SizedBox FormValue(String label, String value) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        children: [Text('$label: '), const SizedBox(width: 10), Text(value)],
      ),
    );
  }
}
