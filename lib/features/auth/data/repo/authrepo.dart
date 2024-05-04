import 'package:blood_donation/core/utils/Failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class Authrepo {


  Future<Either<Failure,User?>> login(String phonenumber,String verificationId ,String code);
  Future<Either<FirebaseAuthException,String>> verify(String phonenumber);
Future addbloodtype(String bloodtype,String phoneNumber); 
Future<bool> existenceofuser(String id);

}