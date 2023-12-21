import 'package:flutter/material.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/text.dart';

const List<String> height = [
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
];

const List<String> unit = ['inch', 'metter'];

class HeightDialog extends StatefulWidget {
  const HeightDialog(BuildContext context, {super.key});

  @override
  State<HeightDialog> createState() => _HeightDialogState();
}

class _HeightDialogState extends State<HeightDialog> {
  String heightActive = '1';
  String unitActive = 'inch';

  void changeHeight(String value) {
    setState(() {
      heightActive = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)), //this right here
      child: SizedBox(
        height: 300.0,
        width: 300.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListView.builder(
                          itemCount: height.length,
                          itemBuilder: (context, index) => HeightBox(
                              changeHeight,
                              index: index,
                              heightActive: heightActive),
                        ),
                      )),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListView.builder(
                          itemCount: unit.length,
                          itemBuilder: (context, index) => Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: AppColor.borderColor,
                                        width: 1.0
                                      ))),
                            height: 60,
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  unit[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: unit[index] == unitActive
                                          ? AppColor.blackColor1
                                          : AppColor.lightColor4),
                                )),
                          ),
                        ),
                      )),
                )
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 50.0)),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Close!',
                style: TextStyle(color: Colors.purple, fontSize: 18.0),
              )
            )
          ],
        ),
      ),
    );
  }
}

class HeightBox extends StatelessWidget {
  const HeightBox(
    this.changeHeight, {
    super.key,
    required this.index,
    required this.heightActive,
  });
  final int index;
  final String heightActive;
  final Function(String) changeHeight;

  void _onPressed() {
    changeHeight(height[index]);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onPressed,
      child: Container(
        height: 40,
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(color: AppColor.borderColor, width: 1.0))),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            height[index],
            textAlign: TextAlign.center,
            style: TextStyle(
              color: height[index] == heightActive
                  ? AppColor.blackColor1
                  : AppColor.lightColor1,
            ),
          ),
        ),
      ),
    );
  }
}
