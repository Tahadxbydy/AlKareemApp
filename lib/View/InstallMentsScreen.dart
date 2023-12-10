import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Widgets/InstallmentsTile.dart';
import '../constants/constants.dart';

class InstallMentsScreen extends StatelessWidget {
  const InstallMentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
        
          children: [
      
            SizedBox(child: Padding(
                       padding:  EdgeInsets.only(top:10.w, right: 6.w,left: 6.w, bottom: 2.h),

              child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Installment',style: TextStyle(color:  Colors.white,fontSize: 25.sp),),Image.asset('Assets/image 20.png',height: 8.h,)],),
                  Text('Owner, Muhammad Kareem',style: TextStyle(color:  Colors.white,fontSize: 10.sp),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Amount to be paid :',style: TextStyle(color:  Colors.white,fontSize: 13.sp,fontWeight: FontWeight.bold),),
                                      SizedBox(height: 10.h,),
                                      Text('45,0000',style: TextStyle(color:  Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                  
                  ],
              ),
            ),),
           
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 2.h),
                decoration: BoxDecoration(
                      color:Colors.white,
                    borderRadius: BorderRadius.only( topLeft: Radius.circular(10.w),topRight: Radius.circular(10.w) )),
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context,index){
                      
                      return InstallmentsTile();
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}