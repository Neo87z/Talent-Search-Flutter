// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud_new/models/job.dart';
import 'package:firebase_crud_new/models/user.dart';

import 'package:firebase_crud_new/screens/editListedJob.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class ManageUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<User>>(context);
    return Scaffold(
        body: (users != null)
            ? ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                    leading: FlutterLogo(size: 72.0),
                    title: Text(users[index].Fname),
                    subtitle: Text(users[index].Lname),
                    trailing: RaisedButton(
                        child: Text("View Details"),
                        onPressed: () {
                          Alert(
                              context: context,
                              title: "User Details",
                              content: Column(
                                children: <Widget>[
                                  TextField(
                                    decoration: InputDecoration(
                                        icon: Icon(Icons.account_circle),
                                        labelText: users[index].Fname),
                                    enabled: false,
                                  ),
                                  TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.lock),
                                      labelText: users[index].Lname,
                                      enabled: false,
                                    ),
                                  ),
                                  TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.lock),
                                      labelText: users[index].Email,
                                      enabled: false,
                                    ),
                                  ),
                                  TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.lock),
                                      labelText: users[index].Type,
                                      enabled: false,
                                    ),
                                  ),
                                  TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.lock),
                                      labelText: users[index].UserID,
                                      enabled: false,
                                    ),
                                  ),
                                ],
                              ),
                              buttons: [
                                DialogButton(
                                  onPressed: () {
                                    final docUser = FirebaseFirestore.instance
                                        .collection('user')
                                        .doc(users[index].UserID);
                                    docUser.delete();
                                    Navigator.of(context).pop();
                                  },
                                  color: Colors.red,
                                  child: Text(
                                    "Remove User",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                )
                              ]).show();
                        }),
                    isThreeLine: true,
                    onTap: () {},
                  ));
                })
            : Center(child: CircularProgressIndicator()));
  }
}
