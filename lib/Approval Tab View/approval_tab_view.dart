import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'approval_detail_screen.dart';

class ApprovalTabView extends StatefulWidget {
  const ApprovalTabView({Key? key}) : super(key: key);

  @override
  State<ApprovalTabView> createState() => _ApprovalTabViewState();
}

class _ApprovalTabViewState extends State<ApprovalTabView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: ListView.builder(
          padding: const EdgeInsets.only(top: 0.0),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const ApprovalDetailScreen()));
              },
              child: Container(
                margin: const EdgeInsets.all(20),
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 9), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.all(0.0),
                      leading: const CircleAvatar(
                        radius: 35,
                        // child: Image.asset("images/exit.png"),
                      ),
                      title: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Name : ',
                                style: TextStyle(color: Color(0xff336699)),
                              ),
                              const Text(
                                "Pooja",
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: const [
                              Text(
                                'From :',
                                style: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '18-04-23   ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'To :',
                                style: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text('18-04-23',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                        ],
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Reason : ',
                                    style: TextStyle(
                                      color: Colors.purple.withOpacity(0.6),
                                      fontSize: 14,
                                    ),
                                  ),
                                  const Text(
                                    'Something.......',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              )),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  height: 20,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                          width: 2,
                                          color: Colors.purpleAccent)),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0))),
                                      onPressed: () {},
                                      child: const Text(
                                        'Rejected',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 8,
                                            fontWeight: FontWeight.bold),
                                      ))),
                              const SizedBox(width: 10),
                              Container(
                                  height: 20,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.purple,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.purple,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0))),
                                      onPressed: () {},
                                      child: const Text(
                                        'Approve',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 9,
                                            fontWeight: FontWeight.bold),
                                      ))),
                              const SizedBox(width: 10),
                              const Expanded(child: SizedBox()),
                              Container(
                                padding: const EdgeInsets.only(right: 10),
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.purple,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
