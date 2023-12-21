import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:healthy_app/apis/user/index.dart';
import 'package:healthy_app/bloc/authorize/authorize_bloc.dart';
import 'package:healthy_app/router/index.dart';
import 'package:healthy_app/store/index.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  @override
  void initState() {
    super.initState();
    EasyLoading.show(status: 'loading...');
    checkAuthorize();
  }

  void checkAuthorize() async {
    final String? token = Store.instance.getString(StoreKeys.token);

    if (Store.instance.containsKey(StoreKeys.token)) {
      final onCheck = CheckTokenResponsi().onCheck;
      var response = await onCheck(token!);
      if (response.statusCode == 200) {
        // var data = json.decode(response.body.toString());
        // var dataUser = AuthorizeResponse.fromJson(data);
        AuthorizeBloc.instance.add(AuthorizeEventSuccess());
      } else {
        AuthorizeBloc.instance.add(AuthorizeEventFail());
      }
    } else {
        AuthorizeBloc.instance.add(AuthorizeEventFail());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthorizeBloc, AuthorizeState>(
        listener: (context, state) => {
          if (state is AuthorizeSuccess)
            {
              EasyLoading.dismiss(),
              Navigator.of(context).pushNamed(Routes.startScreen)
            }
          else if (state is AuthorizeFail)
            {
              EasyLoading.dismiss(),
              Navigator.of(context).pushNamed(Routes.loginScreen)
            }
        },
        child: BlocBuilder<AuthorizeBloc, AuthorizeState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: const Text('Loading'),
              ),
              body: const Column(),
            );
          },
        ));
  }
}
