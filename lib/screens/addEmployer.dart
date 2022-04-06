// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:firebase_crud_new/models/employer.dart';
import 'package:firebase_crud_new/provider/CommonProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/Firestore_service.dart';

// class AddEmployer extends StatefulWidget {
//   @override
//   State<AddEmployer> createState() => _AddEmployer();
// }

// class _AddEmployer extends State<AddEmployer> {
//   int _selectedIndex = 0;
//   PageController pageController = PageController();
//   void onTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });

//     pageController.animateToPage(index,
//         duration: Duration(milliseconds: 1000),
//         curve: Curves.easeInOutCubicEmphasized);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final productProvider = Provider.of<ProductProvider>(context);
//     return Scaffold(
//       body: PageView(
//         controller: pageController,
//         children: [
//           Container(
//             padding: const EdgeInsets.all(8.0),
//             child: ListView(
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 100, vertical: 0),
//                   child: Image(
//                     image: NetworkImage(
//                       'https://cdn.dribbble.com/users/2055858/screenshots/5660772/media/df1b4e7c3e10f07efaea3278d3e71cb0.png?compress=1&resize=400x300&vertical=top',
//                     ),
//                   ),
//                 ),

//                 Text('Add New Employer Details',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         fontSize: 20.0,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue,
//                         fontFamily: 'Lobster')),
//                          SizedBox(
//                   height: 10.0,
//                 ),

//                 Text('Complete the below mentioned to add New Employer Details',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         fontSize: 16.0,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                         fontFamily: 'Lobster')),
//                 SizedBox(
//                   height: 20.0,
//                 ),

//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//                   child: Text('Company Name',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                           fontFamily: 'Lobster')),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0)),
//                       hintText: 'Input Company Name',
//                     ),
//                     onChanged: (value) {
//                       productProvider.ChangeCompanyName(value);
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//                   child: Text('Company Field',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                           fontFamily: 'Lobster')),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0)),
//                       hintText: 'Input Company Field',
//                     ),
//                     onChanged: (value) {
//                       productProvider.ChangeCompanyField(value);
//                     },
//                   ),
//                 ),

//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//                   child: Text('Company Address',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                           fontFamily: 'Lobster')),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0)),
//                       hintText: 'Input Company Address',
//                     ),
//                     onChanged: (value) {
//                       productProvider.ChangeCompanyAddress(value);
//                     },
//                   ),
//                 ),

//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//                   child: Text('Contact Number',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                           fontFamily: 'Lobster')),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0)),
//                       hintText: 'Input Contact Number',
//                     ),
//                     onChanged: (value) {
//                       productProvider.ChangeContactNumbers(value);
//                     },
//                   ),
//                 ),

//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//                   child: Text('Manager Name',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                           fontFamily: 'Lobster')),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0)),
//                       hintText: 'Input Manager Name',
//                     ),
//                     onChanged: (value) {
//                       productProvider.ChangeManagerName(value);
//                     },
//                   ),
//                 ),

//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//                   child: Text('Manager Email',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                           fontFamily: 'Lobster')),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0)),
//                       hintText: 'Input Manager Email',
//                     ),
//                     onChanged: (value) {
//                       productProvider.ChangeManagereEmail(value);
//                     },
//                   ),
//                 ),

//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//                   child: Text('Website',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                           fontFamily: 'Lobster')),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0)),
//                       hintText: 'Input Company Website',
//                     ),
//                     onChanged: (value) {
//                       productProvider.ChangeWebsite(value);
//                     },
//                   ),
//                 ),

//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//                   child: Text('Rating',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                           fontFamily: 'Lobster')),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0)),
//                       hintText: 'Input Company Rating (1-5)',
//                     ),
//                     onChanged: (value) {
//                       productProvider.ChangeRating(value);
//                     },
//                   ),
//                 ),

//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 ButtonTheme(
//                   minWidth: 20.0,
//                   height: 50.0,
//                   child: RaisedButton(
//                       color: Colors.red,
//                       textColor: Colors.white,
//                       child: Text("Create Employer"),
//                       onPressed: () {
//                         productProvider.AddNewEmployer();
//                         Navigator.of(context).pop();
//                       }),
//                 ),
//                 // ignore: deprecated_member_use

//                 SizedBox(
//                   height: 40.0,
//                 ),
//               ],
//             ),
//           ),
//           Container(color: Colors.black),
//           Container(color: Colors.brown),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Employer'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.black,
//         unselectedItemColor: Colors.grey,
//         onTap: onTapped,
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_crud_new/screens/employerScreen.dart';

