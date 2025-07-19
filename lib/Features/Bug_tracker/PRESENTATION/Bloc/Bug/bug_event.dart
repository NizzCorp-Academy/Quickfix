part of 'bug_bloc.dart';

/// ------------------------------
/// BugEvent - Base Event for BugBloc
/// ------------------------------
///
/// Purpose:
/// Acts as the base class for all events handled by [BugBloc].
/// Extend this class to define specific actions related to bug operations.
/// ---------------------------------------------------------------
///
/// ------------------------------
/// BugLoadEvent - Fetch Bug List Event
abstract class BugEvent {}

/// ------------------------------
///
/// Triggered to load all bugs from the Firestore.
///
/// Handled by:
/// - Fetching bugs using [BugService.getBugs()]
/// - Emitting [BugLoaded] state on success
/// -------------------------------------------------------
class BugLoadEvent extends BugEvent {}

///
/// ------------------------------
/// AddBugEvent - Add New Bug Event
/// ------------------------------
///
/// Triggered when a user adds a new bug report.
///
/// Parameters:
/// - [bug]: The [BugModelCustom] object containing bug details.
///
/// Handled by:
/// - Adding the bug using [BugService.addBugs()]
/// - Reloading the bug list after adding

class AddBugEvent extends BugEvent {
  final BugModelCustom bug;

  AddBugEvent(this.bug);
}

/// ------------------------------
/// UpdateBugEvent - Update Existing Bug Event
/// ------------------------------
///
/// Triggered when a user updates a bug report.
///
/// Parameters:
/// - [bug]: The [BugModelCustom] object with updated bug details.
///
/// Handled by:
/// - Updating the bug in Firestore
/// - Reloading the bug list after update

class UpdateBugEvent extends BugEvent {
  final BugModelCustom bug;
  UpdateBugEvent(this.bug);
}
/// ------------------------------
/// BugDelete - Delete Bug Event
/// ------------------------------
///
/// Triggered when a user deletes a bug by its [id].
///
/// Parameters:
/// - [id]: The document ID of the bug to delete.
///
/// Handled by:
/// - Deleting the bug from Firestore
/// - Reloading the bug list after deletion

class BugDelete extends BugEvent {
  final String id;
 
  BugDelete(this.id);
}
   /// Creates a [BugDelete] event with the given bug [id]. 
