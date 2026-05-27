import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> faqs = [
      {
        "question": "How can I register a complaint?",
        "answer":
        "To register a complaint, go to the Home Page and select the relevant service "
            "(Water, Electricity, Garbage, or Public Health). Fill in the required details "
            "and submit the form. You will receive a Complaint ID after successful submission."
      },
      {
        "question": "How can I check my complaint status?",
        "answer":
        "You can check the status of your complaint from the Status Page. "
            "Each complaint will show its current stage such as Pending, In Progress, or Resolved."
      },
      {
        "question": "What does complaint priority mean?",
        "answer":
        "Priority indicates the urgency of your complaint. "
            "Low is for minor issues, Medium for moderate concerns, "
            "and High for urgent or emergency situations."
      },
      {
        "question": "How long does it take to resolve a complaint?",
        "answer":
        "Resolution time depends on the type and priority of the complaint. "
            "High priority issues are addressed faster. Most complaints are resolved "
            "within 24–72 hours."
      },
      {
        "question": "Can I submit multiple complaints?",
        "answer":
        "Yes, you can submit multiple complaints if needed. "
            "Each complaint will have a unique ID for tracking."
      },
      {
        "question": "Is my personal information safe?",
        "answer":
        "Yes, your personal information is kept confidential and used only "
            "for resolving your complaint efficiently."
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Frequently Asked Questions"),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ExpansionTile(
              tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              iconColor: Colors.green[700],
              collapsedIconColor: Colors.green,
              title: Text(
                faqs[index]["question"]!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              children: [
                Text(
                  faqs[index]["answer"]!,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}