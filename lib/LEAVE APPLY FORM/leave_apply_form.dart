import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class LeaveApplyForm extends StatefulWidget {
  const LeaveApplyForm({Key? key}) : super(key: key);

  @override
  State<LeaveApplyForm> createState() => _LeaveApplyFormState();
}

class _LeaveApplyFormState extends State<LeaveApplyForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _fromdateController = TextEditingController();
  final TextEditingController _todateController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _leaveTypeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _employeeCodeController = TextEditingController();

  // form validation key
  final _applyFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 110, 20, 30),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 2,
                    offset: Offset(2, 5),
                  )
                ]),
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _applyFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Apply for Leave",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                          color: Colors.teal),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This field is mandatory";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Your Name',
                          // Set border for enabled state (default)
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: Colors.black26),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          // Set border for focused state
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: Colors.black26),
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
                        // selecting the time with datePicker
                        Container(
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              border:
                                  Border.all(color: Colors.black26, width: 2)),
                          child: Center(
                              child: TextButton(
                            onPressed: () {
                              DatePicker.showDatePicker(context,
                                  minTime: DateTime.now(),
                                  currentTime: DateTime.now(),
                                  onChanged: (date) {
                                setState(() {
                                  _fromdateController.text = date.toString();
                                });
                              });
                            },
                            child: Text(
                              _fromdateController.text,
                              style: const TextStyle(fontSize: 10),
                            ),
                          )),
                        ),
                        const Text(
                          "To",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.teal,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              border:
                                  Border.all(color: Colors.black26, width: 2)),
                          child: Center(
                              child: TextButton(
                            onPressed: () {
                              DatePicker.showDatePicker(context,
                                  minTime: DateTime.now(),
                                  currentTime: DateTime.now(),
                                  onChanged: (date) {
                                setState(() {
                                  _todateController.text = date.toString();
                                });
                              });
                            },
                            child: Text(
                              _todateController.text,
                              style: const TextStyle(fontSize: 10),
                            ),
                          )),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _durationController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This field is mandatory";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'No of Days',
                          // Set border for enabled state (default)
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: Colors.black26),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          // Set border for focused state
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: Colors.black26),
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _leaveTypeController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This field is mandatory";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Leave Type',
                          // Set border for enabled state (default)
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: Colors.black26),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          // Set border for focused state
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: Colors.black26),
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _addressController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This field is mandatory";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Address',
                          // Set border for enabled state (default)
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: Colors.black26),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          // Set border for focused state
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: Colors.black26),
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _contactController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This field is mandatory";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Contact No.',
                          // Set border for enabled state (default)
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: Colors.black26),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          // Set border for focused state
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: Colors.black26),
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          border: Border.all(color: Colors.black26, width: 2)),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: "    Reason",
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                        height: 35,
                        width: 100,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepOrange),
                            onPressed: () {
                              if (_applyFormKey.currentState!.validate()) {
                                print("Submitted");
                              } else {
                                print("Please fill all field");
                              }
                            },
                            child: const Text('Submit')))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
