import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_plus/responsive_plus.dart';
import 'package:responsive_plus_example/brain/constants.dart';
import 'package:responsive_plus_example/ui/profile_image.dart';
import 'package:responsive_plus_example/widgets/style_button.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(context.mix(5)),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                kTxtAppName,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: context.font(5),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (context.isLarge) const ProfileImage(),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: context.mix(2)),
                          if (!context.isLarge) ProfileImage(),
                          SizedBox(height: context.mix(2)),
                          Text(
                            kTxtPresentation,
                            style: Theme.of(context).textTheme.headlineLarge!
                                .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: context.font(3.5),
                                ),
                          ),
                          if (kIsWeb && context.isTablet)
                            Container(height: 10, color: Colors.transparent),
                          ShaderMask(
                            shaderCallback: (bounds) {
                              return defaultGradient.createShader(bounds);
                            },
                            child: Text(
                              kTxtProfession,
                              style: Theme.of(context).textTheme.headlineLarge!
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    height: 0,
                                    fontSize: context.font(3),
                                  ),
                            ),
                          ),
                          SizedBox(height: context.mix(2)),
                          Text(
                            kTxtAboutMe,
                            style: TextStyle(
                              color: Colors.grey,
                              wordSpacing: 2,
                              fontSize: context.font(2.5),
                            ),
                          ),
                          SizedBox(height: context.mix(2)),
                          const StyleButton(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
