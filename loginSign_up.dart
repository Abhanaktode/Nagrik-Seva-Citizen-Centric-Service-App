import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({super.key});

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {

  bool isLogin = true;
  bool rememberMe = false;

  bool hidePassword = true;
  bool hideConfirmPassword = true;

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  static List<Map<String, String>> users = [];
  Future<void> saveUsers() async {
    final prefs = await SharedPreferences.getInstance();
    String usersJson = jsonEncode(users);
    await prefs.setString("users", usersJson);
  }

  Future<void> loadUsers() async {
    final prefs = await SharedPreferences.getInstance();
    String? usersJson = prefs.getString("users");

    if (usersJson != null) {
      List decoded = jsonDecode(usersJson);
      users = decoded.map((e) => Map<String, String>.from(e)).toList();
    }
  }
  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  void submit() {

    if (isLogin) {

      for (var user in users) {
        if (user["phone"] == phoneController.text &&
            user["password"] == passwordController.text) {

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(user: user),
            ),
          );
          return;
        }
      }

      showMessage("Invalid Login Credentials", isError: true);

    } else {

      if (nameController.text.isEmpty ||
          ageController.text.isEmpty ||
          phoneController.text.isEmpty ||
          passwordController.text.isEmpty ||
          confirmPasswordController.text.isEmpty) {
        showMessage("Please fill all fields", isError: true);
        return;
      }

      if (passwordController.text != confirmPasswordController.text) {
        showMessage("Passwords do not match", isError: true);
        return;
      }

      Map<String, String> newUser = {
        "name": nameController.text,
        "age": ageController.text,
        "phone": phoneController.text,
        "password": passwordController.text,
      };

      users.add(newUser);
      saveUsers();

      // 🔥 DIRECT HOME PAGE AFTER SIGNUP
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(user: newUser),
        ),
      );
    }
  }

  void showMessage(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );
  }

  InputDecoration inputStyle(String label, IconData icon,
      {Widget? suffixIcon}) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: Colors.grey.shade100,

      // Normal border
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.grey,
          width: 1,
        ),
      ),

      // Focus border (jab click kare)
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Colors.green.shade700,
          width: 2,
        ),
      ),

      // Default border
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.green.shade700,

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Text(
                    isLogin ? "Welcome Back" : "Create Account",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 25),

                  if (!isLogin) ...[
                    TextField(
                      controller: nameController,
                      decoration:
                      inputStyle("Full Name", Icons.person),
                    ),
                    const SizedBox(height: 15),

                    TextField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      decoration:
                      inputStyle("Age", Icons.calendar_today),
                    ),
                    const SizedBox(height: 15),
                  ],

                  TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration:
                    inputStyle("Phone Number", Icons.phone),
                  ),
                  const SizedBox(height: 15),

                  /// PASSWORD FIELD
                  TextField(
                    controller: passwordController,
                    obscureText: hidePassword,
                    decoration: inputStyle(
                      "Password",
                      Icons.lock,
                      suffixIcon: IconButton(
                        icon: Icon(
                          hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  /// CONFIRM PASSWORD (Signup Only)
                  if (!isLogin)
                    Column(
                      children: [
                        TextField(
                          controller: confirmPasswordController,
                          obscureText: hideConfirmPassword,
                          decoration: inputStyle(
                            "Confirm Password",
                            Icons.lock_outline,
                            suffixIcon: IconButton(
                              icon: Icon(
                                hideConfirmPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  hideConfirmPassword =
                                  !hideConfirmPassword;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),

                  if (isLogin)
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (value) {
                            setState(() {
                              rememberMe = value!;
                            });
                          },
                        ),
                        const Text("Remember Me"),
                      ],
                    ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade700,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        isLogin ? "Login" : "Register",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextButton(
                    onPressed: () {
                      setState(() {
                        isLogin = !isLogin;
                      });
                    },
                    child: Text(
                      isLogin
                          ? "Don't have an account? Sign Up"
                          : "Already have an account? Login",
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