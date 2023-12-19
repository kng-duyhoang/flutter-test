import 'package:flutter/material.dart';
import 'package:healthy_app/constant/images.dart';

class HelloScreen extends StatelessWidget {
  final void Function() goPage2;
  
  const HelloScreen({super.key, required this.goPage2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageConstant.imageCover),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome, let's exercise together",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              const Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 13),
              ElevatedButton(
                onPressed: goPage2,
                child: const Text('Start Introduction')
              ),
            ],
          ),
        ),
      ),
    );
  }
}
