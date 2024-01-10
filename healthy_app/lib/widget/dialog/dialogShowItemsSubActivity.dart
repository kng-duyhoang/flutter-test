// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/sub-activity/index.dart';
import 'package:healthy_app/screen/schedule/create/detail/subActivityBlock.dart';

class ShowItemsSubActivity extends StatefulWidget {
  
  ShowItemsSubActivity(BuildContext context, this.listRender, {super.key});
  List<SubActivity> listRender;

  @override
  State<ShowItemsSubActivity> createState() => _ShowItemsSubActivityState();
}

class _ShowItemsSubActivityState extends State<ShowItemsSubActivity> {
  

  @override
  void initState() {
    super.initState();
    print(widget.listRender[0].subActivityId);
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
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: 300,
              child: Stack(children: [
                const Center(
                  child: Text(
                    "Select Activity",
                    style: AppText.titleLargeLight, textAlign: TextAlign.center
                  ),
                ),
                Positioned(
                  top: 5.0,
                  right: 5.0,
                  child: SizedBox(
                    width: 40,
                    height: 40.0,
                    child: IconButton(onPressed: () {
                      Navigator.pop(context);
                    }, icon: const Icon(Icons.close, color: AppColor.defaultColor,)),
                  )),
                ]),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: List.generate(
                    widget.listRender.length,
                    (index) => SubActivityBlock(
                        data: widget.listRender[index])))
          ],
        )
      ),
    );
  }
}
