import 'package:flutter/material.dart';
import 'loginSign_up.dart';
import 'profile.dart';
import 'about.dart';
import 'faqs.dart';
import 'complaint.dart';
import 'status.dart';

class HomePage extends StatelessWidget {
  final Map<String, String> user;

  const HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nagrik Seva"),
        backgroundColor: Colors.green.shade700,
      ),

      drawer: Drawer(
        child: Column(
          children: [

            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green.shade700,
              ),
              accountName: Text(user["name"] ?? ""),
              accountEmail: Text("Phone: ${user["phone"]}"),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40, color: Colors.blue),
              ),
            ),

            Expanded(
              child: ListView(
                children: [

                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text("Profile"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(user: user),
                        ),
                      );
                    },
                  ),

                  ListTile(
                    leading: const Icon(Icons.track_changes),
                    title: const Text("Complaint Status"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StatusPage(),
                        ),
                      );
                    },
                  ),

                  ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text("About Us"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutPage(),
                        ),
                      );
                    },
                  ),

                  ListTile(
                    leading: const Icon(Icons.question_answer),
                    title: const Text("FAQs"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FAQPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginRegisterPage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Citizen Centric Services",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                children: [

                  serviceTile(context, "Water", Icons.water_drop, Colors.lightBlue.shade300),
                  serviceTile(context, "Electricity", Icons.electric_bolt, Colors.orange.shade400),
                  serviceTile(context, "Garbage", Icons.delete, Colors.green.shade500),
                  serviceTile(context, "Public Health", Icons.health_and_safety, Colors.red.shade400),

                  const SizedBox(height: 25),

                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Row(
                            children: [
                              Icon(
                                Icons.campaign,
                                color: Colors.red,
                                size: 30,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Announcement",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 10),

                          Text(
                            "Nagrik Seva is a citizen-focused digital platform created to address "
                                "essential public concerns such as electricity outages, water supply "
                                "disruptions, garbage collection issues, and public health emergencies. "
                                "\n\n"
                                "If you experience a power cut in your area, please remain calm and report "
                                "the issue through the app so the concerned department can respond quickly. "
                                "Keep emergency lighting arrangements ready during unexpected outages."
                                "\n\n"
                                "Residents are advised to store sufficient water during scheduled supply "
                                "hours and use it responsibly. In case of leakage, low pressure, or irregular "
                                "supply, kindly raise a complaint immediately for faster resolution."
                                "\n\n"
                                "Proper waste segregation into wet and dry garbage helps maintain cleanliness "
                                "and prevents health risks. Please follow the garbage collection schedule and "
                                "support sanitation workers by placing bins outside at designated times only."
                                "\n\n"
                                "Public health and hygiene are everyone’s responsibility. Report sanitation "
                                "concerns, stagnant water, or emergency health risks promptly through the app. "
                                "Together, we can build a cleaner, safer, and more responsive community.",
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
Widget serviceTile(
    BuildContext context,
    String title,
    IconData icon,
    Color bgColor,
    ) {
  return StatefulBuilder(
    builder: (context, setState) {
      bool isPressed = false;

      return GestureDetector(
        onTapDown: (_) => setState(() => isPressed = true),
        onTapUp: (_) => setState(() => isPressed = false),
        onTapCancel: () => setState(() => isPressed = false),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ComplaintPage(),
            ),
          );
        },
        child: AnimatedScale(
          scale: isPressed ? 0.95 : 1.0,
          duration: const Duration(milliseconds: 120),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 85,
            margin: const EdgeInsets.only(bottom: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [
                  bgColor.withOpacity(0.9),
                  bgColor.withOpacity(0.6),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: bgColor.withOpacity(0.4),
                  blurRadius: isPressed ? 5 : 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                splashColor: Colors.white.withOpacity(0.3),
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ComplaintPage(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      AnimatedRotation(
                        turns: isPressed ? 0.1 : 0,
                        duration: const Duration(milliseconds: 200),
                        child: Icon(
                          icon,
                          size: 36,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 18),
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}