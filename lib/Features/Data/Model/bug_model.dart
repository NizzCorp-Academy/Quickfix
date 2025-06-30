class BugModel {
  final String id;
  final String title;
  final String description;
  final String assignedDeveloper;
  final String date;
  final String severity;
  final String status;

  BugModel(
    this.id, {
    required this.title,
    required this.description,
    required this.assignedDeveloper,
    required this.date,
    required this.severity,
    required this.status,
  });

  factory BugModel.fromFirestore(Map<String, dynamic> data, String id) {
    return BugModel(
      id,
      title: data['title'] ?? "",
      description: data['description'] ?? "",
      assignedDeveloper: data['assignedDeveloper'] ?? "",
      date: (data['date'] ?? ""),
      severity: data['severity'] ?? "",
      status: data['status'] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id" : id,
      'title': title,
      'description': description,
      'assignedDeveloper': assignedDeveloper,
      'date': date,
      'severity': severity,
      'status': status,
    };
  }
}
