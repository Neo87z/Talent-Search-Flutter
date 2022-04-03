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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employer Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ViewEmployer(title: 'Employer Details'),
    );
  }
}

class ViewEmployer extends StatefulWidget {
  ViewEmployer({Key , this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Database db;
  List docs = [];
  initialise() {
    db = Database();
    db.initiliase();
    db.read().then((value) => {
          setState(() {
            docs = value;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    initialise();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(56, 75, 49, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(56, 75, 49, 1.0),
        title: Text("Country"),
      ),
      body: ListView.builder(
        itemCount: docs.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              onTap: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                View(country: docs[index], db: db)))
                    .then((value) => {
                          if (value != null) {initialise()}
                        });
              },
              contentPadding: EdgeInsets.only(right: 30, left: 36),
              title: Text(docs[index]['name']),
              trailing: Text(docs[index]['code']),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddEmployer(db: db)))
              .then((value) {
            if (value != null) {
              initialise();
            }
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}