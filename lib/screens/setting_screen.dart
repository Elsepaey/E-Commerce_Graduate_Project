

// import 'package:flutter/material.dart';
// import 'package:graduate_project/constants.dart';
// import 'package:graduate_project/screens/signup_screen.dart';
// import 'package:graduate_project/screens/profile_screen.dart'; // Import the ProfileScreen
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class SettingScreen extends StatelessWidget {
//   SettingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kWhiteColor,
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             'Setting',
//             style: TextStyle(
//                 color: Colors.green[900],
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 32),
//         child: Column(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 Navigator.pushNamed(context, 'ProfileScreen'); // Navigate to ProfileScreen
//               },
//               child: ListTile(
//                 leading: Icon(
//                   Icons.person,
//                   color: kPrimaryColor,
//                 ),
//                 title: Text(
//                   'Your Profile',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.pushNamed(context, 'WhoAreUsScreen');
//               },
//               child: ListTile(
//                 leading: Icon(
//                   Icons.info,
//                   color: kPrimaryColor,
//                 ),
//                 title: Text(
//                   'About US',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.pushNamed(context, 'ContactUsScreen');
//               },
//               child: ListTile(
//                 leading: Icon(
//                   Icons.email,
//                   color: kPrimaryColor,
//                 ),
//                 title: Text(
//                   'Contact Us',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 // Add any logout logic here if needed
//                 Navigator.pushNamed(context, 'LoginPage'); // Navigate to LoginScreen
//               },
//               child: ListTile(
//                 leading: Icon(
//                   Icons.logout,
//                   color: kPrimaryColor,
//                 ),
//                 title: Text(
//                   'Log Out',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//             Container(
//               height: 300,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Icon(
//                   FontAwesomeIcons.twitter,
//                   color: kPrimaryColor,
//                 ),
//                 Icon(
//                   FontAwesomeIcons.linkedin,
//                   color: kPrimaryColor,
//                 ),
//                 Icon(
//                   FontAwesomeIcons.facebook,
//                   color: kPrimaryColor,
//                 ),
//                 Icon(
//                   FontAwesomeIcons.instagram, // Correct Instagram icon
//                   color: kPrimaryColor,
//                 ),
//                 Icon(
//                   FontAwesomeIcons.whatsapp, // Added WhatsApp icon
//                   color: kPrimaryColor,
//                 ),
                
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }







// import 'package:flutter/material.dart';
// import 'package:graduate_project/constants.dart';
// import 'package:graduate_project/screens/signup_screen.dart';
// import 'package:graduate_project/screens/profile_screen.dart'; // Import the ProfileScreen
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:url_launcher/url_launcher.dart'; // Import for launching URLs

// class SettingScreen extends StatelessWidget {
//   SettingScreen({super.key});

//   // Function to launch URLs
//   void _launchURL(String url) async {
//     final Uri uri = Uri.parse(url);
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri, mode: LaunchMode.externalApplication);
//     } else {
//       print('Could not launch $url');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kWhiteColor,
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             'Setting',
//             style: TextStyle(
//                 color: Colors.green[900],
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 32),
//         child: Column(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 Navigator.pushNamed(
//                     context, 'ProfileScreen'); // Navigate to ProfileScreen
//               },
//               child: ListTile(
//                 leading: Icon(
//                   Icons.person,
//                   color: kPrimaryColor,
//                 ),
//                 title: Text(
//                   'Your Profile',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.pushNamed(context, 'WhoAreUsScreen');
//               },
//               child: ListTile(
//                 leading: Icon(
//                   Icons.info,
//                   color: kPrimaryColor,
//                 ),
//                 title: Text(
//                   'About Us',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.pushNamed(context, 'ContactUsScreen');
//               },
//               child: ListTile(
//                 leading: Icon(
//                   Icons.email,
//                   color: kPrimaryColor,
//                 ),
//                 title: Text(
//                   'Contact Us',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 // Add any logout logic here if needed
//                 Navigator.pushNamed(
//                     context, 'LoginPage'); // Navigate to LoginScreen
//               },
//               child: ListTile(
//                 leading: Icon(
//                   Icons.logout,
//                   color: kPrimaryColor,
//                 ),
//                 title: Text(
//                   'Log Out',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//             SizedBox(height: 40), // Space before social icons
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 IconButton(
//                   icon: Icon(FontAwesomeIcons.twitter, color: kPrimaryColor),
//                   onPressed: () => _launchURL('https://twitter.com/'),
//                 ),
//                 IconButton(
//                   icon: Icon(FontAwesomeIcons.linkedin, color: kPrimaryColor),
//                   onPressed: () => _launchURL('https://linkedin.com/'),
//                 ),
//                 IconButton(
//                   icon: Icon(FontAwesomeIcons.facebook, color: kPrimaryColor),
//                   onPressed: () => _launchURL('https://facebook.com/'),
//                 ),
//                 IconButton(
//                   icon: Icon(FontAwesomeIcons.instagram, color: kPrimaryColor),
//                   onPressed: () => _launchURL('https://instagram.com/'),
//                 ),
//                 IconButton(
//                   icon: Icon(FontAwesomeIcons.whatsapp, color: kPrimaryColor),
//                   onPressed: () => _launchURL('https://whatsapp.com/'),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:graduate_project/constants.dart';
import 'package:graduate_project/screens/signup_screen.dart';
import 'package:graduate_project/screens/profile_screen.dart'; // Import the ProfileScreen
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart'; // Import for launching URLs

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  // Function to launch URLs
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      // Successfully launched
    } else {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Setting',
            style: TextStyle(
              color: Colors.green[900],
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.person, color: kPrimaryColor),
              title: Text('Your Profile',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                if (context.mounted) {
                  Navigator.pushNamed(context, 'ProfileScreen');
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.info, color: kPrimaryColor),
              title: Text('About Us',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                if (context.mounted) {
                  Navigator.pushNamed(context, 'WhoAreUsScreen');
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.email, color: kPrimaryColor),
              title: Text('Contact Us',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                if (context.mounted) {
                  Navigator.pushNamed(context, 'ContactUsScreen');
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: kPrimaryColor),
              title: Text('Log Out',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                if (context.mounted) {
                  Navigator.pushNamed(context, 'LoginPage');
                }
              },
            ),
            SizedBox(height: 40), // Space before social icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSocialIcon(
                    FontAwesomeIcons.twitter, 'https://twitter.com/'),
                _buildSocialIcon(
                    FontAwesomeIcons.linkedin, 'https://linkedin.com/'),
                _buildSocialIcon(
                    FontAwesomeIcons.facebook, 'https://facebook.com/'),
                _buildSocialIcon(
                    FontAwesomeIcons.instagram, 'https://instagram.com/'),
                _buildSocialIcon(
                    FontAwesomeIcons.whatsapp, 'https://whatsapp.com/'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget to create social media icons with links
  Widget _buildSocialIcon(IconData icon, String url) {
    return IconButton(
      icon: Icon(icon, color: kPrimaryColor),
      onPressed: () => _launchURL(url),
    );
  }
}
