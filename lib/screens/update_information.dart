import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/constants.dart';
import 'package:graduate_project/cubits/profile/profile_cubit.dart';
import 'package:graduate_project/cubits/profile/profile_state.dart';
import 'package:graduate_project/screens/signup_screen.dart';
import 'package:graduate_project/screens/splash_screen.dart';
import 'package:graduate_project/services/services_locator.dart';
import 'package:graduate_project/widgets/custom_button.dart';
import 'package:graduate_project/widgets/custom_hintfield.dart';
import 'package:graduate_project/widgets/custom_textfield.dart';
import 'package:graduate_project/widgets/short_textfield.dart';

class UpdateInformation extends StatefulWidget {
  @override
  State<UpdateInformation> createState() => _UpdateInformationState();
}

class _UpdateInformationState extends State<UpdateInformation> {
  @override
  void initState() {
    super.initState();
    ServicesLocator.profileCubit.initil();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
           
            SizedBox(height: 30), // Add space before the title text

            // Centered Title
            Center(
              child: Text(
                'Update Your Information',
                style: TextStyle(
                  fontSize: 24,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Adding space after the title text
            SizedBox(height: 20), // Add space after the title text

            // Change Cover Section
            Container(
              child: GestureDetector(
                onTap: () {
                  // Add your cover change logic here
                  print("Change Cover tapped!");
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image_outlined, size: 24, color: Colors.black),
                      SizedBox(height: 4),
                      Text(
                        "Change Cover",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Name and other details section
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('First Name'),
                    SizedBox(height: 5),
                    ShortTextfield(
                      controller: ServicesLocator.profileCubit.firstName,
                    ),
                    SizedBox(height: 10),
                    Text('Date Of Birth'),
                    SizedBox(height: 5),
                    CustomHintfield(
                      hinttext: 'mm/dd/yyyy',
                      controller: ServicesLocator.profileCubit.dobController,
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Last Name'),
                    SizedBox(height: 5),
                    ShortTextfield(
                      controller: ServicesLocator.profileCubit.lastName,
                    ),
                    SizedBox(height: 10),
                    Text('Gender'),
                    SizedBox(height: 5),
                    ShortTextfield(
                      controller: ServicesLocator.profileCubit.gender,
                    ),
                  ],
                ),
              ],
            ),

            // Contact details section
            SizedBox(height: 10),
            Text(
              'Phone',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 5),
            CustomTextfield(
              hinttext: 'Phone Number',
              controller: ServicesLocator.profileCubit.phoneController,
            ),
            SizedBox(height: 10),
            Text(
              'Email',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 5),
            CustomTextfield(
              hinttext: 'Example@email.com',
              controller: ServicesLocator.profileCubit.emailConttroller,
            ),
            SizedBox(height: 10),
            Text(
              'Password',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 5),
            CustomTextfield(
              hinttext: 'At least 8 characters',
              controller: ServicesLocator.profileCubit.passwordController,
            ),

            // Update button
            SizedBox(height: 20),
            CustomButton(
              title: 'Update Your Data',
              onTap: () {
                ServicesLocator.profileCubit.updateProfile();
              },
            ),
            SizedBox(height: 10),
            BlocListener<ProfileCubit, ProfileState>(
              listener: (context, state) {
                if (state.profileStateStatus ==
                    ProfileStateStatus.updateLoading) {
                  showLoadingDialog(context);
                }
                if (state.profileStateStatus ==
                    ProfileStateStatus.updateSucess) {
                  Navigator.pop(context);

                  Navigator.pop(context);
                }
                if (state.profileStateStatus == ProfileStateStatus.updateError) {
                  Navigator.pop(context);
                  showToast(msg: state.errorMessage!);
                }
              },
              child: SizedBox.shrink(),
            ),

            // Adding space after the button
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
