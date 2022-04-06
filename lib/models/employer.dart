// ignore_for_file: non_constant_identifier_names

class Employer{
  String CompanyID;
  final String CompanyName;
  final String CompanyField;
  final String CompanyAddress;
  final String ContactNumber;
  final String ManagerName;
  final String ManagerEmail;
  final String Website;
  final String Rating;

  Employer( {
    this.CompanyID = '', 
  required this.CompanyName, 
  required this.CompanyField, 
  required this.CompanyAddress, 
  required this.ContactNumber, 
  required this.ManagerName,  
  required this.ManagerEmail, 
  required this.Website, 
  required this.Rating});

  Map<String, dynamic> toMap() {
    return {
      'CompanyID': CompanyID,
      'CompanyName': CompanyName,
      'CompanyField': CompanyField,
      'CompanyAddress': CompanyAddress,
      'ContactNumber': ContactNumber,
      'ManagerName': ManagerName,
      'ManagerEmail': ManagerEmail,
      'Website': Website,
      'Rating' : Rating,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'CompanyID': CompanyID,
      'CompanyName': CompanyName,
      'CompanyField': CompanyField,
      'CompanyAddress': CompanyAddress,
      'ContactNumber': ContactNumber,
      'ManagerName': ManagerName,
      'ManagerEmail': ManagerEmail,
      'Website': Website,
      'Rating' : Rating,
    };
  }

  factory Employer.fromJson(Map<String, dynamic> json) {
    return Employer(
        CompanyID: json['CompanyID'],
        CompanyName: json['CompanyName'],
        CompanyField: json['CompanyField'],
        CompanyAddress: json['CompanyAddress'],
        ContactNumber: json['ContactNumber'],
        ManagerName: json['ManagerName'],
        ManagerEmail: json['ManagerEmail'],
        Website: json['Website'],
        Rating: json['Rating']);
  }

  Employer.fromFirestore(Map<String, dynamic> firestore)
      : CompanyID = firestore['CompanyID'],
        CompanyName = firestore['CompanyName'],
        CompanyField = firestore['CompanyField'],
        CompanyAddress = firestore['CompanyAddress'],
        ContactNumber = firestore['ContactNumber'],
        ManagerName = firestore['ManagerName'],
        ManagerEmail = firestore['ManagerEmail'],
        Website = firestore['Website'],
        Rating = firestore['Rating'];
}