import 'package:blood_donation/const.dart';
import 'package:blood_donation/features/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class otpfield extends StatelessWidget {
  const otpfield({
    super.key,
    required this.clear,
    required this.phone,
  });

  final bool clear;
  final String? phone;

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      clearText: clear,
      autoFocus: true,
      borderWidth: 4,
      numberOfFields: 6,
      borderColor: buttontextcolor,
      showFieldAsBox: true,
      onCodeChanged: (String code) {},

      onSubmit: (String verificationCode) async {
        await BlocProvider.of<AuthCubit>(context).login(
            phone!, BlocProvider.of<AuthCubit>(context).id!, verificationCode);
            
            
      }, // end onSubmit
    );
  }
}

