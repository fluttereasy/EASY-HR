import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hr_easy/REPOSITORIES/PAST%20LEAVE%20SERVICES/applied_leave_services.dart';
import 'package:meta/meta.dart';

part 'past_applied_blo_c_event.dart';
part 'past_applied_blo_c_state.dart';

class PastAppliedBloCBloc
    extends Bloc<PastAppliedBloCEvent, PastAppliedBloCState> {
  PastAppliedServices pastAppliedServices = PastAppliedServices();

  PastAppliedBloCBloc() : super(PastAppliedBloCInitial()) {
    on<PastLeaveFetchEvent>((event, emit) async {
      emit(PastAppliedLoadingState());
      try {
        final pastLeave = await pastAppliedServices.getPastLeaves(
            event.fyId, event.date, event.empCodee);
        emit(PastAppliedLoadedState(pastLeaves: pastLeave));
      } on Exception catch (e) {
        emit(PastAppliedfailedState());
      }
    });
  }
}
