// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud_new/models/job.dart';
import 'package:firebase_crud_new/models/user.dart';
import 'package:firebase_crud_new/screens/ApplicantViewJob.dart';

import 'package:firebase_crud_new/screens/editListedJob.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../provider/CommonProvider.dart';

class ITSectorjob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final jobs = Provider.of<List<Job>>(context);
    return Scaffold(
        body: (jobs != null)
            ? ListView.builder(
                itemCount: jobs.length,
                itemBuilder: (context, index) {
                  if (jobs[index].JobCat == "IT") {
                    return Card(
                        child: ListTile(
                      leading: Icon(
                        Icons.add_to_queue_sharp,
                        color: Colors.blueAccent,
                        size: 70.0,
                        semanticLabel:
                            'Text to announce in accessibility modes',
                      ),
                      title: Text(jobs[index].Designation),
                      subtitle: Text(jobs[index].Job_Qualifications),
                      trailing: RaisedButton(
                          child: Text("Quick Apply"),
                          onPressed: () {
                            Alert(
                                context: context,
                                title: "User Details",
                                content: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 100, vertical: 0),
                                      child: Image(
                                        image:
                                            AssetImage('assets/mainlogo.png'),
                                      ),
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                          icon: Icon(Icons.account_circle),
                                          labelText: 'Applicant Full Name'),
                                      onChanged: (value) {
                                        productProvider.ChangeApplicantFullName(
                                            value);
                                      },
                                      enabled: true,
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                          icon: Icon(Icons.account_circle),
                                          labelText: 'Applicant Age'),
                                      onChanged: (value) {
                                        productProvider
                                            .changeAplicantAge(value);
                                      },
                                      enabled: true,
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                          icon: Icon(Icons.account_circle),
                                          labelText:
                                              'Applicant Highest Qualification'),
                                      onChanged: (value) {
                                        productProvider.ChangeApplocantHughQalu(
                                            value);
                                      },
                                      enabled: true,
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                          icon: Icon(Icons.account_circle),
                                          labelText: 'Expected Salary'),
                                      onChanged: (value) {
                                        productProvider
                                            .ChangeApplicantexpectedSalary(
                                                value);
                                      },
                                      enabled: true,
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                          icon: Icon(Icons.account_circle),
                                          labelText: 'About you'),
                                      onChanged: (value) {
                                        productProvider.ChangeApplicantAboutYou(
                                            value);
                                      },
                                      enabled: true,
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                          icon: Icon(Icons.account_circle),
                                          labelText: 'CV Link'),
                                      onChanged: (value) {
                                        productProvider.changeCV(value);
                                      },
                                      enabled: true,
                                    ),
                                  ],
                                ),
                                buttons: [
                                  DialogButton(
                                    onPressed: () {
                                      productProvider.SaveApplicant();
                                      Navigator.of(context).pop();
                                    },
                                    color: Colors.red,
                                    child: Text(
                                      "Apply To This Job",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  )
                                ]).show();
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
                              return AppkicantViewJob(jobs[index]);
                            }));
                        
                      },
                    ));
                  } else {
                    return Card();
                  }
                })
            : Center(child: CircularProgressIndicator()));
  }
}
