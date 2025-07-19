import 'package:cloud_firestore/cloud_firestore.dart';


    // This model represents a single bug report in the Bug Tracker application.
    // Used for storing and retrieving bug data from Firestore database.



class BugModelCustom {
  
  final String userId;    /// The ID of the user who created the bug.


  final String title;   /// Short title describing the bug.

  
  final String description;/// Detailed description of the bug.

  final String assignedDeveloper; /// who is asssigned the bugs

  final String date;   /// Date when the bug was reported.

  final String severity;   // Severity level of the bug (Low, Medium, High).

  final String status;  /// Current status of the bug (e.g., Fixed, Unfixed).


   // Used for storing and retrieving bug data from Firestore database.

  BugModelCustom(
    this.userId, {
    required this.title,
    required this.description,
    required this.assignedDeveloper,
    required this.date,
    required this.severity,
    required this.status,
  });
      /// Creates a [BugModelCustom] object from Firestore data.
  factory BugModelCustom.fromFirestore(
    Map<String, dynamic> data,
    String userID,
  ) {
    return BugModelCustom(
      userID,
      title: data['title'] ?? "",
      description: data['description'] ?? "",
      assignedDeveloper: data['assignedDeveloper'] ?? "",
      date: (data['date'] ?? ""),
      severity: data['severity'] ?? "",
      status: data['status'] ?? "",
    );
  }
  
   
/// Converts the [BugModelCustom] object into a map suitable for Firestore storage.
///
/// This method prepares the bug data by mapping all its fields to key-value pairs.
/// It also adds a server-generated timestamp (`createdAt`) to track when the bug was created.
///
/// Returns:
/// - A `Map<String, dynamic>` containing the bug details and metadata.
/// purpose:
///// Converts the bug data into a map for saving in Firestore.

  Map<String, dynamic> toMap() {
    return {
      'createdAt': FieldValue.serverTimestamp(),
      "userId": userId, 
      'title': title,
      'description': description,
      'assignedDeveloper': assignedDeveloper,
      'date': date,
      'severity': severity,
      'status': status,
    };
  }
}
