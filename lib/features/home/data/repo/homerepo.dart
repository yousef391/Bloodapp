import 'package:blood_donation/core/utils/Failure.dart';
import 'package:blood_donation/features/auth/data/model/user.dart';
import 'package:blood_donation/features/home/data/model/Post.dart';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

 abstract class homerepo {

Future<Either<Failure,List<postM>>> fetchPosts();
Future<Either<Failure,UserM?>> getcurrentuser( User? user);
Future<Failure?> addpost( postM post);



}