import 'package:flutter/material.dart';

class SeverityScreen extends StatelessWidget {
  const SeverityScreen({super.key, required this.tittle});
  final String tittle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tittle)),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 1),
                    blurRadius: 2,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Log In UI Misalignment",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Button not centered in login page",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Center(
                      child: Text(
                        "unfixed",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class LowSeverityScreen extends StatelessWidget {
//   const LowSeverityScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Dummy list of low severity bugs
//     final List<Map<String, dynamic>> lowBugs = [
//       {
//         "title": "Login UI Misalignment",
//         "description": "Button not centered in login page",
//         "status": "Unfixed"
//       },
//       {
//         "title": "Text Overlap in Profile",
//         "description": "User name overlaps profile picture",
//         "status": "Fixed"
//       },
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("🟢 Low Severity Bugs"),
//         backgroundColor: Colors.green,
//       ),
//       body: ListView.builder(
//         itemCount: lowBugs.length,
//         itemBuilder: (context, index) {
//           final bug = lowBugs[index];
//           return Card(
//             margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             elevation: 3,
//             child: ListTile(
//               title: Text(
//                 bug["title"],
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               subtitle: Text(bug["description"]),
//               trailing: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                 decoration: BoxDecoration(
//                   color: bug["status"] == "Fixed"
//                       ? Colors.green
//                       : Colors.redAccent,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Text(
//                   bug["status"],
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
