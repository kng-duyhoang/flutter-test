// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:healthy_app/constant/text.dart';

class HeightDialog extends StatefulWidget {
  
  const HeightDialog(BuildContext context, {super.key});

  @override
  State<HeightDialog> createState() => _HeightDialogState();
}

class _HeightDialogState extends State<HeightDialog> {
  int height = 160;

  void _onClose() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: SizedBox(
        height: 300.0,
        width: 300.0,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: 300,
              child: Stack(children: [
                const Center(
                  child: Text("Select Height",
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
                      controller: FixedExtentScrollController(initialItem: 20),
                      renderChildrenOutsideViewport: false,
                      useMagnifier: true,
                      magnification: 1.5,
                      physics: const FixedExtentScrollPhysics(),
                      onSelectedItemChanged: (value) {
                        setState(() {
                          height = value + 140;
                        });
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: 50,
                        builder: (context, index) {
                          return MyHeight(
                              height: index + 140, heightActive: height);
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
                          return const Center(
                            child: Text('CM', style: AppText.textBlack),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHeight extends StatelessWidget {
  int height;
  int heightActive;
  MyHeight({super.key, required this.height, required this.heightActive});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Center(
        child: Text(height.toString(),
            style: height == heightActive
                ? AppText.textBlack
                : AppText.textLight),
      ),
    );
  }
}
