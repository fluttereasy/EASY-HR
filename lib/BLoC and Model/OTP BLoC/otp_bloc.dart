import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_easy/REPOSITORIES/OTP%20SERVICES/otp_services.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  static String? otpSent;
  OtpBloc() : super(OtpInitial()) {
    OtpServicces otpServicces = OtpServicces();
    on<OtpSendEvent>((event, emit) async {
      emit(OtpSendingState());
      try {
        final otpCode = otpServicces.sendOtp(event.phoneNumber.toString());
        emit(OtpSentState(otpCode: otpCode));
      } catch (e) {}
    });
  }
}
