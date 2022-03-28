// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:firebase_crud_new/provider/CommonProvider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateAccount extends StatefulWidget {
  @override
  State<CreateAccount> createState() => _CreateAccount();
}

class _CreateAccount extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: ListView(
          children: <Widget>[
            Image(
              image: NetworkImage(
                  'https://cdn.dribbble.com/users/2055858/screenshots/5660772/media/df1b4e7c3e10f07efaea3278d3e71cb0.png?compress=1&resize=400x280&vertical=top'),
            ),
            Text('Create Your TalentSeach.Lk Account',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontFamily: 'Lobster')),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  hintText: 'Enter First Name',
                ),
                onChanged: (value) {
                  productProvider.ChangeFirstName(value);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  hintText: 'Enter Last Name',
                ),
                onChanged: (value) {
                  productProvider.ChangelaastName(value);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
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
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  hintText: 'Enter Confirm Password',
                ),
                onChanged: (value) {
                  productProvider.ChangePassword(value);
                },
              ),
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
                  child: Text("Create Account"),
                  onPressed: () {
                    productProvider.SaveUser();
                    Navigator.of(context).pop();
                  }),
            ),
            // ignore: deprecated_member_use
          ],
        ),
      ),
    );
  }
}
