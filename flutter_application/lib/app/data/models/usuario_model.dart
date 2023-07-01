class UsuarioModel {
  UsuarioModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.username,
      required this.password});

  int id;
  String name;
  String email;
  String username;
  String password;

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    final fullName = "${map['firstName']} ${map['lastName']}";

    return UsuarioModel(
      id: map['id'],
      name: fullName,
      email: map['email'],
      username: map['username'],
      password: map['password'],
    );
  }
}
