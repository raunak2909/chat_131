// ignore_for_file: file_names, non_constant_identifier_names

class RegisterModal {
  String? userId;
  String FirstName;
  String LastName;
  String email;
  String phone;

  RegisterModal({
    this.userId,
    required this.FirstName,
    required this.LastName,
    required this.email,
    required this.phone,
  });

  factory RegisterModal.fromJson(Map<String, dynamic> json) {
    return RegisterModal(
      userId: json['userId'],
      FirstName: json['FirstName'],
      LastName: json['LastName'],
      email: json['email'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId':userId,
      'FirstName': FirstName,
      'LasttName': LastName,
      'email': email,
      'phone': phone,
    };
  }
}
