import 'package:bug_tracker_application/core/constants/color_costants/color_constant.dart';
import 'package:bug_tracker_application/core/constants/const_size/const_size.dart';
import 'package:flutter/material.dart';


/// ----------------------------------------------------------------
/// BugsCard - Reusable Widget for Displaying Bug Summary in a Card
/// ----------------------------------------------------------------
///
/// **Purpose:**  
/// Displays bug details like title, description, severity, status, 
/// assigned developer, and date in a styled card with delete option.
///
/// **Supports:**
/// - Tappable action (onTap)
/// - Delete button (onDelete)
/// - Customizable severity and status chips
///
/// **Usage Example:**
/// ```dart
/// BugsCard(
///   title: "Crash on Login",
///   description: "App crashes when incorrect password is entered.",
///   assignedDeveloper: "John Doe",
///   date: "16 July 2025",
///   Sevirity: "high",
///   status: "unfixed",
///   onDelete: () { /* handle delete */ },
///   onTap: () { /* navigate to details */ },
/// )
/// ```
///
/// ----------------------------------------------------------------


class BugsCard extends StatelessWidget {
  const BugsCard({
    super.key,
    required this.title,
    required this.description,
    required this.assignedDeveloper,
    required this.date,

    this.onEdit,
    this.onDelete,
    this.onShare,
    this.onTap,
    this.Sevirity,
    this.status,
  });

  final String title;
  final String description;
  final String assignedDeveloper;
  final String date;
  final String? Sevirity;
  final String? status;

  final void Function()? onEdit;
  final void Function()? onDelete;
  final void Function()? onShare;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.only(bottom: 12),
        elevation: 3,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue.shade200, width: 1),
            borderRadius: BorderRadius.circular(15),
            color: ColorConstant.Bugs_card,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: onDelete,
                      child: Icon(Icons.delete, size: 20, color: Colors.red),
                    ),
                    SizedBox(width: 10),
                  ],
                ),

                SizedBox(width: 10),
                SizedBox(height: 5),
                Text(maxLines: 3, description, style: TextStyle(fontSize: 18)),
                SizedBox(height: 5),
                Row(
                  children: [
                    Center(
                      child: Chip(
                        label: Text(
                          'SEVIRITY: ${Sevirity}'.toUpperCase(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        backgroundColor:
                            Sevirity == "high"
                                ? Colors.red.shade100
                                : Sevirity == "medium"
                                ? Colors.yellow.shade100
                                : Sevirity == "low"
                                ? Colors.white70
                                : Colors.red.shade100,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Chip(
                      label: Text('STATUS : ${status}'.toUpperCase()),
                      backgroundColor:
                          status == "fixed"
                              ? Colors.green.shade100
                              : Colors.red.shade100,
                    
                    ),
                  ],
                ),
                CustomSize.kSizedBoxheight10,

                Text(
                  maxLines: 1,
                  assignedDeveloper,
                  style: TextStyle(fontSize: 18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      date,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    CustomSize.kSizedBoxwidth5,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
