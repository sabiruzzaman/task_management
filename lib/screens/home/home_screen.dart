import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management/screens/home/progress_card.dart';
import 'overview_scroll.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: Color.fromRGBO(242, 244, 255, 1),
          padding: const EdgeInsets.all(0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform.rotate(
                    angle: 180 * 3.1415926535897932 / 180,
                    // Converts degrees to radians (180 degrees)
                    child: SvgPicture.asset(
                      'assets/icons/menu.svg', // Your SVG icon
                      width: 30, // Set the desired size
                      height: 30, // Optional color if needed
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 93, 63, 246),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: const Icon(Icons.person, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Hello, ",
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                        TextSpan(
                          text: "Sabuj!",
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    "Have a nice day!",
                    style: GoogleFonts.montserrat(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(0),
              child: OverView(),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Progress",
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  ProgressCard(projectName: "Project", completedPercent: 30, date: "2 days ago"),
                  ProgressCard(projectName: "Project", completedPercent: 30, date: "2 days ago"),
                  ProgressCard(projectName: "Project", completedPercent: 30,date: "2 days ago"),
                  ProgressCard(projectName: "Project", completedPercent: 30,date: "2 days ago"),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
