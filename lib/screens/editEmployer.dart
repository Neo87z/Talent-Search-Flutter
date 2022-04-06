// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud_new/models/employer.dart';
import 'package:firebase_crud_new/screens/adminEmployerView.dart';
import 'package:firebase_crud_new/screens/employerScreen.dart';
import 'package:firebase_crud_new/provider/CommonProvider.dart';
import 'package:firebase_crud_new/services/Firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class EditEmployer extends StatefulWidget {
  final DocumentSnapshot documentSnapshot;

  const EditEmployer({Key? key, required this.documentSnapshot})
      : super(key: key);

  @override
  State<EditEmployer> createState() => _EditEmployerState();
}

class _EditEmployerState extends State<EditEmployer> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController companyFieldController = TextEditingController();
  TextEditingController companyAddressController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController managerNameController = TextEditingController();
  TextEditingController managerEmailController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  TextEditingController websiteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    companyNameController = TextEditingController(
        text: widget.documentSnapshot != null
            ? widget.documentSnapshot['CompanyName']
            : '');
    companyFieldController = TextEditingController(
        text: widget.documentSnapshot != null
            ? widget.documentSnapshot['CompanyField']
            : '');
    companyAddressController = TextEditingController(
        text: widget.documentSnapshot != null
            ? widget.documentSnapshot['CompanyAddress']
            : '');
    contactNumberController = TextEditingController(
        text: widget.documentSnapshot != null
            ? widget.documentSnapshot['ContactNumber']
            : '');
    managerNameController = TextEditingController(
        text: widget.documentSnapshot != null
            ? widget.documentSnapshot['ManagerName']
            : '');
    managerEmailController = TextEditingController(
        text: widget.documentSnapshot != null
            ? widget.documentSnapshot['ManagerEmail']
            : '');
    ratingController = TextEditingController(
        text: widget.documentSnapshot != null
            ? widget.documentSnapshot['Rating']
            : '');
    websiteController = TextEditingController(
        text: widget.documentSnapshot != null
            ? widget.documentSnapshot['Website']
            : '');
  }

  @override
  Widget build(BuildContext context) {
    final employerProvider = Provider.of<ProductProvider>(context);
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employer Details"),
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
                      const Text("Edit Employer",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 224, 55, 55))),
                      SizedBox(
                        height: height * 0.05,
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
                              height: height * 0.05,
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
                                if (value!.isEmpty ||
                                    !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                  return "Address cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: height * 0.05,
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
                              height: height * 0.05,
                            ),
                            TextFormField(
                              controller: contactNumberController,
                              onChanged: (String value) {
                                employerProvider.ChangeContactNumbers(value);
                              },
                              decoration: InputDecoration(
                                  labelText: "Contact Number",
                                  hintText: "Enter the contact number",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  )),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                  return "Contact number cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: height * 0.05,
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
                              height: height * 0.05,
                            ),
                            TextFormField(
                              controller: managerEmailController,
                              onChanged: (String value) {
                                employerProvider.ChangeManagereEmail(value);
                              },
                              decoration: InputDecoration(
                                  labelText: "Manager Email",
                                  hintText: "Enter manager email",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  )),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                  return "Manager email cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: height * 0.05,
                            ),
                            TextFormField(
                              controller: ratingController,
                              onChanged: (String value) {
                                employerProvider.ChangeRating(value);
                              },
                              decoration: InputDecoration(
                                  labelText: "Rating",
                                  hintText: "Enter the company rating",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  )),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                  return "Rating cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: height * 0.05,
                            ),
                            TextFormField(
                              controller: websiteController,
                              onChanged: (String value) {
                                employerProvider.ChangeWebsite(value);
                              },
                              decoration: InputDecoration(
                                  labelText: "Company Website",
                                  hintText: "Enter the website",
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
                              height: height * 0.05,
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
                                                  const AdminEmployerView()));
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
                                            CompanyID: widget
                                                .documentSnapshot['CompanyID']);
                                        await FirestoreService()
                                            .UpdateEmployer(employer);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text(
                                                  'Record Updated Successfully')),
                                        );
                                        setState(() {
                                          isLoading = true;
                                        });
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: const Text("Save"),
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
