import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String name;
  final String email;
  final String gender;
  final int age;
  final int lenght;
  final int weight;

  User({
    required this.email,
    required this.age,
    required this.gender,
    required this.name,
    required this.lenght,
    required this.weight,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "gender": gender,
        "age": age,
        "lenght": lenght,
        "weight": weight,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      name: snapshot['name'],
      email: snapshot['email'],
      gender: snapshot['gender'],
      age: snapshot['age'],
      lenght: snapshot['lenght'],
      weight: snapshot['weight'],
    );
  }
}
