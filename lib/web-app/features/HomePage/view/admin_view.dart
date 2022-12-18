import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test/web-app/core/constants/app-text-style.dart';
import 'package:test/web-app/core/constants/colors.dart';
import 'package:test/web-app/core/constants/responsive_ui.dart';
import 'package:test/web-app/core/widgets/CustomButton.dart';
import 'package:test/web-app/core/widgets/custom-dropdown.dart';
import 'package:test/web-app/core/responsive/SizeConfig.dart';
import 'package:get/get.dart';
import 'package:test/web-app/core/widgets/footer_ui.dart';
import 'package:test/web-app/features/HomePage/controller/homePage-Controller.dart';
import 'package:url_launcher/url_launcher.dart';

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation>
    with SingleTickerProviderStateMixin {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('users')
      .snapshots(includeMetadataChanges: true);
  TabController? _controller;

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  HomeController homeController = Get.find();

  List<Map<String, dynamic>> userDataActive = [];
  List<Map<String, dynamic>> userDataProcess = [];
  List<Map<String, dynamic>> userDataClosed = [];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return Theme(
          data: ThemeData(
            brightness: Brightness.light,
            // add tabBarTheme
            tabBarTheme: const TabBarTheme(
              labelColor: Colors.white,
              labelStyle: TextStyle(color: Colors.white), // color for text
            ),
            primaryColor:
                Colors.pink[800], // outdated and has no effect to Tabbar
          ),
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.red,
                bottom: TabBar(
                  controller: _controller,
                  tabs: const [
                    Tab(
                        text: 'Active',
                        icon: Icon(
                          Icons.notifications_active_rounded,
                          color: Colors.white,
                        )),
                    Tab(
                        text: 'Processing',
                        icon: Icon(
                          Icons.wifi_protected_setup,
                          color: Colors.white,
                        )),
                    Tab(
                        text: 'Closed',
                        icon: Icon(
                          Icons.curtains_closed_rounded,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
              body: TabBarView(
                controller: _controller,
                children: [
                  ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return (data['status'] == 1)
                          ? GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SeeUserForm(
                                            id: document.id,
                                            name: data['FullName'],
                                            dob: data['DateOfBirth'],
                                            email: data['Email'],
                                            phone: data['Phone'],
                                            courseLevel: data['CourseLevel'],
                                            program: data['Program'],
                                            comment: data['Comments'],
                                            status: data['status'])));
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: (ResponsiveWidget.isWebScreen
                                            ? 100
                                            : 15) *
                                        SizeConfig.widthMultiplier!,
                                    vertical: (ResponsiveWidget.isWebScreen
                                            ? 10
                                            : 5) *
                                        SizeConfig.heightMultiplier!),
                                child: Card(
                                  elevation: 10,
                                  child: ListTile(
                                    title: Text('Name: ' + data['FullName']),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(height: 6),
                                        Text('Course: ' + data['CourseLevel']),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container();
                    }).toList(),
                    // snapshot.data!.docs.map((DocumentSnapshot document) {
                    //   Map<String, dynamic> data =
                    //       document.data()! as Map<String, dynamic>;
                    //   return GestureDetector(
                    //     onTap: () {
                    //       snapshot.data!.docs[0].id;
                    //     },
                    //     child: ListTile(
                    //       title: Text(data['FullName']),
                    //       subtitle: Text(data['CourseLevel']),
                    //     ),
                    //   );
                    // }).toList(),
                  ),
                  ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return (data['status'] == 2)
                          ? GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SeeUserForm(
                                            id: document.id,
                                            name: data['FullName'],
                                            dob: data['DateOfBirth'],
                                            email: data['Email'],
                                            phone: data['Phone'],
                                            courseLevel: data['CourseLevel'],
                                            program: data['Program'],
                                            comment: data['Comments'],
                                            status: data['status'])));
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: (ResponsiveWidget.isWebScreen
                                            ? 100
                                            : 15) *
                                        SizeConfig.widthMultiplier!,
                                    vertical: (ResponsiveWidget.isWebScreen
                                            ? 10
                                            : 5) *
                                        SizeConfig.heightMultiplier!),
                                child: Card(
                                  elevation: 10,
                                  child: ListTile(
                                    title: Text('Name: ' + data['FullName']),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(height: 6),
                                        Text('Course: ' + data['CourseLevel']),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container();
                    }).toList(),
                    // snapshot.data!.docs.map((DocumentSnapshot document) {
                    //   Map<String, dynamic> data =
                    //       document.data()! as Map<String, dynamic>;
                    //   return GestureDetector(
                    //     onTap: () {
                    //       snapshot.data!.docs[0].id;
                    //     },
                    //     child: ListTile(
                    //       title: Text(data['FullName']),
                    //       subtitle: Text(data['CourseLevel']),
                    //     ),
                    //   );
                    // }).toList(),
                  ),
                  ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return (data['status'] == 3)
                          ? GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SeeUserForm(
                                            id: document.id,
                                            name: data['FullName'],
                                            dob: data['DateOfBirth'],
                                            email: data['Email'],
                                            phone: data['Phone'],
                                            courseLevel: data['CourseLevel'],
                                            program: data['Program'],
                                            comment: data['Comments'],
                                            status: data['status'])));
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: (ResponsiveWidget.isWebScreen
                                            ? 100
                                            : 15) *
                                        SizeConfig.widthMultiplier!,
                                    vertical: (ResponsiveWidget.isWebScreen
                                            ? 10
                                            : 5) *
                                        SizeConfig.heightMultiplier!),
                                child: Card(
                                  elevation: 10,
                                  child: ListTile(
                                    title: Text('Name: ' + data['FullName']),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(height: 6),
                                        Text('Course: ' + data['CourseLevel']),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container();
                    }).toList(),
                    // snapshot.data!.docs.map((DocumentSnapshot document) {
                    //   Map<String, dynamic> data =
                    //       document.data()! as Map<String, dynamic>;
                    //   return GestureDetector(
                    //     onTap: () {
                    //       snapshot.data!.docs[0].id;
                    //     },
                    //     child: ListTile(
                    //       title: Text(data['FullName']),
                    //       subtitle: Text(data['CourseLevel']),
                    //     ),
                    //   );
                    // }).toList(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class SeeUserForm extends StatefulWidget {
  const SeeUserForm(
      {Key? key,
      required this.id,
      required this.name,
      required this.dob,
      required this.email,
      required this.phone,
      required this.courseLevel,
      required this.program,
      required this.comment,
      required this.status})
      : super(key: key);

  final String name;
  final String id;
  final String dob;
  final String email;
  final String phone;
  final String courseLevel;
  final String program;
  final String comment;
  final int status;

  @override
  State<SeeUserForm> createState() => _SeeUserFormState();
}

