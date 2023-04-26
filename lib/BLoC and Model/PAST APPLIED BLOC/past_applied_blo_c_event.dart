part of 'past_applied_blo_c_bloc.dart';

@immutable
abstract class PastAppliedBloCEvent {}

class PastLeaveFetchEvent extends PastAppliedBloCEvent {
  String fyId;
  String date;
  String empCodee;
  PastLeaveFetchEvent(
      {required this.fyId, required this.date, required this.empCodee});
}
