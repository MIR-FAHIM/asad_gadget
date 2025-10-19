import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:asad_gadget/app/Page/widget/GlowAnimation.dart';
import 'package:asad_gadget/app/modules/global_widgets/block_button_widget.dart';
import 'package:asad_gadget/app/routes/app_pages.dart';
import 'package:asad_gadget/common/Color.dart';

class TransactionSuccessful extends StatelessWidget {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size(65, 65),
          child: AppBar(
            backgroundColor: const Color(0xFF652981),
            centerTitle: true,
            title: Text('Transaction Successful'.tr),
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Get.offNamed(Routes.SALES);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white70,
                )),
            // actions: [
            //   IconButton(
            //       onPressed: () {},
            //       icon: Icon(
            //         CupertinoIcons.bell,
            //         color: Colors.white70,
            //       )),
            // ],
          ),
        ),
        body: SizedBox(
          height: _size.height,
          width: _size.width,
          child: Column(
            children: [
              const GlowAnimation(),
              const SizedBox(height: 25),
              Text(
                'Transaction Successfully Done'.tr,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 15),
              // Text(
              //   "Invoice Number : 649872",
              //   style: TextStyle(fontSize: 13, color: AppColors.homeTextColor3),
              // ),
              // // Text(
              // //   "Due : 649/=",
              // //   style: TextStyle(fontSize: 13, color: AppColors.homeTextColor3),
              // // ),
              // const SizedBox(height: 10),
              // Text(
              //   'Total Paid'.tr + " : ১০০০ ৳",
              //   style: TextStyle(fontSize: 13, color: AppColors.homeTextColor2),
              // ),
              SizedBox(height: _size.height * 0.15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlockButtonWidget(
                    width: Get.size.width * .4,
                    onPressed: () {},
                    color: const Color(0xFF652981),
                    text: Text(
                      'Receipt Share'.tr,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                  ).paddingSymmetric(vertical: 25, horizontal: 10),
                  BlockButtonWidget(
                    width: Get.size.width * .4,
                    onPressed: () {},
                    color: const Color(0xFF652981),
                    text: Text(
                      'Receipt Print'.tr,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                  ).paddingSymmetric(vertical: 25, horizontal: 10),
                ],
              ),
            ],
          ),
        ));
  }
}

// class TransactionSuccessful extends StatefulWidget {
//   @override
//   _TransactionSuccessfulState createState() => _TransactionSuccessfulState();
// }

// class _TransactionSuccessfulState extends State<TransactionSuccessful>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 1),
//     );

//     _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
//       ..addListener(() {
//         setState(() {});
//       })
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.dismissed) {
//           _animationController.forward();
//         } else if (status == AnimationStatus.completed) {
//           _animationController.repeat();
//         }
//       });

//     _animationController.forward();
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: CustomPaint(
//           painter: MyCustomPainter(_animation.value),
//           child: Container(),
//         ),
//       ),
//     );
//   }
// }

// class MyCustomPainter extends CustomPainter {
//   final double animationValue;

//   MyCustomPainter(this.animationValue);

//   @override
//   void paint(Canvas canvas, Size size) {
//     for (int value = 3; value >= 0; value--) {
//       circle(canvas, Rect.fromLTRB(0, 0, size.width, size.height),
//           value + animationValue);
//     }
//   }

//   void circle(Canvas canvas, Rect rect, double value) {
//     Paint paint = Paint()
//       ..color = Color(0xff19DC7C).withOpacity((1 - (value / 4)).clamp(.0, 1));

//     canvas.drawCircle(rect.center,
//         sqrt((rect.width * .5 * rect.width * .5) * value / 4), paint);
//   }

//   @override
//   bool shouldRepaint(MyCustomPainter oldDelegate) {
//     return true;
//   }
// }
