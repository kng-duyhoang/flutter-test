// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/authorize/index.dart';

class ScrollWeightDialog extends StatefulWidget {
  final UserInforModel data;
  final String keyName;
  
  const ScrollWeightDialog(BuildContext context, this.data, this.keyName, {super.key});

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
    // TODO: implement initState
    super.initState();
    if (widget.keyName == "height") {
      if (widget.data.height == "") {
        widget.data.changeHeight = (20 + 140).toString();
      } else {
        setState(() {
          initialItem = int.parse(widget.data.height) - 140;
        });
      }
    } else {
      if (widget.data.weight == "") {
        widget.data.changeWeight = (20 + 40).toString();
      } else {
        setState(() {
          initialItem = int.parse(widget.data.height) - 40;
        });
      }
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
                  child: Text("Select ${isHeight ? 'Height': 'Weight'}",
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
                      controller: FixedExtentScrollController(initialItem: initialItem),
                      renderChildrenOutsideViewport: false,
                      useMagnifier: true,
                      magnification: 1.5,
                      physics: const FixedExtentScrollPhysics(),
                      onSelectedItemChanged: (value) {
                        setState(() {
                          if (isHeight) {
                            widget.data.changeHeight = (value + valueChange).toString();
                          } else {
                            widget.data.changeWeight = (value + valueChange).toString();
                          }
                        });
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: valueChange,
                        builder: (context, index) {
                          return MyData(
                              currentData: (index + valueChange).toString(), dataActive: isHeight ? widget.data.height : widget.data.weight);
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
                            child: Text( isHeight ? 'CM' : 'mg', style: AppText.textBlack),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(height: 50, child: ElevatedButton(onPressed: _onClose, child: const Text('Submit'))),
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
        child: Text(currentData,
            style: dataActive == currentData ? AppText.textBlack : AppText.textLight,
        )
      ),
    );
  }
}
