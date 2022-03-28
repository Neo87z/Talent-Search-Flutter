// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud_new/models/job.dart';

import 'package:firebase_crud_new/models/user.dart';
import 'package:firebase_crud_new/services/Firestore_service.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../models/applyJob.dart';

class ProductProvider with ChangeNotifier {
  final fstore = FirestoreService();
  String _name = '';
  double _price = 0.0;
  String _productId = '';
  var uuid = Uuid();

  String get name => _name;
  double get price => _price;
  String get ProID => _productId;

  changeProductID(String value) {
    print(value);
    _productId = value;
    notifyListeners();
  }

  changeName(String value) {
    print("Changin");
    _name = value;
    notifyListeners();
  }

  changePrice(String value) {
    _price = double.parse(value);
    notifyListeners();
  }

  //UserDetails  Model

  String _FirstName = '';
  String _LastName = '';
  String _EmailAddress = '';
  String _Password = '';
  String _UserId = '';
  bool _LoginStatus = false;
  String _Login = 'No';
  String _Type = '';

  String get GetFirstName => _FirstName;
  String get GetLastName => _LastName;
  String get GetEMailAddress => _EmailAddress;
  String get GetPassword => _Password;
  String get GetUserId => _UserId;
  bool get getloginStatis => _LoginStatus;
  String get LoginStatusNew => _Login;
  String get GetuserType => _Type;

  ChangeUserType(String value) {
    _Type = value;
    notifyListeners();
  }

  ChangeStatus(String value) {
    _Login = value;
    notifyListeners();
  }

  ChangeLoginStatus(bool value) {
    _LoginStatus = value;
    notifyListeners();
  }

  ChangeFirstName(String value) {
    _FirstName = value;
    notifyListeners();
  }

  ChangelaastName(String value) {
    _LastName = value;
    notifyListeners();
  }

  ChamngeEmail(String value) {
    _EmailAddress = value;
    notifyListeners();
  }

  ChangePassword(String value) {
    _Password = value;
    notifyListeners();
  }

  ChangeUserID(String value) {
    _UserId = value;
    notifyListeners();
  }

  loadUserDetails(User user) {
    _FirstName = user.Fname;
    _LastName = user.Lname;
    _EmailAddress = user.Email;
    _Password = user.Password;
    _UserId = user.UserID;
  }

  //AddNeUser to the Firebase

  SaveUser() {
    var newUSer = User(
        Fname: GetFirstName,
        Lname: GetLastName,
        Email: GetEMailAddress,
        Password: GetPassword,
        UserID: uuid.v4(),
        Type: GetuserType);
    fstore.AddNewUser(newUSer);
  }

  //CheckLogidetails
  CheckLoginDetails() async {
    ChangeStatus('No');
    await FirebaseFirestore.instance
        .collection('user')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if (doc["Email"] == GetEMailAddress) {
          if (doc["Password"] == GetPassword) {
            if (doc["Type"] == 'Candidate') {
              print('Login Sucessfull');
              ChangeStatus('yes');
            } else {
              ChangeStatus('Admin');
            }
          }
        }
      });
    });
  }

  Future<String> CheckStatus() async {
    await CheckLoginDetails();
    if (LoginStatusNew == 'yes') {
      print('Login Sucessfull');
      return 'Can';
    } else if (LoginStatusNew == 'Admin') {
      print('login Failed');
      return 'Admin';
    } else {
      print('login Failed2');
      return 'Fail';
    }
  }

  //JOb Model Data
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
  LoadJob(Job job) {
    _Designation = job.Designation;
    _Employeer = job.Employeer;
    _Employeer_Website = job.Employeer_Website;
    _Estimated_Salary = job.Estimated_Salary;
    _Job_Description = job.Job_Description;
    _Job_Qualifications = job.Job_Qualifications;
    _Job_ID = job.Job_ID;
    _Email = job.Email;
    _Contact_Number = job.Contact_Number;
    _JobLocation = job.JobLocation;
    _JobCatgory = job.JobCat;
  }

  String get getDesignation => _Designation;
  String get getEmployerr => _Employeer;
  String get getEmployerrWebsite => _Employeer_Website;
  String get getEstimateSalary => _Estimated_Salary;
  String get getJobDescriptipn => _Job_Description;
  String get getJobQualification => _Job_Qualifications;
  String get getJobId => _Job_ID;
  String get getEmail => _Email;
  String get ContactNumber => _Contact_Number;
  String get JobLocation => _JobLocation;
  String get getJobCatgory => _JobCatgory;

  ChangeJobCateogry(String value) {
    _JobCatgory = value;
    notifyListeners();
  }

  ChangeDesignation(String value) {
    _Designation = value;
    notifyListeners();
  }

  ChangeEmployeer(String value) {
    _Employeer = value;
    notifyListeners();
  }

  ChangeEmployeerWebsite(String value) {
    _Employeer_Website = value;
    notifyListeners();
  }

  ChangeEsitmatedSalry(String value) {
    _Estimated_Salary = value;
    notifyListeners();
  }

  ChangeJobDescription(String value) {
    _Job_Description = value;
    notifyListeners();
  }

  ChangeJobQulaifation(String value) {
    _Job_Qualifications = value;
    notifyListeners();
  }

  ChangeJobID(String value) {
    _Job_ID = value;
    notifyListeners();
  }

  ChangeEmail(String value) {
    _Email = value;
    notifyListeners();
  }

  ChangeContactNumber(String value) {
    _Contact_Number = value;
    notifyListeners();
  }

  ChangeJobLocation(String value) {
    _JobLocation = value;
    notifyListeners();
  }

  SaveJob() {
    var newJob = Job(
        JobCat: getJobCatgory,
        Designation: getDesignation,
        Employeer: getEmployerr,
        Employeer_Website: getEmployerrWebsite,
        Estimated_Salary: getEstimateSalary,
        Job_Description: getJobDescriptipn,
        Job_Qualifications: getJobQualification,
        Job_ID: uuid.v4(),
        Email: getEmail,
        Contact_Number: ContactNumber,
        JobLocation: JobLocation);

    fstore.AddNewJob(newJob);
  }

  UpdateJobListing() {
    print("getJobId");
    print(getEmployerr);
    print(getJobId);
    final docUser = FirebaseFirestore.instance.collection('job').doc(getJobId);
    docUser.update({
      'Designation': getDesignation,
      'Employeer': getEmployerr,
      'Website': getEmployerrWebsite,
      'EstimatedSalary': getEstimateSalary,
      'JobDescruption': getJobDescriptipn,
      'JobQualification': getJobQualification,
      'Email': getEmail,
      'ContactNumber': ContactNumber,
      'JobLocation': JobLocation,
      'JobCat': getJobCatgory
    });
  }

