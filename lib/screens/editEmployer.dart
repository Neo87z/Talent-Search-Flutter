// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud_new/models/employer.dart';

import 'package:firebase_crud_new/provider/CommonProvider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class EditEmployer extends StatefulWidget {
//   final Employer employer;
//   EditEmployer(this.employer);
//   @override
//   State<EditEmployer> createState() => _EditEmployer();
// }

// class _EditEmployer extends State<EditEmployer> {
//   final JobCOntroller = TextEditingController();

//   void dispose() {
//     JobCOntroller.dispose();
//     super.dispose();
//   }

//   void initState() {
//     JobCOntroller.text = widget.employer.CompanyName;
//     new Future.delayed(Duration.zero, () {
//       final productProvider =
//           Provider.of<ProductProvider>(context, listen: false);
//       productProvider.LoadEmployer(widget.employer);
//     });
//   }

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
//     productProvider.ChangeCompanyID(widget.employer.CompanyID);

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
//                 Text('Edit Employer',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         fontSize: 20.0,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue,
//                         fontFamily: 'Lobster')),
//                 SizedBox(
//                   height: 10.0,
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
//                     controller: JobCOntroller,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0)),
//                       hintText: 'Company Name',
//                     ),
//                     onChanged: (value) {
//                       productProvider.ChangeCompanyName(value);
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
            
