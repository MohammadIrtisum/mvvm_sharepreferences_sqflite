class User {
  final int? id;
  final String name;
  final int age;

  User({this.id, required this.name, required this.age});

  // Convert User object to Map (for database insert)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  // Convert a Map to User object (for fetching from database)
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      age: map['age'],
    );
  }
}
