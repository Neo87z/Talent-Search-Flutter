// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud_new/models/job.dart';
import 'package:firebase_crud_new/models/user.dart';

import 'package:firebase_crud_new/screens/editListedJob.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../provider/CommonProvider.dart';


class ManageAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<User>>(context);
  final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
       appBar: AppBar(
          title: Text("Manage Admin"),
          
        ),
        body: (users != null)
            ? ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                    productProvider.ChangeUserType(users[index].Type);
                    productProvider.ChangePassword(users[index].Password);
                    productProvider.ChangeUserID(users[index].UserID);
                  if(users[index].Type == 'Admin'){
                    return Card(
                      child: ListTile(
                                       leading: Icon(
                      Icons.admin_panel_settings_sharp,
                      color: Colors.blueAccent,
                      size: 70.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
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
                                    enabled: true,
                                  ),
                                  TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.lock),
                                      labelText: users[index].Lname,
                                      enabled: true,
                                    ),
                                  ),
                                  TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.lock),
                                      labelText: users[index].Email,
                                      enabled: true,
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
                                 productProvider.UpdateAdmin();
                                  },
                                  color: Colors.red,
                                  child: Text(
                                    "Update Admin",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  ),
                                ),
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
                                    "Remove Admin",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  ),
                                )
                              ]).show();
                        }),
                    isThreeLine: true,
                    onTap: () {},
                  ));

                  }else{
                    return Card(
         
                  );

                  }
                  
                })
            : Center(child: CircularProgressIndicator()));
  }
}
