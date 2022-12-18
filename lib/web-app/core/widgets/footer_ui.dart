import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test/web-app/core/constants/app-text-style.dart';
import 'package:test/web-app/core/constants/colors.dart';
import 'package:test/web-app/core/constants/image-paths.dart';
import 'package:test/web-app/core/constants/responsive_ui.dart';
import 'package:test/web-app/core/responsive/SizeConfig.dart';
import 'package:test/web-app/core/widgets/CustomButton.dart';
import 'package:test/web-app/core/widgets/TextFieldContainer.dart';
import 'package:test/web-app/core/widgets/contact_details_ui.dart';
import 'package:test/web-app/core/widgets/line_widget.dart';
import 'package:test/web-app/features/HomePage/view/admin_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

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
            GestureDetector(
              onDoubleTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return getInputForm(context, removeOffset: true);
                    });
              },
              child: Text(
                'About Us',
                style: AppTextStyle.titleWhite,
              ),
            ),
            SizedBox(
              height: (ResponsiveWidget.isWebScreen ? 20 : 15) *
                  SizeConfig.heightMultiplier!,
            ),
            const LineWidget(),
            SizedBox(
              height: (ResponsiveWidget.isWebScreen ? 50 : 22) *
                  SizeConfig.heightMultiplier!,
            ),
            //website des
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Theme(
                  data: ThemeData(
                    fontFamily: 'Montserrat',
                    scaffoldBackgroundColor: pureWhite,
                  ),
                  child: Text(
                    "SKY\nIS THE\nLIMIT",
                    style: AppTextStyle.neueHaasWhiteFont.copyWith(
                        color: pureWhite,
                        fontWeight: FontWeight.w800,
                        fontSize: (ResponsiveWidget.isWebScreen ? 50 : 20) *
                            SizeConfig.textMultiplier!),
                  ),
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
              onTrippleTap: () {},
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
                    'KUMRULU Sokak N0:11, ZAFER MAHALLESİ, Bahçelievler İstanbul Turkey');
                String googleUrl =
                    "https://www.google.com/maps/search/?api=1&query=41.001650,28.831186";

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

  Widget getInputForm(BuildContext context, {bool? removeOffset}) {
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    return Align(
      alignment:
          ResponsiveWidget.isMobile ? Alignment.center : Alignment.topRight,
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 20,
          child: Container(
            height: null,
            padding: const EdgeInsets.all(25),
            width: Get.width < 500
                ? 300 * SizeConfig.widthMultiplier!
                : 450 * SizeConfig.widthMultiplier!,
            decoration: BoxDecoration(
              color: pureWhite,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFieldContainer(
                    wantLabel: true,
                    label: "Username",
                    hint: 'Username',
                    isObsecure: false,
                    onChanged: () {},
                    suffixWidget: const SizedBox(),
                    textEditingController: username,
                    textInputType: TextInputType.text,
                    subLabel: '',
                    width: ResponsiveWidget.isWebScreen
                        ? 300 * SizeConfig.widthMultiplier!
                        : null,
                  ),
                  getSizedBox(),
                  TextFieldContainer(
                    wantLabel: true,
                    label: "Password",
                    hint: 'password',
                    isObsecure: true,
                    onChanged: () {},
                    suffixWidget: SizedBox(),
                    textEditingController: password,
                    textInputType: TextInputType.text,
                    subLabel: '',
                    width: ResponsiveWidget.isWebScreen
                        ? 300 * SizeConfig.widthMultiplier!
                        : null,
                  ),
                  SizedBox(
                    height: 40 * SizeConfig.heightMultiplier!,
                  ),
                  SizedBox(
                    width: ResponsiveWidget.isWebScreen
                        ? 120 * SizeConfig.widthMultiplier!
                        : double.infinity,
                    height: ResponsiveWidget.isWebScreen
                        ? null
                        : 40 * SizeConfig.heightMultiplier!,
                    child: CustomButton(
                      text: 'Login',
                      buttonColor: Colors.red,
                      onPressed: () async {
                        if (checkAdminLogin(username.text, password.text)) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserInformation()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Invalid Credentials!")));
                        }
                      },
                      textStyle:
                          AppTextStyle.paleText.copyWith(color: pureWhite),
                      //width: 20 * SizeConfig.widthMultiplier!,
                    ),
                  ),
                  SizedBox(
                    height: 20 * SizeConfig.heightMultiplier!,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getSizedBox() {
    return SizedBox(
      height: (ResponsiveWidget.isWebScreen ? 20 : 10) *
          SizeConfig.heightMultiplier!,
    );
  }

  bool checkAdminLogin(String user, String pass) {
    if (user == 'admin@skyisthelimt.com' && pass == "Check@123#") {
      return true;
    } else {
      return false;
    }
  }
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}
