// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:healthy_app/bloc/user_status/userinfor_bloc.dart';
import 'package:healthy_app/constant/text.dart';

class ScrollWeightDialog extends StatefulWidget {
  final String keyName;

  const ScrollWeightDialog(BuildContext context, this.keyName, {super.key});

  @override
  State<ScrollWeightDialog> createState() => _ScrollWeightDialogState();
}

class _ScrollWeightDialogState extends State<ScrollWeightDialog> {
  int initialItem = 20;

  void _onClose() {
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    final bool isHeight = widget.keyName == "height";

    final int valueChange = isHeight ? 140 : 40;
    if (isHeight) {
      UserInforBloc.instance.add(UserEventUpdateHeight(valueChange.toString()));
    } else {
      UserInforBloc.instance.add(UserEventUpdateWeight(valueChange.toString()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isHeight = widget.keyName == "height";
    final int valueChange = isHeight ? 140 : 40;

    return Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: SizedBox(
        height: 350.0,
        width: 300.0,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: 300,
              child: Stack(children: [
                Center(
                  child: Text("Select ${isHeight ? 'Height' : 'Weight'}",
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
            SizedBox(
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 70,
                    child: ListWheelScrollView.useDelegate(
                      itemExtent: 40,
                      perspective: 0.0000000001,
                      controller:
                          FixedExtentScrollController(initialItem: initialItem),
                      renderChildrenOutsideViewport: false,
                      useMagnifier: true,
                      magnification: 1.5,
                      physics: const FixedExtentScrollPhysics(),
                      onSelectedItemChanged: (value) {
                        setState(() {
                          if (isHeight) {
                            UserInforBloc.instance.add(UserEventUpdateHeight(
                                (value + valueChange).toString()));
                          } else {
                            UserInforBloc.instance.add(UserEventUpdateWeight(
                                (value + valueChange).toString()));
                          }
                        });
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: valueChange,
                        builder: (context, index) {
                          return MyData(
                              currentData: (index + valueChange).toString(),
                              dataActive: index.toString());
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    width: 100,
                    child: ListWheelScrollView.useDelegate(
                      itemExtent: 50,
                      perspective: 0.005,
                      diameterRatio: 1.2,
                      physics: const FixedExtentScrollPhysics(),
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: 1,
                        builder: (context, index) {
                          return Center(
                            child: Text(isHeight ? 'CM' : 'mg',
                                style: AppText.textBlack),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
                height: 50,
                child: ElevatedButton(
                    onPressed: _onClose, child: const Text('Submit'))),
          ],
        ),
      ),
    );
  }
}

class MyData extends StatelessWidget {
  String currentData;
  String dataActive;
  MyData({super.key, required this.currentData, required this.dataActive});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Center(
          child: Text(
        currentData,
        style:
            dataActive == currentData ? AppText.textBlack : AppText.textLight,
      )),
    );
  }
}
