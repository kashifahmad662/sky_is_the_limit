import 'package:flutter/material.dart';
import 'package:test/web-app/core/constants/app-text-style.dart';
import 'package:test/web-app/core/constants/responsive_ui.dart';
import 'package:test/web-app/core/responsive/SizeConfig.dart';

class WhyTurkeyUI extends StatelessWidget {
  WhyTurkeyUI({Key? key}) : super(key: key);
  final List<ItemImageTitle> items = [
    ItemImageTitle(
        title: 'Bridge to the World  and Rich Culture',
        imagePath: 'assets/images/turkey1.png'),
    ItemImageTitle(
        title: 'Education According To Your Dream Job',
        imagePath: 'assets/images/turkey2.png'),
    ItemImageTitle(
        title: 'Comprehensive University Education',
        imagePath: 'assets/images/turkey3.png'),
    ItemImageTitle(
        title: 'Quality Education and Economic Life ',
        imagePath: 'assets/images/turkey4.png')
  ];

  final List<String> countryList = [
    'Istanbul',
    'Antalya',
    'Ankara',
    'Izmir',
    'Konya',
    'Bursa',
    'Gaziantep',
    'Sanliurfa',
    // 'Adana',
    // 'Trabzon',
    // 'Eskisehir',
    // 'Diyarbakir',
    // 'Mersin',
    // 'Samsun',
    // 'Kayseri',
    // 'Kahramanmaras',
    // 'Mardin',
    // 'Denizli',
    // 'Malatya',
    // 'Manisa',
    // 'Erzurum',
    // 'Balikesir',
    // 'Aydin',
    // 'Ephesus',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (ResponsiveWidget.isWebScreen)
          SizedBox(
            height: 30 * SizeConfig.heightMultiplier!,
          ),
        Text(
          'Why Turkey?',
          style: AppTextStyle.titleStyle,
        ),
        SizedBox(
          height: (ResponsiveWidget.isWebScreen ? 30 : 20) *
              SizeConfig.heightMultiplier!,
        ),
        Text(
          'You have many reasons to study in Turkey. Turkey is a center of attraction for students in the world, with its natural, spiritual, transportation and physical properties specific to its cities. ${ResponsiveWidget.isWebScreen ? 'Turkey, which has hosted many deep-rooted civilizations in its territory for thousands of years, is almost a mosaic of cultures! In this country where countless civilizations have been hosted, everyone is tolerant and respectful to each other.' : ''}',
          style: AppTextStyle.subtitleStyle,
        ),
        SizedBox(
          height: (ResponsiveWidget.isWebScreen ? 30 : 20) *
              SizeConfig.heightMultiplier!,
        ),
        Wrap(
          runSpacing: 5.0,
          spacing: 5.0,
          direction: Axis.horizontal,
          children: List.generate(
              items.length,
              (index) => Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: (ResponsiveWidget.isWebScreen ? 15 : 8) *
                            SizeConfig.widthMultiplier!,
                        vertical: (ResponsiveWidget.isWebScreen ? 15 : 8) *
                            SizeConfig.heightMultiplier!),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          items[index].imagePath,
                          width: (ResponsiveWidget.isWebScreen ? 80 : 50) *
                              SizeConfig.widthMultiplier!,
                        ),
                        SizedBox(
                          width: (ResponsiveWidget.isWebScreen ? 15 : 10) *
                              SizeConfig.widthMultiplier!,
                        ),
                        Flexible(
                          child: Text(
                            items[index].title,
                            style: AppTextStyle.boldDesdription,
                          ),
                        )
                      ],
                    ),
                  )),
        ),
        SizedBox(
          height: (ResponsiveWidget.isWebScreen ? 40 : 30) *
              SizeConfig.heightMultiplier!,
        ),
        Text(
          'DISCOVER',
          style: AppTextStyle.titleStyleRed,
        ),
        SizedBox(
          height: (ResponsiveWidget.isWebScreen ? 15 : 7) *
              SizeConfig.heightMultiplier!,
        ),
        Text(
          'TURKEY',
          style: AppTextStyle.largeTitleStyleBold,
        ),
        SizedBox(
          height: (ResponsiveWidget.isWebScreen ? 30 : 20) *
              SizeConfig.heightMultiplier!,
        ),
        Wrap(
          runSpacing: 5.0,
          spacing: 5.0,
          direction: Axis.horizontal,
          children: List.generate(
              countryList.length,
              (index) => Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: (ResponsiveWidget.isWebScreen ? 15 : 8) *
                            SizeConfig.widthMultiplier!,
                        vertical: (ResponsiveWidget.isWebScreen ? 15 : 8) *
                            SizeConfig.heightMultiplier!),
                    child: SizedBox(
                      width: (ResponsiveWidget.isWebScreen ? 200 : 100) *
                          SizeConfig.widthMultiplier!,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Color(0xffE4322D),
                          ),
                          SizedBox(
                            width: (ResponsiveWidget.isWebScreen ? 15 : 10) *
                                SizeConfig.widthMultiplier!,
                          ),
                          Flexible(
                            child: Text(
                              countryList[index],
                              style: AppTextStyle.boldDesdription,
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
        ),
      ],
    );
  }
}

class ItemImageTitle {
  final String title;
  final String imagePath;

  const ItemImageTitle({required this.title, required this.imagePath});
}
