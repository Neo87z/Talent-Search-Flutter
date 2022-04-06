import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crud_new/models/employer.dart';
import 'package:firebase_crud_new/models/user.dart';
import 'package:firebase_crud_new/screens/ApplicantViewJob.dart';
import 'package:firebase_crud_new/screens/EmployerHome.dart';
import 'package:firebase_crud_new/screens/addEmployer.dart';

import 'package:firebase_crud_new/screens/editEmployer.dart';
import 'package:firebase_crud_new/services/Firestore_service.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'adminEmployerView.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../provider/CommonProvider.dart';

// class ViewEmployer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final Employers = Provider.of<List<Employer>>(context);
//     return Scaffold(
//         body: (Employers != null)
//             ? ListView.builder(
//                 itemCount: Employers.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                       child: ListTile(
//                     leading: FlutterLogo(size: 72.0),
//                     title: Text(Employers[index].CompanyName),
//                     subtitle: Text(
//                        Employers[index].CompanyField),

//                     trailing: Text(Employers[index].CompanyAddress),
//                     isThreeLine: true,
//                     onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditEmployer(Employers[index])));},
//                   ));
//                 })
//             : Center(child: CircularProgressIndicator()));
//   }
// }

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// class ViewEmployer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final productProvider = Provider.of<ProductProvider>(context);
//     final employer = Provider.of<List<Employer>>(context);

//     return Scaffold(
//         body: (employer != null)
//             ? ListView.builder(
//                 itemCount: employer.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                       child: ListTile(
//                     leading: FlutterLogo(size: 72.0),
//                     title: Text(employer[index].CompanyName),
//                     subtitle: Text(employer[index].CompanyField),
//                     trailing: RaisedButton(
//                         child: Text("View Employer Details"),
//                         onPressed: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) =>
//                                   AdminEmployerView(employer[index])));
//                         }),
//                     isThreeLine: true,
//                     onTap: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => AdminEmployerView(employer[index])));
//                     },
//                   ));
//                 })
//             : Center(child: CircularProgressIndicator()));
//   }
// }

// class ViewEmployer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new AppBar(

//       ),
//       body: ViewEmployer(),
//     );
//   }
// }

// class AdminViewEmployer extends StatefulWidget {
//   @override
//   _AdminViewEmployerState createState() => _AdminViewEmployerState();

// }

// class _AdminViewEmployerState extends State<AdminViewEmployer> {

//   Future _data;

//   Future getPosts() async {
//     var firestore = FirebaseFirestore.instance;

//     QuerySnapshot qn = await firestore.collection("employers").getDocuments();

//     return qn.documents;
//   }

//   navigateToDetail(DocumentSnapshot post){
//     Navigator.push(context, MaterialPageRoute(builder: (context) => EmployerDetail(post: post,)));
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     _data = getPosts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: FutureBuilder(
//         future: _data,
//         builder: (_, snapshot){

//       if(snapshot.connectionState == ConnectionState.waiting){
//         return Center(
//           child: Text("Loading..."),
//         );
//       }else{
//         ListView.builder(
//           itemCount: snapshot.data.length,
//           itemBuilder: (_, index){

//             return ListTile(
//               title: Text(snapshot.data[index].data["CompanyName"]),
//               onTap: () => navigateToDetail(snapshot.data[index]),
//             );

//         });

//       }

//       }),
//     );
//   }
// }

// class EmployerDetail extends StatefulWidget {

// final DocumentSnapshot post;

// DetailPage({this.post});

//   @override
//   _EmployerDetailState createState() => _EmployerDetailState();

// }

// class _EmployerDetailState extends State<EmployerDetail> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.post.data["CompanyName"]),
//       ),
//       body: Container(
//         child: Card(
//           child: ListTile(
//             title: Text(widget.post.data["CompanyName"]),
//             subtitle: Text(widget.post.data["CompanyField"]),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ViewEmployer extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     final firestoreService = FirestoreService();

//     return MultiProvider(
//           providers: [
//             ChangeNotifierProvider(create: (context) => ProductProvider()),
//             StreamProvider(create: (context)=> firestoreService.getEmployers(), initialData: [],),
//           ],
//           child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: EmployerHome(),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewEmployer extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;
  const ViewEmployer({Key? key, required this.documentSnapshot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employer Details"),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .5,
              decoration: const BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Company Name: ${documentSnapshot['CompanyName']}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoMono',
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Company Field: ${documentSnapshot['CompanyField']}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoMono',
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Company Address: ${documentSnapshot['CompanyAddress']}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoMono',
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Contact Number: ${documentSnapshot['ContactNumber']}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoMono',
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Manager Name: ${documentSnapshot['ManagerName']}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoMono',
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Manager Email: ${documentSnapshot['ManagerEmail']}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoMono',
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Company Rating(1-5): ${documentSnapshot['Rating']}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoMono',
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Company Website: ${documentSnapshot['Website']}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoMono',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
