// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:healthy_app/constant/text.dart';

class AddActivityDialog extends StatefulWidget {
  const AddActivityDialog(BuildContext context, {super.key});

  @override
  State<AddActivityDialog> createState() => _AddActivityDialogState();
}

class _AddActivityDialogState extends State<AddActivityDialog> {
  int initialItem = 20;
  String dropdownValue = "";
  List<String> list = <String>['Day', 'Week'];
  final TextEditingController _nameController = TextEditingController();

  void _onClose() {
    Navigator.pop(context);
  }

  void _onSubmit() {
    print(_nameController.text);
    print(dropdownValue);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: SizedBox(
        height: 350.0,
        width: 300.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                width: double.infinity,
                child: Stack(children: [
                  const Center(
                    child: Text(
                      "Create Shedule",
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
              SizedBox(
                height: 50,
                width: double.infinity,
                child: TextField(
                  controller: _nameController,
                  textAlignVertical: TextAlignVertical.center,
                  style: AppText.bodyLarge,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    hintText: "Shedule Name",
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
              ),
              SizedBox(height: 20,),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    Text('Choose type'),
                    SizedBox(width: 20,),
                    DropdownMenu<String>(
                      inputDecorationTheme: InputDecorationTheme(
                        isDense: true,
                        labelStyle: AppText.bodyLarge,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                        constraints: BoxConstraints.tight(const 
                        Size.fromHeight(50)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      initialSelection: list.first,
                      onSelected: (String? value) {
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                    dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(value: value, label: value);
                    }).toList(),
                                  ),
                  ],
                )
              ),
              const SizedBox(height: 50),
              SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      onPressed: _onSubmit, child: const Text('Submit'))),
            ],
          ),
        ),
      ),
    );
  }
}
