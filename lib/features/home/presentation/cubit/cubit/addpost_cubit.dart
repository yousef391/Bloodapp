import 'package:bloc/bloc.dart';
import 'package:blood_donation/features/home/data/model/Post.dart';
import 'package:blood_donation/features/home/data/repo/homerepoimpl.dart';
import 'package:meta/meta.dart';

part 'addpost_state.dart';

class AddpostCubit extends Cubit<AddpostState> {
  AddpostCubit(this._homerepoimpl) : super(AddpostInitial());
Homerepoimpl _homerepoimpl;
  Future addpost(postM post) async {
    emit(AddpostLoading());
var result= await _homerepoimpl.addpost(post);
result==null ? emit(Addpostsucces()) : emit(AddpostFailure());
  }
}
