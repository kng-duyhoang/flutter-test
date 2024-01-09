// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:healthy_app/apis/schedule/index.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/sub-activity/index.dart';

class AddSubActivityDialog extends StatefulWidget {
  late Function(SubActivity) addSubActivity;
  late String id;

  AddSubActivityDialog(BuildContext context, this.addSubActivity, this.id,
      {super.key});

  @override
  State<AddSubActivityDialog> createState() => _AddSubActivityDialogState();
}

class _AddSubActivityDialogState extends State<AddSubActivityDialog> {
  int initialItem = 20;
  String dropdownValue = "";
  List<String> list = <String>['Day', 'Week'];
  List<SubActivity> listRender = [];

  void _onClose() {
    Navigator.pop(context);
  }

  void getSubActivity() async {
    final response = await ScheduleApi().getSubActivity(widget.id);
    setState(() {
      listRender = response.items;
    });
  }

  void _onCheck(SubActivity data) {
    widget.addSubActivity(data);
    _onClose();
  }

  @override
  void initState() {
    super.initState();
    getSubActivity();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: SizedBox(
        height: 400.0,
        width: 300.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                width: 300,
                child: Stack(children: [
                  const Center(
                    child: Text("Select SubActivity",
                        style: AppText.titleLarge, textAlign: TextAlign.center),
                  ),
                  Positioned(
                      top: 5.0,
                      right: 5.0,
                      child: SizedBox(
                        width: 40,
                        height: 40.0,
                        child: IconButton(
                            onPressed: _onClose, icon: const Icon(Icons.close)),
                      )),
                ]),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                child: SizedBox(
                  height: 300,
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8),
                      itemCount: listRender.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElevatedButton.icon(onPressed: () {
                              _onCheck(listRender[index]);
                            }, icon: const Icon(Icons.add), label: Text(listRender[index].name, style: AppText.textLight,)),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
