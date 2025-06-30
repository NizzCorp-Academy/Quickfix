part of 'bug_bloc.dart';

abstract class BugEvent {}

class BugLoadEvent extends BugEvent {}

class AddBugEvent extends BugEvent {
  final BugModel bug;

  AddBugEvent(this.bug);
}
class UpdateBugEvent extends BugEvent{
    final BugModel bug;
   UpdateBugEvent(this.bug);

}


class BugDelete extends BugEvent {
  final String id;
  BugDelete(this.id);
}

// class GetBugsEvent extends BugEvent {
//   final List<BugModel> bugss;
//   GetBugsEvent(this.bugss);
// }

// class AddbugSuccess extends BugEvent {}

// class GetBugsEvent extends BugEvent {}
