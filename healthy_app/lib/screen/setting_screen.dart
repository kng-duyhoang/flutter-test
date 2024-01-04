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

        return SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              FormControl(label: 'Id', value: state.user.id,),
              FormControl(label: 'User Name', value: state.user.username,),
              FormControl(label: 'Gender', value: state.user.gender,),
              FormControl(label: 'Gmail', value: state.user.gmail,),
              FormControl(label: 'Birthday', value: state.user.birthday,),
              FormControl(label: 'Weight', value: state.user.weight,),
              FormControl(label: 'Height', value: state.user.height,),
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
