import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:task_management/db/task_database.dart';
import 'package:task_management/models/task.dart';
import 'package:task_management/screens/task/category_card.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({Key? key, this.task}) : super(key: key);
  final Task? task;

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  late TextEditingController _titleController;
  late TextEditingController _dateController;
  late TextEditingController _startTimeController;
  late TextEditingController _endTimeController;
  late TextEditingController _descriptionController;
  DateTime selectedDate = DateTime.now();
  String category = "Development";
  final TaskDatabase _taskDatabase = TaskDatabase();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _dateController = TextEditingController(
        text: DateFormat('EEE, MMM d, ' 'yy').format(selectedDate));
    _startTimeController =
        TextEditingController(text: DateFormat.jm().format(DateTime.now()));
    _endTimeController = TextEditingController(
        text: DateFormat.jm().format(DateTime.now().add(Duration(hours: 1))));
    _descriptionController = TextEditingController();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 93, 63, 246),
        // Set status bar color to white
        statusBarIconBrightness: Brightness
            .light, // Dark icons for better visibility on light background
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2005),
      lastDate: DateTime(2030),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
        _dateController.text =
            DateFormat('EEE, MMM d, ' 'yy').format(selectedDate);
      });
    }
  }

  _selectTime(BuildContext context, String timeType) async {
    final TimeOfDay? result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        if (timeType == "StartTime") {
          _startTimeController.text = result.format(context);
        } else {
          _endTimeController.text = result.format(context);
        }
      });
    }
  }

  void _setCategory(String selectedCategory) {
    setState(() {
      category = selectedCategory;
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 255, 255, 255),
        // Set status bar color to white
        statusBarIconBrightness: Brightness
            .dark, // Dark icons for better visibility on light background
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    bool readOnly = false,
    Function()? onTap,
    IconData? icon,
    Color textColor = Colors.white,
    bool isMultiline = false, // New parameter to handle multiline input
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        cursorColor: textColor,
        style: GoogleFonts.montserrat(color: textColor, fontSize: 15),
        keyboardType:
            isMultiline ? TextInputType.multiline : TextInputType.text,
        maxLines: isMultiline ? null : 1,
        // Allows multiline input when true
        decoration: InputDecoration(
          labelText: labelText,
          suffixIcon: icon != null ? Icon(icon, color: textColor) : null,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: textColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: textColor),
          ),
          labelStyle: GoogleFonts.montserrat(color: textColor, fontSize: 15),
        ),
      ),
    );
  }

  Future<void> _saveTask() async {
    final title = _titleController.text;
    final date = selectedDate.toString();
    final startTime = _startTimeController.text;
    final endTime = _endTimeController.text;
    final description = _descriptionController.text;
    const isDone = 0;

    widget.task == null
        ? await _taskDatabase.insertTask(Task(
            title: title,
            date: date,
            startTime: startTime,
            endTime: endTime,
            description: description,
            category: category,
            isDone: isDone,
          ))
        : null;

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Task created successfully")));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 93, 63, 246),
      // Light background color
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            Stack(
              children: [
                Positioned(
                  bottom: -85,
                  right: -70,
                  child: Container(
                    padding: EdgeInsets.all(90),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 40,
                          color: Color.fromARGB(255, 105, 75, 251),
                        )),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Iconsax.arrow_left,
                                size: 30, color: Colors.white),
                          ),
                          const Spacer(),
                          Text(
                            "Create New Task",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(flex: 1),
                          SvgPicture.asset(
                            'assets/icons/search.svg',
                            height: 30,
                            width: 30,
                            color: Colors.white,
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: TextFormField(
                          controller: _titleController,
                          cursorColor: Colors.white,
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          decoration: InputDecoration(
                            labelText: "Title",
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            fillColor: Colors.white,
                            labelStyle: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: TextFormField(
                          controller: _dateController,
                          cursorColor: Colors.white,
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: "Date",
                            suffixIcon: GestureDetector(
                              onTap: () {
                                _selectDate(context);
                              },
                              child: const Icon(
                                Iconsax.calendar_add,
                                color: Colors.white,
                              ),
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            fillColor: Colors.white,
                            labelStyle: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Form Section (White Container)
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Time Pickers
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Start Time
                            Expanded(
                              child: buildTextField(
                                controller: _startTimeController,
                                labelText: "Start Time",
                                readOnly: true,
                                onTap: () => _selectTime(context, "StartTime"),
                                icon: Iconsax.timer_start,
                                textColor: Colors.black26,
                              ),
                            ),
                            const SizedBox(width: 20),
                            // End Time
                            Expanded(
                              child: buildTextField(
                                controller: _endTimeController,
                                labelText: "End Time",
                                readOnly: true,
                                onTap: () => _selectTime(context, "EndTime"),
                                icon: Iconsax.timer_pause,
                                textColor: Colors.black26,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Description
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: buildTextField(
                          controller: _descriptionController,
                          labelText: "Description",
                          textColor: Colors.black,
                          isMultiline: true, // Allows multiline input
                        ),
                      ),

                      // Category Selection
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Category",
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        children: [
                          for (var cat in [
                            'Marketing',
                            'Meeting',
                            'Study',
                            'Sports',
                            'Development',
                            'Family',
                            'Urgent',
                            'Production'
                          ])
                            GestureDetector(
                              onTap: () => _setCategory(cat),
                              child: CategoryCard(
                                categoryText: cat,
                                isActive: category == cat,
                              ),
                            ),
                        ],
                      ),

                      // Create Task Button
                      const SizedBox(height: 80),
                      Center(
                        child: GestureDetector(
                          onTap: () {

                            if (_titleController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Title cannot be empty"),
                                ),
                              );
                              return;
                            }

                            if (_descriptionController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Description cannot be empty"),
                                ),
                              );
                              return;
                            }
                            _saveTask();
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 93, 63, 246),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              "Create Task",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
