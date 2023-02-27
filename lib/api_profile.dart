import 'package:api_get_data_profile_me/constans/my_key%20_words.dart';
import 'package:api_get_data_profile_me/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const api_profile());
}

class api_profile extends StatefulWidget {
  const api_profile({super.key});

  @override
  State<api_profile> createState() => _api_profileState();
}

class _api_profileState extends State<api_profile> {
  User? user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mLoadData().then((value){setState(() {

    });});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("api me"),
      ),
      body: user == null
          ? CircularProgressIndicator()
          : Container(
              child: Column(
                children: [
                  Text(user!.name.toString()),
                  Text(user!.email.toString()),
                  Text(user!.phone_country.toString())
                ],
              ),
            ),
    );
  }

  Future<User?> mLoadData() async {

     var r = await http.get(
          Uri.parse(
              'https://api-attendance.grapview.com/api/v1/employee/profile'),
          headers: <String, String>{
            'Content-Type': 'application/json',
            "api_key": '5267556B58703273357638792F423F45',
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzZmFmZmQ2MTVlZjJhZTY4OTYxZDVhNSIsIm5hbWUiOiJBbC1hbWluIiwicm9sZSI6ImVtcGxveWVlIiwiaWF0IjoxNjc3NDg5MzEzLCJleHAiOjE2Nzc1NzU3MTN9.7234w3HDLDb7CxzEPi4ne05bdD45ehEvIoJd0YHdsVo"
          });
      //print("our result:  ${r.body}");
      Map result = json.decode(r.body);
      print("our result: ${result["data"]["name"]}");
      //print("name: ${r.body["name"]}");
      user = User(name: result["data"][MyKeywords.name], email: result["data"][MyKeywords.email],phone_country:result["data"][MyKeywords.phone_country]);
     return user;

    // final profileUrl=Uri.parse('https://api-attendance.grapview.com/api/v1/employee/profile');
    // final response =await http.get(profileUrl);
    // print(response.statusCode);
    // print(response.body);

    // return json.decode(response.body);
  }
}
