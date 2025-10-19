// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'package:asad_gadget/app/modules/Test/check_sim_numner.dart';
//
// import '../modules/Auth/checkPhoneNumber/controllers/check_phone_number_controller.dart';
//
//
//
// class TermAndCOndition extends GetView<CheckPhoneNumberController> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//
//           children: [
//             GestureDetector(
//               onTap: (){
//                 controller.checkTerm.value = true;
//                 Get.back();
//               },
//               child: Container(
//                 color: Colors.blue,
//
//                 height: 30,
//                 width: 100,
//                 child: Center(child: Text("Agree", style: TextStyle(
//                   color: Colors.white,
//
//                 ),)),
//               ),
//             ),
//             GestureDetector(
//               onTap: (){
//                 controller.checkTerm.value = false;
//                 Get.back();
//               },
//               child: Container(
//                 color: Colors.red,
//
//                 height: 30,
//                 width: 100,
//                 child: Center(child: Text("Decline",
//                   style: TextStyle(
//                     color: Colors.white,
//
//                   ),)),
//               ),
//             )
//           ],
//         ),
//       ),
//       body: WebViewContainer(
//         "https://www.com.example.salary/privacy-policy.php",
//       ),
//     );
//   }
// }
