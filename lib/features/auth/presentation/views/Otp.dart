import 'package:blood_donation/const.dart';
import 'package:blood_donation/core/utils/go_router.dart';
import 'package:blood_donation/core/utils/styles.dart';
import 'package:blood_donation/features/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:blood_donation/features/auth/presentation/views/widgets/custombutton.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';


import 'widgets/countdown.dart';
import 'widgets/otpfield.dart';

// ignore: must_be_immutable
class Otpview extends StatelessWidget {
  Otpview({super.key, this.phone});
  String? phone;
  String? id;
  bool clear = false;

  final Tkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: Tkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is Authsuccestobloodtype) {
                GoRouter.of(context).push(routerapp.Kbloodtype);
              } 
               if (state is Authsuccestohome) {
                GoRouter.of(context).push(routerapp.Khomepath);
              }
              if (state is Authfailure) {
                ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
                  content: Text('CODE INCCORECT'),
                  backgroundColor: Colors.red,
                ));
                clear = true;
              }
              if (state is Authloading && clear == true) {
                clear = !clear;
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Code Verification',
                    style: buttonstyle.copyWith(fontSize: 34),
                  ),
               const    SizedBox(
                    height: 40,
                  ),
                  otpfield(clear: clear, phone: phone),
                const   SizedBox(
                    height: 40,
                  ),
                const   countdown(),
                const   SizedBox(
                    height: 20,
                  ),
                  state is Authloading
                      ? const  Center(
                          child: CircularProgressIndicator(),
                        )
                      : custom_button(
                          color: buttontextcolor,
                          content: Text('submit',
                              style: buttonstyle.copyWith(color: color2)),
                          ontap: () async {},
                        ),
                const   SizedBox(
                    height: 40,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

