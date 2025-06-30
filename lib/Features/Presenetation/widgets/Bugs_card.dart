import 'package:bug_tracker_application/core/constants/color_costants/color_constant.dart';
import 'package:bug_tracker_application/core/constants/const_size/const_size.dart';
import 'package:flutter/material.dart';

class Bugs_card extends StatelessWidget {
  const Bugs_card({
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
                      backgroundColor: Colors.orange.shade100,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Chip(
                    label: Text('STATUS : ${status}'.toUpperCase()),
                    backgroundColor: Colors.red.shade100,
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
    );
  }
}
