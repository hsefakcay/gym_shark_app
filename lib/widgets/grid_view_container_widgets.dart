import 'package:flutter/material.dart';
import 'package:gym_shark_app/common/color_extension.dart';

class GridViewContainer extends StatelessWidget {
  const GridViewContainer({
    super.key,
    required this.width,
    required this.height,
    required this.imageName,
    required this.workoutName,
    required this.taskNumber,
  });

  final double width;
  final double height;
  final String imageName;
  final String workoutName;
  final int taskNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        children: [
          SizedBox(
            height: width * 0.41,
            width: width * 0.41,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/${imageName}"),
              ),
            ),
          ),
          Positioned(
            bottom: height * 0.01,
            left: width * 0.03,
            child: Row(
              children: [
                Text(
                  workoutName,
                  style: TextStyle(color: TColors().whiteColor, fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 20,
                ),
                Text("$taskNumber Task", style: TextStyle(color: TColors().whiteColor, fontSize: 12))
              ],
            ),
          )
        ],
      ),
    );
  }
}
