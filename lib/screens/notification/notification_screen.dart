import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:task_management/screens/home/progress_card.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({
    super.key,
    required this.goBack,
  });

  final void Function(int) goBack;

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {


  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 255, 255, 255),
        statusBarIconBrightness: Brightness.dark,
      ),
    );

  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(242, 244, 255, 1),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(25),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        widget.goBack(2);
                      },
                      child: const Icon(Iconsax.arrow_left,
                          size: 30, color: Colors.black),
                    ),
                    const Spacer(),
                    Text(
                      "Notification",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(flex: 1),
                    const Icon(Icons.delete_sweep_outlined,
                        size: 30, color: Colors.black),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  ProgressCard(
                      projectName: "Project 1", completedPercent: 30,date: "2 days age",),
                  ProgressCard(
                      projectName: "Project 2", completedPercent: 50,date: "2 days age",),
                  ProgressCard(
                      projectName: "Project 3", completedPercent: 70,date: "2 days age",),
                  ProgressCard(
                      projectName: "Project 4", completedPercent: 40,date: "2 days age",),
                  ProgressCard(
                      projectName: "Project 6", completedPercent: 30,date: "2 days age"),
                  ProgressCard(
                      projectName: "Project 7", completedPercent: 50,date: "2 days age",),
                  ProgressCard(
                      projectName: "Project 8", completedPercent: 70,date: "2 days age",),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    ));
  }
}
