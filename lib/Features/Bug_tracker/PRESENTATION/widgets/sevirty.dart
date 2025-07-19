import 'package:bug_tracker_application/core/constants/color_costants/color_constant.dart';
import 'package:flutter/material.dart';



/// --------------------------------------------------------------
/// Sevirity - Custom Clickable Card for Filter/Status/Severity
/// --------------------------------------------------------------
///
/// **Purpose:**  
/// Displays a clickable card with a title text, customizable color,
/// and border styling. Used for filters, categories, or status.
///
/// **Features:**
/// - Accepts onTap callback
/// - Supports custom background color & border color
/// - Reusable across multiple screens
///
/// **Example Usage:**
/// ```dart
/// Sevirity(
///   tittle: "High",
///   ontaP: () { /* handle tap */ },
///   customcolor: Colors.red.shade100,
///   borderclr: Colors.black,
/// )
/// ```
///
/// --------------------------------------------------------------


class Sevirity extends StatelessWidget {
  const Sevirity({
    super.key,
    required this.tittle,
    this.ontaP,
    this.customcolor,
    required this.borderclr,
  });
  final void Function()? ontaP;
  final String tittle;
  final Color? customcolor;
  final Color borderclr;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontaP,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        margin: const EdgeInsets.only(bottom: 12),
        elevation: 3,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: borderclr, width: 1),
            color: customcolor ?? ColorConstant.mainWhite,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(tittle, style: TextStyle(fontSize: 15)),
        ),
      ),
    );
  }
}
