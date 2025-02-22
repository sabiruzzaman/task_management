import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management/screens/home/progress_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 93, 63, 246),
        // Set status bar color to white
        statusBarIconBrightness: Brightness
            .light, // Dark icons for better visibility on light background
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromRGBO(242, 244, 255, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(25),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 93, 63, 246),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/search.svg',
                                height: 24,
                                width: 24,
                                color: Colors.grey.shade400,
                              ),
                              const SizedBox(width: 10.0),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Search',
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 18.0,
                                      color: Colors.grey.shade400,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: -50,
                right: -50,
                child: Container(
                  padding: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 25,
                        color: Colors.white10,
                      )),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  ProgressCard(
                      projectName: "Project 1", completedPercent: 30,date: "2 days ago"),
                  ProgressCard(
                      projectName: "Project 2", completedPercent: 50,date: "2 days ago"),
                  ProgressCard(
                      projectName: "Project 3", completedPercent: 70,date: "2 days ago"),
                  ProgressCard(
                      projectName: "Project 4", completedPercent: 40,date: "2 days ago"),
                  ProgressCard(
                      projectName: "Project 6", completedPercent: 30,date: "2 days ago"),
                  ProgressCard(
                      projectName: "Project 7", completedPercent: 50,date: "2 days ago"),
                  ProgressCard(
                      projectName: "Project 8", completedPercent: 70,date: "2 days ago"),
                  ProgressCard(
                      projectName: "Project 9", completedPercent: 40,date: "2 days ago"),
                  ProgressCard(
                      projectName: "Project 10", completedPercent: 4,date: "2 days ago"),
                  ProgressCard(
                      projectName: "Project 11", completedPercent: 4,date: "2 days ago"),
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
