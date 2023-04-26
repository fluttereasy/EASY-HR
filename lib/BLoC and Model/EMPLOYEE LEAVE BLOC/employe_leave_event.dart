part of 'employe_leave_bloc.dart';

@immutable
abstract class EmployeLeaveEvent {}

class EmployeeLeaveFetchEvent extends EmployeLeaveEvent{
  String? empCode;
  String ?finanicalID;
  EmployeeLeaveFetchEvent({this.empCode , this.finanicalID});
}
