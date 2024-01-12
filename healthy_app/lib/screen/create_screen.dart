// ignore_for_file: use_build_context_synchronously, unused_local_variable
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:healthy_app/apis/authorize/index.dart';
import 'package:healthy_app/bloc/authorize/authorize_bloc.dart';
import 'package:healthy_app/bloc/user/user_bloc.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/authorize/index.dart';
import 'package:healthy_app/router/index.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool isLoading = false;

  void _onRegisterHandler(
      String email, String password, String confirmPassword) async {
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password and Confirm Password do not match.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }
    final data = LoginRequest(gmail: email, password: password);
    EasyLoading.show(status: 'loading...');
    setState(() {
      isLoading = true;
    });

    final registerResponse = await AuthorizeApi().register(data);
    AuthorizeBloc.instance.add(AuthorizeEventSuccess(registerResponse.token));
    UserBloc.instance.add(UserEventSuccess(registerResponse.user));
    Navigator.pushNamed(context, Routes.navigator);
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
        title:
            const Center(child: Text('Đăng ký', textAlign: TextAlign.center)),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            renderInput(_emailController, "Email"),
            const SizedBox(height: 20),
            renderInput(_passwordController, "Mật khẩu"),
            const SizedBox(height: 20),
            renderInput(_confirmPasswordController, "Nhập lại mật khẩu"),
            const SizedBox(height: 20),
            IgnorePointer(
              ignoring: isLoading,
              child: ElevatedButton(
                onPressed: () {
                  final email = _emailController.text;
                  final password = _passwordController.text;
                  final confirmPassword = _confirmPasswordController.text;
                  _onRegisterHandler(email, password, confirmPassword);
                },
                child: const Text(
                  'Đăng ký',
                  style: AppText.textWhiteLarge,
                ),
              ),
            )
          ],
        ),
      ),
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
            obscureText:
                fieldName == "Password" || fieldName == "ConfirmPassword",
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
