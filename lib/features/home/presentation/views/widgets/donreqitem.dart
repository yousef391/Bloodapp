import 'package:blood_donation/const.dart';
import 'package:blood_donation/core/utils/styles.dart';
import 'package:flutter/material.dart';

class donrqitem extends StatelessWidget {
    donrqitem({
    super.key,
    required this.hint,
    this.selected,
    this.ontap,
    required this.path
  });
String hint;
bool? selected=false;
void Function()? ontap;
String path;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              width: 4,
              color:  selected! ? Colors.blue : Colors.transparent
            ),
           borderRadius: BorderRadius.circular(16),
          ),
        child: Container(
      
        width: MediaQuery.of(context).size.width*0.35,
           margin: EdgeInsets.all(10) ,
          decoration: BoxDecoration(
            border: Border.all(
              width: 10,
              color:  buttontextcolor 
            ),
           borderRadius: BorderRadius.circular(16),color: color2
          ),
           child: Center(child: Column(
             children: [
              Image.asset(path, height: MediaQuery.of(context).size.height*0.11, ),
               Text(hint , style:buttonstyle.copyWith(
                 fontSize: 16, color: buttontextcolor
               ) ,),
             ],
           )),
          ),
      ),
    );;
  }
}