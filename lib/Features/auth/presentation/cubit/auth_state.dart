import 'package:flutter/material.dart';
@immutable
abstract class AuthState {}
class AuthInitial extends AuthState {}
class LoginLoading extends AuthState {}
class LoginSuccess extends AuthState {}
class LoginError extends AuthState {
  final String errorMessage;
  LoginError(this.errorMessage);
}
class RegisterLoading extends AuthState {}
class RegisterSuccess extends AuthState {}
class RegisterError extends AuthState {
  final String errorMessage;
  RegisterError(this.errorMessage);
}