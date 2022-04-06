// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crud_new/models/applyJob.dart';
import 'package:firebase_crud_new/models/employer.dart';
import 'package:firebase_crud_new/models/job.dart';

import 'package:firebase_crud_new/models/user.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<void> AddNewUser(User user) async {
    final docUser =
        FirebaseFirestore.instance.collection('user').doc(user.UserID);

    final json = {
      'Fname': user.Fname,
      'Lname': user.Fname,
      'Email': user.Email,
      'Password': user.Password,
      'UserID': user.UserID,
      'Type': 'Candidate'
    };

    await docUser.set(json);
  }

  Stream<List<User>> GetAllUsers() {
    print("hi");
    return FirebaseFirestore.instance.collection('user').snapshots().map(
        (snapshot) => snapshot.docs
            .map((document) => User.GetAllUserData(document.data()))
            .toList());
  }

  Stream<List<Applicant>> GetApplicants() {
    return FirebaseFirestore.instance.collection('applicant').snapshots().map(
        (snapshot) => snapshot.docs
            .map((document) => Applicant.getAllApplicants(document.data()))
            .toList());
  }

  Stream<List<Job>> GetAllJobs() {
    return FirebaseFirestore.instance.collection('job').snapshots().map(
        (snapshot) => snapshot.docs
            .map((document) => Job.getallJobs(document.data()))
            .toList());
  }

  Future<void> AddNewJob(Job job) async {
    final docUser =
        FirebaseFirestore.instance.collection('job').doc(job.Job_ID);
    final json = {
      'Designation': job.Designation,
      'Employeer': job.Employeer,
      'Website': job.Employeer_Website,
      'EstimatedSalary': job.Estimated_Salary,
      'JobDescruption': job.Job_Description,
      'JobQualification': job.Job_Qualifications,
      'Email': job.Email,
      'JobId': job.Job_ID,
      'ContactNumber': job.Contact_Number,
      'JobLocation': job.JobLocation,
      'JobCat': job.JobCat
    };

    await docUser.set(json);
  }

  Future<void> AddNewApplicant(Applicant applicant) async {
    print(applicant.ApplicantID);
    final docUser = FirebaseFirestore.instance
        .collection('applicant')
        .doc(applicant.ApplicantID);
    final json = {
      'FullName': applicant.FullName,
      'Age': applicant.Age,
      'HighestQualifiaction': applicant.HighestQualifiaction,
      'ExpectedSalary': applicant.ExpectedSalary,
      'AboutYou': applicant.AboutYou,
      'CVUploadedLink': applicant.CVUploadedLink,
      'ApplicantID': applicant.ApplicantID,
      'Status': applicant.Status
    };
    print("h2");
    await docUser.set(json);
  }

  //  Stream<List<Employer>> getallEmployers() {
  //   return FirebaseFirestore.instance.collection('employer').snapshots().map(
  //       (snapshot) => snapshot.docs
  //           .map((document) => Employer.getallEmployers(document.data()))
  //           .toList());
  // }

  // Future<void> AddNewEmployer(Employer employer) async {
  //   final docUser =
  //       FirebaseFirestore.instance.collection('employer').doc();
  //   final json = {
  //     'CompanyID': employer.CompanyID,
  //     'CompanyName': employer.CompanyName,
  //     'CompanyField': employer.CompanyField,
  //     'CompanyAddress': employer.CompanyAddress,
  //     'ContactNumber': employer.ContactNumber,
  //     'ManagerName': employer.ManagerName,
  //     'ManagerEmail': employer.ManagerEmail,
  //     'Website': employer.Website,
  //     'Rating': employer.Rating,

  //   };

  //   await docUser.set(json);
  // }

  // Future<void> saveEmployer(Employer employer){
  //   return _db.collection('employer').doc(employer.CompanyID).set(employer.toMap());
  // }

  // Stream<List<Employer>> getEmployers(){
  //   return _db.collection('employer').snapshots().map((snapshot) => snapshot.docs.map((document) => Employer.fromFirestore(document.data())).toList());
  // }

  // Future<void> removeEmployer(String CompanyID){
  //   return _db.collection('employer').doc(CompanyID).delete();
  // }

  Future<void> AddEmployer(Employer employer) async {
    final docPart = _db.collection("employer").doc();
    employer.CompanyID = docPart.id;

    final json = employer.toJson();
    await docPart.set(json);
  }

  Future<void> UpdateEmployer(Employer employer) {
    return _db
        .collection("employer")
        .doc(employer.CompanyID)
        .update(employer.toJson());
  }

  Future<void> RemoveEmployer(String? CompanyID) {
    return _db.collection("employer").doc(CompanyID).delete();
  }

  // Future<void> removeEmployer(String CompanyID) async {
  //   try {
  //     await _db.collection("employer").doc(CompanyID).delete();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<List> getEmployers() async {
  //   QuerySnapshot querySnapshot;
  //   List docs = [];
  //   try {
  //     querySnapshot =
  //         await _db.collection('employer').orderBy('CompanyName').get();
  //     if (querySnapshot.docs.isNotEmpty) {
  //       for (var doc in querySnapshot.docs.toList()) {
  //         Map a = {"CompanyID": doc.id, "CompanyName": doc['CompanyName'], "CompanyField": doc["CompanyField"]};
  //         docs.add(a);
  //       }
  //       return docs;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<void> saveEmployer(String CompanyID, String CompanyName, String CompanyField, String CompanyAddress, String ContactNumber, String ManagerName,String ManagerEmail, String Website, String Rating) async {
  //   try {
  //     await _db
  //         .collection("employer")
  //         .doc(CompanyID)
  //         .update({ 'CompanyName': CompanyName, 'CompanyField': CompanyField, 'CompanyAddress': CompanyAddress, 'ContactNumber': ContactNumber, 'ManagerName': ManagerName, 'ManagerEmail': ManagerEmail, 'Website': Website,'Rating': Rating});
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
