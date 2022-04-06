// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:firebase_crud_new/models/employer.dart';
import 'package:firebase_crud_new/provider/CommonProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/Firestore_service.dart';
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
