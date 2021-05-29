import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_sample/bloc/data/model/user_details.dart';
import 'package:flutter_bloc_sample/bloc/data/repository/user_details_repository.dart';
import 'package:meta/meta.dart';

part 'user_details_event.dart';

part 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  final UserDetailsRepository userDetailsRepository;

  UserDetailsBloc({required this.userDetailsRepository})
      : super(UserDetailsLoading());

  @override
  Stream<UserDetailsState> mapEventToState(UserDetailsEvent event,) async* {
    yield UserDetailsLoading();
    try {
      UserDetails userDetails = await userDetailsRepository.fetchUserDetails();
      await Future.delayed(Duration(seconds: 5));
      yield UserDetailsLoaded(userDetails);
    } catch (e) {
      print("Exception while fetching user details: " + e.toString());
      yield UserDetailsError();
    }
  }
}
