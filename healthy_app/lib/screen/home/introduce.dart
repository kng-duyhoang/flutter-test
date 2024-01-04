import 'package:flutter/material.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/text.dart';

class IntroduceHome extends StatefulWidget {
  const IntroduceHome({super.key});

  @override
  State<IntroduceHome> createState() => _IntroduceHomeState();
}

class _IntroduceHomeState extends State<IntroduceHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 56, 24, 0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 130,
              decoration: BoxDecoration(
                color: Color(0xFFECF1F6),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Padding(
                padding: EdgeInsets.all(19),
                child: Column(
                  children: [
                    Text(
                      'Healthy life belongs to everyone',
                      style: AppText.titleLarge,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Create your schedule!!!'),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color(0xFF1F4690)),),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
