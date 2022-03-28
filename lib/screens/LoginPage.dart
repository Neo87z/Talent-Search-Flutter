// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:firebase_crud_new/provider/CommonProvider.dart';
import 'package:firebase_crud_new/screens/adminHome.dart';

import 'package:firebase_crud_new/screens/createAccount.dart';
import 'package:firebase_crud_new/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 1.0,
          ),
          Image(
            image: NetworkImage(
                'https://cdn.dribbble.com/users/2055858/screenshots/5660772/media/df1b4e7c3e10f07efaea3278d3e71cb0.png?compress=1&resize=400x300&vertical=top'),
          ),
          Text('Welcome To TalentSeach.Lk',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontFamily: 'Lobster')),
          Text('Login To Proceed',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontFamily: 'Lobster')),
          SizedBox(
            height: 1.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                hintText: 'Enter Email Address',
              ),
              onChanged: (value) {
                productProvider.ChamngeEmail(value);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                hintText: 'Enter Password',
              ),
              onChanged: (value) {
                productProvider.ChangePassword(value);
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ButtonTheme(
            minWidth: 20.0,
            height: 50.0,
            child: RaisedButton(
                child: Text("Login"),
                onPressed: () async {
                  print("here");
                  if (await productProvider.CheckStatus() == 'Can') {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  } else if (await productProvider.CheckStatus() == 'Admin') {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AdminHome()));
                  } else {
                    Alert(
                            context: context,
                            title: "Login Failed",
                            desc: "Please Check The User Credentials")
                        .show();
                  }
                }),
          ),
          SizedBox(
            height: 15.0,
          ),
          ButtonTheme(
            minWidth: 20.0,
            height: 50.0,
            child: RaisedButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text("Sign Up"),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CreateAccount()));
                }),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text('Forgot Password? Click Me To Reset',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontFamily: 'Lobster')),
        ],
      ),
    );
  }
}
