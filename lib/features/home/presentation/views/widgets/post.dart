import 'package:blood_donation/const.dart';
import 'package:blood_donation/core/utils/styles.dart';
import 'package:blood_donation/features/home/data/model/Post.dart';
import 'package:flutter/material.dart';

class post extends StatelessWidget {
   post( {super.key , required this.postinfo});
postM postinfo;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8 ,horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      color: buttontextcolor),
      child: Row(
       
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            
            height: MediaQuery.of(context ).size.height*0.1 ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: color2
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Center(child: 
              Image.asset(postinfo.imageurl! ,), ),
            ),
          ) , 
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(postinfo.bloodtype  , style: buttonstyle.copyWith(fontSize: 24) ,) , 
      Text(postinfo.tel  , style: buttonstyle.copyWith(fontSize: 24) ,) , 
      
      
      Container(
      width : MediaQuery.of(context).size.width*0.2,
        child: Text(postinfo.desc  , style: buttonstyle.copyWith(fontSize: 12 ),maxLines:3, softWrap: false, overflow: TextOverflow.ellipsis,))
      ],
    ) ,
    Icon(Icons.call)
        ],
      ),
    );
  }
}