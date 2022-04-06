// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud_new/models/applyJob.dart';
import 'package:firebase_crud_new/models/job.dart';

import 'package:firebase_crud_new/provider/CommonProvider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApplicantView extends StatefulWidget {
  final Applicant appli;
  ApplicantView(this.appli);
  @override
  State<ApplicantView> createState() => _ApplicantView();
}

class _ApplicantView extends State<ApplicantView> {
  final JobCOntroller = TextEditingController();
  void dispose() {
    JobCOntroller.dispose();
    super.dispose();
  }

  void initState() {
    JobCOntroller.text = widget.appli.ApplicantID;
    new Future.delayed(Duration.zero, () {
      final productProvider =
          Provider.of<ProductProvider>(context, listen: false);
      productProvider.LoadAppli(widget.appli);
    });
  }

  int _selectedIndex = 0;
  PageController pageController = PageController();
  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    pageController.animateToPage(index,
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeInOutCubicEmphasized);
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    productProvider.ChangeApplicantID(widget.appli.ApplicantID);

    productProvider.ChangeStatus(widget.appli.Status);

    productProvider.ChangeApplicantAboutYou(widget.appli.AboutYou);
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 0),
                  child: Image(
                    image: AssetImage('assets/mainlogo.png'),
                  ),
                ),
                Text('My Job Application',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontFamily: 'Lobster')),
                SizedBox(
                  height: 10.0,
                ),
                Text('Please Fill The Form Below To Update To The Job',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Lobster')),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Text('Applicant ID',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Lobster')),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                  child: TextField(
                    enabled: false,
                    controller: JobCOntroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: 'Input Job Title',
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Text('Applicant Full Name',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Lobster')),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                  child: TextField(
                  
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: widget.appli.FullName,
                    ),
                    onChanged: (value) {
                      productProvider.ChangeApplicantFullName(value);
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Text('Applicant Age',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Lobster')),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                  child: TextField(
                    
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: widget.appli.Age,
                    ),
                    onChanged: (value) {
                      productProvider.changeAplicantAge(value);
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Text('Applicant Expected Salary',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Lobster')),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                  child: TextField(
                  
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: widget.appli.ExpectedSalary,
                    ),
                    onChanged: (value) {
                      productProvider.ChangeApplicantexpectedSalary(value);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Text('Applicant Highest Qualification',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Lobster')),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                  child: TextField(
                    
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: widget.appli.HighestQualifiaction,
                    ),
                    onChanged: (value) {
                      productProvider.ChangeApplocantHughQalu(value);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Text('Applicant CV Link',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Lobster')),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                  child: TextField(
                    
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: widget.appli.CVUploadedLink,
                    ),
                    onChanged: (value) {
                      productProvider.changeCV(value);
                    },
                  ),
                ),

                SizedBox(
                  height: 20.0,
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                    child: Text("Update Job Application"),
                    onPressed: () {
                      productProvider.UpdateApplicant();
                      Navigator.of(context).pop();
                    }),
                RaisedButton(
                    color: Colors.red,
                    child: Text("Remove Application"),
                    onPressed: () {
                      final docUser = FirebaseFirestore.instance
                          .collection('applicant')
                          .doc(widget.appli.ApplicantID);
                      docUser.delete();
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    }),
              ],
            ),
          ),
          Container(color: Colors.black),
          Container(color: Colors.brown),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: onTapped,
      ),
    );
  }
}
