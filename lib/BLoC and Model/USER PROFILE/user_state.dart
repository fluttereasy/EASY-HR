part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserProfileLoadingState extends UserState {}

class UserProfileLoadedState extends UserState {
  var userProfileData;
  UserProfileLoadedState({this.userProfileData});
}

class UserProfileFailedLoadingState extends UserState {}
