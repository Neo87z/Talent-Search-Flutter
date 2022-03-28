// ignore_for_file: non_constant_identifier_names

class Applicant {
  final String FullName;
  final String Age;
  final String HighestQualifiaction;
  final String ExpectedSalary;
  final String AboutYou;
  final String CVUploadedLink;

  final String ApplicantID;


  final String Status;

  Applicant(
      {required this.FullName,
      required this.Age,
      required this.HighestQualifiaction,
      required this.ExpectedSalary,
      required this.AboutYou,
      required this.CVUploadedLink,
      required this.Status,
      required this.ApplicantID,
  
     });

  Applicant.getAllApplicants(Map<String, dynamic> firestore)
      : FullName = firestore['FullName'],
        Status = firestore['Status'],
        Age = firestore['Age'],
        HighestQualifiaction = firestore['HighestQualifiaction'],
        ExpectedSalary = firestore['ExpectedSalary'],
        AboutYou = firestore['AboutYou'],
        CVUploadedLink = firestore['CVUploadedLink'],
        ApplicantID = firestore['ApplicantID'];
  
}
