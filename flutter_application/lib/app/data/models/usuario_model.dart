class UsuarioModel {
  UsuarioModel(
      {required this.id,
      required this.email,
      required this.username,
      required this.password});

  int id;
  String email;
  String username;
  String password;

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      id: map['id'],
      email: map['email'],
      username: map['username'],
      password: map['password'],
    );
  }
}
