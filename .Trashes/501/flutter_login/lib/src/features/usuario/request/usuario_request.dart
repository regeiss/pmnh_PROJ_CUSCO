//
//
//
class UsuarioRequest {
  UsuarioRequest({
    required this.identifier,
    required this.password,
  });

  String identifier;
  String password;

  factory UsuarioRequest.fromJson(Map<String, dynamic> json) => UsuarioRequest(
        identifier: json["identifier"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "identifier": identifier,
        "password": password,
      };
}
