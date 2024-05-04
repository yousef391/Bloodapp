part of 'cuser_cubit.dart';

@immutable
sealed class CuserState {}

final class CuserInitial extends CuserState {}
final class Cuserfailure extends CuserState {}
final class Cusersucces extends CuserState {
  Cusersucces({required this.user});
  UserM user;
}
final class Cuserloading extends CuserState {}