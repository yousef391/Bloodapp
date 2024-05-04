import 'package:bloc/bloc.dart';
import 'package:blood_donation/core/utils/Failure.dart';
import 'package:blood_donation/features/home/data/model/Post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../data/repo/homerepoimpl.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit(this.homerepoimpl) : super(PostsInitial());
  Homerepoimpl homerepoimpl;
   CollectionReference<Map<String, dynamic>> posts = FirebaseFirestore.instance.collection('Posts');

  Future fetchposts() async {
    emit(PostsLoading());
    posts.snapshots().listen((event) async {
      Either<Failure, List<postM>> result = await homerepoimpl.fetchPosts();
      result.fold((l) => emit(PostsFailure()), (r) {
      
      emit(Postssucces(r));
     
      });
     });
    

    
    
  }


}
