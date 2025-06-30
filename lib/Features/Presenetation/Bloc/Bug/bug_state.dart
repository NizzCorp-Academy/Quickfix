import 'package:bug_tracker_application/Features/Data/Model/bug_model.dart';

abstract class BugState {}

class BugInitial extends BugState {}

class BugLoading extends BugState {}

class BugAdded extends BugState {}

class BugLoaded extends BugState {
  final List<BugModel> bugss;
  BugLoaded(this.bugss);
}

class BugError extends BugState {
  final String message;
  BugError(this.message);
}
