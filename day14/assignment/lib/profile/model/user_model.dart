import 'package:assignment/profile/model/address_model.dart';
import 'package:assignment/profile/model/company_model.dart';

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      username: map['username'],
      email: map['email'],
      address: Address.fromMap(map['address']),
      phone: map['phone'],
      website: map['website'],
      company: Company.fromMap(map['company']),
    );
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, username: $username}';
  }
}
