import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_easy/BLoC%20and%20Model/PAST%20APPLIED%20BLOC/past_applied_blo_c_bloc.dart';
import 'package:hr_easy/REPOSITORIES/PAST%20LEAVE%20SERVICES/applied_leave_services.dart';

class PastTabView extends StatefulWidget {
  const PastTabView({Key? key}) : super(key: key);

  @override
  State<PastTabView> createState() => _PastTabViewState();
}

class _PastTabViewState extends State<PastTabView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PastAppliedBloCBloc()
        ..add(PastLeaveFetchEvent(
            fyId: "19", date: "2023-04-20", empCodee: "10730")),
      child: BlocBuilder<PastAppliedBloCBloc, PastAppliedBloCState>(
        builder: (context, state) {
          if (state is PastAppliedLoadingState) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.teal,
            ));
          }
          if (state is PastAppliedLoadedState) {
            final pastLeave = state.pastLeaves;
            return pastLeave != null
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
                          return Container(
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
                                            pastLeave[index]["EmpName"],
                                            style: TextStyle(
                                              fontSize: 13,
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 2),
                                      Row(
                                        children: [
                                          Text(
                                            'From :',
                                            style: TextStyle(
                                              color: Colors.teal,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            pastLeave[index]["StartDate"],
                                            style: TextStyle(
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
                                          Text(pastLeave[index]["EndDate"],
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
                                            pastLeave[index]["Status"],
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
                                                pastLeave[index]["Purpose"],
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                ),
                                              ),
                                              const Expanded(child: SizedBox()),
                                              Container(
                                                padding: const EdgeInsets.only(
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
                          );
                        }),
                  )
                : Text("NO Data Available");
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
