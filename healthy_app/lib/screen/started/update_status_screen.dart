// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/screen/started/dialog.dart';

class UpdateStatusScreen extends StatefulWidget {
  late Function(int) goPage;
  late Function(dynamic, String) changeData;

  UpdateStatusScreen(this.goPage, this.changeData, {super.key});

  @override
  State<UpdateStatusScreen> createState() => _UpdateStatusScreenState();
}

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class _UpdateStatusScreenState extends State<UpdateStatusScreen> {
  final TextEditingController _usernameController = TextEditingController();
  int? genderData = 0;

  void _onPressed(String userName) {
    widget.changeData(userName, 'name');
  }

  void _onChange(int value) {
    widget.changeData(value, 'gender');
    setState(() {
      genderData = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                const Text("Your name:", style: AppText.titleSmall),
                const SizedBox(height: 5),
                TextField(
                  controller: _usernameController,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.borderColor, width: 1.0),
                    ),
                  ),
                  style: AppText.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(children: <Widget>[
              Flexible(
                flex: 1,
                child: RadioListTile(
                  title: const Text('Male', style: AppText.titleSmall),
                  value: 0,
                  groupValue: genderData,
                  onChanged: (int? value) {
                    _onChange(value!);
                  },
                ),
              ),
              Flexible(
                flex: 1,
                child: RadioListTile(
                  title: const Text('Female', style: AppText.titleSmall),
                  value: 1,
                  groupValue: genderData,
                  onChanged: (int? value) {
                    _onChange(value!);
                  },
                ),
              ),
            ]),
            const SizedBox(height: 15),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: TextButton(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(const Radius.circular(10)),
                              side: BorderSide(color: AppColor.borderColor)))),

                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) =>
                            HeightDialog(context));
                  },
                  child: Text(
                    "Input Your Height",
                    style: TextStyle(color: AppColor.blackColor1),
                  )),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  final userName = _usernameController.text;
                  _onPressed(userName);
                },
                child: const Text("Next", style: AppText.titleMedium))
          ],
        ),
      ),
    );
  }
}
