class UserResponseModel {
  UserResponseModel({
    required this.status,
    required this.message,
    required this.users,
  });

  final int status;
  final String message;
  final List<UserModel> users;

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      status: json["status"] ?? 0,
      message: json["message"] ?? "",
      users: json["users"] == null
          ? []
          : List<UserModel>.from(
          json["users"]!.map((x) => UserModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "users": users.map((x) => x.toJson()).toList(),
  };
}

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.age,
    required this.address,
    required this.createdAt,
    required this.v,
  });

  final String id;
  final String name;
  final String email;
  final String gender;
  final int age;
  final String address;
  final String createdAt;
  final int v;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["_id"] ?? "",
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      gender: json["gender"] ?? "",
      age: json["age"] ?? 0,
      address: json["address"] ?? "",
      createdAt: json["createdAt"] ?? "",
      v: json["__v"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "gender": gender,
    "age": age,
    "address": address,
    "createdAt": createdAt,
    "__v": v,
  };
}