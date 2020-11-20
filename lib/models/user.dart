class User {
  String name;
  int age;
  List<String> professions;

  User({this.name, this.age, this.professions});

  User copyWith({
    String name,
    int age,
    List<String> professions,
  }) =>
      User(
          name: name ?? this.name,
          age: age ?? this.age,
          professions: professions ?? this.professions);
}
