// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:firebase_crud_new/provider/CommonProvider.dart';
import 'package:firebase_crud_new/screens/AdminVewAllJobs.dart';
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
      Navigator.push(
          context,
          PageRouteBuilder(
              transitionDuration: Duration(seconds: 2),
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secAnimation,
                  Widget child) {
                animation = CurvedAnimation(
                    parent: animation, curve: Curves.fastOutSlowIn);
                return ScaleTransition(
                  alignment: Alignment.center,
                  scale: animation,
                  child: child,
                );
              },
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secAnimation) {
                return ManageAdmin();
              }));
     
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
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              transitionDuration: Duration(seconds: 2),
                              transitionsBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secAnimation,
                                  Widget child) {
                                animation = CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.fastOutSlowIn);
                                return ScaleTransition(
                                  alignment: Alignment.center,
                                  scale: animation,
                                  child: child,
                                );
                              },
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secAnimation) {
                                return AddJob();
                              }));
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
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              transitionDuration: Duration(seconds: 2),
                              transitionsBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secAnimation,
                                  Widget child) {
                                animation = CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.fastOutSlowIn);
                                return ScaleTransition(
                                  alignment: Alignment.center,
                                  scale: animation,
                                  child: child,
                                );
                              },
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secAnimation) {
                                return AdmiNViewJobs();
                              }));
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
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              transitionDuration: Duration(seconds: 2),
                              transitionsBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secAnimation,
                                  Widget child) {
                                animation = CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.fastOutSlowIn);
                                return ScaleTransition(
                                  alignment: Alignment.center,
                                  scale: animation,
                                  child: child,
                                );
                              },
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secAnimation) {
                                return ViewJobOffer();
                              }));
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
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              transitionDuration: Duration(seconds: 2),
                              transitionsBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secAnimation,
                                  Widget child) {
                                animation = CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.fastOutSlowIn);
                                return ScaleTransition(
                                  alignment: Alignment.center,
                                  scale: animation,
                                  child: child,
                                );
                              },
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secAnimation) {
                                return ManageUsers();
                              }));
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
                ]),
          ),
          Container(color: Colors.black),
          Container(color: Colors.brown),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Admin'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: onTapped,
      ),
    );
  }
}
