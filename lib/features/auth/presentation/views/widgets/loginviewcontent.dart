  import 'package:blood_donation/const.dart';
import 'package:blood_donation/core/utils/go_router.dart';
import 'package:blood_donation/core/utils/styles.dart';
import 'package:blood_donation/features/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:blood_donation/features/auth/presentation/views/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'custombutton.dart';

class content extends StatelessWidget {
   content({
    super.key, 
    
  }) ;

  final GlobalKey<FormState> _key=GlobalKey<FormState>();
  String? phonenumber;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80, bottom: 30),
              child: Image.asset(
                'assets/images/blood_icon.png',
                height: MediaQuery.of(context).size.height * 0.2,
              ),
            ),
            custom_TF(
              hint: 'Phone number',
              onchanged: (p0) {
                    if (p0.startsWith('0')) {
                      phonenumber = '+213'+ p0.substring(1);
                   
                    } else if (p0.startsWith('+213')) {
                      phonenumber = p0;
                    } 
                  },
            ),
            Spacer(),
            Text(
              'register now >>',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            custom_button(
              color: color2,
              content: Text('Login',
                  style: buttonstyle.copyWith(color: buttontextcolor)),
              ontap: () {
                if (_key.currentState!.validate()) {
                  
                  BlocProvider.of<AuthCubit>(context).verify(phonenumber!);
                  GoRouter.of(context)
                      .push(routerapp.Kotpview, extra: phonenumber!);
                }
              },
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
