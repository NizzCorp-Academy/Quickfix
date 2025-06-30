

import 'package:bug_tracker_application/core/constants/color_costants/color_constant.dart';
import 'package:flutter/material.dart';

class FixedBugListScreen extends StatelessWidget {
  const FixedBugListScreen({super.key, required this.title, this.isFixed});
  final String title;
  final bool? isFixed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: [
          status_card(isFixed: isFixed),
        ],
      ),
    );
  }
}

class status_card extends StatelessWidget {
  const status_card({
    super.key,
    required this.isFixed,
  });

  final bool? isFixed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue.shade100,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.bug_report_outlined,
                      color: ColorConstant.mainRed,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Crash on Set up",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Priority : Medium ",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    isFixed == true
                        ? Icon(
                          Icons.check_circle_rounded,
                          color: Colors.green,
                        )
                        : Icon(
                          Icons.disabled_by_default_outlined,
                          color: Colors.red,
                        ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
