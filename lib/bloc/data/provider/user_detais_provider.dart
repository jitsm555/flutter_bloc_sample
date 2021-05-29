import 'dart:convert';
import 'package:flutter_bloc_sample/bloc/data/model/user_details.dart';
import 'package:http/http.dart' as http;

class UserDetailsProvider {
  final String URL =
      "https://5f383e6541c94900169bfd42.mockapi.io/api/v1/user_details";

  /// Fetch the user details from given public URL
  Future<UserDetails> fetchUserDetails() async {
    final response = await http.get(
      Uri.parse(URL),
    );

    if (response.statusCode == 200) {
      print("Success");
      final resData = UserDetails.fromJson(jsonDecode(response.body));
      return resData;
    }
    throw Exception('Not able to fetch the data: ' + response.body);
  }
}
