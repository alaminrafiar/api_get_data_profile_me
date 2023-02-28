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
                  Text(user!.id.toString()),
                  Text(user!.employee_id.toString()),
                  Text(user!.name.toString()),
                  Text(user!.email.toString()),
                  Text(user!.phone_country.toString()),
                  Text(user!.phone_dial_code.toString()),
                  Text(user!.phone.toString()),
                  Text(user!.gender.toString()),
                  Text(user!.department.toString()),
                  Text(user!.designation.toString()),
                  Text(user!.imei.toString()),
                  Text(user!.image.toString()),
                  Text(user!.role.toString()),



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
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzZmFmZmQ2MTVlZjJhZTY4OTYxZDVhNSIsIm5hbWUiOiJBbC1hbWluIiwicm9sZSI6ImVtcGxveWVlIiwiaWF0IjoxNjc3NTY2MzEyLCJleHAiOjE2Nzc2NTI3MTJ9.oLGnTH_CPNpDOIs8d_PO1T0ZTDsXLAB0pbjZC2wL8fo"
          });
      //print("our result:  ${r.body}");
      Map result = json.decode(r.body);
      print("our result: ${result["data"]["name"]}");
      //print("name: ${r.body["name"]}");
      user = User(id: result["data"][MyKeywords.id],
        employee_id:result["data"][MyKeywords.employee_id],
        name:result["data"][MyKeywords.name],
        email: result["data"][MyKeywords.email],
        phone_country:result["data"][MyKeywords.phone_country],
        phone_dial_code:result["data"][MyKeywords.phone_dial_code],
        phone: result["data"][MyKeywords.phone],
        gender: result["data"][MyKeywords.gender],
        department: result["data"][MyKeywords.department],
        designation: result["data"][MyKeywords.designation],
        imei: result["data"][MyKeywords.imei],
        image: result["data"][MyKeywords.image],
        role: result["data"][MyKeywords.role],



      );
     return user;

    // final profileUrl=Uri.parse('https://api-attendance.grapview.com/api/v1/employee/profile');
    // final response =await http.get(profileUrl);
    // print(response.statusCode);
    // print(response.body);

    // return json.decode(response.body);
  }
}
