// ignore_for_file: file_names

class SignInModal {
  String? usrId;
  String email;
  String password;

  SignInModal({required this.email, required this.password});

  factory SignInModal.fromJson(Map<String, String> json) {
    return SignInModal(
      email: 'email',
      password: 'password',
    );
  }
}

class SingnInWithPhone {
  String phone;
  SingnInWithPhone({required this.phone});

  factory SingnInWithPhone.fromJson(Map<String, String> json) {
    return SingnInWithPhone(phone: 'phone');
  }
}
