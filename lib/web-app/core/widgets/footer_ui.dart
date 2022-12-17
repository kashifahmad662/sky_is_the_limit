import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test/web-app/core/constants/app-text-style.dart';
import 'package:test/web-app/core/constants/colors.dart';
import 'package:test/web-app/core/constants/image-paths.dart';
import 'package:test/web-app/core/constants/responsive_ui.dart';
import 'package:test/web-app/core/responsive/SizeConfig.dart';
import 'package:test/web-app/core/widgets/contact_details_ui.dart';
import 'package:test/web-app/core/widgets/line_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterUI extends StatelessWidget {
  const FooterUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xff384141),
          image: DecorationImage(
              image: AssetImage(
                ImagePath.footerBG,
              ),
              fit: BoxFit.fill)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: (ResponsiveWidget.isWebScreen ? 60 : 30) *
                SizeConfig.widthMultiplier!),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: (ResponsiveWidget.isWebScreen ? 60 : 30) *
                  SizeConfig.heightMultiplier!,
            ),
            Text(
              'About Us',
              style: AppTextStyle.titleWhite,
            ),
            SizedBox(
              height: (ResponsiveWidget.isWebScreen ? 20 : 15) *
                  SizeConfig.heightMultiplier!,
            ),
            const LineWidget(),
            SizedBox(
              height: (ResponsiveWidget.isWebScreen ? 50 : 20) *
                  SizeConfig.heightMultiplier!,
            ),
            //website des
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "SKY\nIS THE\nLIMIT",
                  style: AppTextStyle.neueHaasWhiteFont.copyWith(
                      color: pureWhite,
                      fontSize: (ResponsiveWidget.isWebScreen ? 50 : 20) *
                          SizeConfig.textMultiplier!),
                ),
                SizedBox(
                  width: (ResponsiveWidget.isWebScreen ? 60 : 30) *
                      SizeConfig.widthMultiplier!,
                ),
                Container(
                  color: Colors.white.withOpacity(0.4),
                  width: 0.5 * SizeConfig.widthMultiplier!,
                  height: (ResponsiveWidget.isWebScreen ? 120 : 70) *
                      SizeConfig.heightMultiplier!,
                ),
                SizedBox(
                  width: (ResponsiveWidget.isWebScreen ? 60 : 30) *
                      SizeConfig.widthMultiplier!,
                ),
                Flexible(
                  child: Text(
                    "This website is managed under founder of Sky is the limit Mr.WAQAS KALAM",
                    style: AppTextStyle.whiteSubtitleStyle,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: (ResponsiveWidget.isWebScreen ? 20 : 15) *
                  SizeConfig.heightMultiplier!,
            ),
            Text(
              'Contact Us',
              style: AppTextStyle.titleWhite,
            ),
            SizedBox(
              height: (ResponsiveWidget.isWebScreen ? 20 : 15) *
                  SizeConfig.heightMultiplier!,
            ),
            const LineWidget(),
            SizedBox(
              height: (ResponsiveWidget.isWebScreen ? 50 : 20) *
                  SizeConfig.heightMultiplier!,
            ),
            ContactDetailsUI(
              title: 'admin@skyisthelimt.com',
              onTap: () {
                final Uri emailLaunchUri = Uri(
                  scheme: 'mailto',
                  path: 'admin@skyisthelimt.com',
                  query: encodeQueryParameters(<String, String>{
                    'subject': 'Admission Query',
                  }),
                );

                launchUrl(emailLaunchUri);
              },
            ),
            ContactDetailsUI(
              title: ResponsiveWidget.isWebScreen
                  ? 'https://www.facebook.com/Skyisthelimit.educonsultant/'
                  : 'https://www.facebook.com/Skyisthelimit.\neduconsultant/',
              onTap: () {
                launchUrl(
                    Uri.parse(
                        'https://www.facebook.com/Skyisthelimit.educonsultant/'),
                    mode: LaunchMode.platformDefault);
              },
            ),
            ContactDetailsUI(
                onTap: () {
                  launchUrl(
                      Uri.parse(
                          'https://instagram.com/skyisthelimit_study_turkey?igshid=YmMyMTA2M2Y='),
                      mode: LaunchMode.platformDefault);
                },
                title: ResponsiveWidget.isWebScreen
                    ? 'https://instagram.com/skyisthelimit_study_turkey?igshid=YmMyMTA2M2Y='
                    : 'https://instagram.com/skyisthelimit_study_\nturkey?igshid=YmMyMTA2M2Y='),
            ContactDetailsUI(
              onTap: () {
                final Uri emailLaunchUri = Uri(
                  scheme: 'tel',
                  path: '+90 552 681 68 29',
                );

                launchUrl(emailLaunchUri);
              },
              onSeconderyTapped: () {
                final Uri emailLaunchUri = Uri(
                  scheme: 'tel',
                  path: '+918285545017',
                );

                launchUrl(emailLaunchUri);
              },
              title: '+90 552 681 68 29',
              subText: ' / +918285545017',
            ),
            SizedBox(
              height: (ResponsiveWidget.isWebScreen ? 20 : 15) *
                  SizeConfig.heightMultiplier!,
            ),
            Text(
              'Office',
              style: AppTextStyle.titleWhite,
            ),
            SizedBox(
              height: (ResponsiveWidget.isWebScreen ? 20 : 15) *
                  SizeConfig.heightMultiplier!,
            ),
            const LineWidget(),
            SizedBox(
              height: (ResponsiveWidget.isWebScreen ? 50 : 20) *
                  SizeConfig.heightMultiplier!,
            ),
            ContactDetailsUI(
              onTap: () {
                String query = Uri.encodeComponent(
                    'APARTMAN D-11 KUMRULU SOK, ZAFER MAHALLESİ, Bahçelievler İstanbul Turkey');
                String googleUrl =
                    "https://www.google.com/maps/search/?api=1&query=$query";

                launchUrl(Uri.parse(googleUrl));
              },
              title: (ResponsiveWidget.isWebScreen)
                  ? 'NO :26 EMRE APARTMAN D-11 KUMRULU SOK . ZAFER MAHALLESİ. Bahçelievler İstanbul Turkey'
                  : 'NO :26 EMRE APARTMAN D-11 KUMRULU\nSOK . ZAFER MAHALLESİ. Bahçelievler\nİstanbul Turkey',
            ),
          ],
        ),
      ),
    );
  }
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}
