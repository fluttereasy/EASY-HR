part of 'employe_leave_bloc.dart';

@immutable
abstract class EmployeLeaveState {}

class EmployeLeaveInitial extends EmployeLeaveState {}

class EmployeeLeaveLoadingState extends EmployeLeaveState {}

class EmployeeLeaveLoadedState extends EmployeLeaveState {
  var employeeLeaveData;
  EmployeeLeaveLoadedState({this.employeeLeaveData});
}

class EmployeeLeaveFailedState extends EmployeLeaveState {}
