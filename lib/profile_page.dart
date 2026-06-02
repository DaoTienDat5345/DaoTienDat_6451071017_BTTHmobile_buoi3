import 'package:btthmobilebuoi3/widgets/about_me_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

//https://cdn.haitrieu.com/wp-content/uploads/2022/03/Logo-Dai-Hoc-Giao-Thong-Van-Tai-UTC.png

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String aboutMe = "";
  final TextEditingController _aboutMeController = TextEditingController(
    text: "",
  );

  @override
  void initState() {
    // load thông tin cá nhân của user từ SQLite

    aboutMe = "";

    // cập nhật lại controller
    _aboutMeController.text = aboutMe;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // logo
            Image.asset("assets/images/logo.png", width: 150, height: 150),
            //Image.network("https://cdn.haitrieu.com/wp-content/uploads/2022/03/Logo-Dai-Hoc-Giao-Thong-Van-Tai-UTC.png"),
            const SizedBox(height: 10),
            // tên
            Text('Nguyễn Văn A'),
            const SizedBox(height: 10),
            // email
            Text('64570145@st.utc2.edu.vn'),
            const SizedBox(height: 10),

            // các thông tin profile khác
            InfoItemWidget(
              title: "About me",
              iconUrl: "assets/icons/about_me.svg",
              onTap: () {
                // Show dialog about me
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("About me"),
                    content: AboutMeWidget(controller: _aboutMeController),
                    actions: [
                      TextButton(
                        onPressed: () async {
                          // lưu thông tin about me vào SQLite
                          aboutMe = _aboutMeController.text;

                          await Future.delayed(
                            Duration(seconds: 1),
                          ); // giả lập thời gian lưu dữ liệu

                          // lưu xong thì đóng dialog
                          Navigator.pop(context);
                        },
                        child: Text("Save"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Close"),
                      ),
                    ],
                  ),
                );
              },
            ),

            InfoItemWidget(
              title: "Work Experience",
              iconUrl: "assets/icons/work_experience.svg",
              onTap: () {},
            ),
            InfoItemWidget(
              title: "Education",
              iconUrl: "assets/icons/about_me.svg",
              onTap: () {},
            ),
            InfoItemWidget(
              title: "Skills",
              iconUrl: "assets/icons/about_me.svg",
              onTap: () {},
            ),
            InfoItemWidget(
              title: "Projects",
              iconUrl: "assets/icons/about_me.svg",
              onTap: () {},
            ),
            InfoItemWidget(
              title: "Certifications",
              iconUrl: "assets/icons/about_me.svg",
              onTap: () {},
            ),
            InfoItemWidget(
              title: "Languages",
              iconUrl: "assets/icons/about_me.svg",
              onTap: () {},
            ),
            InfoItemWidget(
              title: "Interests",
              iconUrl: "assets/icons/about_me.svg",
              onTap: () {},
            ),
            InfoItemWidget(
              title: "References",
              iconUrl: "assets/icons/about_me.svg",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class InfoItemWidget extends StatelessWidget {
  final String title;
  final String iconUrl;
  final VoidCallback onTap;
  const InfoItemWidget({
    super.key,
    required this.title,
    required this.iconUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: SvgPicture.asset(iconUrl),
      title: Text(title),
      trailing: SvgPicture.asset('assets/icons/add.svg'),
    );
  }
}
