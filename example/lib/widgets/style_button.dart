import 'package:flutter/material.dart';
import 'package:responsive_plus/responsive_plus.dart';
import 'package:responsive_plus_example/brain/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class StyleButton extends StatelessWidget {
  const StyleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IntrinsicWidth(
        child: InkWell(
          onTap: () {
            launchUrl(Uri.parse(kTxtUrl));
          },
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: context.mix(1.5),
              vertical: context.mix(1),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurple,
                  offset: const Offset(0, -1),
                  blurRadius: context.diag(2.5),
                ),
                BoxShadow(
                  color: Colors.blue,
                  offset: const Offset(0, 1),
                  blurRadius: context.diag(2.5),
                ),
              ],
              gradient: defaultGradient,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.ads_click_rounded,
                  color: Colors.white70,
                  size: context.icon(4),
                ),
                SizedBox(width: context.mix(1)),
                Text(
                  'Visite a Página Oficial',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Colors.white,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: context.mix(1)),
                Icon(
                  Icons.touch_app,
                  color: Colors.white70,
                  size: context.icon(4),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
