import 'dart:developer';

import 'package:bug_tracker_application/Features/Data/Model/bug_model.dart';
import 'package:bug_tracker_application/core/utils/app-session.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BugService {
  final bugcollection = FirebaseFirestore.instance.collection(
    AppSession.collectionBox,
  );

  Future<void> addBugs(BugModel bugModel) async {
    await bugcollection.add(bugModel.toMap());
  }

  Future<List<BugModel>> getBugs() async {
    final snapshot = await bugcollection.get();

    final listOfBugs =
        snapshot.docs.map((doc) {
          final data = doc.data();
       
          return BugModel.fromFirestore(data, doc.id);
        }).toList();

    return listOfBugs;
  }

  Future<void> updateBug(BugModel bug) async {
    await bugcollection.doc(bug.id).update(bug.toMap());
  
  }

  Future<void> bugDelete(dynamic id) async {
    await bugcollection.doc(id).delete();
  }
}