class _SeeUserFormState extends State<SeeUserForm> {
  Widget getSizedBox() {
    return SizedBox(
      height: (ResponsiveWidget.isWebScreen ? 20 : 10) *
          SizeConfig.heightMultiplier!,
    );
  }

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  final List<String> status = ['Active', 'Processing', 'Closed'];
  String? selectedStatusValue;
  @override
  void initState() {
    selectedStatusValue = status[widget.status - 1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              vertical: (ResponsiveWidget.isWebScreen ? 100 : 40) *
                  SizeConfig.heightMultiplier!,
              horizontal: (ResponsiveWidget.isWebScreen ? 100 : 40) *
                  SizeConfig.widthMultiplier!),
          child: Card(
            elevation: 20,
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: (ResponsiveWidget.isWebScreen ? 40 : 10) *
                      SizeConfig.heightMultiplier!,
                  horizontal: (ResponsiveWidget.isWebScreen ? 40 : 10) *
                      SizeConfig.widthMultiplier!),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomDropDown(
                    color: Colors.transparent,
                    hint: "heel",
                    labelText: "Country",
                    listofItems: const ["Turkey"],
                    onChanged: null,
                    value: "Turkey",
                    width: ResponsiveWidget.isWebScreen
                        ? 300 * SizeConfig.widthMultiplier!
                        : null,
                  ),
                  getSizedBox(),
                  userFormData(
                    title: "Name:",
                    subTitle: widget.name,
                  ),
                  getSizedBox(),
                  userFormData(
                    title: "Date of birth:",
                    subTitle: widget.dob,
                  ),
                  getSizedBox(),
                  GestureDetector(
                    onTap: () {
                      final Uri emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: widget.email,
                        query: encodeQueryParameters(<String, String>{
                          'subject': 'Sky is the limit admin',
                        }),
                      );

                      launchUrl(emailLaunchUri);
                    },
                    child: userFormData(
                      title: "Email:",
                      subTitle: widget.email,
                    ),
                  ),
                  getSizedBox(),
                  GestureDetector(
                      onTap: () {
                        final Uri emailLaunchUri = Uri(
                          scheme: 'tel',
                          path: widget.phone,
                        );

                        launchUrl(emailLaunchUri);
                      },
                      child: userFormData(
                          title: 'Phone:', subTitle: widget.phone)),
                  getSizedBox(),
                  userFormData(
                      title: 'Course Level:', subTitle: widget.courseLevel),
                  getSizedBox(),
                  userFormData(title: 'Program:', subTitle: widget.program),
                  getSizedBox(),
                  userFormData(title: 'Comment:', subTitle: widget.comment),
                  getSizedBox(),
                  CustomDropDown(
                    color: pale,
                    width: ResponsiveWidget.isWebScreen
                        ? 300 * SizeConfig.widthMultiplier!
                        : null,
                    hint: "Progress",
                    labelText:
                        ResponsiveWidget.isWebScreen ? "Status" : "Status",
                    listofItems: status,
                    onChanged: (value) {
                      setState(() {
                        selectedStatusValue = value;
                      });
                    },
                    value: selectedStatusValue,
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
                      text: 'Update',
                      buttonColor: Colors.red,
                      onPressed: () async {
                        users
                            .doc(widget.id)
                            .update({
                              'status':
                                  (status.indexOf(selectedStatusValue ?? '') +
                                      1)
                            })
                            .then((value) => Navigator.pop(context))
                            .catchError((error) =>
                                print("Failed to update user: $error"));
                      },
                      textStyle:
                          AppTextStyle.paleText.copyWith(color: pureWhite),
                      //width: 20 * SizeConfig.widthMultiplier!,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget userFormData({required String title, required String subTitle}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyle.regularBlack62Text.copyWith(
              color: Color(0xff333333),
              fontWeight: FontWeight.w500,
              fontSize: ResponsiveWidget.isMobile
                  ? 14 * SizeConfig.textMultiplier!
                  : 18 * SizeConfig.textMultiplier!),
        ),
        Text(
          subTitle,
          style: AppTextStyle.regularBlack62Text.copyWith(
              color: Color(0xff333333),
              fontWeight: FontWeight.w400,
              fontSize: ResponsiveWidget.isWebScreen
                  ? 18 * SizeConfig.textMultiplier!
                  : 14 * SizeConfig.textMultiplier!),
        )
      ],
    );
  }
}
