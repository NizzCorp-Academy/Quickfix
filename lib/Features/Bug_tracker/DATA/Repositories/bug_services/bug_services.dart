import 'package:bug_tracker_application/Features/Bug_tracker/DATA/Model/bug_model.dart';
import 'package:bug_tracker_application/core/utils/app-session.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// ------------------------------
/// BugService - Firestore Service for Bug Operations
/// ------------------------------
///
/// Purpose:
/// Provides CRUD operations for managing bug reports in Firestore.
/// Handles adding, fetching, updating, and deleting bugs for the logged-in user.
///
/// Usage:
/// Call this service from the repository or directly BLoC.
///
/// Firestore Collection: Defined by [AppSession.BugCollectionBox]
/// ----------------------------------------------------------------------
class BugService {
  /// Firestore collection reference for storing bugs.
  final bugcollection = FirebaseFirestore.instance.collection(
    AppSession.BugCollectionBox,
  );

  /// Adds a new bug to Firestore.
  ///
  /// Converts the [bugModel] to a map,
  /// adds the `createdAt` server timestamp,
  /// and sets the `createdby` field as the current user's UID.

  Future<void> addBugs(BugModelCustom bugModel) async {
    final data = bugModel.toMap();
    data['createdAt'] = FieldValue.serverTimestamp();
    data['createdby'] = FirebaseAuth.instance.currentUser!.uid;

    await bugcollection.add(data);
  }

  /// -----------------------------------------------------------

  /// Fetches all bugs created by the currently logged-in user from Firestore.
  ///
  /// Returns a [List<BugModelCustom>] containing all matching bugs.
  ///
  /// Filters by `createdby` field matching the current user's UID.

  Future<List<BugModelCustom>> getBugs() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    final snapshot =
        await bugcollection
            .where('createdby', isEqualTo: currentUser?.uid)
            .get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      return BugModelCustom.fromFirestore(data, doc.id);
    }).toList();
  }

  /// ----------------------------------------------------------------------------
  /// Updates an existing bug document in Firestore.
  ///
  /// Identifies the document by [bug.userId] and updates its fields with [bug.toMap()]

  Future<void> updateBug(BugModelCustom bug) async {
    await bugcollection.doc(bug.userId).update(bug.toMap());
  }

  /// Deletes a bug document from Firestore by its [userId].

  Future<void> bugDelete(dynamic userId) async {
    await bugcollection.doc(userId).delete();
  }
}
