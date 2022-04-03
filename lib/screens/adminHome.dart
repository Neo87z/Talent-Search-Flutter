// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:firebase_crud_new/provider/CommonProvider.dart';
import 'package:firebase_crud_new/screens/AdminVewAllJobs.dart';
import 'package:firebase_crud_new/screens/EmployerHome.dart';
import 'package:firebase_crud_new/screens/addJob.dart';
import 'package:firebase_crud_new/screens/viewjobOffer.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ApplicantJobs.dart';
import 'manageAdmins.dart';
import 'manageUser.dart';

class AdminHome extends StatefulWidget {
  @override
  State<AdminHome> createState() => _AdminHome();
}

class _AdminHome extends State<AdminHome> {
  int _selectedIndex = 0;
  PageController pageController = PageController();
  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ManageAdmin()));
    } else {
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 1000),
          curve: Curves.easeInOutCubicEmphasized);
    }
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          Container(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 120),
            child: GridView.count(
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 2,
                childAspectRatio: .90,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => AddJob()));
                    },
                    child: Container(
                        child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.account_tree_sharp,
                                size: 100.0, color: Colors.green),
                            Text('List New Job')
                          ],
                        ),
                      ),
                    )),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AdmiNViewJobs()));
                    },
                    child: Container(
                        child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.add_link_sharp,
                                size: 100.0, color: Colors.green),
                            Text('View Current Jobs')
                          ],
                        ),
                      ),
                    )),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ViewJobOffer()));
                    },
                    child: Container(
                        child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.add_business_sharp,
                                size: 100.0, color: Colors.green),
                            Text('View Job Offers')
                          ],
                        ),
                      ),
                    )),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ManageUsers()));
                    },
                    child: Container(
                        child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.add_chart_sharp,
                                size: 100.0, color: Colors.green),
                            Text('Manage Users')
                          ],
                        ),
                      ),
                    )),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EmployerHome()));
                    },
                    child: Container(
                        child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.person,
                                size: 100.0, color: Color.fromARGB(255, 209, 45, 45)),
                            Text('Employer Management')
                          ],
                        ),
                      ),
                    )),
                  ),
                ]),
          ),
          
          Container(color: Colors.black),
          Container(color: Colors.brown),
        ],
        
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(context,
      //         MaterialPageRoute(builder: (context) => EmployerHome()));
      //   },
      //   backgroundColor: Colors.redAccent,
      //   child: const Icon(
      //     Icons.add,
      //     color: Colors.white,
      //     size: 32,
      //   ),
      // ),

      
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
