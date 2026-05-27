import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [
                    Icon(Icons.public, color: Colors.green, size: 26),
                    SizedBox(width: 10),
                    Text(
                      "Nagrik Seva",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 15),

                Text(
                  "Nagrik Seva is a citizen-centric digital platform designed "
                      "to simplify communication between residents and local authorities. "
                      "Our mission is to provide a fast, transparent, and reliable system "
                      "for addressing essential public service concerns.",
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.6,
                  ),
                ),

                SizedBox(height: 20),


                Text(
                  "Our Services",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10),

                Row(
                  children: [
                    Icon(Icons.water_drop, color: Colors.blue),
                    SizedBox(width: 8),
                    Text("Water Supply Complaints"),
                  ],
                ),

                SizedBox(height: 8),

                Row(
                  children: [
                    Icon(Icons.electric_bolt, color: Colors.orange),
                    SizedBox(width: 8),
                    Text("Electricity Issues"),
                  ],
                ),

                SizedBox(height: 8),

                Row(
                  children: [
                    Icon(Icons.delete, color: Colors.green),
                    SizedBox(width: 8),
                    Text("Garbage & Waste Management"),
                  ],
                ),

                SizedBox(height: 8),

                Row(
                  children: [
                    Icon(Icons.health_and_safety, color: Colors.red),
                    SizedBox(width: 8),
                    Text("Public Health Concerns"),
                  ],
                ),

                SizedBox(height: 20),


                Text(
                  "Our Vision",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  "We aim to build a smarter and cleaner community by "
                      "empowering citizens with digital tools to report and "
                      "track civic issues efficiently. Together, we can create "
                      "a responsive and accountable public service system.",
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.6,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}