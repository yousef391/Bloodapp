part of 'addpost_cubit.dart';

@immutable
sealed class AddpostState {}

final class AddpostInitial extends AddpostState {}
final class Addpostsucces extends AddpostState {}
final class AddpostFailure extends AddpostState {
}
final class AddpostLoading extends AddpostState {}

