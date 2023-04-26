import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hr_easy/REPOSITORIES/APPLIED%20LEAVE%20SERVICES/applied_leave_services.dart';
import 'package:meta/meta.dart';

part 'applied_event.dart';
part 'applied_state.dart';

class AppliedBloc extends Bloc<AppliedEvent, AppliedState> {
  AppliedBloc() : super(AppliedInitial()) {
    AppliedLeaveServices appliedLeaveServices = AppliedLeaveServices();
    on<AppliedFetchEvent>((event, emit) async{
      try {
        emit(AppliedLeaveLoadingState());
        var appliedLeave = await appliedLeaveServices.getAppliedLeaves(
            event.fyID, event.empID, event.date);
        emit(AppliedLeaveLoadedState(appliedLeave: appliedLeave));
      } on Exception catch (e) {
        print(e.toString());
      }
    });
  }
}
