part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class Verifysucces extends AuthState {}
final class Verifyfailure extends AuthState {}
final class Verifyloading extends AuthState {}
// ignore: must_be_immutable
final class Authsuccestobloodtype extends AuthState {

}
final class Authsuccestohome extends AuthState {

}
// ignore: must_be_immutable
final class Authfailure extends AuthState {
  Authfailure({this.message});
  String? message;
}
final class Authloading extends AuthState {}

final class TypeFailure extends AuthState {}
final class TypeLoading extends AuthState {}
final class Typessucces extends AuthState {

}