//Applicants

  String _FullName = '';
  String _Age = '';
  String _HighestQualifiaction = '';
  String _ExpectedSalary = '';
  String _AboutYou = '';
  String _CVUploadedLink = '';
  String _ApplicantCNumber = '';
  String _ApplicantID = '';
  String _UserID = '';
  String _JobID = '';
  String _Status = '';

  String get getApplicantStatus => _Status;
  String get getApplicantFullNAme => _FullName;
  String get getApplicantAge => _Age;
  String get getApplicanyHighQuali => _HighestQualifiaction;
  String get getApplicantExceptedSalary => _ExpectedSalary;
  String get getApploicantAboutYou => _AboutYou;
  String get getApplicantCvLink => _CVUploadedLink;
  String get getAPplocantNumber => _ApplicantCNumber;
  String get getApploicantID => _ApplicantID;
  String get getApplcantUserID => _UserID;
  String get getAPplicantJobId => _JobID;

  ChangeApplicantStatus(String value) {
    _Status = value;
    notifyListeners();
  }

  ChangeApplicantFullName(String value) {
    print("Chaneg");
    _FullName = value;
    notifyListeners();
  }

  changeAplicantAge(String value) {
    _Age = value;
    notifyListeners();
  }

  ChangeApplocantHughQalu(String value) {
    _HighestQualifiaction = value;
    notifyListeners();
  }

  ChangeApplicantexpectedSalary(String value) {
    _ExpectedSalary = value;
    notifyListeners();
  }

  ChangeApplicantAboutYou(String value) {
    _AboutYou = value;
    notifyListeners();
  }

  ChangeApplicantNumber(String value) {
    _ApplicantCNumber = value;
    notifyListeners();
  }

  ChangeApplicantID(String value) {
    _ApplicantID = value;
    notifyListeners();
  }

  ChnageApplicantUserID(String value) {
    _UserID = value;
    notifyListeners();
  }

  changeCV(String value) {
    _CVUploadedLink = value;
    notifyListeners();
  }

  ChangeApplocantJobID(String value) {
    _JobID = value;
    notifyListeners();
  }

  SaveApplicant() {
    print(getApplicantFullNAme);

    var newApplicant = Applicant(
        FullName: getApplicantFullNAme,
        Age: getApplicantAge,
        HighestQualifiaction: getApplicanyHighQuali,
        ExpectedSalary: getApplicantExceptedSalary,
        AboutYou: getApploicantAboutYou,
        CVUploadedLink: getApplicantCvLink,
        ApplicantID: uuid.v4(),
        Status: 'Pending');

    fstore.AddNewApplicant(newApplicant);
  }

  UpdateAdmin() {
    print("herre");
    print(GetUserId);
    final docUser =
        FirebaseFirestore.instance.collection('user').doc(GetUserId);
    docUser.update({
      'Email': getEmail,
      'Fname': GetFirstName,
      'Lanme': GetLastName,
      'Password': GetPassword,
      'Type': GetuserType
    });
  }

  UpdateApplicant() {
    print(getApploicantID);
    final docUser =
        FirebaseFirestore.instance.collection('applicant').doc(getApploicantID);
    docUser.update({
      'FullName': getApplicantFullNAme,
      'Age': getApplicantAge,
      'HighestQualifiaction': getApplicanyHighQuali,
      'ExpectedSalary': getApplicantExceptedSalary,
      'AboutYou': getApploicantAboutYou,
      'CVUploadedLink': getApplicantCvLink,
      'Status': 'Pending',
    });
  }

  ApproveApplication() {
    print(getApploicantID);
    final docUser =
        FirebaseFirestore.instance.collection('applicant').doc(getApploicantID);
    docUser.update({
      'Status': 'Approve',
    });
  }

  DeclineApplication() {
    print("here");
    print(getApploicantID);
    final docUser =
        FirebaseFirestore.instance.collection('applicant').doc(getApploicantID);
    docUser.update({
      'Status': 'Decline',
    });
  }
}
