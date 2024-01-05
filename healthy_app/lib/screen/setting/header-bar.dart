import 'package:flutter/material.dart';
import 'package:healthy_app/bloc/user/user_bloc.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/images.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/widget/common/information-parctice.dart';

class HeaderBar extends StatefulWidget {
  const HeaderBar({super.key});

  @override
  State<HeaderBar> createState() => _HeaderBarState();
}

class _HeaderBarState extends State<HeaderBar> {
  var user = UserBloc.instance.state.user;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 10,),
      SizedBox(
        height: 60,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: DecorationImage(
                      image: AssetImage(ImageConstant.avt),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(const Radius.circular(50.0)),
                  ),
                ),
                SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.username, style: AppText.titleLarge,),
                    Text('@${user.gmail}', style: AppText.bodySmall)
                  ],
                )
              ],
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit_document),
                    color: const Color.fromARGB(255, 114, 109, 109)),
              ],
            )
          ],
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      const InformationPractice(false)
    ]);
  }
}
