import 'package:calendar/pages/add_event_page.dart';
import 'package:calendar/pages/delete_ads_page.dart';
import 'package:calendar/pages/image_adder_page.dart';
import 'package:calendar/pages/search_users.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/home_page.dart'; // Import the HomePage
import '../pages/admin_home_page.dart'; // Import the AdminHomePage

class DashboardTab extends StatefulWidget {
  const DashboardTab({super.key});

  @override
  State<DashboardTab> createState() => _DashboardTabState();
}

class _DashboardTabState extends State<DashboardTab> {
  bool isHomePage = false; // State variable to track the current page

  void toggleSwitch() {
    setState(() {
      isHomePage = !isHomePage; // Toggle the state variable
      navigateToPage(); // Call the method to navigate
    });
  }

  void navigateToPage() {
    if (isHomePage) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AdminHomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 233, 176, 64),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 10,
                  blurRadius: 20,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            left: 20,
            child: Text(
              'Dashboard',
              style: GoogleFonts.acme(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 20, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        const AdminAddEvent(),
                                transitionDuration:
                                    Duration.zero, // No transition duration
                                reverseTransitionDuration: Duration
                                    .zero, // No reverse transition duration
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 30,
                          ),
                          color: Colors.black,
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Add',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        const SearchUsersPage(),
                                transitionDuration:
                                    Duration.zero, // No transition duration
                                reverseTransitionDuration: Duration
                                    .zero, // No reverse transition duration
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.search,
                            size: 30,
                          ),
                          color: Colors.black,
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Search',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed:
                              toggleSwitch, // Call the toggleSwitch method
                          icon: const Icon(
                            Icons.swap_horizontal_circle,
                            size: 30,
                          ),
                          color: Colors.black,
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Switch',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        const AddImage(),
                                transitionDuration:
                                    Duration.zero, // No transition duration
                                reverseTransitionDuration: Duration
                                    .zero, // No reverse transition duration
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.insert_drive_file,
                            size: 30,
                          ),
                          color: Colors.black,
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Insert ADs',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        DeleteAds(),
                                transitionDuration:
                                    Duration.zero, // No transition duration
                                reverseTransitionDuration: Duration
                                    .zero, // No reverse transition duration
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.delete,
                            size: 30,
                          ),
                          color: Colors.black,
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Delete ADs',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Current Page: ${isHomePage ? "Home" : "Agent"}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
