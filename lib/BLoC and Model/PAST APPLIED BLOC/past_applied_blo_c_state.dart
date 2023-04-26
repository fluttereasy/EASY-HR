part of 'past_applied_blo_c_bloc.dart';

@immutable
abstract class PastAppliedBloCState {}

class PastAppliedBloCInitial extends PastAppliedBloCState {}

class PastAppliedLoadingState extends PastAppliedBloCState {}

class PastAppliedLoadedState extends PastAppliedBloCState {
  var pastLeaves;
  PastAppliedLoadedState({this.pastLeaves});
}

class PastAppliedfailedState extends PastAppliedBloCState {}
