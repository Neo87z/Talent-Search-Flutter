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
                    leading: FlutterLogo(size: 72.0),
                    title: Text(appli[index].AboutYou),
                    subtitle: Text(appli[index].ApplicantID),
                    trailing: RaisedButton(
                        child: Text("View Application"),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  ApplicantView(appli[index])));
                        }),
                    isThreeLine: true,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ApplicantView(appli[index])));
                    },
                  ));
                })
            : Center(child: CircularProgressIndicator()));
  }
}
