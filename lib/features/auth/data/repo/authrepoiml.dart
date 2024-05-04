import 'package:blood_donation/core/utils/Failure.dart';
import 'package:blood_donation/features/auth/data/repo/authrepo.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class authrepoimpl extends Authrepo {
CollectionReference db = FirebaseFirestore.instance.collection('users');
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Future<Either<FirebaseAuthException, String>> verify(
      String phonenumber) async {
    String verificationid = '';
    FirebaseAuthException failure;
    try {
      await auth.verifyPhoneNumber(
        timeout: const Duration(seconds:  60),
        phoneNumber: phonenumber,
        verificationCompleted: (PhoneAuthCredential credential) {
        },
        verificationFailed: (FirebaseAuthException e) {  failure = e;
        },
        codeSent: (String verificationId, int? resendToken) {
          verificationid = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {

        },
      );
    
      return right(verificationid);
    } on FirebaseAuthException catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, User?>> login(
      String phonenumber, String verificationId, String code) async {
    String smsCode = code;

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      await auth.signInWithCredential(credential);
  
      return right(auth.currentUser!);
    } on Exception catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

   Future addbloodtype(String bloodtype, String phoneNumber)async {
  db.doc(auth.currentUser!.uid).update({ 'bloodtype' : bloodtype ,
  'number' : phoneNumber,
  'name' : 'username ',
  'fammilyname' : 'username',
  'adresse' : 'void',
  
  });
  }
  
  @override
  Future<bool> existenceofuser(String id) async {
    bool? exist;
      await FirebaseFirestore.instance.collection('users').doc(id).get().then((doc) {
        
            exist = doc.exists;
        });
        return exist!;
  } 

}
