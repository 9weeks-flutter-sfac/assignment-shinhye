class JobModel {
  final String? id; // : "652645d4015b79b54d9d8460",
  final String? jobs; // (string): "스마트 재난 관리 전문가",
  final int? createdAt; // : 1697007060597,
  final int? updatedAt; // : 1697007079589,
  final String? salary; // (int): null,
  final String?
      major; // (listlessstringgreater): "IT융합학과, 소방방재학과, 안전공학과, 정보통신공학과, 컴퓨터공학과, 소프트웨어공학과",
  final String? category; // (string): "환경/생태",
  final String?
      work; // (string): "스마트재난관리전문가는 각종 스마트기기를 활용해서 신속하고 정확하게 재난에 대응할 수 있도록 도와주며 재난 상황의 공통점이나 발생 원인을 분석하여 필요한 대응 방법을 찾고, IT 기술과 최첨단 장비를 융합하여 재난관리 시스템을 기획, 개발합니다.",
  final String? cert; // (listlessstringgreater): "방재기사",
  final String? skill; // (listlessstringgreater): "수리·논리력, 공간지각력"

  JobModel({
    required this.id,
    this.jobs,
    this.createdAt,
    this.updatedAt,
    this.salary,
    this.major,
    this.category,
    this.work,
    this.cert,
    this.skill,
  });

  factory JobModel.fromJson({required Map<String, dynamic> json}) {
    return JobModel(
      id: json['_id'],
      jobs: json['jobs(string)'] ?? null,
      createdAt: json['createdAt'] ?? null,
      updatedAt: json['updatedAt'] ?? null,
      salary: json['salary(int)'] ?? null,
      major: json['major(listlessstringgreater)'] ?? null,
      category: json['category(string)'] ?? null,
      work: json[' work(string)'] ?? null,
      cert: json[' cert(listlessstringgreater)'] ?? null,
      skill: json[' skill(listlessstringgreater)'] ?? null,
    );
  }
}
