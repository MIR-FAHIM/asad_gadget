import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:asad_gadget/common/Color.dart';

class GlowAnimation extends StatefulWidget {
  const GlowAnimation({Key? key}) : super(key: key);

  @override
  State<GlowAnimation> createState() => _GlowAnimationState();
}

class _GlowAnimationState extends State<GlowAnimation> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: _size.height * 0.4,
      width: _size.width,
      child: Center(
        child: AvatarGlow(
            glowColor: AppColors.primaryColor,
            duration: Duration(milliseconds: 2000),
            repeat: true,
           // showTwoGlows: true,
            curve: Curves.easeOutQuad,
            child: Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(99)),
              child: Icon(Icons.check, color: Colors.white, size: 80),
            ),
            ),
      ),
    );
  }
}
