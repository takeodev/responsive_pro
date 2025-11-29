import 'package:flutter/material.dart';
import 'package:responsive_pro/responsive_pro.dart';
import 'package:responsive_pro_example/brain/constants.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.mix(2)),
        child: Container(
          height: context.diag(20),
          width: context.diag(20),
          padding: EdgeInsets.all(context.mix(1)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: defaultGradient,
            boxShadow: [
              BoxShadow(
                color: Colors.blueAccent,
                offset: const Offset(-2, 0),
                blurRadius: context.diag(5),
              ),
              BoxShadow(
                color: Colors.blue,
                offset: const Offset(2, 0),
                blurRadius: context.diag(5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset('profile.png', fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
