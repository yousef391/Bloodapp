import 'package:blood_donation/features/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:blood_donation/features/auth/presentation/views/Login_page.dart';
import 'package:blood_donation/features/auth/presentation/views/Otp.dart';
import 'package:blood_donation/features/auth/presentation/views/selection_view.dart';
import 'package:blood_donation/features/home/data/repo/homerepoimpl.dart';
import 'package:blood_donation/features/home/presentation/cubit/cubit/addpost_cubit.dart';
import 'package:blood_donation/features/home/presentation/cubit/cubit/cuser_cubit.dart';
import 'package:blood_donation/features/home/presentation/cubit/cubit/posts_cubit.dart';
import 'package:blood_donation/features/home/presentation/views/Home_view.dart';
import 'package:blood_donation/features/home/presentation/views/profileview.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class routerapp {
  static final Khomepath = '/home';
  static final Kbloodtype = '/blood_type';
  static final Kotpview = '/otp_view';
  static final Kprofileview = '/profileview';

  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return Login_view();
        },
      ),
      GoRoute(
          path: Khomepath,
          builder: (context, state) => BlocProvider(
                create: (context) => PostsCubit(Homerepoimpl())..fetchposts(),
                child: BlocProvider(
            create: (context) => CuserCubit(Homerepoimpl())
              ..getcurrentuser(BlocProvider.of<AuthCubit>(context).currentuser),
            child: Home_view(),
          )
              )),
      GoRoute(
        path: Kbloodtype,
        builder: (context, state) => selection_view(),
      ),
      GoRoute(
        path: Kotpview,
        builder: (context, state) => Otpview(
          phone: state.extra as String?,
        ),
      ),
      GoRoute(
        path: Kprofileview,
        builder: (context, state) {
          return profile_view();
        },
      ),
    ],
  );
}
