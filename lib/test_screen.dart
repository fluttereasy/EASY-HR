import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _leaveTypeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _employeeCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    "Apply for Leave",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                        color: Colors.teal),
                  ),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        labelText: 'Your Name',
                        // Set border for enabled state (default)
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.black26),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        // Set border for focused state
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.black26),
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "From",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.teal,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.black26, width: 2)),
                      ),
                      Text(
                        "To",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.teal,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.black26, width: 2)),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _durationController,
                    decoration: InputDecoration(
                        labelText: 'No of Days',
                        // Set border for enabled state (default)
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.black26),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        // Set border for focused state
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.black26),
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _leaveTypeController,
                    decoration: InputDecoration(
                        labelText: 'Leave Type',
                        // Set border for enabled state (default)
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.black26),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        // Set border for focused state
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.black26),
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _addressController,
                    decoration: InputDecoration(
                        labelText: 'Address',
                        // Set border for enabled state (default)
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.black26),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        // Set border for focused state
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.black26),
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _contactController,
                    decoration: InputDecoration(
                        labelText: 'Contact No.',
                        // Set border for enabled state (default)
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.black26),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        // Set border for focused state
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.black26),
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          border: Border.all(color: Colors.black26, width: 2)),
                      child: TextField(
                        decoration: InputDecoration(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
