import 'dart:io';

import 'package:bug_tracker_application/Features/Bug_tracker/DATA/Model/bug_model.dart';

import 'package:bug_tracker_application/Features/Bug_tracker/DOMAIN/services/notification/notification_service.dart';
import 'package:bug_tracker_application/Features/Bug_tracker/PRESENTATION/Bloc/Bug/bug_state.dart';
import 'package:bug_tracker_application/Features/Bug_tracker/PRESENTATION/Bloc/Bug/bug_bloc.dart';

import 'package:bug_tracker_application/Features/Bug_tracker/PRESENTATION/Screens/Main_screens/bug_detail_screen.dart';

import 'package:bug_tracker_application/Features/Bug_tracker/PRESENTATION/Screens/Main_screens/filtering/severity_screen.dart';

import 'package:bug_tracker_application/Features/Bug_tracker/PRESENTATION/Screens/Main_screens/status_screen.dart';
import 'package:bug_tracker_application/Features/Bug_tracker/PRESENTATION/Screens/Main_screens/filtering/unfixed.dart';
import 'package:bug_tracker_application/Features/Bug_tracker/PRESENTATION/widgets/Bugs_card.dart';

import 'package:bug_tracker_application/Features/Bug_tracker/PRESENTATION/widgets/add_form.dart';

import 'package:bug_tracker_application/Features/Bug_tracker/PRESENTATION/widgets/sevirty.dart';
import 'package:bug_tracker_application/core/constants/color_costants/color_constant.dart';
import 'package:bug_tracker_application/core/constants/const_size/const_size.dart';
import 'package:bug_tracker_application/core/utils/app-session.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

