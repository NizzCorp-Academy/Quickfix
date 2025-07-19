
import 'package:bug_tracker_application/Features/Bug_tracker/DATA/Model/bug_model.dart';

/// ------------------------------
/// BugState - Base State for BugBloc
/// ------------------------------
///
/// Purpose:
/// Represents all possible states emitted by [BugBloc].
/// Extend this class to define specific UI states related to bug management.
abstract class BugState {}

/// ------------------------------
/// BugInitial - Initial State
/// ------------------------------
///
/// Represents the initial state when the BugBloc is first created.
///
/// Usage:
/// - Shown before any event is triggered.
class BugInitial extends BugState {}


/// ------------------------------
/// BugLoading - Loading State
/// ------------------------------
///
/// Represents the state when a bug-related operation is in progress (e.g., loading, adding, updating).
///
/// Usage:
/// - Show loading indicator in UI when this state is active.
class BugLoading extends BugState {}

/// ------------------------------
/// BugAdded - Successful Bug Addition State
/// ------------------------------
///
/// Represents the state when a new bug is successfully added.
///
/// Usage:
/// - Can be used to show success messages or reset input forms.
class BugAdded extends BugState {}

/// ------------------------------
/// BugLoaded - Bug List Loaded State
/// ------------------------------
///
/// Represents the state when the list of bugs is successfully fetched from Firestore.
///
/// Parameters:
/// - [bugss]: List of [BugModelCustom] representing the fetched bug reports.
///
/// Usage:
/// - Used to display the bug list in the UI.
/// 
/// 

  /// Creates a [BugLoaded] state with a list of [bugss].
class BugLoaded extends BugState {

  final List<BugModelCustom> bugss;
  BugLoaded(this.bugss);
}


/// ------------------------------
/// BugError - Error State
/// ------------------------------
///
/// Represents an error state when a bug-related operation fails.
///
/// Parameters:
/// - [message]: Description of the error.
///
/// Usage:
/// - Display an error message in the UI when this state is emitted.
class BugError extends BugState {
  /// Creates a [BugError] state with an error [message].
  final String message;
  BugError(this.message);
}
