import 'package:flutter/material.dart';
import 'package:healthy_app/router/index.dart';
import 'package:healthy_app/store/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void removeToken() {
    Store.instance.remove(StoreKeys.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appbar'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const Text("say SOme Thing ?"),
          ElevatedButton(onPressed: removeToken, child: const Text("remove Token")),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.loginScreen);
            },
            child: const Text("Login")),
        ],
      ),
    );
  }
}
