// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:firebase_crud_new/provider/CommonProvider.dart';
import 'package:firebase_crud_new/screens/addEmployer.dart';
import 'package:firebase_crud_new/screens/viewEmployer.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ApplicantJobs.dart';
import 'manageAdmins.dart';
import 'manageUser.dart';

class EmployerHome extends StatefulWidget {
  @override
  State<EmployerHome> createState() => _EmployerHome();
}

class _EmployerHome extends State<EmployerHome> {
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
                          MaterialPageRoute(builder: (context) => AddEmployer()));
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
                            Text('Add New Employer details')
                          ],
                        ),
                      ),
                    )),
                  ),
       

                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ViewEmployer()));
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
                            Text('View All Employers')
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
