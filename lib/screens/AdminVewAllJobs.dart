import 'package:firebase_crud_new/models/job.dart';

import 'package:firebase_crud_new/screens/editListedJob.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdmiNViewJobs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Jobs = Provider.of<List<Job>>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Listed Jobs"),
        ),
        body: (Jobs != null)
            ? ListView.builder(
                itemCount: Jobs.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                    leading: Icon(
                      Icons.account_tree_sharp,
                      color: Colors.blueAccent,
                      size: 70.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                    title: Text(Jobs[index].Designation),
                    subtitle: Text(Jobs[index].Job_Description),
                    trailing: Text("Rs." + Jobs[index].Estimated_Salary),
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
                                return EditJob(Jobs[index]);
                              }));

                      
                    },
                  ));
                })
            : Center(child: CircularProgressIndicator()));
  }
}
