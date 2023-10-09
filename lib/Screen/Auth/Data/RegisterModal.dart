// ignore_for_file: file_names, non_constant_identifier_names

class RegisterModal {
  String? userId;
  String FirstName;
  String LastName;
  String email;
  String phone;
  String password;
  String ConfirmPassword;
  bool checkTerms;

  RegisterModal(
      {required this.FirstName,
      required this.LastName,
      required this.email,
      required this.phone,
      required this.password,
      required this.ConfirmPassword,
      required this.checkTerms});

  factory RegisterModal.toJson(Map<String, dynamic> json) {
    return RegisterModal(
        FirstName: 'FirstName',
        LastName: 'LastName',
        email: 'email',
        phone: 'phone',
        password: 'password',
        ConfirmPassword: 'ConfirmPassword',
        checkTerms: true);
  }
}
