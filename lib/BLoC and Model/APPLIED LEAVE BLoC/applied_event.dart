part of 'applied_bloc.dart';

@immutable
abstract class AppliedEvent {}

class AppliedFetchEvent extends AppliedEvent {
  String fyID;
  String empID;
  String date;
  AppliedFetchEvent({required this.fyID , required this.empID , required this.date});
}
