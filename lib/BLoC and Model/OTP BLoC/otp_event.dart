part of 'otp_bloc.dart';

@immutable
abstract class OtpEvent {}

class OtpSendEvent extends OtpEvent{
  String ?phoneNumber;
  OtpSendEvent({this.phoneNumber});
}
