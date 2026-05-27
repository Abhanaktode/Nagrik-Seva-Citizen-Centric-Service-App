import 'package:flutter/material.dart';
import 'complaint.dart';


class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  Color getStatusColor(String status) {
    switch (status) {
      case "Resolved":
        return Colors.green;
      case "In Progress":
        return Colors.orange;
      case "Rejected":
        return Colors.red;
      default:
        return Colors.blue; // Pending
    }
  }

  @override
  Widget build(BuildContext context) {

    final complaints = ComplaintPageState.complaints;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Complaint Status"),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      body: complaints.isEmpty
          ? const Center(
        child: Text(
          "No complaints registered yet.",
          style: TextStyle(fontSize: 16),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: complaints.length,
        itemBuilder: (context, index) {

          final complaint = complaints[index];
          final status = complaint["status"] ?? "Pending";

          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// ID + Status Badge
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ID: ${complaint["id"]}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: getStatusColor(status),
                          borderRadius:
                          BorderRadius.circular(20),
                        ),
                        child: Text(
                          status,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Text("Date: ${complaint["date"]}"),
                  Text("Priority: ${complaint["priority"]}"),

                  const Divider(height: 20),

                  const Text(
                    "Address",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(complaint["address"] ?? ""),

                  const SizedBox(height: 8),

                  const Text(
                    "Description",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(complaint["description"] ?? ""),

                  const SizedBox(height: 10),

                  Text(
                    status == "Resolved"
                        ? "Your complaint has been resolved successfully."
                        : status == "In Progress"
                        ? "Work is currently in progress."
                        : "Your complaint is pending and will be processed soon.",
                    style: TextStyle(
                        color: getStatusColor(status)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}