//                 TextField(
//                   decoration: InputDecoration(hintText: widget.employer.CompanyAddress),
//                   onChanged: (value) {
//                     productProvider.ChangeCompanyAddress(value);
//                   },
//                 ),
//                 Text(
//                   'Company Field : ',
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 TextField(
//                   decoration:
//                       InputDecoration(hintText: widget.employer.CompanyField),
//                   onChanged: (value) {
//                     productProvider.ChangeCompanyField(value);
//                   },
//                 ),
//                 Text(
//                   'Contact Number : ',
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 TextField(
//                   decoration:
//                       InputDecoration(hintText: widget.employer.ContactNumber),
//                   onChanged: (value) {
//                     productProvider.ChangeContactNumber(value);
//                   },
//                 ),
//                 Text(
//                   'Manager Name : ',
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 TextField(
//                   decoration: InputDecoration(hintText: widget.employer.ManagerName),
//                   onChanged: (value) {
//                     productProvider.ChangeManagerName(value);
//                   },
//                 ),
//                 Text(
//                   'Manager Email : ',
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 TextField(
//                   decoration:
//                       InputDecoration(hintText: widget.employer.ManagerEmail),
//                   onChanged: (value) {
//                     productProvider.ChangeManagereEmail(value);
//                   },
//                 ),
//                 Text(
//                   'Company Website : ',
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 TextField(
//                   decoration: InputDecoration(hintText: widget.employer.Website),
//                   onChanged: (value) {
//                     productProvider.ChangeWebsite(value);
//                   },
//                 ),
//                 Text(
//                   'Rating : ',
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 TextField(
//                   decoration:
//                       InputDecoration(hintText: widget.employer.Rating),
//                   onChanged: (value) {
//                     productProvider.ChangeRating(value);
//                   },
//                 ),
                
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 // ignore: deprecated_member_use
//                 RaisedButton(
//                     child: Text("Update Employer"),
//                     onPressed: () {
//                       productProvider.saveEmployer();
//                       Navigator.of(context).pop();
//                     }),
//                 RaisedButton(
//                     color: Colors.red,
//                     child: Text("Remove Employer"),
//                     onPressed: () {
//                       final docUser = FirebaseFirestore.instance
//                           .collection('employer')
//                           .doc(widget.employer.CompanyID);
//                       docUser.delete();
//                       Navigator.of(context).pop();
//                     }),
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



class EditEmployer extends StatefulWidget {
  final Employer employer;
  EditEmployer(this.employer);
  @override
  _EditEmployerState createState() => _EditEmployerState();
}

class _EditEmployerState extends State<EditEmployer> {
  final CompanyNameController = TextEditingController();
  final CompanyFieldController = TextEditingController();
  final CompanyAddressController = TextEditingController();
  final ContactNumberController = TextEditingController();
  final ManagerNameController = TextEditingController();
  final ManagerEmailController = TextEditingController();
  final WebsiteController = TextEditingController();
  final RatingController = TextEditingController();

  @override
  void dispose() {
    CompanyNameController.dispose();
    CompanyFieldController.dispose();
    CompanyAddressController.dispose();
    ContactNumberController.dispose();
    ManagerNameController.dispose();
    ManagerEmailController.dispose();
    WebsiteController.dispose();
    RatingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.employer == null) {
      //New Record
      CompanyNameController.text = "";
      CompanyFieldController.text = "";
      CompanyAddressController.text = "";
      ContactNumberController.text = "";
      ManagerNameController.text = "";
      ManagerEmailController.text = "";
      WebsiteController.text = "";
      RatingController.text = "";
      // new Future.delayed(Duration.zero, () {
      //   final productProvider = Provider.of<ProductProvider>(context,listen: false);
      //   productProvider.LoadEmployer(Employer(CompanyName: productProvider.));
      // });
    } else {
      //Controller Update
      CompanyNameController.text=widget.employer.CompanyName;
      CompanyFieldController.text=widget.employer.CompanyField;
      CompanyAddressController.text=widget.employer.CompanyAddress;
      ContactNumberController.text=widget.employer.ContactNumber;
      ManagerNameController.text=widget.employer.ManagerName;
      ManagerEmailController.text=widget.employer.ManagerEmail;
      WebsiteController.text=widget.employer.Website;
      RatingController.text=widget.employer.Rating;
      //State Update
      new Future.delayed(Duration.zero, () {
        final productProvider = Provider.of<ProductProvider>(context,listen: false);
        productProvider.LoadEmployer(widget.employer);
      });
      
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Edit Employer Details')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: CompanyNameController,
              decoration: InputDecoration(hintText: 'Company Name'),
              onChanged: (value) {
                productProvider.ChangeCompanyName(value);
              },
            ),
            TextField(
              controller: CompanyFieldController,
              decoration: InputDecoration(hintText: 'Company Field'),
              onChanged: (value) => productProvider.ChangeCompanyField(value),
            ),
            TextField(
              controller: CompanyAddressController,
              decoration: InputDecoration(hintText: 'Company Address'),
              onChanged: (value) {
                productProvider.ChangeCompanyAddress(value);
              },
            ),
            TextField(
              controller: ContactNumberController,
              decoration: InputDecoration(hintText: 'Contact Number'),
              onChanged: (value) => productProvider.ChangeContactNumbers(value),
            ),
            TextField(
              controller: ManagerNameController,
              decoration: InputDecoration(hintText: 'Manager Name'),
              onChanged: (value) {
                productProvider.ChangeManagerName(value);
              },
            ),
            TextField(
              controller: ManagerEmailController,
              decoration: InputDecoration(hintText: 'Manager Email'),
              onChanged: (value) => productProvider.ChangeManagereEmail(value),
            ),
            TextField(
              controller: WebsiteController,
              decoration: InputDecoration(hintText: 'Company Website'),
              onChanged: (value) {
                productProvider.ChangeWebsite(value);
              },
            ),
            TextField(
              controller: RatingController,
              decoration: InputDecoration(hintText: 'Company Rating'),
              onChanged: (value) => productProvider.ChangeRating(value),
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              child: Text('Save Employer Details'),
              onPressed: () {
                productProvider.saveEmployer();
                Navigator.of(context).pop();
              },
            ),
            (widget.employer !=null) ? RaisedButton(
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Delete Employer'),
              onPressed: () {
                productProvider.removeEmployer(widget.employer.CompanyID);
                Navigator.of(context).pop();
              },
            ): Container(),
          ],
        ),
      ),
    );
  }
}