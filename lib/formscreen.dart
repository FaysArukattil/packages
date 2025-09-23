import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:packages/displayscreen.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  DateTime? _dob;
  String? gender;
  String? selectedCountry;

  bool english = false;
  bool hindi = false;
  bool malayalam = false;

  Future<void> pickDate() async {
    _dob = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1998),
      lastDate: DateTime(2100),
    );
    if (_dob != null) {
      String formatted = DateFormat('dd/MM/yyyy').format(_dob!);
      setState(() {
        dobController.text = formatted;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form Screen")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Name",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Your Name";
                    }
                    if (value.length < 3) {
                      return "Name must be at least 3 characters";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Your Email";
                    }
                    if (!value.contains('@')) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Phone Number",
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Your Phone No";
                    }
                    if (value.length < 10) {
                      return "Enter a valid number";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                DropdownButtonFormField(
                  value: selectedCountry,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Select Country",
                  ),
                  items: [
                    DropdownMenuItem(value: "India", child: Text("India")),
                    DropdownMenuItem(
                      value: "Australia",
                      child: Text("Australia"),
                    ),
                    DropdownMenuItem(value: "USA", child: Text("USA")),
                    DropdownMenuItem(value: "Canada", child: Text("Canada")),
                    DropdownMenuItem(value: "UK", child: Text("UK")),
                    DropdownMenuItem(value: "Russia", child: Text("Russia")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedCountry = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please select a country";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                Row(
                  children: [
                    Radio(
                      value: "Male",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });
                      },
                    ),
                    Text("Male"),
                    Radio(
                      value: "Female",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });
                      },
                    ),
                    Text("Female"),
                  ],
                ),
                SizedBox(height: 20),

                TextFormField(
                  controller: dobController,
                  readOnly: true,
                  onTap: pickDate,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Date of Birth",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Select Date of Birth";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                Row(
                  children: [
                    Checkbox(
                      value: english,
                      onChanged: (value) {
                        setState(() {
                          english = value!;
                        });
                      },
                    ),
                    Text("English"),
                    SizedBox(width: 5),
                    Checkbox(
                      value: hindi,
                      onChanged: (value) {
                        setState(() {
                          hindi = value!;
                        });
                      },
                    ),
                    Text("Hindi"),
                    SizedBox(width: 5),
                    Checkbox(
                      value: malayalam,
                      onChanged: (value) {
                        setState(() {
                          malayalam = value!;
                        });
                      },
                    ),
                    Text("Malayalam"),
                  ],
                ),

                SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (!(formKey.currentState?.validate() ?? false)) return;

                      if (gender == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please select gender")),
                        );
                        return;
                      }

                      if (!english && !malayalam && !hindi) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Select at least one language"),
                          ),
                        );
                        return;
                      }

                      List<String> languages = [
                        if (english) "English",
                        if (hindi) "Hindi",
                        if (malayalam) "Malayalam",
                      ];

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DisplayScreen(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            dob: dobController.text,
                            country: selectedCountry!,
                            gender: gender!,
                            languages: languages,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    child: Text("Submit"),
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
