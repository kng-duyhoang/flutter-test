// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:healthy_app/bloc/user_status/userinfor_bloc.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/authorize/index.dart';
import 'package:healthy_app/widget/dialog/cupertinoDatePicker.dart';
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

  DateTime convertStringToDatetime(String data) {
    DateTime tempDate = DateTime.parse(data);
    return tempDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body:
          BlocBuilder<UserInforBloc, UserInforState>(builder: (context, state) {
        return SingleChildScrollView(
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
                    onChanged: (String newText) {
                      if (newText.isNotEmpty) {
                        UserInforBloc.instance
                            .add(UserEventUpdateName(newText));
                      }
                    },
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
                      setState(() {
                        genderData = value;
                        UserInforBloc.instance.add(UserEventUpdateGender(
                            value == 1 ? 'Female' : 'Male'));
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
                      setState(() {
                        genderData = value;
                        UserInforBloc.instance.add(UserEventUpdateGender(
                            value == 1 ? 'Female' : 'Male'));
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    side: BorderSide(
                                        color: AppColor.borderColor)))),
                    onPressed: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) =>
                              CupertinoDatePickerDialog(context));
                    },
                    child: Text(
                      state.birthday != ""
                          ? state.birthday
                          : "Input Your BirthDay",
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    side: BorderSide(
                                        color: AppColor.borderColor)))),
                    onPressed: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) =>
                              ScrollWeightDialog(context, 'height'));
                    },
                    child: Text(
                      state.height != "" ? state.height : "Input Your Height",
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    side: BorderSide(
                                        color: AppColor.borderColor)))),
                    onPressed: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) =>
                              ScrollWeightDialog(context, 'weight'));
                    },
                    child: Text(
                      state.weight != "" ? state.weight : "Input Your Weight",
                      style: AppText.textBlack,
                    )),
              ),
            ],
          ),
        );
      }),
      floatingActionButton: Container(
        height: 70,
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                widget.goPage(2);
              },
              child: const Text("Next", style: AppText.titleMedium)),
        ),
      ),
    );
  }
}
