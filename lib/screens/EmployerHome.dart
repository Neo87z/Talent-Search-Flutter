import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_crud_new/provider/CommonProvider.dart';
import 'package:firebase_crud_new/screens/addEmployer.dart';
import 'package:firebase_crud_new/screens/viewEmployer.dart';
import 'package:firebase_crud_new/components/EmployerUserview.dart';

class EmployerHome extends StatefulWidget {
  const EmployerHome({Key? key}) : super(key: key);

  @override
  State<EmployerHome> createState() => _EmployerHome();
}

class _EmployerHome extends State<EmployerHome> {
  @override
  Widget build(BuildContext context) {
    final CollectionReference _employer =
        FirebaseFirestore.instance.collection('employer');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employers"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: _employer.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                    margin: const EdgeInsets.all(8),
                    child: EmployerUserview(
                      documentSnapshot: documentSnapshot,
                    ));
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
