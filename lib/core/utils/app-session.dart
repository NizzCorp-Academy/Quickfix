class AppSession {
        /// Available severity levels for bugs.
  static List severity = ["Low", "Medium", "High"];

  /// Possible status options for bugs.
  static List status = ["Fixed", "Unfixed"];

  /// Firestore collection name for storing bugs.
  static String BugCollectionBox = "Bugs";
}
