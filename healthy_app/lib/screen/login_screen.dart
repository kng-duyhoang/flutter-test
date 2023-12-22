// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:healthy_app/apis/user/index.dart';
import 'package:healthy_app/bloc/authorize/authorize_bloc.dart';
import 'package:healthy_app/model/login.dart';
import 'package:healthy_app/router/index.dart';
import 'package:healthy_app/store/index.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  void _onLoginHandler(String userName, String password) async {
    final login = LoginResponsi().onLogin;
    EasyLoading.show(status: 'loading...');
    setState(() {
      isLoading = true;
    });

    var response = await login(userName, password);
    if (response.statusCode == 200) {
      var data = json.decode(response.body.toString());
      var dataResponse = ModelLoginResponse.fromJson(data);
      Store.instance.setString(StoreKeys.token, dataResponse.token);
      await Navigator.pushNamed(context, Routes.homeScreen);
    } else {}
    setState(() {
      isLoading = false;
    });
    EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Center(child: Text('Login', textAlign: TextAlign.center)),
        automaticallyImplyLeading: false,
      ),
      body: BlocListener<AuthorizeBloc, AuthorizeState>(
          listener: (context, state) => {},
          child: BlocBuilder<AuthorizeBloc, AuthorizeState>(
              builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  renderInput(_usernameController, 'Email'),
                  const SizedBox(height: 20),
                  renderInput(_passwordController, 'Password'),
                  const SizedBox(height: 30),
                  IgnorePointer(
                    ignoring: isLoading,
                    child: ElevatedButton(
                      onPressed: () {
                        final userName = _usernameController.text;
                        final password = _passwordController.text;
                        _onLoginHandler(userName, password);
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            );
          })),
    );
  }

  Column renderInput(TextEditingController controller, String fieldName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 40,
          child: TextField(
            controller: controller,
            textAlignVertical: TextAlignVertical.center,
            obscureText: fieldName == "Password",
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 89, 92, 91), width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 102, 90, 89), width: 1.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
