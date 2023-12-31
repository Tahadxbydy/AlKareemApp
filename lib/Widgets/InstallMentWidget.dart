import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/constants.dart';

class InstallmentWidget extends StatelessWidget {
  InstallmentWidget({super.key, required this.title, required this.amount});

  final String title;
  final List<String> amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(
        color: kPrimaryColor,
      ))),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 30.w,
              child: Text(
                title,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.black,
                ),
              ),
            ),
            VerticalDivider(
              color: kPrimaryColor,
            ),
            Flexible(
              child: SizedBox(
                width: 30.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: amount
                      .map((item) => Text(
                            item,
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ))
                      .toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
