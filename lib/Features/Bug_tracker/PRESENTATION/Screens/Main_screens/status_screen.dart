import 'package:bug_tracker_application/Features/Bug_tracker/DATA/Model/bug_model.dart';
import 'package:bug_tracker_application/Features/Bug_tracker/PRESENTATION/Bloc/Bug/bug_bloc.dart';
import 'package:bug_tracker_application/Features/Bug_tracker/PRESENTATION/Bloc/Bug/bug_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


/// ------------------------------
/// StatusScreen - Bug Report Summary Screen
/// ------------------------------
///
/// **Purpose:**
/// - Displays a summary of all reported bugs.
/// - Shows the total number of bugs, fixed bugs, and unfixed bugs.
/// - Provides a quick status overview for the user.
///
/// **Features:**
/// - Uses `BlocBuilder` to listen for `BugState` updates.
/// - Separates bug counts based on status (Fixed / Unfixed).
/// - Presents summary info inside styled cards.
///
/// **Usage:**
/// - Navigated from the Drawer (Reports section).
/// - Automatically updates when the bug list changes.
///
/// ------------------------------

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // Initialize buglist as an empty list or fetch from Bloc/state as needed

    return Scaffold(
      appBar: AppBar(title: Text("Status & Streaks")),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Center(
          child: BlocBuilder<BugBloc, BugState>(
            builder: (context, state) {
              if (state is BugLoaded) {
                final allBugs = state.bugss;
                List<BugModelCustom> fixedBugs =
                    allBugs.where((bug) => bug.status == "fixed").toList();

                List<BugModelCustom> unfixedBugs =
                    allBugs.where((bug) => bug.status == "unfixed").toList();
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Tottal Bugs Reported",
                            style: TextStyle(fontSize: 18),
                          ),
                          Spacer(),
                          BlocBuilder<BugBloc, BugState>(
                            builder: (context, state) {
                              if (state is BugLoaded) {
                                return Text(
                                  state.bugss.length.toString(),
                                  style: TextStyle(fontSize: 18),
                                );
                              }
                              return Text("NO BUG REPORTED");
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Text("Fixed Bugs", style: TextStyle(fontSize: 18)),
                          Spacer(),
                          Text(
                            "${fixedBugs.length}",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Text("Unfixed Bugs", style: TextStyle(fontSize: 18)),
                          Spacer(),
                          Text(
                            "${unfixedBugs.length}",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return Center(child: Text("No Bugs Reported Yet"));
            },
          ),
        ),
      ),
    );
  }
}
