import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webinfo_senter/common/style.dart';
import 'package:webinfo_senter/common/text_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:webinfo_senter/helper/result_state.dart';
import 'package:webinfo_senter/provider/akun_provider.dart';
import 'package:webinfo_senter/ui/edit_profile.dart';
import 'package:webinfo_senter/ui/pengajuan_screen.dart';
import 'package:webinfo_senter/ui/login_page.dart';
import 'package:webinfo_senter/widget/display_photo.dart';

class ProfilePage extends StatelessWidget {
  static const String profileTitle = 'Profile';
  static const routeName = '/profile_page';

  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthButton, heightButton;

    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      widthButton = MediaQuery.of(context).size.height * 0.933;
      heightButton = MediaQuery.of(context).size.height * 0.145;
    } else {
      widthButton = MediaQuery.of(context).size.width * 0.933;
      heightButton = MediaQuery.of(context).size.width * 0.145;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'Profile Akun',
                  style: myTextTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Consumer<AkunProvider>(
                  builder: (context, snapshot, child) {
                    if (snapshot.state == ResultState.loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.state == ResultState.hasData) {
                      var profileAkun = snapshot.userAkun;
                      return Column(
                        children: [
                          ClipOval(
                            child: DisplayPhoto(
                              url: profileAkun.urlFotoProfil,
                              width: 100.0,
                              height: 100.0,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            profileAkun.nama,
                            style: myTextTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            profileAkun.email,
                            style: myTextTheme.bodyLarge!,
                          ),
                        ],
                      );
                    } else {
                      return Text(snapshot.message);
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: widthButton,
                  height: heightButton,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, EditProfile.routeName);
                    },
                    child: Text(
                      "Ubah Profil",
                      style: myTextTheme.labelLarge!
                          .copyWith(color: customRedColor),
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: widthButton,
                  height: heightButton,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, FormPengajuan.routeName);
                    },
                    child: Text(
                      "Ajukan Webinar",
                      style: myTextTheme.labelLarge!
                          .copyWith(color: customRedColor),
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: widthButton,
                  height: heightButton,
                  child: OutlinedButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pushNamed(context, LoginPage.routeName);
                    },
                    child: Text(
                      "Logout",
                      style: myTextTheme.labelLarge!.copyWith(
                        color: customRedColor,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
