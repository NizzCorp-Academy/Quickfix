import 'package:bug_tracker_application/core/constants/color_costants/color_constant.dart';
import 'package:flutter/material.dart';

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
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: borderclr, width: 1),
          color: customcolor ?? ColorConstant.mainWhite,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Text(tittle, style: TextStyle(fontSize: 15)),
      ),
    );
  }
}
