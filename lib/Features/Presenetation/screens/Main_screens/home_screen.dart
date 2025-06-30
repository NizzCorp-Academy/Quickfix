import 'package:bug_tracker_application/Features/Domain/services/notification/notification_service.dart';
import 'package:bug_tracker_application/Features/Presenetation/Bloc/Bug/bug_state.dart';
import 'package:bug_tracker_application/Features/Presenetation/Bloc/Bug/bug_bloc.dart';
import 'package:bug_tracker_application/Features/Presenetation/screens/Main_screens/Ruff_screen.dart';
import 'package:bug_tracker_application/Features/Presenetation/screens/Main_screens/bug_detail_screen.dart';
import 'package:bug_tracker_application/Features/Presenetation/screens/Main_screens/severity_screen.dart';

import 'package:bug_tracker_application/Features/Presenetation/screens/Main_screens/status_screen.dart';
import 'package:bug_tracker_application/Features/Presenetation/screens/Main_screens/unfixed.dart';
import 'package:bug_tracker_application/Features/Presenetation/widgets/Bugs_card.dart';

import 'package:bug_tracker_application/Features/Presenetation/widgets/add_form.dart';

import 'package:bug_tracker_application/Features/Presenetation/widgets/sevirty.dart';
import 'package:bug_tracker_application/core/constants/color_costants/color_constant.dart';
import 'package:bug_tracker_application/core/constants/const_size/const_size.dart';
import 'package:bug_tracker_application/core/utils/app-session.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<BugBloc>().add(BugLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<BugModel> allBugs = [];
    List<BugModel> lowSeverityBugs =
        allBugs.where((bug) => bug.severity == 0).toList();
    List<BugModel> mediumSeverityBugs =
        allBugs.where((bug) => bug.severity == 1).toList();
    List<BugModel> highSeverityBugs =
        allBugs.where((bug) => bug.severity == 2).toList();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: ColorConstant.mainWhite),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddForm(isEditMode: false)),
          );
          setState(() {});
        },
      ),
      backgroundColor: ColorConstant.Scaffoldgb,

      ///////APP BAR ///////
      ///   APP BAR/////////
      appBar: AppBar(
        backgroundColor: ColorConstant.Scaffoldgb,
        title: Text(
          "BUG TRACKER",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              NotificationService.showNotification(
                "Hey shafeeque",
                "Aren't you reporting any bugs today?",
              );
            },
            icon: Icon(Icons.notification_add, color: Colors.orange),
          ),
          SizedBox(width: 5),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menu', style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Report'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StatusScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
              },
            ),
          ],
        ),
      ),

      ///////////////////////////// Drawer closed ///////////////
      ////////////////////////////  open body   ////////////////
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Severity",
                    style: TextStyle(
                      color: ColorConstant.mainBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    ///////////// SEVERITY  LIST  ////////////////
                    children: List.generate(
                      3,
                      // AppSession.severity.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 5,
                        ),
                        child: Sevirity(
                          borderclr: Colors.black,
                          ontaP: () {
                            if (index == 0) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => SeverityScreen(
                                        tittle: "LOW SEVERITY",
                                      ),
                                ),
                              );
                            } else if (index == 1) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => SeverityScreen(
                                        tittle: "MEDIUM SEVERITY",
                                      ),
                                ),
                              );
                            } else if (index == 2) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => SeverityScreen(
                                        tittle: "HIGH SEVERITY",
                                      ),
                                ),
                              );
                            }
                          },
                          tittle: AppSession.severity[index],
                        ),
                      ),
                    ),
                  ),
                  CustomSize.kSizedBoxheight10,

                  Text(
                    "Status",
                    style: TextStyle(
                      color: ColorConstant.mainBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  CustomSize.kSizedBoxheight10,

                  Row(
                    ///////////// STATUS  LIST  ////////////////
                    children: List.generate(
                      AppSession.status.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 5,
                        ),
                        child: Sevirity(
                          borderclr: Colors.black,
                          ontaP: () {
                            if (index == 0) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => FixedBugListScreen(
                                        isFixed: true,

                                        title: "Fix Bugs",
                                      ),
                                ),
                              );
                            } else if (index == 1) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => FixedBugListScreen(
                                        isFixed: false,
                                        title: "Unfixed Bugs",
                                      ),
                                ),
                              );
                            }
                          },
                          customcolor:
                              index == 0
                                  ? Colors.green.shade100
                                  : Colors.red.shade100,
                          tittle: AppSession.status[index],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              BlocBuilder<BugBloc, BugState>(
                builder: (context, state) {
                  if (state is BugLoaded) {
                    return Text(
                      "All Bugs (${state.bugss.length})",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    );
                  }
                  return Text("");
                },
              ),
              CustomSize.kSizedBoxheight10,
              BlocBuilder<BugBloc, BugState>(
                builder: (context, state) {
                  if (state is BugLoaded) {
                    return ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final bug = state.bugss[index];

                        /////////////////////// BUG CARD METHOD///////////
                        return Bugs_card(
                          onDelete: () {
                            context.read<BugBloc>().add(BugDelete(bug.id));
                          },

                          /////////////     HOME SCREWEN UI ///////////
                          /////////////     HOME SCREWEN UI //////////
                          title: bug.title,
                          description: bug.description,
                          date: bug.date,
                          Sevirity: bug.severity,
                          status: bug.status,
                          assignedDeveloper: bug.assignedDeveloper,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => BugDetailScreen(
                                      title: bug.title,
                                      desc: bug.description,
                                      date: bug.date,
                                      Severity: bug.severity,
                                      Status: bug.status,
                                      developer: bug.assignedDeveloper,
                                      onUpdate: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => AddForm(
                                                  isEditMode: true,

                                                  title: bug.title,
                                                  desc: bug.description,
                                                  developer:
                                                      bug.assignedDeveloper,
                                                  date: bug.date,
                                                  id: bug.id,
                                                  Severity: bug.severity,
                                                  status: bug.status,
                                                ),
                                          ),
                                        );
                                      },
                                    ),
                              ),
                            );
                          },
                        );
                      },
                      separatorBuilder:
                          (context, index) => SizedBox(height: 10),
                      itemCount: state.bugss.length,
                    );
                  } else if (state is BugError) {
                    return Text(state.message);
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
