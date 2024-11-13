class RegisterParams {
  final String email;
  final String password;
  final String name;
  final String phoneNumber;
  final String confirmPassword;

  RegisterParams({
    required this.email,
    required this.password,
    required this.name,
    required this.phoneNumber,
    required this.confirmPassword,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'username': name,
      'mobile': phoneNumber,
      'password_confirmation': confirmPassword,
    };
  }
}