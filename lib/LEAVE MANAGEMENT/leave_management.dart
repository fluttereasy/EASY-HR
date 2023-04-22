import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hr_easy/OTP%20FOLDER/otp_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Applied Tab View/applied_tab_view.dart';
import '../Approval Tab View/approval_tab_view.dart';
import '../LEAVE APPLY FORM/leave_apply_form.dart';
import '../Past Tab View/past_tab_view.dart';
import '../test_screen.dart';

class LeaveManagementScreen extends StatefulWidget {
  const LeaveManagementScreen({Key? key}) : super(key: key);

  @override
  State<LeaveManagementScreen> createState() => _LeaveManagementScreenState();
}

class _LeaveManagementScreenState extends State<LeaveManagementScreen> {
  void logOut() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.clear();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(5),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => LeaveApplyForm()));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, shape: const CircleBorder()),
            child: Icon(
              Icons.add,
              color: Colors.purple.withOpacity(0.6),
              size: 50,
            ),
          ),
        ),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Do you want to logout ?"),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                  const OtpScreen()));
                                      logOut();
                                    },
                                    child: const Text(
                                      "Yes",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "No",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            )
                          ],
                        );
                      });
                },
                icon: Icon(Icons.login_rounded))
          ],
          elevation: 0,
        ),
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 280,
              decoration: const BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(100),
                      bottomLeft: Radius.circular(100))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => TestScreen()));
                            },
                            child: Container(
                              margin: const EdgeInsets.all(20),
                              height: 60,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black,
                                                blurRadius: 5.0)
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      child: const Center(
                                          child: Text(
                                        'CL',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ))),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  const Text(
                                    '5 Days',
                                    style: TextStyle(
                                        color: Color(0xffffcc33),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  Container(
                    width: 250,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 2.0,
                          spreadRadius: 0.0,
                          offset: Offset(2.0, 2.0),
                        )
                      ],
                    ),
                    child: TabBar(
                        unselectedLabelColor: Colors.grey,
                        labelColor: Colors.black,
                        tabs: [
                          Tab(
                            child: Container(
                              height: 30,
                              child: const Center(
                                  child: Text(
                                'Applied',
                                style: TextStyle(fontSize: 11),
                              )),
                            ),
                          ),
                          Tab(
                            child: Container(
                              height: 30,
                              child: const Center(
                                  child: Text('Past',
                                      style: TextStyle(fontSize: 11))),
                            ),
                          ),
                          Tab(
                            child: Container(
                              height: 30,
                              child: const Center(
                                  child: Text('Approved',
                                      style: TextStyle(fontSize: 11))),
                            ),
                          ),
                        ]),
                  )
                ],
              ),
            ),
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset("images/drops.png",
                      fit: BoxFit.fill, color: Colors.purple.withOpacity(0.6)),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 10, right: 10, bottom: 5, top: 5),
                    child: const TabBarView(children: [
                      AppliedTabView(),
                      PastTabView(),
                      ApprovalTabView()
                    ]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//Expanded(
//               child: TabBarView(
//                   children: [
//                     Container(
//                 height: 300,
//                 color: Colors.orange,
//               ),
//                     Container(
//                       height: 300,
//                       color: Colors.blueGrey,
//                     ),
//                     Container(
//                       height: 300,
//                       color: Colors.teal,
//                     )
//                   ]
//               ),
//             )

//elevated button with add sign

//Container(
//           margin: const EdgeInsets.all(5.0),
//           height: 60,
//           width: 60,
//           decoration: const BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.white,
//             boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2.0)],
//           ),
//           child: Icon(
//             Icons.add,
//             color: Colors.purple.shade200,
//             size: 50,
//           ),
//         ),
