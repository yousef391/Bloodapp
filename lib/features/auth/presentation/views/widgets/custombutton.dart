import 'package:blood_donation/core/utils/go_router.dart';
import 'package:blood_donation/core/utils/styles.dart';
import 'package:blood_donation/features/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class custom_button extends StatelessWidget {
  custom_button(
      {super.key, required this.color, required this.content, this.ontap});
  Color color;

  Widget? content;
  void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: ontap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(36)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(child: content),
          ),
        ));
  }
}
