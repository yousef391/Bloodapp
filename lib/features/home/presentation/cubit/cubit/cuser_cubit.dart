import 'package:bloc/bloc.dart';
import 'package:blood_donation/core/utils/Failure.dart';
import 'package:blood_donation/features/auth/data/model/user.dart';
import 'package:blood_donation/features/home/data/repo/homerepoimpl.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'cuser_state.dart';

class CuserCubit extends Cubit<CuserState> {
  CuserCubit(this.homerepoimpl) : super(CuserInitial());
Homerepoimpl homerepoimpl;
  UserM? cusser;

 Future getcurrentuser(User? user) async{
 Either<Failure, UserM?> result=await  homerepoimpl.getcurrentuser(user);
result.fold((l) => emit(Cuserfailure()), (r) => {
  cusser=r,
  emit(Cusersucces(user: cusser!))
});
 }

}
