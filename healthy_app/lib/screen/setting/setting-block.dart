// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/setting/index.dart';

class SettingBlock extends StatefulWidget {
  const SettingBlock({super.key, required this.listRender, required this.title});
  final List<SettingBlockItemModel> listRender;
  final String title;

  @override
  State<SettingBlock> createState() => _SettingBlockState();
}

class _SettingBlockState extends State<SettingBlock> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(widget.title, style: AppText.titleSmall,),
        SizedBox(
          width: double.infinity,
          height: widget.listRender.length * 50,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.listRender.length,
            itemBuilder: (BuildContext context, int index) {
              return BlockSettingItem(data: widget.listRender[index]);
            },
          ),
        )
      ],
    );
  }
}

class BlockSettingItem extends StatelessWidget {
  const BlockSettingItem({
    super.key,
    required this.data
  });
  final SettingBlockItemModel data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          // Navigator.pushNamed(context, data.router);
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide.none,
          padding: const EdgeInsets.all(0)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(data.icons, cacheHeight: 24, cacheWidth: 24),
                  const SizedBox(width: 5),
                  Text(data.label, style: AppText.titleMedium,)
                ]
              ),
              const Icon(Icons.arrow_forward_ios, size: 20, color: AppColor.blackColor1)
          ],
        ),
      ),
    );
  }
}
