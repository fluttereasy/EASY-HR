part of 'otp_bloc.dart';

@immutable
abstract class OtpState {}

class OtpInitial extends OtpState {}

class OtpSendingState extends OtpState {}

class OtpSentState extends OtpState {
  var otpCode;
  OtpSentState({this.otpCode});
}

class OtpSendFailedState extends OtpState {}
