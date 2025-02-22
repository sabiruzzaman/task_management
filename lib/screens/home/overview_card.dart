import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class OverviewCard extends StatelessWidget {
  OverviewCard({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.cardColor,
    required this.shadowColor,
    required this.iconBackGroundColor,
    required this. icon,
  });

  late String title;
  late String description;
  late String date;
  late Color cardColor;
  late Color shadowColor;
  late Color iconBackGroundColor;
  late Icon icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 0, right: 10, top: 5, bottom: 5),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    width: 180,
                    height: 240,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: cardColor),
                  ),
                  Positioned(
                    bottom: -50,
                    left: -50,
                    child: Container(
                      padding: EdgeInsets.all(50),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 25,
                            color: shadowColor,
                          )),
                    ),
                  ),
                  Positioned(
                    top: -50,
                    right: -50,
                    child: Container(
                      padding: EdgeInsets.all(50),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 25,
                            color: shadowColor,
                          )),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    width: 180,
                    height: 240,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: iconBackGroundColor,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: icon,
                            ),
                            Text(
                              title,
                              style:
                                  GoogleFonts.montserrat(color: Colors.white),
                            ),
                          ],
                        ),
                        Text(
                         description,
                          style: GoogleFonts.montserrat(
                              color: Colors.white, fontSize: 15),
                        ),
                        Text(
                          '${DateFormat.MMMd().format((DateTime.now()))}',
                          style: GoogleFonts.montserrat(
                              color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
