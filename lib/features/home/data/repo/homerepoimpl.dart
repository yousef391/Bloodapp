import 'package:blood_donation/core/utils/Failure.dart';
import 'package:blood_donation/features/auth/data/model/user.dart';

import 'package:blood_donation/features/home/data/repo/homerepo.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/Post.dart';

class Homerepoimpl extends homerepo {
  CollectionReference<Map<String, dynamic>> posts =
      FirebaseFirestore.instance.collection('Posts');
  CollectionReference<Map<String, dynamic>> users =
      FirebaseFirestore.instance.collection('users');
  final auth = FirebaseAuth.instance;
  @override
  Future<Either<Failure, List<postM>>> fetchPosts() async {
    List<postM> postlist = [];

    try {
      await posts.get().then(
        (event) {
          for (var element in event.docs) {
            postlist.add(postM.fromjsno(
                element.data() as Map<String, dynamic>, element.id));
          }
          print(postlist);
        },
      );

      return right(postlist);
    } on Exception catch (e) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, UserM?>> getcurrentuser(User? user) async {
    final docRef = users.doc(user!.uid);
    UserM? currentUser;
    try {
      await docRef.get().then(
        (DocumentSnapshot doc) {
          final data = doc.data() as Map<String, dynamic>;
          currentUser = UserM.fromjson(data);
        },
      );
      return right(currentUser);
    } on Exception catch (e) {
      return left(Failure());
    }
  }

  @override
  Future<Failure?> addpost(postM post) async {
    try {
      posts.add({
        'description': post.desc,
        'number': post.tel,
        'photo': post.imageurl,
        'status': post.status,
        'type': post.bloodtype,
        'city' : post.city
      });
    } on Exception catch (e) {
      return Failure();
    }
  }
}
