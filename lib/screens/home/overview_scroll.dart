import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:task_management/screens/home/overview_card.dart';

class OverView extends StatefulWidget {
  const OverView({super.key});

  @override
  State<OverView> createState() => _OverViewState();
}

class _OverViewState extends State<OverView> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color.fromRGBO(242, 244, 255, 1),
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            controller: tabController,
            labelColor: Colors.black,
            isScrollable: true,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: Colors.white),
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            unselectedLabelColor: Colors.grey.shade400,
            tabAlignment: TabAlignment.start,
            tabs: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Tab(
                  child: Text(
                    "My Tasks",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Tab(
                  child: Text(
                    "Pending",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Tab(
                  child: Text(
                    "Completed",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 250,
            width: double.maxFinite,
            child: TabBarView(
              controller: tabController,
              children: [
                ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return  Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: OverviewCard(
                          title: "Project",
                          description: "Description",
                          date: "Date",
                          cardColor: const Color.fromARGB(255, 97, 63, 248),
                          shadowColor: const Color.fromARGB(255, 105, 75, 251),
                          iconBackGroundColor: const Color.fromARGB(255, 68, 43, 190),
                            icon: const Icon(Iconsax.tick_circle,
                                color: Colors.white)
                        ),
                      );
                    }),
                ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return  Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: OverviewCard(
                          title: "Project",
                          description: "Description",
                          date: "Date",
                          cardColor: const Color.fromARGB(255, 147, 131, 252),
                          shadowColor: const Color.fromARGB(255, 162, 149, 255),
                          iconBackGroundColor: const Color.fromARGB(255, 110, 98, 198),
                            icon: const Icon(Icons.incomplete_circle,
                                color: Colors.white)
                        ),
                      );
                    }),
                ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return  Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: OverviewCard(
                          title: "Project",
                          description: "Description",
                          date: "Date",
                          cardColor: const Color.fromARGB(255, 58, 184, 184),
                          shadowColor: const Color.fromARGB(255, 94, 197, 197),
                          iconBackGroundColor: const Color.fromARGB(255, 21, 117, 117),
                          icon: const Icon(Icons.task_alt,
                              color: Colors.white),
                        ),
                      );
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
