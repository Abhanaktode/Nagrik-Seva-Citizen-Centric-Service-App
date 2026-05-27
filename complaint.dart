import 'package:flutter/material.dart';

class ComplaintPage extends StatefulWidget {
  const ComplaintPage({super.key});

  @override
  State<ComplaintPage> createState() => ComplaintPageState();
}

class ComplaintPageState extends State<ComplaintPage> {

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final descriptionController = TextEditingController();

  String? selectedPriority;
  final List<String> priorities = ['Low', 'Medium', 'High'];

  static List<Map<String, String>> complaints = [];

  void submitComplaint() {

    if (!_formKey.currentState!.validate()) return;
    if (selectedPriority == null) {
      showMessage("Please select a priority", isError: true);
      return;
    }

    final complaintId =
        'NSC${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';

    complaints.add({
      "id": complaintId,
      "name": nameController.text,
      "phone": phoneController.text,
      "address": addressController.text,
      "priority": selectedPriority!,
      "description": descriptionController.text,
      "status": "Pending",
      "date": DateTime.now().toString().substring(0, 10),
    });

    showMessage("Complaint Registered! ID: $complaintId");

    nameController.clear();
    phoneController.clear();
    addressController.clear();
    descriptionController.clear();
    setState(() => selectedPriority = null);
  }

  void showMessage(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        backgroundColor: isError ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Register Complaint"),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "Complaint Details",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 16),

                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: "Full Name",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                    value == null || value.trim().isEmpty
                        ? "Name cannot be empty"
                        : null,
                  ),

                  const SizedBox(height: 12),

                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: "Phone Number",
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                    value == null || value.trim().isEmpty
                        ? "Phone cannot be empty"
                        : null,
                  ),

                  const SizedBox(height: 12),

                  TextFormField(
                    controller: addressController,
                    decoration: const InputDecoration(
                      labelText: "Address / Location",
                      prefixIcon: Icon(Icons.location_on),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                    value == null || value.trim().isEmpty
                        ? "Address cannot be empty"
                        : null,
                  ),

                  const SizedBox(height: 12),

                  DropdownButtonFormField<String>(
                    value: selectedPriority,
                    decoration: const InputDecoration(
                      labelText: "Priority",
                      prefixIcon: Icon(Icons.flag),
                      border: OutlineInputBorder(),
                    ),
                    items: priorities
                        .map((p) =>
                        DropdownMenuItem(value: p, child: Text(p)))
                        .toList(),
                    onChanged: (val) =>
                        setState(() => selectedPriority = val),
                  ),

                  const SizedBox(height: 12),

                  TextFormField(
                    controller: descriptionController,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      labelText: "Describe your complaint...",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                    value == null || value.trim().isEmpty
                        ? "Description cannot be empty"
                        : null,
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton.icon(
                    onPressed: submitComplaint,
                    icon: const Icon(Icons.send),
                    label: const Text("Submit Complaint"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.blue.shade500,
                      foregroundColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}