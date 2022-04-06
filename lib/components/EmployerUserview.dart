import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/CommonProvider.dart';
import 'package:firebase_crud_new/screens/ViewEmployer.dart';
import 'package:firebase_crud_new/screens/editEmployer.dart';

class EmployerUserview extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;
  const EmployerUserview({
    required this.documentSnapshot,
    Key? key,
  }) : super(key: key);

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
        // child: SingleChildScrollView(
        child: Card(
          borderOnForeground: true,
          elevation: 6,
          shadowColor: Colors.redAccent,
          child: Column(
            children: [
              Text(
                "          ",
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                documentSnapshot['CompanyName'],
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                "          ",
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                "[ ${documentSnapshot['CompanyField']} ]",
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoMono',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
