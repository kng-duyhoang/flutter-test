// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/schedule/index.dart';

const List<String> list = <String>['Day', 'Week'];

class CreateInforSchedule extends StatefulWidget {
  late Function(int) goPage;
  late Function(String) changeType;
  late Function(String) changeName;
  late Schedule listSchedule;

  CreateInforSchedule(this.goPage, this.changeType, this.changeName, this.listSchedule, {super.key});

  @override
  State<CreateInforSchedule> createState() => _CreateInforScheduleState();
}

class _CreateInforScheduleState extends State<CreateInforSchedule> {
  String dropdownValue = "";
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      dropdownValue = widget.listSchedule.type;
      _nameController.text = widget.listSchedule.nameSchedule;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text("Create Schedule"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 20,
                  width: double.infinity,
                  child: Text(
                    'Tên lịch trình: ',
                    style: AppText.textBlack,
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: TextField(
                    controller: _nameController,
                    textAlignVertical: TextAlignVertical.center,
                    style: AppText.bodyLarge,
                    onChanged: (value) => {
                      widget.changeName(value)
                    },
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      hintText: "Shedule Name",
                      hintStyle: TextStyle(fontSize: 12),
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 89, 92, 91), width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 102, 90, 89),
                            width: 1.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: Row(
                children: [
                  const SizedBox(
                    height: 20,
                    child: Text(
                      'Chọn loại: ',
                      style: AppText.textBlack,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                      height: 40,
                      child: DropdownButton<String>(
                        value: dropdownValue!.isEmpty ? null : dropdownValue!,
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            widget.changeType(value!);
                            dropdownValue = value;
                          });
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 70,
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                widget.goPage(1);
              },
              child: const Text("Next", style: AppText.textBlack)),
        ),
      ),
    );
  }
}

