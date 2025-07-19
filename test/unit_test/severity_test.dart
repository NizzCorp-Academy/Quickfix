import 'package:bug_tracker_application/Features/Bug_tracker/PRESENTATION/widgets/add_form.dart';
import 'package:flutter_test/flutter_test.dart';


// Unit tests for getSeverity() function
// This function converts integer severity levels to their corresponding string values.
// Expected behavior:
// - 0 => "low"
// - 1 => "medium"
// - 2 => "High"
// - any other value => "unknown"
void main() {
  group('getSeverity function test', () {
    test('should return "low" for 0', () {
      expect(getSeverity(0), "low");
    });

    test('should return "medium" for 1', () {
      expect(getSeverity(1), "medium");
    });

    test('should return "High" for 2', () {
      expect(getSeverity(2), "High");
    });

    test('should return " unknown" for invalid value', () {
      expect(getSeverity(5), " unknown");
    });
  });
}
