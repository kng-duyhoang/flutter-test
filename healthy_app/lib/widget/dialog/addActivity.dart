// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:healthy_app/apis/activity/index.dart';
import 'package:healthy_app/bloc/activity/activity_bloc.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/activity/index.dart';

class AddActivityDialog extends StatefulWidget {
  void Function(String) addActivity;
  
  AddActivityDialog(BuildContext context, this.addActivity, {super.key});

  @override
  State<AddActivityDialog> createState() => _AddActivityDialogState();
}

class _AddActivityDialogState extends State<AddActivityDialog> {
  int initialItem = 20;
  String dropdownValue = "";
  List<String> list = <String>['Day', 'Week'];
  final TextEditingController _nameController = TextEditingController();
  List<Activity> listRender = [];

  void _onClose() {
    Navigator.pop(context);
  }

  void _onSubmit() {
  }

  void _onCheck(Activity data) {
    widget.addActivity(data.id);
  }

  @override
  void initState() {
    super.initState();
    listRender = ActivityBloc.instance.state.list;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: SizedBox(
        height: 450.0,
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
                  child: Text(
                    "Select Activity",
                    style: AppText.titleLarge, textAlign: TextAlign.center
                  ),
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
                    padding: const EdgeInsets.all(8),
                    itemCount: listRender.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 50,
                        child: ElevatedButton(
                          child: Text(listRender[index].name),
                          onPressed: () {
                            _onCheck(listRender[index]);
                          },
                        )
                      );
                    }
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                  height: 40,
                  child: ElevatedButton(
                      onPressed: _onSubmit, child: const Text('Submit'))),
            ],
          ),
        ),
      ),
    );
  }
}
