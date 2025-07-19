import 'package:flutter/material.dart';
import 'package:bug_tracker_application/Features/Bug_tracker/DATA/Model/bug_model.dart';
/// ------------------------------
/// SeverityScreen - Filtered Bug List Screen
/// ------------------------------
///
/// Purpose:
/// Displays a list of bugs filtered by severity or status with a custom heading.
///
/// Parameters:
/// - [bugs]: List of [BugModelCustom] bugs to display.
/// - [heading]: Heading text displayed on AppBar.
/// - [customcolor]: Optional background color for each bug card.
///
/// Usage:
/// dart
/// Navigator.push(
///   context,
///   MaterialPageRoute(
///     builder: (_) => SeverityScreen(bugs: filteredBugs, heading: 'High Severity'),
///   ),
/// );
/// `
class SeverityScreen extends StatelessWidget {
  const SeverityScreen({
    super.key,
    required this.bugs,
    required this.heading,
    this.customcolor,
  });

  final List<BugModelCustom> bugs;
  final String heading;
  final Color? customcolor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(heading)),
      body:
          bugs.isEmpty
              ? Center(
                child: Text(
                  "No bugs found with ${heading}",
                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
              : Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: bugs.length,
                  itemBuilder: (context, index) {
                    final bug = bugs[index];

                    return SeverityCard(
                      bug: bug,
                      customcolor: customcolor ?? Colors.white,
                    );
                  },
                ),
              ),
    );
  }
}

/// ------------------------------
/// SeverityCard - Single Bug Card Widget
/// ------------------------------
///
/// Purpose:
/// Displays a single bug's information inside a styled card.
///
/// Parameters:
/// - [bug]: The [BugModelCustom] instance representing the bug.
/// - [customcolor]: Optional card background color.
///
/// Usage:
/// Used inside [SeverityScreen] or any other bug list UI.
class SeverityCard extends StatelessWidget {
  const SeverityCard({super.key, required this.bug, this.customcolor});

  final BugModelCustom bug;
  final Color? customcolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: customcolor ?? Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 2),
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bug.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 5),
          Text(
            bug.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.grey, fontSize: 15),
          ),
          const SizedBox(height: 5),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color:
                    bug.status == "fixed"
                        ? Colors.green.shade500
                        : Colors.red.shade500,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                bug.status,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
