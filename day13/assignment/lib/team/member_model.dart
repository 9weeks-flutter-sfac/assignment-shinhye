enum MBTI {
  ISFJ,
  ISFP,
  ISTJ,
  ISTP,
  INFJ,
  INFP,
  INTJ,
  INTP,
  ESFJ,
  ESFP,
  ESTJ,
  ESTP,
  ENFJ,
  ENFP,
  ENTJ,
  ENTP,
}

class MemberModel {
  final int id;
  final String name;
  final String region;
  final int birthYear;
  final MBTI mbti;

  MemberModel({
    required this.id,
    required this.name,
    required this.region,
    required this.birthYear,
    required this.mbti,
  });
}
