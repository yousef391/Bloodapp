import 'package:blood_donation/const.dart';
import 'package:blood_donation/core/utils/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class custom_search_bar extends StatelessWidget {
  const custom_search_bar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 50,
      
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12)
      ),
      width: MediaQuery.of(context).size.width ,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
         CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(onPressed: (){
            GoRouter.of(context).push(routerapp.Kprofileview);
          }, icon: Icon(Icons.person )),
         ) , 
         Icon(Icons.search)
          ],
        ),
      )
      ,
    );
  }
}