import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_crud_new/screens/ViewEmployer.dart';

class PartEmployerUser extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;
  const PartEmployerUser({Key? key, required this.documentSnapshot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        width: 200,
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ViewEmployer(documentSnapshot: documentSnapshot)));
            },
            child: Card(
                borderOnForeground: true,
                elevation: 8,
                shadowColor: Colors.redAccent,
                child: Column(
                  children: [

                    Text(
                      documentSnapshot['CompanyName'],
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      documentSnapshot['CompanyAddress'],
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      documentSnapshot['ContactNumber'],
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ))));
  }
}
