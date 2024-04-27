// ignore_for_file: public_member_api_docs, sort_constructors_first

// ignore_for_file: file_names

class UserModels {
  final String name;
  final String email;
  final String password;
  final String images;

  final String id;

  UserModels(
      {required this.name,
      required this.email,
      required this.password,
      required this.images,
      required this.id});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'images': images,
      'id': id,
    };
  }

  factory UserModels.fromMap(Map<String, dynamic> map) {
    return UserModels(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      images: map['images'] as String,
      id: map['id'] as String,
    );
  }
}
