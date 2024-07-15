import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_shark_app/common/color_extension.dart';
import 'package:gym_shark_app/model/workout.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    List<Workout> workoutList;
    workoutList = [
      Workout(name: "Resistance", imageName: "resistance.jpg", taskNumber: 34),
      Workout(name: "Push Up", imageName: "push_up.jpg", taskNumber: 26),
      Workout(name: "Row", imageName: "row.jpg", taskNumber: 18),
      Workout(name: "Curl", imageName: "curl.jpg", taskNumber: 8),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors().whiteColor,
        title: const Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                maxRadius: 25,
                backgroundImage: AssetImage("assets/images/man-profile.jpg"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Hallo Bobby",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.waving_hand_rounded,
                        color: Colors.amber,
                        size: 20,
                      )
                    ],
                  ),
                  Text(
                    "Good Morning",
                    style: TextStyle(fontSize: 13, color: Colors.black54),
                  )
                ],
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.notification_add_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: TColors().whiteColor,
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchBar(
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  leading: Icon(
                    Icons.search_outlined,
                    color: Colors.black38,
                  ),
                  elevation: WidgetStateProperty.all(0),
                  backgroundColor: WidgetStatePropertyAll(Colors.grey.shade100),
                  hintText: "Search workouts",
                  hintStyle: WidgetStatePropertyAll(TextStyle(color: Colors.black12, fontSize: 14)),
                ),
                SizedBox(height: height * 0.025),
                Text(
                  "Todays Session",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: height * 0.025),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: height * 0.2,
                        width: width * 0.9,
                        child: Image(fit: BoxFit.cover, image: AssetImage("assets/images/push_up.jpg")),
                      ),
                    ),
                    Positioned(
                      bottom: height * 0.015,
                      left: width * 0.05,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Full Body",
                            style: TextStyle(
                              color: TColors().whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "34 Task",
                            style: TextStyle(
                              color: TColors().whiteColor,
                              fontSize: 12,
                            ),
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    size: 15,
                                    Icons.favorite_border,
                                    color: TColors().whiteColor,
                                  ),
                                  SizedBox(width: width * 0.02),
                                  Text(
                                    "Calories",
                                    style: TextStyle(
                                      color: TColors().whiteColor,
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(width: width * 0.1),
                              Row(
                                children: [
                                  Icon(
                                    size: 15,
                                    Icons.access_time_rounded,
                                    color: TColors().whiteColor,
                                  ),
                                  SizedBox(width: width * 0.02),
                                  Text(
                                    "24 Min",
                                    style: TextStyle(
                                      color: TColors().whiteColor,
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: height * 0.025),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Featured Workouts",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Row(
                      children: [
                        Text(
                          "See all",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: TColors().greenColor),
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: TColors().greenColor,
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01),
                Container(
                  width: width,
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Sütun sayısı
                    ),
                    itemCount: 4, // Oluşturulacak öğe sayısı
                    itemBuilder: (context, index) {
                      return GridViewContainer(
                        width: width,
                        height: height,
                        imageName: workoutList[index].imageName,
                        workoutName: workoutList[index].name,
                        taskNumber: workoutList[index].taskNumber,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: TColors().whiteColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: TColors().greenColor,
        unselectedItemColor: Colors.black38,
        items: <BottomNavigationBarItem>[
          NavigationBarItem(Icons.home_outlined, "Home"),
          NavigationBarItem(Icons.access_time_rounded, "Timer"),
          NavigationBarItem(Icons.workspace_premium_outlined, "Present"),
          NavigationBarItem(Icons.person_outline, "Profile"),
        ],
      ),
    );
  }

  BottomNavigationBarItem NavigationBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        size: 30,
      ),
      label: label,
    );
  }
}

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
