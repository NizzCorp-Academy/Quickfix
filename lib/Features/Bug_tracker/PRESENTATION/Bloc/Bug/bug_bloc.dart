import 'dart:developer';

import 'package:bug_tracker_application/Features/Bug_tracker/DATA/Model/bug_model.dart';

import 'package:bug_tracker_application/Features/Bug_tracker/DATA/Repositories/bug_services/bug_services.dart';

import 'package:bug_tracker_application/Features/Bug_tracker/PRESENTATION/Bloc/Bug/bug_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'bug_event.dart';

/// ------------------------------
/// BugBloc - Bug Management Business Logic Component
/// ------------------------------
///
/// Purpose:
/// Manages all Bug Tracker operations including:
/// - Adding a new bug
/// - Loading bug list
/// - Updating a bug
/// - Deleting a bug
///
/// Uses [BugService] to interact with Firestore for CRUD operations.
///
/// Emits various [BugState] based on the operation outcome.

class BugBloc extends Bloc<BugEvent, BugState> {
  /// Service class instance to perform Firestore operations.
  final BugService bugService;

  /// Initializes [BugBloc] with [BugInitial] state and registers event handlers.
  BugBloc(this.bugService) : super(BugInitial()) {
    /// ------------------------------
    /// Handles AddBugEvent
    /// ------------------------------
    /// Adds a new bug to Firestore, then loads the updated bug list.
    /// Emits:
    /// - [BugAdded] on successful add
    /// - [BugLoaded] with the latest bug list
    /// - [BugError] on failure

    on<AddBugEvent>((event, emit) async {
      try {
        await bugService.addBugs(event.bug);
        emit(BugAdded());
        final bugList = await bugService.getBugs();

        emit(BugLoaded(bugList));
      } catch (e) {
        emit(BugError(e.toString()));
      }
    });

    /// ------------------------------
    /// Handles BugLoadEvent
    /// ------------------------------
    /// Fetches the list of bugs from Firestore.
    /// Emits:
    /// - [BugLoaded] with bug list
    /// - [BugError] on failure

    on<BugLoadEvent>((event, emit) async {
      try {
        final bugList = await bugService.getBugs();

        emit(BugLoaded(bugList));
      } catch (e) {
        log(e.toString());
        emit(BugError("Something Error".toString()));
      }
    });

    /// ------------------------------
    /// Handles UpdateBugEvent
    /// ------------------------------
    /// Updates a bug document in Firestore, then reloads the bug list.
    /// Emits:
    /// - [BugError] on failure

    on<UpdateBugEvent>((event, emit) async {
      try {
        await bugService.updateBug(event.bug);

        add(BugLoadEvent());
      } catch (e) {
        emit(BugError("fetching data"));
      }
    });

    /// ------------------------------
    /// Handles BugDelete
    /// ------------------------------
    /// Deletes a bug by its ID, then reloads the bug list.
    on<BugDelete>((event, emit) async {
      await bugService.bugDelete(event.id);

      add(BugLoadEvent());
    });
  }
}
