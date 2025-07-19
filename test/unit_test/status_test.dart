import 'package:bug_tracker_application/Features/Bug_tracker/PRESENTATION/widgets/add_form.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Unit tests for getStatus() function
  // Expected outputs:
  // - 0 => "fixed"
  // - 1 => "unfixed"

  group('getStatus function test', () {
    test('should return "fixed" for 0', () {
      expect(getStatus(0), "fixed");
    });

    test('should return "unfixed" for 1', () {
      expect(getStatus(1), "unfixed");
    });
  });
}
