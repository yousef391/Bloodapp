import 'package:blood_donation/const.dart';
import 'package:blood_donation/core/utils/styles.dart';
import 'package:flutter/material.dart';

class posnegicon extends StatelessWidget {
   posnegicon({
    super.key,
    required this.hint,
    this.selected,
    this.ontap
  });
String hint;
bool? selected=false;
void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
      width: MediaQuery.of(context).size.width*0.18 ,
         margin: EdgeInsets.all(2) ,
        decoration: BoxDecoration(
          border: Border.all(
            width: 5,
            color: selected! ? buttontextcolor : Colors.transparent
          ),
         borderRadius: BorderRadius.circular(16),color: color2
        ),
         child: Center(child: Text(hint , style:buttonstyle.copyWith(
           fontSize: 64, color: buttontextcolor
         ) ,)),
        ),
    );
  }
}