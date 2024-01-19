// ignore_for_file: file_names, must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/sub-activity/index.dart';

class AddAmountSubActivity extends StatefulWidget {
  AddAmountSubActivity(BuildContext context, {required this.data, super.key});

  late SubActivity data;
  @override
  State<AddAmountSubActivity> createState() => _AddAmountSubActivityState();
}

class _AddAmountSubActivityState extends State<AddAmountSubActivity> {
  @override
  void initState() {
    super.initState();
  }
  final TextEditingController _controller = TextEditingController();

  void updateAmount() {
    setState(() {
      widget.data.amount = _controller.text;
    });
    // Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          height: 100.0,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
                      children: [
                        Text('Nhập số lương: '),
                        SizedBox(width: 10,),
                        SizedBox(
                          width: 100,
                          child: TextField(
                            controller: _controller,
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
                        ),
                        ElevatedButton(onPressed: (){
                          updateAmount();
                        }, child: Text('submit', style: AppText.textWhite,).tr())
                      ],
            ),
          )),
    );
  }
}
