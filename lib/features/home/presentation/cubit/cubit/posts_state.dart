part of 'posts_cubit.dart';

@immutable
sealed class PostsState {}

final class PostsInitial extends PostsState {}
final class PostsFailure extends PostsState {}
final class PostsLoading extends PostsState {}
final class Postssucces extends PostsState {
  Postssucces(this.postlist,);
  final List<postM> postlist;
}




