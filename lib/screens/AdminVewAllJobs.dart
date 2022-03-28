import 'package:firebase_crud_new/models/job.dart';

import 'package:firebase_crud_new/screens/editListedJob.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AdmiNViewJobs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Jobs = Provider.of<List<Job>>(context);
    return Scaffold(
        body: (Jobs != null)
            ? ListView.builder(
                itemCount: Jobs.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                    leading: FlutterLogo(size: 72.0),
                    title: Text(Jobs[index].Designation),
                    subtitle: Text(
                       Jobs[index].Job_Description),
                       
                    trailing: Text(Jobs[index].Estimated_Salary),
                    isThreeLine: true,
                    onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditJob(Jobs[index])));},
                  ));
                })
            : Center(child: CircularProgressIndicator()));
  }
}
