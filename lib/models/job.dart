// ignore_for_file: non_constant_identifier_names

class Job{
  final String Designation;
  final String Employeer;
  final String Employeer_Website;
  final String Estimated_Salary;
  final String Job_Description;
  final String Job_Qualifications;
  final String Job_ID;
  final String Email;
  final String Contact_Number;
  final String JobLocation;
  final String JobCat;

  Job( {required this.Designation, required this.Employeer, required this.Employeer_Website,required this.JobCat, required this.Estimated_Salary, required this.Job_Description, required this.Job_Qualifications,required this.Job_ID,required this.Email,required this.Contact_Number, required this.JobLocation});

Job.getallJobs(Map<String,dynamic> firestore)
  :Designation=firestore['Designation'],
  Employeer=firestore['Employeer'],
  Employeer_Website=firestore['Website'],
  Estimated_Salary=firestore['EstimatedSalary'],
  Job_Description=firestore['JobDescruption'],
  Job_Qualifications=firestore['JobQualification'],
  Email=firestore['Email'],
  Job_ID=firestore['JobId'],
  Contact_Number=firestore['ContactNumber'],
  JobCat=firestore['JobCat'],
  JobLocation=firestore['JobLocation'];

} 