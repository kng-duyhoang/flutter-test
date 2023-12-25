import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_app/bloc/user/user_bloc.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/user/index.dart';
import 'package:healthy_app/store/index.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  User user = User(id: "", gmail: "", gender: "", height: "", weight: "", birthday: "", username: "");

  void removeToken() {
    Store.instance.remove(StoreKeys.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {

        if (state is UserData) {
          user = state.user;
        }
        return Container(
          width: double.infinity,
          child: Column(
            children: [
              FormControl(label: 'Id', value: user.id,),
              FormControl(label: 'User Name', value: user.username,),
              FormControl(label: 'Gender', value: user.gender,),
              FormControl(label: 'Gmail', value: user.gmail,),
              FormControl(label: 'Birthday', value: user.birthday,),
              FormControl(label: 'Weight', value: user.weight,),
              FormControl(label: 'Height', value: user.height,),
          ]),
        );
      })
    );
  }
}

class FormControl extends StatefulWidget {
  const FormControl({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  State<FormControl> createState() => _FormControlState();
}

class _FormControlState extends State<FormControl> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(
            width: 150,
            child: Text('${widget.label}: ', style: AppText.titleLarge,)
          ),
          SizedBox(
            width: 200,
            child: Text(widget.value, style: AppText.titleMedium,)
          )
        ],
      ),
    );
  }
}
