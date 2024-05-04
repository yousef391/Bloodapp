import 'package:blood_donation/const.dart';
import 'package:blood_donation/core/utils/styles.dart';
import 'package:flutter/material.dart';

class blood_item extends StatelessWidget {
  blood_item({super.key, required this.type ,this.ontap, this.selected});
  void Function()? ontap;
  bool? selected = false;
  String? type;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
      
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
            border: Border.all(
                width: 5, color: selected! ? color2 : Colors.transparent),
            borderRadius: BorderRadius.circular(30),
            color: buttontextcolor),
        child: Center(
            child: Text(
          type!,
          style: buttonstyle.copyWith(fontSize: 62, color: color2),
        )),
      ),
    );
  }
}
