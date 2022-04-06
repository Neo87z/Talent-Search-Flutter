// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:firebase_crud_new/provider/CommonProvider.dart';
import 'package:firebase_crud_new/screens/CommuniJobs.dart';
import 'package:firebase_crud_new/screens/EgineerJobs.dart';
import 'package:firebase_crud_new/screens/GovernMentJobs.dart';
import 'package:firebase_crud_new/screens/HealthJobs.dart';
import 'package:firebase_crud_new/screens/EmployerHome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../models/applyJob.dart';
import '../models/job.dart';

import 'ApplicantJobs.dart';
import 'FinanceJobs.dart';
import 'ITsectorJobs.dart';
import 'createAccount.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _selectedIndex = 0;
  PageController pageController = PageController();
  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => AppliantJob()));
    } else {
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 1000),
          curve: Curves.easeInOutCubicEmphasized);
    }
  }

  @override
  Widget build(BuildContext context) {
    final jobs = Provider.of<List<Job>>(context);
    final appli = Provider.of<List<Applicant>>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          Container(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 10),
            child: GridView.count(
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 2,
                childAspectRatio: .90,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ITSectorjob()));
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
                            Text('IT Sector')
                          ],
                        ),
                      ),
                    )),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EngineerJobs()));
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
                            Text('Engineering Sector')
                          ],
                        ),
                      ),
                    )),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HealthKobs()));
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
                            Text('Health Sector')
                          ],
                        ),
                      ),
                    )),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FinanceJobs()));
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
                            Text('Finance Sector')
                          ],
                        ),
                      ),
                    )),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CommuncationJobs()));
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
                            Icon(Icons.add_ic_call_sharp,
                                size: 100.0, color: Colors.green),
                            Text('Communication Sector')
                          ],
                        ),
                      ),
                    )),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => GovernJobs()));
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
                            Icon(Icons.add_moderator_sharp,
                                size: 100.0, color: Colors.green),
                            Text('Government Sector')
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
                            Icon(Icons.person, size: 100.0),
                            Text('Employer Details')
                          ],
                        ),
                      ),
                    )),
                  ),
                ]),
          ),
          Container(),
          Container(color: Colors.brown),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'My Jobs'),
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
