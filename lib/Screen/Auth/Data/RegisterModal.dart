// ignore_for_file: file_names, non_constant_identifier_names

class RegisterModal {
  String? userId;
  String uFirstName;
  String uLastName;
  String uEmail;
  String uPhone;
  String uProfilePic;
  bool isActive;
  bool isOnline;



  RegisterModal({
    this.userId,
    this.isActive = true,
    this.isOnline = false,
    this.uProfilePic = "",
    required this.uFirstName,
    required this.uLastName,
    required this.uEmail,
    required this.uPhone,

  });

  factory RegisterModal.fromJson(Map<String, dynamic> json) {
    return RegisterModal(
      userId: json['userId'],
      uPhone: json['uPhone'],
      uEmail: json['uEmail'],
      uFirstName: json['uFirstName'],
      uLastName: json['uLastName'],
      isOnline: json['isOnline'],
      isActive: json['isActive'],
      uProfilePic: json['uProfilePic'],
    );
  }

  Map<String, dynamic> toJson() {
    return {

      'userId':userId,
      'uFirstName':uFirstName,
      'uLastName':uLastName,
      'uEmail':uEmail,
      'uPhone':uPhone,
      'uProfilePic':uProfilePic,
      'isOnline':isOnline,
      'isActive':isActive,

    };
  }
}
