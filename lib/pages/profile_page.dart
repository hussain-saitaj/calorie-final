import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'edit_password.dart';
import 'edit_email.dart';
import 'edit_name.dart';
import 'edit_phone.dart';
import '../login_screen.dart';

import '../user/user_data.dart';

// This class handles the Page to dispaly the user's info on the "Edit Profile" Screen
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserData.myUser;

    return Scaffold(
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 10,
          ),
          Center(
              child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(64, 105, 225, 1),
                    ),
                  ))),

          buildUserInfoDisplay(user.name, 'Name', EditNameFormPage()),
          buildUserInfoDisplay(user.phone, 'Phone', EditPhoneFormPage()),
          buildUserInfoDisplay(user.email, 'Email', EditEmailFormPage()),
          MaterialButton(
            minWidth: 300,
            height: 60,
            onPressed: () {
              navigateSecondPage(EditPasswordFormPage());
            },
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: Colors.black
                ),

            ),
            child: Text("Reset Password", style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18
            ),),
          ),
          SizedBox( height: 10,),
          MaterialButton(
            minWidth: 300,
            height: 60,
            onPressed: () {
              navigateSecondPage(LoginScreen());
            },
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.black
              ),

            ),
            child: Text("Logout", style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18
            ),),
          )
        ],
      ),
    );
  }

  // Widget builds the display item with the proper formatting to display the user's info
  Widget buildUserInfoDisplay(String getValue, String title, Widget editPage) =>
      Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                  width: 350,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ))),
                  child: Row(children: [
                    Expanded(
                        child: TextButton(
                            onPressed: () {
                            },
                            child: Text(
                              getValue,
                              style: TextStyle(fontSize: 16, height: 1.4),
                            ))),
                    IconButton(
                      icon: Icon(Icons.edit),
                      color: Colors.black,
                      onPressed: (

                          ) {navigateSecondPage(editPage);},
                    )
                  ]))
            ],
          ));




  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  // Handles navigation and prompts refresh.
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}
