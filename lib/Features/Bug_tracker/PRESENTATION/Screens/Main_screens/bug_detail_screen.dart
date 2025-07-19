import 'package:bug_tracker_application/Features/Bug_tracker/DATA/Model/bug_model.dart';
import 'package:bug_tracker_application/Features/Bug_tracker/PRESENTATION/widgets/sevirty.dart';
import 'package:bug_tracker_application/core/constants/color_costants/color_constant.dart';
import 'package:bug_tracker_application/core/constants/const_size/const_size.dart';
import 'package:flutter/material.dart';


/// ------------------------------
/// BugDetailScreen - Detailed View of a Bug Report
/// ------------------------------
///
/// Purpose:
/// Displays the complete details of a single bug report including title,
/// description, severity, status, assigned developer, and date.
///
/// Allows user to:
/// - View all bug details
/// - Trigger update action via edit button
/// - Optionally share or perform other actions
///
/// Parameters:
/// - [title]: Title of the bug.
/// - [desc]: Detailed description of the bug.
/// - [date]: Date associated with the bug.
/// - [developer]: Assigned developer’s name.
/// - [status]: Current status of the bug (e.g., Fixed/Unfixed).
/// - [severity]: Severity level of the bug (e.g., High/Medium/Low).
/// - [onUpdate]: Callback triggered when edit icon is tapped.
///
/// Usage Example:
/// ```dart
/// Navigator.push(
///   context,
///   MaterialPageRoute(
///     builder: (_) => BugDetailScreen(
///       title: "Crash on Login",
///       desc: "App crashes when wrong credentials are entered.",
///       date: "2025-07-16",
///       developer: "John Doe",
///       Status: "Unfixed",
///       Severity: "High",
///       onUpdate: () { /* Open Edit Screen */ },
///     ),
///   ),
/// );
/// ```

class BugDetailScreen extends StatelessWidget {
  const BugDetailScreen({
    super.key,
    required this.title,
    required this.desc,
    required this.date,
    required this.developer,
    required this.status,
    required this.severity,
    required this.onUpdate, required this.onShare,
  });

  final String title;
  final String desc;
  final String date;
  final String developer;
  final String status;
  final String severity;
  final VoidCallback onUpdate;
  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
    BugModelCustom bug;
    return Scaffold(
      appBar: AppBar(title: Text('Bug Details'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: ColorConstant.mainBlack,
                            ),
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: onUpdate,

                          icon: Icon(Icons.edit, size: 15),
                        ),
                      ],
                    ),
                    CustomSize.kSizedBoxheight10,
                    Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: ColorConstant.mainBlack,
                      ),
                    ),
                    Text(
                      desc,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),

                    CustomSize.kSizedBoxheight10,
                    Row(
                      children: [
                        Sevirity(
                          customcolor:
                              severity == "high"
                                  ? Colors.red.shade100
                                  : severity == "medium"
                                  ? Colors.orange.shade100
                                  : severity == "low"
                                  ? Colors.white
                                  : Colors.red.shade100,
                          borderclr: Colors.black,
                          tittle: "Sevirity:$severity".toUpperCase(),
                          ontaP: () {},
                        ),
                        SizedBox(width: 5),
                        Sevirity(
                          customcolor:
                              status == "fixed"
                                  ? Colors.green.shade100
                                  : Colors.red.shade100,
                          borderclr: Colors.black,
                          tittle: "Status:$status".toUpperCase(),

                          ontaP: () {},
                        ),
                      ],
                    ),

                    CustomSize.kSizedBoxheight10,

                    Text(
                      "Developer",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: ColorConstant.mainBlack,
                      ),
                    ),

                    Text(developer, style: TextStyle(fontSize: 16)),
                    CustomSize.kSizedBoxheight10,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(date, style: TextStyle(fontSize: 16)),
                        IconButton(
                          onPressed: onShare,
                          icon: Icon(Icons.share, size: 20),
                        ),
                        CustomSize.kSizedBoxwidth5,
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
