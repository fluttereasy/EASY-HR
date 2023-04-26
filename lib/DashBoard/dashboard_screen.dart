import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_easy/BLoC%20and%20Model/USER%20PROFILE/user_bloc.dart';
import 'package:hr_easy/REPOSITORIES/EMP%20LEAVE%20BALANCE/employee_leave_balance.dart';
import '../CAMERA VIEW/camera_login_button.dart';
import '../LEAVE MANAGEMENT/leave_management.dart';

class DashBoardScreen extends StatefulWidget {
  final phonNumber;

  const DashBoardScreen({Key? key, this.phonNumber}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  String? empCode;
  String? fyID;
  String? empID;
  EmployeeLeaveServices _employeeLeaveServices = EmployeeLeaveServices();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            UserBloc()..add(UserProfileFetchEvent(phoneNumber: "7982208767")),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserProfileLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.teal),
                  );
                }
                if (state is UserProfileLoadedState) {
                  final profileData = state.userProfileData;
                  empCode = profileData[0]["EmpCode"];
                  fyID = profileData[0]["FyId"];
                  empID = profileData[0]["EmpId"];
                  return profileData != null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: const Text(
                                    'Hello, ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 24,
                                        letterSpacing: 2),
                                  ),
                                ),
                                const Text(
                                  'Admin, ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 24,
                                      letterSpacing: 2),
                                )
                              ],
                            ),
                            const SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                const LoginCameraButton()));
                                  },
                                  //onTap:_isDetecting ? null : _trackFace,
                                  child: Container(
                                    height: 140,
                                    width: 165,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                            color: Colors.green.shade100,
                                            width: 3.0)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(height: 8),
                                        Image.asset(
                                          'images/immigration.png',
                                          height: 90,
                                          width: 140,
                                        ),
                                        const SizedBox(height: 5),
                                        const Text(
                                          'Attendance',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                LeaveManagementScreen(
                                                  empCode: empCode.toString(),
                                                  fyID: fyID,
                                                )));
                                  },
                                  child: Container(
                                    height: 140,
                                    width: 165,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                            color: Colors.green.shade100,
                                            width: 3.0)),
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 8),
                                        Image.asset(
                                          'images/exit.png',
                                          height: 90,
                                          width: 140,
                                        ),
                                        const SizedBox(height: 5),
                                        const Text(
                                          'Leave Management',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : Text("Problem logging in");
                }
                return Text("Problem Logging in ");
              },
            ),
          ),
        ));
  }
}
