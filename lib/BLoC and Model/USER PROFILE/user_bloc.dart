import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hr_easy/SHARED%20PREF%20UTILS/shared_pref_util.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../REPOSITORIES/USER PROFILE SERVICES/user_profile_services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserProfile _userProfile = UserProfile();

  UserBloc() : super(UserInitial()) {
    on<UserProfileFetchEvent>((event, emit) async {
      emit(UserProfileLoadingState());
      try {
        final profileData =
            await _userProfile.getUserProfile(event.phoneNumber.toString());
        // print(profileData);

        emit(UserProfileLoadedState(userProfileData: profileData));
      } catch (e) {
        emit(UserProfileFailedLoadingState());
      }
    });
  }
}
