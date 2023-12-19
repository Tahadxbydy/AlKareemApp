import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realestate/ViewModel/AuthProvider.dart';

import 'package:sizer/sizer.dart';

import '../../Utills/AuthTockenFunctions.dart';
import '../../Widgets/PhotoWidget.dart';
import '../../Widgets/ProfileTile.dart';
import 'AccountScreen.dart';
import 'HelpCenter.dart';
import 'MyRentScreen.dart';
import 'NotificationScreen.dart';
import 'PaymentsScreen.dart';
import 'SecurityScreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static const routename = 'ProfileScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image.asset('Assets/House.png'),
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 2.h,
              ),
              // InkWell(
              //     onTap: () {
              //       // Navigator.pushNamed(context, AccountScreen.routename);
              //       // Navigator.push(
              //       //   context,
              //       //   MaterialPageRoute(
              //       //       builder: (context) => const AccountScreen()),
              //       // );
              //     },
              //     child: Image.asset('Assets/Group 43.png')),
              ProfilePhotoWidget(),
              SizedBox(
                height: 2.h,
              ),
              Text(
                context.read<LoginProvider>().userObject.data!.name ?? '',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: double.infinity,
                height: 0.11.h,
                color: Colors.grey,
              ),
              ProfileTiles(
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyRentScreen()),
                  );
                },
                title: 'Due Date',
                icon: Icons.calendar_month_outlined,
              ),
              ProfileTiles(
                  ontap: () {
                    // Navigator.pushNamed(context, PaymentssScreen.routename);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentssScreen()),
                    );
                  },
                  title: 'Payments',
                  icon: Icons.wallet),
              Container(
                width: double.infinity,
                height: 0.11.h,
                color: Colors.grey,
              ),
              ProfileTiles(
                ontap: () {
                  // Navigator.pushNamed(context, AccountScreen.routename);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AccountScreen()),
                  );
                },
                title: 'Profile',
                icon: Icons.calendar_month_outlined,
              ),
              ProfileTiles(
                  ontap: () {
                    // Navigator.pushNamed(context, NotificationScreen.routename);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationScreen()),
                    );
                  },
                  title: 'Notification',
                  icon: Icons.wallet),
              ProfileTiles(
                ontap: () {
                  // Navigator.pushNamed(context, SecurityScreen.routename);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecurityScreen()),
                  );
                },
                title: 'Security',
                icon: Icons.shield_outlined,
              ),
              ProfileTiles(
                ontap: () {
                  // Navigator.pushNamed(context, HelpcenterScreen.routename);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HelpcenterScreen()),
                  );
                },
                title: 'Help center',
                icon: Icons.question_mark_rounded,
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0.1),
                child: InkWell(
                  onTap: () {
                    deleteAuthTocken(context);
                  },
                  child: ListTile(
                    tileColor: Colors.transparent,
                    leading: Icon(
                      Icons.login,
                      color: Colors.red,
                    ),
                    title: Text(
                      'Logout',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
