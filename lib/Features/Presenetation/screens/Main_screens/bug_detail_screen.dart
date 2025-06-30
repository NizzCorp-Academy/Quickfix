import 'package:bug_tracker_application/Features/Presenetation/widgets/sevirty.dart';
import 'package:bug_tracker_application/core/constants/color_costants/color_constant.dart';
import 'package:bug_tracker_application/core/constants/const_size/const_size.dart';
import 'package:flutter/material.dart';

class BugDetailScreen extends StatelessWidget {
  const BugDetailScreen({
    super.key,
    required this.title,
    required this.desc,
    required this.date,
    required this.developer,
    required this.Status,
    required this.Severity,
    required this.onUpdate,
  });

  final String title;
  final String desc;
  final String date;
  final String developer;
  final String Status;
  final String Severity;
  final VoidCallback onUpdate;
  @override
  Widget build(BuildContext context) {
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
                      "Discription",
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
                          borderclr: Colors.black,
                          tittle: " Status: ${Status}".toUpperCase(),
                          customcolor: Colors.green.shade200,
                          ontaP: () {},
                        ),
                        SizedBox(width: 20),

                        Sevirity(
                          borderclr: Colors.black,
                          tittle: "Sevirity:  ${Severity}".toUpperCase(),
                          ontaP: () {},
                        ),
                      ],
                    ),

                    CustomSize.kSizedBoxheight10,

                    Text(
                      "developer",
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
                          onPressed: () {},
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
