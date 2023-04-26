part of 'applied_bloc.dart';

@immutable
abstract class AppliedState {}

class AppliedInitial extends AppliedState {}

class AppliedLeaveLoadingState extends AppliedState{}

class AppliedLeaveLoadedState extends AppliedState{
  var appliedLeave;
  AppliedLeaveLoadedState({this.appliedLeave});
}

class AppliedLeaveFailedState extends AppliedState{}