class AddEmployer extends StatefulWidget {
  const AddEmployer({Key? key}) : super(key: key);

  @override
  State<AddEmployer> createState() => _AddEmployerState();
}

class _AddEmployerState extends State<AddEmployer> {
  var uuid = Uuid();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final companyNameController = TextEditingController();
  final companyAddressController = TextEditingController();
  final companyFieldController = TextEditingController();
  final contactNumberController = TextEditingController();
  final managerNameController = TextEditingController();
  final managerEmailController = TextEditingController();
  final ratingController = TextEditingController();
  final websiteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final employerProvider = Provider.of<ProductProvider>(context);
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employers"),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFffffff),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.04),
                      const Text("Insert New Employer",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 224, 55, 55))),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      Center(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: companyNameController,
                              onChanged: (String value) {
                                employerProvider.ChangeCompanyName(value);
                              },
                              decoration: InputDecoration(
                                  labelText: "Company Name",
                                  hintText: "Enter the company name",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  )),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                  return "Name cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: height * 0.04,
                            ),
                            TextFormField(
                              controller: companyAddressController,
                              onChanged: (String value) {
                                employerProvider.ChangeCompanyAddress(value);
                              },
                              decoration: InputDecoration(
                                  labelText: "Company Address",
                                  hintText: "Enter the company address",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Address cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: height * 0.04,
                            ),
                            TextFormField(
                              controller: companyFieldController,
                              onChanged: (String value) {
                                employerProvider.ChangeCompanyField(value);
                              },
                              decoration: InputDecoration(
                                  labelText: "Company Field",
                                  hintText: "Enter the company field",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  )),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                  return "Field cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: height * 0.04,
                            ),
                            TextFormField(
                              controller: contactNumberController,
                              onChanged: (String value) {
                                employerProvider.ChangeContactNumbers(value);
                              },
                              decoration: InputDecoration(
                                  labelText: "Contact number",
                                  hintText: "Enter the contact number",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Contact cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: height * 0.04,
                            ),
                            TextFormField(
                              controller: managerNameController,
                              onChanged: (String value) {
                                employerProvider.ChangeManagerName(value);
                              },
                              decoration: InputDecoration(
                                  labelText: "Manager Name",
                                  hintText: "Enter the manager name",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  )),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                  return "Manager name cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: height * 0.04,
                            ),
                            TextFormField(
                              controller: managerEmailController,
                              onChanged: (String value) {
                                employerProvider.ChangeManagereEmail(value);
                              },
                              decoration: InputDecoration(
                                  labelText: "Manager Email",
                                  hintText: "Enter manager's email",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Email cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: height * 0.04,
                            ),
                            TextFormField(
                              controller: websiteController,
                              onChanged: (String value) {
                                employerProvider.ChangeWebsite(value);
                              },
                              decoration: InputDecoration(
                                  labelText: "Company Website",
                                  hintText: "Enter the company website",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  )),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                  return "Website cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: height * 0.04,
                            ),
                            TextFormField(
                              controller: ratingController,
                              onChanged: (String value) {
                                employerProvider.ChangeRating(value);
                              },
                              decoration: InputDecoration(
                                  labelText: "Company Rating",
                                  hintText: "Enter the company rating",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Rating cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: height * 0.04,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red,
                                      minimumSize: const Size(40, 40),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const EmployerScreen()));
                                    },
                                    child: const Text("Cancel"),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blue,
                                      minimumSize: const Size(40, 40),
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      if (_formKey.currentState!.validate()) {
                                        Employer employer = Employer(
                                          CompanyID: uuid.v4(),
                                          CompanyName:
                                              companyNameController.text,
                                          CompanyAddress:
                                              companyAddressController.text,
                                          CompanyField:
                                              companyFieldController.text,
                                          ContactNumber:
                                              contactNumberController.text,
                                          ManagerName:
                                              managerNameController.text,
                                          ManagerEmail:
                                              managerEmailController.text,
                                          Rating: ratingController.text,
                                          Website: websiteController.text,
                                        );
                                        FirestoreService()
                                            .AddEmployer(employer);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text(
                                                  'Record Saved Successfully')),
                                        );
                                        setState(() {
                                          isLoading = false;
                                        });
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: const Text("Submit"),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
