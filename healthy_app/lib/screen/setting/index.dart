import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_app/bloc/user/user_bloc.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/screen/setting/header-bar.dart';
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const HeaderBar(),
            ],
          ),
        );
      }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 40,
          width: double.infinity,
          child: OutlinedButton(
            onPressed: (){},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFFFE970F), width: 1),
               shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: Text("Log Out", style: TextStyle(color: Color(0xFFFE970F)),),
          ),
        ),
      ),
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
