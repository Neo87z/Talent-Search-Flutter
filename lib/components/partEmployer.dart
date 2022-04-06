import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/CommonProvider.dart';
import 'package:firebase_crud_new/screens/ViewEmployer.dart';
import 'package:firebase_crud_new/screens/editEmployer.dart';

class PartEmployer extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;
  const PartEmployer({
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
                documentSnapshot['CompanyName'],
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                documentSnapshot['CompanyField'],
                style: Theme.of(context).textTheme.headline6,
              ),
              Row(
                children: [
                  Expanded(
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditEmployer(
                                    documentSnapshot: documentSnapshot)));
                      },
                      icon: const Icon(
                        Icons.edit_rounded,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () async {
                        if (await showConfirmationDialog(context)) {
                          Provider.of<ProductProvider>(context, listen: false)
                              .removeEmployer(documentSnapshot['CompanyID']);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Employer Deleted Successfully')),
                          );
                        }
                      },
                      icon: const Icon(
                        Icons.delete_rounded,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      //),
    );
  }

  Future showConfirmationDialog(BuildContext context) => showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
          content: const Text("Are you sure want to delete ?"),
          actions: <Widget>[
            TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text("Yes")),
            TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text("No")),
          ],
        ),
      );
}
