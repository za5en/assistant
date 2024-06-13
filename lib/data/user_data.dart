class User {
  User({
    required this.id,
    required this.name,
    required this.surname,
    required this.patronymic,
    required this.fullName,
    required this.email,
    required this.userCompetencies,
  });

  int id;
  String name;
  String surname;
  String patronymic;
  String fullName;
  String email;
  List<UserCompetency> userCompetencies;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        surname: json["surname"],
        patronymic: json["patronymic"],
        fullName: json["fullName"],
        email: json["email"],
        userCompetencies: List.from(json["userCompetencies"] ?? []),
      );
}

class UserCompetency {
  UserCompetency({
    required this.id,
    required this.name,
    required this.priority,
    required this.level,
    required this.testTimeMinutes,
    required this.passThreshold,
    required this.completed,
    required this.testAttempts,
  });

  int id;
  String name;
  int priority;
  String level;
  int testTimeMinutes;
  int passThreshold;
  bool completed;
  List<TestAttempt> testAttempts;

  factory UserCompetency.fromJson(Map<String, dynamic> json) => UserCompetency(
        id: json["id"],
        name: json["name"],
        priority: json["priority"],
        level: json["level"],
        testTimeMinutes: json["testTimeMinutes"],
        passThreshold: json["passThreshold"],
        completed: json["completed"],
        testAttempts: List.from(json["testAttempts"] ?? []),
      );
}

class TestAttempt {
  TestAttempt({
    required this.solutionDuration,
    required this.uploadedAt,
    required this.answers,
  });

  int solutionDuration;
  String uploadedAt;
  List<Answer> answers;

  factory TestAttempt.fromJson(Map<String, dynamic> json) => TestAttempt(
        solutionDuration: json["solutionDuration"],
        uploadedAt: json["uploadedAt"],
        answers: List.from(json["answers"] ?? []),
      );
}

class Answer {
  Answer({
    required this.option,
    required this.isCorrect,
  });

  String option;
  bool isCorrect;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        option: json["option"],
        isCorrect: json["isCorrect"],
      );
}
