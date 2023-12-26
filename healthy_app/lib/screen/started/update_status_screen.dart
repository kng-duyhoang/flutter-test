// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/authorize/index.dart';
import 'package:healthy_app/widget/dialog/scrollwheelview_dialog.dart';

class UpdateStatusScreen extends StatefulWidget {
  late Function(int) goPage;
  late UserInforModel data;

  UpdateStatusScreen(this.goPage, this.data, {super.key});

  @override
  State<UpdateStatusScreen> createState() => _UpdateStatusScreenState();
}

class _UpdateStatusScreenState extends State<UpdateStatusScreen> {
  final TextEditingController _usernameController = TextEditingController();
  int? genderData = 0;
  DateTime selectedDate = DateTime.now();

  DateTime convertStringToDatetime (String data) {
    DateTime tempDate = DateTime.parse(data);
    return tempDate;
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.data.birthday == "" ? selectedDate : convertStringToDatetime(widget.data.birthday),
      firstDate: DateTime(1990),
      lastDate: DateTime(2025),
      locale: const Locale("en", "EN"),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        widget.data.changeBirthday = selectedDate.toString();
      });
  }

  void _onchangeUserName(String userName) {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Text('Tell us about yourself',
                style: TextStyle(
                    fontSize: 20,
                    color: AppColor.darkPrimaryColor,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 25),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                const Text("Your name:", style: AppText.textBlack),
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
                  title: const Text('Male', style: AppText.textBlack),
                  value: 0,
                  groupValue: genderData,
                  onChanged: (int? value) {
                    widget.data.gender = 'male';
                    setState(() {
                      genderData = value;
                    });
                  },
                ),
              ),
              Flexible(
                flex: 1,
                child: RadioListTile(
                  title: const Text('Female', style: AppText.textBlack),
                  value: 1,
                  groupValue: genderData,
                  onChanged: (int? value) {
                    widget.data.gender = 'female';
                    setState(() {
                      genderData = value;
                    });
                  },
                ),
              ),
            ]),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: TextButton(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              side: BorderSide(color: AppColor.borderColor)))),
                  onPressed: () {
                    _selectDate(context);
                  },
                  child: Text(
                    widget.data.birthday != "" ? widget.data.birthday : "Input Your BirthDay",
                    style: AppText.textBlack,
                  )),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: TextButton(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              side: BorderSide(color: AppColor.borderColor)))),
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) =>
                            ScrollWeightDialog(context, widget.data, 'height'));
                  },
                  child: Text(
                    widget.data.height != "" ? widget.data.height : "Input Your Height",
                    style: AppText.textBlack,
                  )),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: TextButton(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              side: BorderSide(color: AppColor.borderColor)))),
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) =>
                            ScrollWeightDialog(context, widget.data, 'weight'));
                  },
                  child: Text(
                    widget.data.weight != "" ? widget.data.weight : "Input Your Weight",
                    style: AppText.textBlack,
                  )),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 70,
        padding: EdgeInsets.all(10),
        child: SizedBox(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                final userName = _usernameController.text;
                _onchangeUserName(userName);
                widget.goPage(2);
              },
              child: const Text("Next", style: AppText.titleMedium)),
        ),
      ),
    );
  }
}
