import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_crud_new/components/partEmployerUser.dart';

class AdminEmployerView extends StatefulWidget {
  const AdminEmployerView({Key? key}) : super(key: key);

  @override
  State<AdminEmployerView> createState() => _AdminEmployerViewState();
}

class _AdminEmployerViewState extends State<AdminEmployerView> {
  final CollectionReference _employer =
      FirebaseFirestore.instance.collection('employer');
  @override
  Widget build(BuildContext context) {
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
                  crossAxisCount: 1),
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                    margin: const EdgeInsets.all(10),
                    child: PartEmployerUser(
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
