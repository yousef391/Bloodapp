import 'package:blood_donation/const.dart';
import 'package:blood_donation/core/utils/styles.dart';
import 'package:blood_donation/features/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:blood_donation/features/auth/presentation/views/widgets/blood_item.dart';
import 'package:blood_donation/features/auth/presentation/views/widgets/custom_textfield.dart';
import 'package:blood_donation/features/auth/presentation/views/widgets/custombutton.dart';
import 'package:blood_donation/features/auth/presentation/views/widgets/posnegicon.dart';
import 'package:blood_donation/features/home/data/model/Post.dart';
import 'package:blood_donation/features/home/presentation/cubit/cubit/addpost_cubit.dart';
import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class buttomsheetbody extends StatefulWidget {
  const buttomsheetbody({super.key});

  @override
  State<buttomsheetbody> createState() => _buttomsheetbodyState();
}

class _buttomsheetbodyState extends State<buttomsheetbody> {
  GroupController controller = GroupController();
  int? selectedindex = 0;
  bool pos = true;
  String? desc;
  String? city;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipperTwo(reverse: true, flip: true),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        color: color,
        height: MediaQuery.of(context).size.height * 0.9,
        child: Form(
            child: ListView(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'choose Blood type : ',
                style: buttonstyle.copyWith(color: buttontextcolor),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 5),
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
            custom_TF(
              onchanged: (p0) {
                city=p0;
              },
              hint: 'City',
            ),
            SizedBox(
              height: 5,
            ),
            custom_TF(
              onchanged: (p0) {
                desc=p0;
              },
              hint: 'description',
              maxLines: 4,
            ),
            SimpleGroupedSwitch<int>(
                    controller: controller,
                    values: [1,2],
                    itemsTitle: ["donate" ,"request"],
                    groupStyle: SwitchGroupStyle(
                        itemTitleStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: color2,
                       ),
                     activeColor: Colors.greenAccent,
                  ),  
             ),
            custom_button(
              ontap: () {
              
                var bloodtype;
                if (pos) {
                  bloodtype = bloodtypes[selectedindex!] + '+';
                } else {
                  bloodtype = bloodtypes[selectedindex!] + '-';
                }
                BlocProvider.of<AddpostCubit>(context).addpost(postM(
                    imageurl: 'assets/images/person.png',
                  city: city!,
                    status: controller.selectedItem==1 ? 'donate' : 'request',
                    desc: desc!,
                    tel: BlocProvider.of<AuthCubit>(context)
                        .currentuser!
                        .phoneNumber!,
                    bloodtype: bloodtype));
              },
              color: color2,
              content: BlocConsumer<AddpostCubit, AddpostState>(
                listener: (context, state) {
                  if (state is AddpostFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Failure'),
                      backgroundColor: Colors.red,
                    ));
                  }
                  if (state is Addpostsucces) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Succes'),
                      backgroundColor: Colors.green,
                    ));
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  return Text('save',
                      style: buttonstyle.copyWith(color: textcolor));
                },
              ),
            ),
            SizedBox(
              height: 5,
            )
          ],
        )),
      ),
    );
  }
}
