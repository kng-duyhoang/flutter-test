// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/schedule/index.dart';
import 'package:healthy_app/widget/dialog/addActivity.dart';

class CreateScheduleScreen extends StatefulWidget {
  const CreateScheduleScreen({super.key});

  @override
  State<CreateScheduleScreen> createState() => _CreateScheduleScreenState();
}

const List<String> list = <String>['Day', 'Week'];

class _CreateScheduleScreenState extends State<CreateScheduleScreen> {
  Schedule listSchedule = Schedule(name: "", type: "", listTask: []);
  int initialItem = 20;
  String dropdownValue = list.first;
  final TextEditingController _nameController = TextEditingController();
  List<Schedule> listShedule = [];
  int lengthList = 1;
  int onActive = 1;

  void changeActive(int index) {
    setState(() {
      onActive = index;
    });
  }

  void _onSubmit() {}

  void _addItem (context) {
    showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) =>
                              AddActivityDialog(context));
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
                            dropdownValue = value!;
                            lengthList = value == "Day" ? 1 : 7;
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
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                scrollDirection: Axis.horizontal,
                itemCount: lengthList,
                itemBuilder: (BuildContext context, int index) {
                  return BuildCarousel(context, index, changeActive, onActive);
                },
              ),
            ),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  IconButton(onPressed: () {
                    _addItem(context);
                  }, icon: Icon(Icons.add), style: ButtonStyle(iconSize: MaterialStateProperty.all(34)),color: AppColor.darkPrimaryColor,)
                ]),
              ),
            )
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
              onPressed: _onSubmit,
              child: const Text("Create", style: AppText.textBlack)),
        ),
      ),
    );
  }
}

class BuildCarousel extends StatelessWidget {
  BuildContext context;
  int carouselIndex;
  void Function(int) changeActive;
  int onActive;

  BuildCarousel(
      this.context, this.carouselIndex, this.changeActive, this.onActive,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: ElevatedButton(
          child: Text(
            "day ${carouselIndex + 1}",
          ),
          style: ElevatedButton.styleFrom(
              side: BorderSide(
            width: 1.0,
            color: carouselIndex == onActive
                ? AppColor.blackColor1
                : AppColor.borderColor,
          )),
          onPressed: () {
            changeActive(carouselIndex);
          },
        ));
  }
}
