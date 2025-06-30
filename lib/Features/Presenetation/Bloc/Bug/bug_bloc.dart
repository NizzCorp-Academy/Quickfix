import 'dart:developer';

import 'package:bug_tracker_application/Features/Data/Model/bug_model.dart';

import 'package:bug_tracker_application/Features/Domain/services/bug_services/bug_services.dart';

import 'package:bug_tracker_application/Features/Presenetation/Bloc/Bug/bug_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'bug_event.dart';

class BugBloc extends Bloc<BugEvent, BugState> {
  final BugService bugService;
  BugBloc(this.bugService) : super(BugInitial()) {
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

    //// Get Bug  Bloc. ///////
    on<BugLoadEvent>((event, emit) async {
      try {
        final bugList = await bugService.getBugs();

        emit(BugLoaded(bugList));
      } catch (e) {
        log(e.toString());
        emit(BugError("Something Error".toString()));
      }
    });

    on<UpdateBugEvent>((event, emit) async {

      try {
        await bugService.updateBug(event.bug);

        add(BugLoadEvent());
      } catch (e) {
        emit(BugError("fetching data"));
       
      }
    });

    on<BugDelete>((event, emit) async {
      await bugService.bugDelete(event.id);

      add(BugLoadEvent());
    });
  }
}
