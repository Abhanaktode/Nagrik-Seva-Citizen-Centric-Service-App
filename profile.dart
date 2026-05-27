import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final Map<String, String> user;

  const ProfilePage({super.key, required this.user});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  late TextEditingController nameController;
  late TextEditingController ageController;

  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user["name"]);
    ageController = TextEditingController(text: widget.user["age"]);
  }

  void saveProfile() {
    setState(() {
      widget.user["name"] = nameController.text;
      widget.user["age"] = ageController.text;
      isEditing = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Profile Updated Successfully"),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            /// Header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green.shade700,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 50, color: Colors.green),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.user["name"] ?? "",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Citizen ID: ${widget.user["phone"] ?? ""}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// Details Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [

                    isEditing
                        ? TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: "Full Name",
                        prefixIcon: Icon(Icons.person),
                      ),
                    )
                        : ListTile(
                      leading: const Icon(Icons.person, color: Colors.green),
                      title: const Text("Full Name"),
                      subtitle: Text(widget.user["name"] ?? ""),
                    ),

                    const Divider(),

                    isEditing
                        ? TextField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Age",
                        prefixIcon: Icon(Icons.cake),
                      ),
                    )
                        : ListTile(
                      leading: const Icon(Icons.cake, color: Colors.green),
                      title: const Text("Age"),
                      subtitle: Text(widget.user["age"] ?? ""),
                    ),

                    const Divider(),

                    ListTile(
                      leading: const Icon(Icons.phone, color: Colors.green),
                      title: const Text("Phone Number"),
                      subtitle: Text(widget.user["phone"] ?? ""),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Button
            ElevatedButton.icon(
              onPressed: () {
                if (isEditing) {
                  saveProfile();
                } else {
                  setState(() => isEditing = true);
                }
              },
              icon: Icon(isEditing ? Icons.save : Icons.edit),
              label: Text(isEditing ? "Save Profile" : "Edit Profile"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.teal.shade500,
                foregroundColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}