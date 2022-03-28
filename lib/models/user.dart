// ignore_for_file: non_constant_identifier_names

class User{
  final String Fname;
  final String Lname;
  final String Email;
  final String Password;
  final String UserID;
  final String Type;

  User( {required this.Fname, required this.Lname, required this.Email, required this.Password, required this.UserID, required this.Type});

User.GetAllUserData(Map<String,dynamic> firestore)
  :Fname=firestore['Fname'],
  Lname=firestore['Lname'],
  Email=firestore['Email'],
  Password=firestore['Password'],
  Type=firestore['Type'],
  UserID=firestore['UserID'];
} 