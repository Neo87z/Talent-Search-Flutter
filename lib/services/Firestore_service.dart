// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crud_new/models/applyJob.dart';
import 'package:firebase_crud_new/models/job.dart';

import 'package:firebase_crud_new/models/user.dart';

class FirestoreService {
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
}
