import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crud_new/provider/CommonProvider.dart';
import 'package:firebase_crud_new/screens/LoginPage.dart';


import 'package:firebase_crud_new/services/Firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final firestoreservice = FirestoreService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        StreamProvider(
            create: (context) => firestoreservice.GetApplicants(),
            initialData: null),
        StreamProvider(
            create: (context) => firestoreservice.GetAllJobs(),
            initialData: null),
        StreamProvider(
            create: (context) => firestoreservice.GetAllUsers(),
            initialData: null),
            
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
