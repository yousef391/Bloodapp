import 'package:blood_donation/const.dart';
import 'package:blood_donation/core/utils/go_router.dart';
import 'package:blood_donation/core/utils/styles.dart';
import 'package:blood_donation/features/auth/presentation/cubit/cubit/auth_cubit.dart';

import 'package:blood_donation/features/auth/presentation/views/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'blood_item.dart';
import 'posnegicon.dart';

class selection_view_body extends StatefulWidget {
  const selection_view_body({super.key});

  @override
  State<selection_view_body> createState() => _selection_view_bodyState();
}

class _selection_view_bodyState extends State<selection_view_body> {
  int? selectedindex = 0;
  bool pos = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const cloudimage(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            children: [
            const   bloodimage(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 10),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2 / 1.9,
                    crossAxisCount: 2,
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return blood_item(
                      type: bloodtypes[index],
                      ontap: () {
                        setState(() {
                          selectedindex = index;
                        });
                      },
                      selected: selectedindex == index ? true : false,
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  posnegicon(
                      hint: '+',
                      selected: pos,
                      ontap: () => setState(() {
                            pos = !pos;
                          })),
                  posnegicon(
                    hint: '-',
                    selected: !pos,
                    ontap: () => setState(() {
                      pos = !pos;
                    }),
                  )
                ],
              ),
        const      SizedBox(
                height: 10,
              ),
              custom_button(
                ontap: () {
                  var bloodtype;
                  if(pos) {
  bloodtype=bloodtypes[selectedindex!]+'+';
                  } else {
 bloodtype=bloodtypes[selectedindex!]+'-';
                  }
                  BlocProvider.of<AuthCubit>(context).addbloodtype(bloodtype,BlocProvider.of<AuthCubit>(context).currentuser!.phoneNumber!);
                },
                color: buttontextcolor,
                content: BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if(state is Typessucces) {
                      GoRouter.of(context).push(routerapp.Khomepath);
                    }
                  },
                  builder: (context, state) {
                    
                    if (state is TypeLoading) {
                      return CircularProgressIndicator();
                    }else {
  return Text('next',
      style: buttonstyle.copyWith(color: textcolor));
}
                  },
                ),
              ),
          const     SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class bloodimage extends StatelessWidget {
  const bloodimage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80, bottom: 30),
      child: Image.asset(
        'assets/images/blood_icon.png',
        height: MediaQuery.of(context).size.height * 0.2,
      ),
    );
  }
}

class cloudimage extends StatelessWidget {
  const cloudimage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: MediaQuery.of(context).size.height - 100,
        child: Image.asset(
          'assets/images/cloud.png',
          width: MediaQuery.of(context).size.width,
        ));
  }
}
