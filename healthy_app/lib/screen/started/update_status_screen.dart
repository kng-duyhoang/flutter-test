import 'package:flutter/material.dart';
import 'package:healthy_app/constant/color.dart';

class UpdateStatusScreen extends StatefulWidget {
  const UpdateStatusScreen({super.key});

  @override
  State<UpdateStatusScreen> createState() => _UpdateStatusScreenState();
}

class _UpdateStatusScreenState extends State<UpdateStatusScreen> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Profile',
              style: TextStyle(
                  fontSize: 40,
                  color: Color.fromARGB(255, 34, 35, 37),
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 2),
            const Text(
              'Introduce yourself!',
              style: TextStyle(fontSize: 15, color: AppColor.lightColor4),
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                Text("Your name:"),
                TextField(
                controller: _usernameController,
                textAlignVertical: TextAlignVertical.center,
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
