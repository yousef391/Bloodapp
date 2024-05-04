import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:blood_donation/features/auth/data/model/user.dart';
import 'package:blood_donation/features/auth/data/repo/authrepoiml.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {

  AuthCubit(this.authrepo) : super(AuthInitial());
  String? id;
  User? currentuser;
final docRef = FirebaseFirestore.instance.collection("users");

 
authrepoimpl authrepo;
  Future verify(String phone) async {
   emit(Verifyloading()) ;
  var verfi= await authrepo.verify(phone);
  verfi.fold((l) => emit(Verifyfailure()), (r) {
    id=r;
    emit(Verifysucces());});
  }

    Future login(String phone , String id, String code) async {
   emit(Authloading()) ;
  var credential= await authrepo.login(phone ,id, code);
  bool exist;
  credential.fold((l) => emit(Authfailure(message: l.message)), (r) async{
   
    currentuser=r;
  
    exist= await authrepo.existenceofuser(r!.uid);
    

    if(exist) {
      emit(Authsuccestohome());
    } else {
      emit(Authsuccestobloodtype());
    }
 
    
    });
  }

    Future addbloodtype(String bloodtype,String phoneNumber) async {
emit(TypeLoading());
try {
  authrepo.addbloodtype(bloodtype,phoneNumber);
  emit(Typessucces());
} on Exception catch (e) {
  emit(TypeFailure());
}
  }


}
