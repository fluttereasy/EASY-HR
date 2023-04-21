import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PastTabView extends StatefulWidget {
  const PastTabView({Key? key}) : super(key: key);

  @override
  State<PastTabView> createState() => _PastTabViewState();
}

class _PastTabViewState extends State<PastTabView> {
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Status : ',
                              style: TextStyle(
                                color: Color(0xff336699),
                                fontWeight: FontWeight.w500,),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Rejected",
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  'Reason : ',
                                  style: TextStyle(
                                    color: Color(0xff6699cc),
                                    fontWeight: FontWeight.w500,),
                                ),
                                const Text(
                                  'Something...',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                  ),
                                ),
                                const Expanded(child: SizedBox()),
                                Container(
                                  padding: const EdgeInsets.only(right: 10),
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
    );
  }
}
