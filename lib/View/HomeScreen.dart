import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realestate/View/PropertyDetailScreen.dart';
import 'package:realestate/ViewModel/AuthProvider.dart';
import 'package:realestate/constants/constants.dart';
import 'package:sizer/sizer.dart';

import '../Widgets/HomeFeaturedWidget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECF9F0),
      appBar: AppBar(
        backgroundColor: Color(0xffECF9F0),
        leading: CircleAvatar(
          backgroundColor: kPrimaryColor,
        ),
        title: Column(
          children: [
            Text(
              'Welcome to Al Kareem City',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              context.read<LoginProvider>().userObject.data!.name ?? '',
              style: Theme.of(context).textTheme.headlineSmall,
            )
          ],
        ),
        actions: [
          Badge(
              child: Icon(
            Icons.notifications_none,
            color: Colors.black,
          )),
          SizedBox(
            width: 2.w,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
              child: PageView.builder(
                  controller: PageController(viewportFraction: 0.6),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PropertyDetailScreen()),
                        );
                        // Navigator.pushNamed(context, PropertyDetailScreen.routename);
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: 50.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: const AssetImage(
                                        'Assets/unsplash_hHz4yrvxwlA.png'))),
                            child: Align(
                              alignment: Alignment(-0.1.w, 0.6),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Block Malik',
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '120 sq. yards',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'West Open',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 1.h,
                              right: 15.w,
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: Text(
                'Featured',
                style: TextStyle(color: Colors.black, fontSize: 14.sp),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: Wrap(
                  spacing: 6.w,
                  runSpacing: 3.h,
                  children: [
                    HomeFeaturedWidget(
                      imagePath: 'Assets/emailIcon.png',
                      title: 'AlKareem\nfacility',
                    ),
                    HomeFeaturedWidget(
                      imagePath: 'Assets/form.png',
                      title: 'Forms',
                    ),
                    HomeFeaturedWidget(
                      imagePath: 'Assets/Map.png',
                      title: 'Maps',
                    ),
                    HomeFeaturedWidget(
                      imagePath: 'Assets/gallery.png',
                      title: 'Gallery',
                    ),
                    HomeFeaturedWidget(
                      imagePath: 'Assets/Complaints.png',
                      title: 'Complaints',
                    ),
                    HomeFeaturedWidget(
                      imagePath: 'Assets/WaterBill.png',
                      title: 'Water Bill',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: Text(
                'Want to Pay Instalment?',
                style: TextStyle(color: Colors.black, fontSize: 14.sp),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.w)),
                margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('Make Instalment Easier.',
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        Text(
                            'Pay Money quickly and securely\nwith two simple clicks in our app.',
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w300))
                      ],
                    ),
                    Image.asset(
                      'Assets/image 12.png',
                      height: 10.h,
                    )
                  ],
                )),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
