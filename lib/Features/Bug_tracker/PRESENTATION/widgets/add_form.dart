import 'package:bug_tracker_application/Features/Bug_tracker/DATA/Model/bug_model.dart';
import 'package:bug_tracker_application/Features/Bug_tracker/PRESENTATION/Bloc/Bug/bug_bloc.dart';

import 'package:bug_tracker_application/Features/Bug_tracker/PRESENTATION/Bloc/Bug/bug_state.dart';

import 'package:bug_tracker_application/Features/Bug_tracker/PRESENTATION/Screens/Main_screens/home_screen.dart';
import 'package:bug_tracker_application/Features/Bug_tracker/PRESENTATION/widgets/sevirty.dart';
import 'package:bug_tracker_application/core/constants/color_costants/color_constant.dart';
import 'package:bug_tracker_application/core/constants/const_size/const_size.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

/// ---------------------------------------------------------
/// AddForm - Bug Creation & Update Form Screen
/// ---------------------------------------------------------
///
/// **Purpose:**
/// - Used to **add new bugs** or **edit existing bugs**.
/// - Provides input fields for title, description, assigned developer, date,
///   severity, and status.
/// - Submits data via `BugBloc` events (AddBugEvent / UpdateBugEvent).
///
/// **Features:**
/// - Handles both **Add** and **Update** modes (based on `isEditMode` flag).
/// - Uses `StatefulBuilder` for local state management of severity & status.
/// - Validates input fields before submission.
/// - Supports Date Picker for selecting date.
///
/// **Usage Example:**
/// ```dart
/// AddForm(isEditMode: false) // For adding a new bug
/// AddForm(
///   isEditMode: true,
///   id: "bugId",
///   title: "Bug Title",
///   desc: "Bug Description",
///   ...
/// ) // For editing an existing bug
/// ```
///
/// ---------------------------------------------------------


// ignore: must_be_immutable
class AddForm extends StatelessWidget {
  final String? id;
  final String? title;
  final String? desc;
  final String? date;
  final String? developer;
  final String? severity;
  final String? status;

  AddForm({
    super.key,
    required this.isEditMode,
    this.title,
    this.desc,
    this.date,
    this.developer,
    this.id,
    this.severity,
    this.status,
  });
  final bool? isEditMode;
  late TextEditingController titleController = TextEditingController(
    text: title,
  );
  late TextEditingController descriptionController = TextEditingController(
    text: desc,
  );
  late TextEditingController assignedDeveloperController =
      TextEditingController(text: developer);
  late TextEditingController dateController = TextEditingController(text: date);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    int? severityIndex;
    int? statusIndex;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          labelText: "Tittle",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      CustomSize.kSizedBoxheight10,
                      TextField(
                        controller: descriptionController,

                        decoration: InputDecoration(
                          labelText: "Description",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      CustomSize.kSizedBoxheight10,
                      TextField(
                        controller: assignedDeveloperController,
                        decoration: InputDecoration(
                          labelText: "Assigned Developer",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      CustomSize.kSizedBoxheight10,
                      TextField(
                        readOnly: true,
                        controller: dateController,
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () async {
                              var date = await showDatePicker(
                                context: context,
                                firstDate: DateTime(2000),
                                lastDate: DateTime.now(),
                              );
                              if (date != null) {
                                dateController.text = DateFormat(
                                  "ddMMMMyy",
                                ).format(date);
                              }
                            },
                            child: Icon(Icons.calendar_today),
                          ),
                          labelText: "Date",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      StatefulBuilder(
                        builder: (context, setclrState) {
                          List severity = ["Low", "Medium", "High"];
                          return Row(
                            children: List.generate(
                              severity.length,
                              (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Sevirity(
                                  borderclr:
                                      severityIndex == index
                                          ? Colors.black
                                          : Colors.white,

                                  ontaP: () {
                                    severityIndex = index;
                                    setclrState(() {});
                                  },
                                  tittle: severity[index],
                                ),
                              ),
                            ),
                          );
                        },
                      ),

                      SizedBox(height: 10),
                      StatefulBuilder(
                        builder: (context, setstatusState) {
                          List status = ["fixed", "Unfixed"];
                          return Row(
                            children: List.generate(
                              status.length,
                              (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Sevirity(
                                  ontaP: () {
                                    statusIndex = index;
                                    setstatusState(() {});
                                  },
                                  customcolor:
                                      index == 0
                                          ? Colors.green.shade100
                                          : Colors.red.shade100,
                                  tittle: status[index],
                                  borderclr:
                                      statusIndex == index
                                          ? Colors.black
                                          : Colors.white,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                  Colors.blue,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                  color: ColorConstant.mainWhite,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            //////// BLOC BUILDER ////////////////////////
                            /////// BLOC BUILDER /////////////////////////
                            //////////////////////////////////////////////
                            //////////////////////////////////////////////
                            child: BlocBuilder<BugBloc, BugState>(
                              builder: (context, state) {
                                return ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                      ColorConstant.loginBlue,
                                    ),
                                  ),

                                  //////////////////   add and  update button ///////////
                                  //////////////////   add and  update button ///////////
                                  //////////////////   add and  update button ///////////
                                  onPressed: () async {
                                    if (titleController.text.isNotEmpty &&
                                        descriptionController.text.isNotEmpty) {
                                      isEditMode == true
                                          ? context.read<BugBloc>().add(
                                            UpdateBugEvent(
                                              BugModelCustom(
                                                id ?? "",
                                                title: titleController.text,
                                                description:
                                                    descriptionController.text,
                                                assignedDeveloper:
                                                    assignedDeveloperController
                                                        .text,
                                                date: dateController.text,
                                                severity: getSeverity(
                                                  severityIndex!,
                                                ),
                                                status: getStatus(statusIndex!),
                                              ),
                                            ),
                                          )
                                          : context.read<BugBloc>().add(
                                            AddBugEvent(
                                              BugModelCustom(
                                                FirebaseAuth
                                                    .instance
                                                    .currentUser!
                                                    .uid,

                                                title: titleController.text,
                                                description:
                                                    descriptionController.text,
                                                assignedDeveloper:
                                                    assignedDeveloperController
                                                        .text,
                                                date: dateController.text,
                                                severity: getSeverity(
                                                  severityIndex!,
                                                ),
                                                status: getStatus(statusIndex!),
                                              ),
                                            ),
                                          );
                                    } else {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text(
                                            "Please fill the inputfield",
                                          ),
                                        ),
                                      );
                                    }

                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomeScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    isEditMode == true ? "update" : "Add",
                                    style: TextStyle(
                                      color: ColorConstant.mainWhite,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String getSeverity(int sevirityValue) {
  if (sevirityValue == 0) {
    return "low";
  } else if (sevirityValue == 1) {
    return "medium";
  } else if (sevirityValue == 2) {
    return "High";
  }

  return " unknown";
}

getStatus(int statusValue) {
  if (statusValue == 0) {
    return "fixed";
  } else if (statusValue == 1) {
    return "unfixed";
  }
  return "Unknown";
}
