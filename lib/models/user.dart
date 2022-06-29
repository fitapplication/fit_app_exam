class Username {
  final String uid;
  Username({required this.uid});
}

class UserData {
  final String? uid;
  final String? name;
  final String? surname;
  final String? age;
  final String? weigth;
  final String? heigth;
  final String? nickname;
  final String? userID;
  final String? loginDate;
  final List? step;
  final List? calories;
  final List? workout;
  final List? heart;

  UserData(
      {this.uid,
      this.age,
      this.name,
      this.surname,
      this.heigth,
      this.weigth,
      this.nickname,
      this.userID,
      this.loginDate,
      this.step,
      this.calories,
      this.workout,
      this.heart});
}
