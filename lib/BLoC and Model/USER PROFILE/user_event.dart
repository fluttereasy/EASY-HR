part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class UserProfileFetchEvent extends UserEvent {
  String ?phoneNumber;
  UserProfileFetchEvent({this.phoneNumber});
}
