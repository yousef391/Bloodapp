import 'package:blood_donation/const.dart';
import 'package:blood_donation/core/utils/styles.dart';
import 'package:blood_donation/features/home/data/repo/homerepoimpl.dart';
import 'package:blood_donation/features/home/presentation/cubit/cubit/addpost_cubit.dart';
import 'package:blood_donation/features/home/presentation/views/widgets/buttomsheetbody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/home_view_body.dart';

class Home_view extends StatelessWidget {
  const Home_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: color,
          onPressed: () {
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return BlocProvider(
                    create: (context) => AddpostCubit(Homerepoimpl()),
                    child: buttomsheetbody(),
                  );
                });
          },
          label: Text(
            'Add post',
            style: buttonstyle.copyWith(color: buttontextcolor),
          )),
      backgroundColor: color2,
      body: home_view_body(),
    );
  }
}
