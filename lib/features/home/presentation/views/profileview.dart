import 'package:blood_donation/const.dart';
import 'package:blood_donation/core/utils/styles.dart';
import 'package:blood_donation/features/home/presentation/cubit/cubit/cuser_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:go_router/go_router.dart';

class profile_view extends StatefulWidget {
  profile_view({super.key});

  @override
  State<profile_view> createState() => _profile_viewState();
}

class _profile_viewState extends State<profile_view> {
  bool edit = true;


  
  @override
  Widget build(BuildContext context) {
    var inputDecoration = const  InputDecoration(
        focusedBorder: InputBorder.none, border: InputBorder.none);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              edit = !edit;
              setState(() {});
            },
            child: !edit
                ? const  Icon(
                    Icons.save,
                    size: 32,
                  )
                : const  Icon(
                    Icons.edit,
                    size: 32,
                  )),
        body: BlocConsumer<CuserCubit, CuserState>(
          listener: (context, state) {
            
          },
          builder: (context, state) {
            if (state is Cusersucces ) {
  TextEditingController _controllername =
      TextEditingController(text: state.user.name);
  TextEditingController _controlleradresse =
      TextEditingController(text: state.user.adresse);
  TextEditingController _controllerbloodtype =
      TextEditingController(text: state.user.bloodtype);
              return Stack(
              children: [
                Column(
                  children: [
                    ClipPath(
                      clipper: WaveClipperTwo(flip: true),
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 10),
                              child: IconButton(
                                  onPressed: () {
                                    GoRouter.of(context).pop();
                                  },
                                  icon: Icon(Icons.arrow_back_ios_rounded)),
                            ),
                          ],
                        ),
                        height: MediaQuery.of(context).size.height * 0.35,
                        decoration: BoxDecoration(
                          color: color2,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      controller: _controllername,
                      decoration: inputDecoration,
                      textAlign: TextAlign.center,
                      readOnly: edit,
                      style: buttonstyle.copyWith(fontSize: 32),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      state.user.tel,
                      style: buttonstyle.copyWith(fontSize: 28),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            'Adresse :',
                            style: buttonstyle.copyWith(fontSize: 22),
                          ),
                          Flexible(
                            child: TextFormField(
                              controller: _controlleradresse,
                              decoration: inputDecoration,
                              textAlign: TextAlign.center,
                              readOnly: edit,
                              style: buttonstyle.copyWith(fontSize: 22),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            'blood type :',
                            style: buttonstyle.copyWith(fontSize: 22),
                          ),
                          Flexible(
                            child: TextFormField(
                              controller: _controllerbloodtype,
                              decoration: inputDecoration,
                              textAlign: TextAlign.center,
                              readOnly: edit,
                              style: buttonstyle.copyWith(fontSize: 22),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Text(
                      'contact us',
                      style: buttonstyle.copyWith(fontSize: 28),
                    ),
                    Text(
                      '0797505598',
                      style: buttonstyle.copyWith(fontSize: 22),
                    ),
                    Text(
                      'blooddonation@gmail.com',
                      style: buttonstyle.copyWith(fontSize: 22),
                    ),
                const     SizedBox(height: 55)
                  ],
                ),
                const profileimage(),
                const cloudimage(),
              ],
            ); 
            } else {
              return const  Center(child: CircularProgressIndicator(),); 
            }
          },
        ));
  }
}

class cloudimage extends StatelessWidget {
  const cloudimage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: MediaQuery.of(context).size.height - 90,
        child: Image.asset(
          'assets/images/cloud.png',
          width: MediaQuery.of(context).size.width + 100,
        ));
  }
}

class profileimage extends StatelessWidget {
  const profileimage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: MediaQuery.of(context).size.width * 0.35,
        left: MediaQuery.of(context).size.width * 0.35,
        top: MediaQuery.of(context).size.height * 0.24,
        child: CircleAvatar(
          radius: 64,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset('assets/images/req.png'),
          ),
        ));
  }
}
