part of 'sport_bloc.dart';

@immutable
abstract class SportState {}

class SportInitial extends SportState {}

class AddNew extends SportState {}

class AddedNew extends SportState {}

class Loading extends SportState {}

class Error extends SportState {
  String? message;
  Error({this.message});
}