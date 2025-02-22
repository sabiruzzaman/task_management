import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:task_management/db/task_database.dart';
import 'package:task_management/models/task.dart';
import 'package:task_management/screens/home/progress_card.dart';
import 'package:task_management/screens/task/add_new_task.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({
    super.key,
    required this.goBack,
  });

  final void Function(int) goBack;

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {

  final TaskDatabase _taskDatabase = TaskDatabase();

  Future<List<Task>> _tasks() async {
    return await _taskDatabase.getTasks();
  }

  DateTime _selectedDate = DateTime.now();

  void _onDateChange(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

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
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          widget.goBack(1);
                        },
                        child: const Icon(
                          Iconsax.arrow_left,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/search.svg',
                        height: 30,
                        width: 30,
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat('MMM, d').format(_selectedDate),
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddNewTask(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 95, 69, 252),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Iconsax.add,
                                color: Colors.white,
                                size: 20,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "Add task",
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    height: 90,
                    child: DatePicker(
                      DateTime.now(),
                      initialSelectedDate: _selectedDate,
                      selectionColor: const Color.fromARGB(255, 95, 69, 252),
                      onDateChange: _onDateChange,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Task",
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ListView(
                  children: [

                    ProgressCard(projectName: "Project 1", completedPercent: 30, date: "2 days ago"),
                    ProgressCard(projectName: "Project 2", completedPercent: 30, date: "2 days ago"),
                    ProgressCard(projectName: "Project 3", completedPercent: 30,date: "5 days ago"),
                    ProgressCard(projectName: "Project 4", completedPercent: 30,date: "2 days ago"),
                    ProgressCard(projectName: "Project 5", completedPercent: 30, date: "3 days ago"),
                    ProgressCard(projectName: "Project 6", completedPercent: 30,date: "2 days ago"),
                    ProgressCard(projectName: "Project 7", completedPercent: 30,date: "2 days ago"),
                 /*   FutureBuilder<List<Task>>(
                      future: _tasks(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: snapshot.data!.map((task) {
                              return ProgressCard(
                                projectName: task.title,
                                completedPercent: task.isDone,
                                date: task.date
                              );
                            }).toList(),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
*/
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
