// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud_new/models/applyJob.dart';
import 'package:firebase_crud_new/models/job.dart';
import 'package:firebase_crud_new/models/user.dart';
import 'package:firebase_crud_new/screens/ApplicantViewJob.dart';

import 'package:firebase_crud_new/screens/editListedJob.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../provider/CommonProvider.dart';
import 'ApplicantViewInsideApplication.dart';

class AppliantJob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final appli = Provider.of<List<Applicant>>(context);

    return Scaffold(
        body: (appli != null)
            ? ListView.builder(
                itemCount: appli.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                    leading: Icon(
                      Icons.adf_scanner_rounded,
                      color: Colors.blueAccent,
                      size: 70.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                    title: Text(appli[index].FullName),
                    subtitle: Text(appli[index].Status),
                    trailing: RaisedButton(
                        child: Text("View Application"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  transitionDuration: Duration(seconds: 2),
                                  transitionsBuilder: (BuildContext context,
                                      Animation<double> animation,
                                      Animation<double> secAnimation,
                                      Widget child) {
                                    animation = CurvedAnimation(
                                        parent: animation,
                                        curve: Curves.fastOutSlowIn);
                                    return ScaleTransition(
                                      alignment: Alignment.center,
                                      scale: animation,
                                      child: child,
                                    );
                                  },
                                  pageBuilder: (BuildContext context,
                                      Animation<double> animation,
                                      Animation<double> secAnimation) {
                                    return ApplicantView(appli[index]);
                                  }));
                        }),
                    isThreeLine: true,
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              transitionDuration: Duration(seconds: 2),
                              transitionsBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secAnimation,
                                  Widget child) {
                                animation = CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.fastOutSlowIn);
                                return ScaleTransition(
                                  alignment: Alignment.center,
                                  scale: animation,
                                  child: child,
                                );
                              },
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secAnimation) {
                                return ApplicantView(appli[index]);
                              }));
                    },
                  ));
                })
            : Center(child: CircularProgressIndicator()));
  }
}
