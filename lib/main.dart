import 'package:blood_donation/core/utils/go_router.dart';
import 'package:blood_donation/features/auth/data/repo/authrepoiml.dart';
import 'package:blood_donation/features/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:blood_donation/features/auth/presentation/views/Login_page.dart';
import 'package:blood_donation/const.dart';
import 'package:blood_donation/features/auth/presentation/views/selection_view.dart';
import 'package:blood_donation/features/home/data/repo/homerepoimpl.dart';
import 'package:blood_donation/features/home/presentation/cubit/cubit/addpost_cubit.dart';
import 'package:blood_donation/features/home/presentation/views/Home_view.dart';
import 'package:blood_donation/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(authrepoimpl()),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: routerapp.router,
        title: 'Blood donation ',
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: color,
            textTheme: GoogleFonts.outfitTextTheme(ThemeData.dark().textTheme)),
      ),
    );
  }
}
