import 'dart:math';

import 'package:blood_donation/const.dart';
import 'package:flutter/material.dart';

class custom_TF extends StatelessWidget {
   custom_TF({
    required this.hint,
    super.key,
    this.maxLines,
    this.onchanged
  });
  
  final hint;
  int? maxLines=1;
  void Function(String)? onchanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextFormField(
        onChanged: onchanged,
        validator: (value) {
          if(value==null || value=='' ) {
            return 'void informations';
          }
          if( !value.startsWith('+213') && !value.startsWith('0')  ) {
            return 'numéro inccorect' ;
          }
        },
        maxLines: maxLines,
        decoration: InputDecoration(
            fillColor: color2,
            hintStyle: TextStyle(color: textcolor, fontSize: 18 ,),
            filled: true,
            hintText: hint,
            border: borderdec(),
            enabledBorder: borderdec(),
            focusedBorder: borderdec(),
            disabledBorder: borderdec()),
      ),
    );
  }

  OutlineInputBorder borderdec() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.transparent));
  }
}
