import 'package:blood_donation/const.dart';
import 'package:blood_donation/core/utils/go_router.dart';
import 'package:blood_donation/core/utils/styles.dart';
import 'package:blood_donation/features/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:blood_donation/features/auth/presentation/views/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'custom_textfield.dart';
import 'loginviewcontent.dart';

class Login_view_body extends StatelessWidget {
  Login_view_body({super.key});
  final _key = GlobalKey<FormState>();
  String? phonenumber;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: MediaQuery.of(context).size.height - 100,
            child: Image.asset(
              'assets/images/cloud.png',
              width: MediaQuery.of(context).size.width,
            )),
        content(),
      ],
    );
  }
}

