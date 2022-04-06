// // ignore_for_file: prefer_const_constructors, deprecated_member_use

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_crud_new/models/employer.dart';
// import 'package:firebase_crud_new/models/job.dart';

// import 'package:firebase_crud_new/provider/CommonProvider.dart';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class AdminEmployerView extends StatefulWidget {
//   final Employer employer;
//   AdminEmployerView(this.employer);
//   @override
//   State<AdminEmployerView> createState() => _AdminEmployerView();
// }

// class _AdminEmployerView extends State<AdminEmployerView> {
//   int _selectedIndex = 0;
//   PageController pageController = PageController();
//   void onTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });

//     pageController.animateToPage(index,
//         duration: Duration(milliseconds: 1000),
//         curve: Curves.easeInOutCubicEmphasized);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final productProvider = Provider.of<ProductProvider>(context);

//     return Scaffold(
//       body: PageView(
//         controller: pageController,
//         children: [
//           Container(
//             padding: const EdgeInsets.all(8.0),
//             child: ListView(
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 140, vertical: 0),
//                   child: Image(
//                     image: NetworkImage(
//                       'https://static.thenounproject.com/png/2376610-200.png',
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 Text('Company Details',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         fontSize: 20.0,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue,
//                         fontFamily: 'Lobster')),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//                   child: Text('Company ID',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                           fontFamily: 'Lobster')),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       enabled: false,
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0)),
//                     ),
//                     onChanged: (value) {
//                       productProvider.ChangeCompanyID(value);
//                     },
//                   ),
//                 ),

//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//                   child: Text('Company Name',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                           fontFamily: 'Lobster')),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       enabled: false,
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0)),

//                     ),
//                     onChanged: (value) {
//                       productProvider.ChangeCompanyName(value);
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//                   child: Text('Company Field',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                           fontFamily: 'Lobster')),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       enabled: false,
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0)),

//                     ),
//                     onChanged: (value) {
//                       productProvider.ChangeCompanyField(value);
//                     },
//                   ),
//                 ),

//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//                   child: Text('Company Address',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                           fontFamily: 'Lobster')),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       enabled: false,
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0)),

//                     ),
//                     onChanged: (value) {
//                       productProvider.ChangeCompanyAddress(value);
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//                   child: Text('Contact Number',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                           fontFamily: 'Lobster')),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       enabled: false,
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0)),

//                     ),
//                     onChanged: (value) {
//                       productProvider.ChangeContactNumbers(value);
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//                   child: Text('Manager Name',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                           fontFamily: 'Lobster')),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       enabled: false,
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0)),

//                     ),
//                     onChanged: (value) {
//                       productProvider.ChangeManagerName(value);
//                     },
//                   ),
//                 ),

//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//                   child: Text('Manager Email',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                           fontFamily: 'Lobster')),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       enabled: false,
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0)),

//                     ),
//                     onChanged: (value) {
//                       productProvider.ChangeManagereEmail(value);
//                     },
//                   ),
//                 ),

//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//                   child: Text('Company Website',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                           fontFamily: 'Lobster')),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       enabled: false,
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0)),

//                     ),
//                     onChanged: (value) {
//                       productProvider.ChangeWebsite(value);
//                     },
//                   ),
//                 ),

//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//                   child: Text('Rating',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                           fontFamily: 'Lobster')),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       enabled: false,
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0)),

//                     ),
//                     onChanged: (value) {
//                       productProvider.ChangeRating(value);
//                     },
//                   ),
//                 ),

//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 // ignore: deprecated_member_use

//               ],
//             ),
//           ),
//           Container(color: Colors.black),
//           Container(color: Colors.brown),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.black,
//         unselectedItemColor: Colors.grey,
//         onTap: onTapped,
//       ),
//     );
//   }
// }

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
