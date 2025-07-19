import 'package:bug_tracker_application/Features/Bug_tracker/DATA/Model/bug_model.dart';

import 'package:flutter/material.dart';

/// ------------------------------
/// FixedBugListScreen - Bug List Filtered by Fix Status
/// ------------------------------
///
/// Purpose:
/// Displays a list of bugs filtered by "Fixed" or "Unfixed" status with a heading.
///
/// Parameters:
/// - [isFixed]: Boolean flag to check if the bugs are fixed (`true`) or unfixed (`false`).  
/// - [heading]: The text displayed on the AppBar and empty state.
/// - [bugsFixed]: The list of [BugModelCustom] bugs to display.
///
/// Usage:
/// ```dart
/// Navigator.push(
///   context,
///   MaterialPageRoute(
///     builder: (_) => FixedBugListScreen(
///       heading: "Fixed Bugs",
///       isFixed: true,
///       bugsFixed: fixedBugs,
///     ),
///   ),
/// );
/// ```
class FixedBugListScreen extends StatelessWidget {
  const FixedBugListScreen({
    super.key,

    this.isFixed,
    required this.bugsFixed,
    required this.heading,
  });
     /// Whether the bugs are fixed (true) or unfixed (false).
  final bool? isFixed;

  
    /// Heading shown in the AppBar Which type of > Low severity,Medium severity,High severity.
  final String heading;

    /// List of bugs to be displayed.
  final List<BugModelCustom> bugsFixed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(heading)),
      body:
          bugsFixed.isEmpty
              ? Center(child: Text("No ${heading} Reported"))
              : SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    bugsFixed.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 5,
                      ),
                      child: Card(
                        color:
                            isFixed == true
                                ? Colors.green.shade100
                                : Colors.red.shade100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin: const EdgeInsets.only(bottom: 12),
                        elevation: 3,
                        child: ListTile(
                          leading:
                              isFixed == true
                                  ? const Icon(
                                    Icons.bug_report,
                                    color: Colors.green,
                                  )
                                  : Icon(
                                    Icons.bug_report_outlined,
                                    color: Colors.red,
                                  ),
                          title: Text("${bugsFixed[index].title}"),
                          subtitle:
                              isFixed == true
                                  ? Text(
                                    "SEVERITY :${bugsFixed[index].severity}"
                                        .toUpperCase(),
                                  )
                                  : Text("${bugsFixed[index].description}"),
                          trailing:
                              isFixed == true
                                  ? Text("${bugsFixed[index].date}")
                                  : Text("${bugsFixed[index].severity}"),
                          // StatusCard(
                          //   isFixed: isFixed,
                          //   severity: bugsFixed[index].severity,

                          //   title: bugsFixed[index].title,
                          // ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
    );
  }
}
