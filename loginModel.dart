import 'dart:convert';

AuthResponse authResponseFromJson(String str) => AuthResponse.fromJson(json.decode(str));
String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  String status;
  String token;
  AuthData data;

  AuthResponse({
    required this.status,
    required this.token,
    required this.data,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    status: json["status"],
    token: json["token"],
    data: AuthData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "token": token,
    "data": data.toJson(),
  };
}

class AuthData {
  User user;

  AuthData({
    required this.user,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) => AuthData(
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
  };
}

class User {
  String id;
  String name;
  String email;
  String phone;
  Location location;
  String profilePic;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.location,
    required this.profilePic,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    location: Location.fromJson(json["location"]),
    profilePic: json["profilePic"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "location": location.toJson(),
    "profilePic": profilePic,
  };
}

class Location {
  String name;
  String address;
  List<double> coordinates;

  Location({
    required this.name,
    required this.address,
    required this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
    address: json["address"],
    coordinates: List<double>.from(json["coordinates"].map((x) => x.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "address": address,
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
  };
}
