import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_easy/BLoC%20and%20Model/APPLIED%20LEAVE%20BLoC/applied_bloc.dart';
import '../REPOSITORIES/PAST LEAVE SERVICES/applied_leave_services.dart';

class AppliedTabView extends StatefulWidget {
  const AppliedTabView({Key? key}) : super(key: key);

  @override
  State<AppliedTabView> createState() => _AppliedTabViewState();
}

class _AppliedTabViewState extends State<AppliedTabView> {
  late TabController _controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppliedBloc()
        ..add(
            AppliedFetchEvent(fyID: "19", empID: "10730", date: "2023-04-20")),
      child: BlocBuilder<AppliedBloc, AppliedState>(
        builder: (context, state) {
          if (state is AppliedLeaveLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.teal,
              ),
            );
          }
          if (state is AppliedLeaveLoadedState) {
            final appliedData = state.appliedLeave;
            return appliedData != null
                ? Container(
                    height: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: ListView.builder(
                        padding: const EdgeInsets.only(top: 0.0),
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              print("Clicked");
                              PastAppliedServices pastAppliedServices =
                                  PastAppliedServices();
                              pastAppliedServices.getPastLeaves(
                                  "19", "2023-04-20", "10730");
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
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 9), // changes position of shadow
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
                                              style: TextStyle(
                                                  color: Color(0xff336699)),
                                            ),
                                            Text(
                                              appliedData[index]["EmpName"],
                                              style: const TextStyle(
                                                fontSize: 13,
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 2),
                                        Row(
                                          children: [
                                            const Text(
                                              'From :',
                                              style: TextStyle(
                                                color: Colors.teal,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              appliedData[index]["StartDate"],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const Text(
                                              'To :',
                                              style: TextStyle(
                                                color: Colors.teal,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(appliedData[index]["EndDate"],
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500))
                                          ],
                                        ),
                                      ],
                                    ),
                                    subtitle: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Status : ',
                                              style: TextStyle(
                                                color: Color(0xff336699),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              appliedData[index]["Status"],
                                              style: TextStyle(
                                                color: Colors.red.shade500,
                                                fontSize: 13,
                                              ),
                                            )
                                          ],
                                        ),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Reason : ',
                                                  style: TextStyle(
                                                    color: Color(0xff6699cc),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  appliedData[index]["Purpose"],
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                const Expanded(
                                                    child: SizedBox()),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10),
                                                  child: const Icon(
                                                    Icons.arrow_forward,
                                                    color: Colors.purple,
                                                  ),
                                                )
                                              ],
                                            ))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  )
                : const Text("NO Data Found");
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
