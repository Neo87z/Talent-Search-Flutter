// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:firebase_crud_new/provider/CommonProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AddEmployer extends StatefulWidget {
  @override
  State<AddEmployer> createState() => _AddEmployer();
}

class _AddEmployer extends State<AddEmployer> {
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
                    image: NetworkImage(
                      'https://cdn.dribbble.com/users/2055858/screenshots/5660772/media/df1b4e7c3e10f07efaea3278d3e71cb0.png?compress=1&resize=400x300&vertical=top',
                    ),
                  ),
                ),
            
                Text('Add New Employer Details',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontFamily: 'Lobster')),
                         SizedBox(
                  height: 10.0,
                ),

                Text('Complete the below mentioned to add New Employer Details',
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
                  child: Text('Company Name',
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
                      hintText: 'Input Company Name',
                    ),
                    onChanged: (value) {
                      productProvider.ChangeCompanyName(value);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Text('Company Field',
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
                      hintText: 'Input Company Field',
                    ),
                    onChanged: (value) {
                      productProvider.ChangeCompanyField(value);
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Text('Company Address',
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
                      hintText: 'Input Company Address',
                    ),
                    onChanged: (value) {
                      productProvider.ChangeCompanyAddress(value);
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Text('Contact Number',
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
                      hintText: 'Input Contact Number',
                    ),
                    onChanged: (value) {
                      productProvider.ChangeContactNumbers(value);
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Text('Manager Name',
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
                      hintText: 'Input Manager Name',
                    ),
                    onChanged: (value) {
                      productProvider.ChangeManagerName(value);
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Text('Manager Email',
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
                      hintText: 'Input Manager Email',
                    ),
                    onChanged: (value) {
                      productProvider.ChangeManagereEmail(value);
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Text('Website',
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
                      hintText: 'Input Company Website',
                    ),
                    onChanged: (value) {
                      productProvider.ChangeWebsite(value);
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Text('Rating',
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
                      hintText: 'Input Company Rating (1-5)',
                    ),
                    onChanged: (value) {
                      productProvider.ChangeRating(value);
                    },
                  ),
                ),

                
              

                SizedBox(
                  height: 20.0,
                ),
                ButtonTheme(
                  minWidth: 20.0,
                  height: 50.0,
                  child: RaisedButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      child: Text("Create Employer"),
                      onPressed: () {
                        productProvider.AddNewEmployer();
                        Navigator.of(context).pop();
                      }),
                ),
                // ignore: deprecated_member_use

                SizedBox(
                  height: 40.0,
                ),
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
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Employer'),
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
