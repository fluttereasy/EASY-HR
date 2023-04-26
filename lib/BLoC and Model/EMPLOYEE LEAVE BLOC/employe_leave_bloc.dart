import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hr_easy/REPOSITORIES/EMP%20LEAVE%20BALANCE/employee_leave_balance.dart';

part 'employe_leave_event.dart';
part 'employe_leave_state.dart';

class EmployeLeaveBloc extends Bloc<EmployeLeaveEvent, EmployeLeaveState> {
  EmployeeLeaveServices _employeeLeaveServices = EmployeeLeaveServices();
  EmployeLeaveBloc() : super(EmployeLeaveInitial()) {
    on<EmployeeLeaveFetchEvent>((event, emit) async {
      emit(EmployeeLeaveLoadingState());
      try {
        print("inside bloc Try cathc");
        var leaveData = await _employeeLeaveServices.getLeaveBalance(
            event.empCode.toString(), event.finanicalID.toString());
        emit(EmployeeLeaveLoadedState(employeeLeaveData: leaveData));
      } on Exception catch (e) {
        emit(EmployeeLeaveFailedState());
      }
    });
  }
}
