// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud_new/models/job.dart';

import 'package:firebase_crud_new/provider/CommonProvider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AppkicantViewJob extends StatefulWidget {
  final Job job;
  AppkicantViewJob(this.job);
  @override
  State<AppkicantViewJob> createState() => _AppkicantViewJob();
}

class _AppkicantViewJob extends State<AppkicantViewJob> {
  final JobCOntroller = TextEditingController();
  void dispose() {
    JobCOntroller.dispose();
    super.dispose();
  }

  void initState() {
    JobCOntroller.text = widget.job.Designation;
    new Future.delayed(Duration.zero, () {
      final productProvider =
          Provider.of<ProductProvider>(context, listen: false);
      productProvider.LoadJob(widget.job);
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
    productProvider.ChangeJobID(widget.job.Job_ID);
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 0),
                  child: Image(
                    image: AssetImage('assets/mainlogo.png'),
                  ),
                ),

                Text('Apply Job',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontFamily: 'Lobster')),
                SizedBox(
                  height: 10.0,
                ),

                Text('Please Fill The Form Below To Apply To The Job',
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
                  child: Text('Job Title',
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
                    controller: JobCOntroller,
                    enabled: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: 'Input Job Title',
                    ),
                    onChanged: (value) {
                      productProvider.ChangeDesignation(value);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Text('Employeer Name',
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
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: widget.job.Employeer,
                    ),
                    onChanged: (value) {
                      productProvider.ChangeEmployeer(value);
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Text('Company Website',
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
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: widget.job.Employeer_Website,
                    ),
                    onChanged: (value) {
                      productProvider.ChangeEmployeerWebsite(value);
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Text('Estimated Salary',
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
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: widget.job.Estimated_Salary,
                    ),
                    onChanged: (value) {
                      productProvider.ChangeEsitmatedSalry(value);
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Text('Job Description',
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
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: widget.job.Job_Description,
                    ),
                    onChanged: (value) {
                      productProvider.ChangeJobDescription(value);
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Text('Job Qualification',
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
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: widget.job.Job_Qualifications,
                    ),
                    onChanged: (value) {
                      productProvider.ChangeJobQulaifation(value);
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Text('Contact Email',
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
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: widget.job.Email,
                    ),
                    onChanged: (value) {
                      productProvider.ChangeEmail(value);
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Text('Company Contact Number',
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
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: widget.job.Contact_Number,
                    ),
                    onChanged: (value) {
                      productProvider.ChangeContactNumber(value);
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Text('Job Location',
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
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: widget.job.JobLocation,
                    ),
                    onChanged: (value) {
                      productProvider.ChangeJobLocation(value);
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Text('Job Catergory',
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
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: widget.job.JobCat,
                    ),
                    onChanged: (value) {
                      productProvider.ChangeJobCateogry(value);
                    },
                  ),
                ),

                SizedBox(
                  height: 20.0,
                ),

                // ignore: deprecated_member_use
                RaisedButton(
                    child: Text("Apply Job"),
                    onPressed: () {
                      Alert(
                          context: context,
                          title: "User Details",
                          content: Column(
                            children: <Widget>[
                               Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 0),
                  child: Image(
                    image: AssetImage('assets/mainlogo.png'),
                  ),
                ),
                              TextField(
                                decoration: InputDecoration(
                                    icon: Icon(Icons.account_circle),
                                    labelText: 'Applicant Full Name'),
                                onChanged: (value) {
                                  productProvider.ChangeApplicantFullName(
                                      value);
                                },
                                enabled: true,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                    icon: Icon(Icons.account_circle),
                                    labelText: 'Applicant Age'),
                                onChanged: (value) {
                                  productProvider.changeAplicantAge(value);
                                },
                                enabled: true,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                    icon: Icon(Icons.account_circle),
                                    labelText:
                                        'Applicant Highest Qualification'),
                                onChanged: (value) {
                                  productProvider.ChangeApplocantHughQalu(
                                      value);
                                },
                                enabled: true,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                    icon: Icon(Icons.account_circle),
                                    labelText: 'Expected Salary'),
                                onChanged: (value) {
                                  productProvider.ChangeApplicantexpectedSalary(
                                      value);
                                },
                                enabled: true,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                    icon: Icon(Icons.account_circle),
                                    labelText: 'About you'),
                                onChanged: (value) {
                                  productProvider.ChangeApplicantAboutYou(
                                      value);
                                },
                                enabled: true,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                    icon: Icon(Icons.account_circle),
                                    labelText: 'CV Link'),
                                onChanged: (value) {
                                  productProvider.changeCV(value);
                                },
                                enabled: true,
                              ),
                            ],
                          ),
                          buttons: [
                            DialogButton(
                              onPressed: () {
                                productProvider.SaveApplicant();
                                Navigator.of(context).pop();
                              },
                              color: Colors.red,
                              child: Text(
                                "Apply To This Job",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            )
                          ]).show();
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
