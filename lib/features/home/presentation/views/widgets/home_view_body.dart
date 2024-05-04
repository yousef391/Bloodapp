import 'package:blood_donation/const.dart';
import 'package:blood_donation/core/utils/styles.dart';
import 'package:blood_donation/features/home/data/model/Post.dart';
import 'package:blood_donation/features/home/presentation/cubit/cubit/posts_cubit.dart';
import 'package:blood_donation/features/home/presentation/views/widgets/donreqitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_search_bar.dart';
import 'post.dart';

class home_view_body extends StatefulWidget {
  const home_view_body({super.key});

  @override
  State<home_view_body> createState() => _home_view_bodyState();
}

class _home_view_bodyState extends State<home_view_body> {
  String type = 'donate';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
              color: homecolor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                custom_search_bar(),
                SizedBox(
                  height: 20,
                ),
                choosing(
                  ontap1: () {
                    setState(() {
                      if (type != 'donate') {
                        setState(() {
                          type = 'donate';
                        });
                      }
                    });
                  },
                  ontap2: () {
                    setState(() {
                      if (type != 'request') {
                        setState(() {
                          type = 'request';
                        });
                      }
                    });
                  },
                  type: type,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '$type' + ' :',
          style: buttonstyle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: BlocConsumer<PostsCubit, PostsState>(
              listener: (context, state) {
                
              },
              builder: (context, state) {
                if (state is Postssucces) {
                  List<postM> newlst = state.postlist
                      .where((element) => element.status == type)
                      .toList();
                  return ListView.builder(
                    itemCount: newlst.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: post(
                          postinfo: newlst[index],
                        ),
                      );
                    },
                  );
                } else if (state is PostsFailure) {
                  return const Text('Failure');
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ],
    );
  }
}




class choosing extends StatefulWidget {
  choosing({super.key, this.ontap1, this.ontap2, required this.type});
  void Function()? ontap1;
  void Function()? ontap2;
  String type;

  @override
  State<choosing> createState() => _choosingState();
}

class _choosingState extends State<choosing> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        donrqitem(
          hint: 'donate',
          path: 'assets/images/donate.png',
          ontap: widget.ontap1,
          selected: widget.type == 'donate' ? true : false,
        ),
        donrqitem(
          hint: 'request',
          path: 'assets/images/req.png',
          ontap: widget.ontap2,
          selected: widget.type == 'request' ? true : false,
        )
      ],
    );
  }
}
