import 'package:flutter/material.dart';
import 'package:flutter_bloc_sample/bloc/data/model/user_details.dart';

class UserDetailsWidget extends StatelessWidget {
  final UserDetails userDetails;

  const UserDetailsWidget({Key? key, required this.userDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: Image.network(
            userDetails.image ?? "",
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 16.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Name: ${userDetails.name ?? ""}"),
            Text("Percentage: ${userDetails.winningPercentage ?? ""}"),
            Text("Won: ${userDetails.won ?? ""}"),
          ],
        )
      ],
    );
  }
}
