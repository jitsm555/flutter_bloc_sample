import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sample/bloc/data/repository/user_details_repository.dart';
import 'package:flutter_bloc_sample/bloc/domain/user_details_bloc.dart';
import 'package:flutter_bloc_sample/bloc/presentation/widgets/user_details_widget.dart';

class UserDetailsScreen extends StatefulWidget {
  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  late final UserDetailsRepository _userDetailsRepository;
  late final UserDetailsBloc _userDetailsBloc;

  @override
  void initState() {
    _userDetailsRepository = UserDetailsRepository();
    _userDetailsBloc =
        UserDetailsBloc(userDetailsRepository: _userDetailsRepository);
    _userDetailsBloc.add(UserDetailsInfo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Center(
        child: BlocBuilder(
            bloc: _userDetailsBloc,
            builder: (BuildContext context, UserDetailsState state) {
              if (state is UserDetailsLoading) {
                return CircularProgressIndicator();
              }
              if (state is UserDetailsLoaded) {
                return UserDetailsWidget(userDetails: state.userDetails);
              }
              return Text('Unable to fetch the user details!!!');
            }),
      ),
    );
  }
}
