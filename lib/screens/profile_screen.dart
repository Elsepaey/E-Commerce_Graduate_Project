import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/constants.dart';
import 'package:graduate_project/cubits/profile/profile_cubit.dart';
import 'package:graduate_project/cubits/profile/profile_state.dart';
import 'package:graduate_project/screens/cache/cache_helper.dart';
import 'package:graduate_project/screens/signup_screen.dart';
import 'package:graduate_project/widgets/custom_navigationbar.dart';
import 'package:graduate_project/widgets/custom_shortbutton.dart';
import 'package:dio/dio.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, state) =>
          state.profileStateStatus == ProfileStateStatus.loading ||
          state.profileStateStatus == ProfileStateStatus.sucess ||
          state.profileStateStatus == ProfileStateStatus.error ||
          state.profileStateStatus == ProfileStateStatus.updateSucess,
      builder: (context, state) {
        if (state.profileStateStatus == ProfileStateStatus.loading) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                value: 2,
                color: Colors.green,
              ),
            ),
          );
        }
        if (state.profileStateStatus == ProfileStateStatus.error) {
          return Scaffold(
            body: Center(child: Text('I have some probleam...')),
          );
        }
        if (state.profileStateStatus == ProfileStateStatus.sucess ||
            state.profileStateStatus == ProfileStateStatus.updateSucess) {
          print('yesssssssssssss');
          return Scaffold(
            // backgroundColor: whiteColor,
            appBar: AppBar(
              backgroundColor: kWhiteColor,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  ClipOval(
                      child: Center(
                    child: ClipOval(
                      child: state.profileResponseModel!.image != null
                          ? Image.network(
                              state.profileResponseModel!.image!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              'https://th.bing.com/th/id/OIP.hGSCbXlcOjL_9mmzerqAbQHaHa?rs=1&pid=ImgDetMain',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                    ),
                  )),
                  Center(
                    child: Text(
                      state.profileResponseModel!.firstName!,
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  //TODO
                  Text(
                    'About',
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 24,
                    ),
                  ),

                  ListTile(
                    leading: Icon(
                      Icons.person,
                      color: kPrimaryColor,
                    ),
                    title: Text(
                      state.profileResponseModel!.gender == 'M'
                          ? 'Male'
                          : 'Female',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.calendar_month,
                      color: kPrimaryColor,
                    ),
                    title: Text(
                      state.profileResponseModel!.date!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.email,
                      color: kPrimaryColor,
                    ),
                    title: Text(
                      state.profileResponseModel!.email!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: kPrimaryColor,
                    ),
                    title: Text(
                      state.profileResponseModel!.phone!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, 'ChangeyourPasswordScreen');
                        },
                        child: CustomShortbutton(title: 'Change Password')),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'UpdateInformation');
                        },
                        child: CustomShortbutton(title: 'UPdate Your Data')),
                  ]),

                  Container(height: 100),

                  //CustomNavigationBar()
                ],
              ),
            ),
          );
        }
        return Scaffold();
      },
    );
  }
}
