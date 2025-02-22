import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:task_management/utils/utils.dart';

class ProgressCard extends StatelessWidget {
  ProgressCard({
    super.key,
    required this.projectName,
    required this.completedPercent,
    required this.date,
  });
  late String projectName;
  late int completedPercent;
  late String date;
  
  Utils utils = Utils();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 3.0,
            margin: const EdgeInsets.only(top: 10),
            height: 49 * 0.01 * completedPercent,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 93, 63, 246),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Expanded(
            child: Container(
              height: 70,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 93, 63, 246),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: const Icon(Icons.sync_outlined, color: Colors.white),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      projectName,
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    Text(
                      "2 days ago",
                      style: GoogleFonts.montserrat(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                    /*Text(
                      utils.calculateAndReturnDateDifferences(DateTime.parse(date)),
                      style: GoogleFonts.montserrat(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    )*/
                  ],
                ),
                Expanded(child: Container()),
                const Icon(
                  Icons.more_vert_outlined,
                  color: Colors.grey,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