/// ------------------------------
/// HomeScreen - Main Dashboard of Bug Tracker App
/// ------------------------------
///
/// **Purpose:**
/// - Acts as the main landing page after login.
/// - Displays all bugs reported by the user.
/// - Allows filtering bugs by:
///   - Severity (Low, Medium, High)
///   - Status (Fixed, Unfixed)
/// - Provides navigation to:
///   - Bug Details
///   - Add New Bug
///   - Report Summary (StatusScreen)
/// - Provides Drawer with Logout and Profile Image update option.
/// - Displays FCM notification trigger from AppBar.
///
/// **Features Covered:**
/// - Bug List with CRUD operations
/// - Filter by Severity and Status
/// - Bloc Pattern with BugBloc for state management
/// - Firebase Authentication & Firestore Integration
/// - Image Picker for profile picture
/// - Local Notifications with NotificationService
///
/// **Used Widgets & Screens:**
/// - `BugsCard` - Bug List Item Card
/// - `AddForm` - To Add or Edit Bug
/// - `BugDetailScreen` - Detailed view of single Bug
/// - `StatusScreen` - Filtered bugs based on fixed/unfixed status
/// - `SeverityScreen` - Filtered bugs based on severity
///
/// **Architecture:**
/// - Follows **Bloc Pattern** for state management
/// - Clean separation of presentation and domain logic
/// - Uses Dependency Injection of `BugBloc` from parent
///
/// **Onboarding Actions:**
/// - Displays all bugs fetched from `BugBloc`
/// - Allows adding new bug with FAB
/// - Allows logout using FirebaseAuth
///
/// **Push Notifications:**
/// - Uses `NotificationService` to show motivational reminders
///
/// --------

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  String? url;
  XFile? selectedImage;
  @override
  void initState() {
    super.initState(); // Must call this
    context.read<BugBloc>().add(BugLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

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
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: Text(
          "BUG TRACKER",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              NotificationService.showNotification(
                "Hey ${user?.displayName}",
                "Aren't you reporting any bugs today?",
              );
            },
            icon: Icon(Icons.notification_add, color: Colors.white),
          ),
          SizedBox(width: 5),
        ],
      ),
      drawer: Drawer(
        shadowColor: Colors.white,

        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // DrawerHeader(
            //   decoration: BoxDecoration(color: Colors.blue),
            //   child: Text('Menu', style: TextStyle(color: Colors.white)),
            // ),
            UserAccountsDrawerHeader(
              currentAccountPicture: InkWell(
                onTap: () async {
                  final ImagePicker picker = ImagePicker();
                  selectedImage = await picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  if (selectedImage != null) {
                    final storageRef = FirebaseStorage.instance.ref();
                    Reference? imagereference = storageRef.child(
                      "mountains.jpg",
                    );

                    await imagereference.putFile(File(selectedImage!.path));
                    url = await imagereference.getDownloadURL();
                  }
                  // Create a storage reference from our app

                  setState(() {});
                },

                child: CircleAvatar(
                  backgroundImage:
                      selectedImage != null
                          ? Image.file(File(selectedImage!.path)).image
                          : null,
                  //  NetworkImage(
                  //   "https://cdn.pixabay.com/photo/2022/06/05/07/04/person-7243410_1280.png",
                  // ),
                  // backgroundImage: Image.file(File(selectedImage!.path)).image,
                  // child: Icon(Icons.person, size: 50, color: Colors.blue),
                ),
              ),
              accountName: Text(user?.displayName ?? "unknown"),
              accountEmail: Text(user?.email ?? 'No Email'),
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: BlocBuilder<BugBloc, BugState>(
              builder: (context, state) {
                if (state is BugInitial || state is BugLoading) {
                  return CircularProgressIndicator();
                }
                if (state is BugLoaded) {
                  final allBugs = state.bugss;
                  /////////////////  FILTERING BUGS BY STATUS //////////////
                  /// /////////////////  FILTERING BUGS BY STATUS //////////////
                  /// /////////////////  FILTERING BUGS BY STATUS //////////////
                  List<BugModelCustom> fixedBugs =
                      allBugs.where((bug) => bug.status == "fixed").toList();

                  List<BugModelCustom> unfixedBugs =
                      allBugs.where((bug) => bug.status == "unfixed").toList();

                  /////////////////  FILTERING BUGS BY SEVERITY //////////////
                  /// /////////////////  FILTERING BUGS BY SEVERITY //////////////
                  /// /////////////////  FILTERING BUGS BY SEVERITY //////////////

                  List<BugModelCustom> lowSeverity =
                      allBugs.where((bug) => bug.severity == "low").toList();
                  List<BugModelCustom> mediumSeverity =
                      allBugs.where((bug) => bug.severity == "medium").toList();

                  List<BugModelCustom> highSeverity =
                      allBugs.where((bug) => bug.severity == "High").toList();

                  return Column(
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
                            children: List.generate(
                              3,

                              (index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 5,
                                ),
                                child: SizedBox(
                                  child: Sevirity(
                                    tittle: AppSession.severity[index],
                                    borderclr: Colors.black,
                                    ontaP: () {
                                      if (index == 0) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                ////// SEVERITY SCREEN ////////
                                                /// ////// SEVERITY SCREEN ////////
                                                ///  ////// SEVERITY SCREEN ////////
                                                ///  ////// SEVERITY SCREEN ////////
                                                (context) => SeverityScreen(
                                                  heading: "Low severity",
                                                  customcolor: Colors.white,
                                                  bugs: lowSeverity,
                                                ),
                                          ),
                                        );
                                      } else if (index == 1) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => SeverityScreen(
                                                  heading: "Medium severity",
                                                  customcolor:
                                                      Colors.yellow.shade100,
                                                  bugs: mediumSeverity,
                                                ),
                                          ),
                                        );
                                      } else if (index == 2) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => SeverityScreen(
                                                  heading: "High severity",
                                                  customcolor:
                                                      Colors.red.shade100,
                                                  bugs: highSeverity,
                                                ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
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

                          /// /////////////// STATUS LIST ////////////////
                          /// /////////////// STATUS LIST ////////////////
                          BlocBuilder<BugBloc, BugState>(
                            builder: (context, state) {
                              return Row(
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
                                                  (context) =>
                                                      FixedBugListScreen(
                                                        isFixed: true,
                                                        bugsFixed: fixedBugs,
                                                        heading: "Fixed Bugs",
                                                      ),
                                            ),
                                          );
                                        } else if (index == 1) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (context) =>
                                                      FixedBugListScreen(
                                                        bugsFixed: unfixedBugs,
                                                        isFixed: false,
                                                        heading: "Unfixed Bugs",
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
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      BlocBuilder<BugBloc, BugState>(
                        builder: (context, state) {
                          if (state is BugLoading) {
                            return CircularProgressIndicator();
                          }
                          if (state is BugLoaded) {
                            return Text(
                              "All Bugs (${state.bugss.length})",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            );
                          }
                          return Text("Loading bugs...");
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
                                ///////////// HOME SCREWEN UI ///////////
                                ///////////// HOME SCREWEN UI //////////

                                return BugsCard(
                                  onDelete: () {
                                    context.read<BugBloc>().add(
                                      BugDelete(bug.userId),
                                    );
                                  },

                                  title: bug.title,
                                  description: bug.description,
                                  date: bug.date.toString(),
                                  Sevirity: bug.severity.toString(),
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
                                              date: bug.date.toString(),
                                              severity: bug.severity.toString(),
                                              status: bug.status,
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
                                                          date:
                                                              bug.date
                                                                  .toString(),
                                                          id: bug.userId,
                                                          severity:
                                                              bug.severity
                                                                  .toString(),
                                                          status: bug.status,
                                                        ),
                                                  ),
                                                );
                                              },
                                              onShare: () {
                                                final bugtittle =
                                                    bug.title.toString();
                                                final bugdesc =
                                                    bug.description.toString();
                                                final bugdev =
                                                    bug.assignedDeveloper
                                                        .toString();
                                                final bugreport =
                                                    "${bugtittle}${bugdesc}${bugdev}";
                                                SharePlus.instance.share(
                                                  ShareParams(text: bugreport),
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
                  );
                }

                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );
  }
}
