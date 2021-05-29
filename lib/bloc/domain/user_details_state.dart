part of 'user_details_bloc.dart';

@immutable
abstract class UserDetailsState {}

class UserDetailsLoading extends UserDetailsState {
  @override
  String toString() {
    return "UserDetailsLoading";
  }
}

class UserDetailsLoaded extends UserDetailsState {
  final UserDetails userDetails;

  UserDetailsLoaded(this.userDetails);

  @override
  String toString() {
    return "UserDetailsLoaded";
  }
}

class UserDetailsError extends UserDetailsState {
  @override
  String toString() {
    return "UserDetailsError";
  }
}
