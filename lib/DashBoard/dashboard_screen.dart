import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../CAMERA VIEW/camera_login_button.dart';
import '../LEAVE MANAGEMENT/leave_management.dart';
import '../REPOSITORIES/user_profile_services.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  UserProfile _userProfile = UserProfile();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    _userProfile.getUserProfile("8447659609");
                  },
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
                            builder: (context) => const LoginCameraButton()));
                  },
                  //onTap:_isDetecting ? null : _trackFace,
                  child: Container(
                    height: 140,
                    width: 165,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                            color: Colors.green.shade100, width: 3.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                              fontWeight: FontWeight.bold, fontSize: 18),
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
                                const LeaveManagementScreen()));
                  },
                  child: Container(
                    height: 140,
                    width: 165,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                            color: Colors.green.shade100, width: 3.0)),
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
                              fontWeight: FontWeight.bold, fontSize: 17),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//  late final InputImage inputImage;
//   static final ImageLabelerOptions _options =
//       ImageLabelerOptions(confidenceThreshold: 0.8);
//
//   final imageLabeler = ImageLabeler(options: _options);
//   final ImagePicker imagePicker = ImagePicker();
//
//   String text = "";
//
//   final faceDetector = FaceDetector(
//       options: FaceDetectorOptions(
//     enableClassification: true,
//     enableContours: true,
//     enableLandmarks: true,
//     enableTracking: true,
//     performanceMode: FaceDetectorMode.accurate,
//   ));
//
//   File? _pickedImage;
//
//   getImageFromCamera() async {
//     XFile? image = await imagePicker.pickImage(source: ImageSource.camera);
//     // final image = await imagePicker.pickImage(source: ImageSource.camera);
//     setState(() {
//       _pickedImage = File(image!.path);
//     });
//     inputImage = InputImage.fromFile(_pickedImage!);
//     identifyImage(inputImage);
//   }
//
//   void identifyImage(InputImage inputImage) async {
//     final List<ImageLabel> image = await imageLabeler.processImage(inputImage);
//
//     if (image.isEmpty) {
//       setState(() {
//         text = "Cannot identify the image";
//       });
//       return;
//     }
//
//     for (ImageLabel img in image) {
//       setState(() {
//         text = "Label: ${img.label}";
//       });
//     }
//     imageLabeler.close();
//   }
