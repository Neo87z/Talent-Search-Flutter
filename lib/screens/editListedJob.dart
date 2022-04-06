// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud_new/models/job.dart';

import 'package:firebase_crud_new/provider/CommonProvider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditJob extends StatefulWidget {
  final Job job;
  EditJob(this.job);
  @override
  State<EditJob> createState() => _EditJob();
}
 String _Designation = '';
  String _Employeer = '';
  String _Employeer_Website = '';
  String _Estimated_Salary = '';
  String _Job_Description = '';
  String _Job_Qualifications = '';
  String _Job_ID = '';
  String _Email = '';
  String _Contact_Number = '';
  String _JobLocation = '';
  String _JobCatgory = '';
class _EditJob extends State<EditJob> {
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
       appBar: AppBar(
          title: Text("Edit Listed Jobs"),
          
        ),
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
                    image: NetworkImage(
                      'https://cdn.dribbble.com/users/2055858/screenshots/5660772/media/df1b4e7c3e10f07efaea3278d3e71cb0.png?compress=1&resize=400x300&vertical=top',
                    ),
                  ),
                ),
            
                Text('Edit Listed New Job',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontFamily: 'Lobster')),
                         SizedBox(
                  height: 10.0,
                ),

                Text('Please Ammend The Form Below To Edit Listed Job',
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
                    child: Text("Update Job"),
                    onPressed: () {
                      productProvider.UpdateJobListing();
                      Navigator.of(context).pop();
                    }),
                RaisedButton(
                    color: Colors.red,
                    child: Text("Remove Job"),
                    onPressed: () {
                      final docUser = FirebaseFirestore.instance
                          .collection('job')
                          .doc(widget.job.Job_ID);
                      docUser.delete();
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
