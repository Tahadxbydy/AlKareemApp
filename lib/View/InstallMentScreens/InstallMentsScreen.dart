import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realestate/ViewModel/AuthProvider.dart';
import 'package:sizer/sizer.dart';

import '../../ViewModel/UserPaymentProvider.dart';
import '../../Widgets/InstallmentsTile.dart';
import '../../constants/constants.dart';

class InstallMentsScreen extends StatelessWidget {
  const InstallMentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              child: Padding(
                padding: EdgeInsets.only(
                    top: 10.w, right: 6.w, left: 6.w, bottom: 2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Installment',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 25.sp),
                            ),
                            Image.asset(
                              'Assets/image 20.png',
                              height: 8.h,
                            )
                          ],
                        ),
                      ],
                    ),
                    Consumer<LoginProvider>(builder: (_, provider, __) {
                      return Text(
                        'Owner: ${provider.userObject.data!.name}',
                        style: TextStyle(color: Colors.white, fontSize: 10.sp),
                      );
                    }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Amount to be paid :',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Consumer<UserPaymentProvider>(
                            builder: (_, provider, __) {
                          return provider.isLoading
                              ? CircularProgressIndicator()
                              : Text(
                                  provider.tolatPayment.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold),
                                );
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 2.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.w),
                        topRight: Radius.circular(10.w))),
                child:
                    Consumer<UserPaymentProvider>(builder: (_, provider, __) {
                  if (provider.isLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (provider.paymentsList!.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Image.asset('Assets/Group 4031.png'),
                      ),
                    );
                  } else {
                    return RefreshIndicator(
                      onRefresh: () async {
                        await context
                            .read<UserPaymentProvider>()
                            .getPayments(context);
                      },
                      child: ListView.builder(
                          itemCount: provider.paymentsList!.length,
                          itemBuilder: (context, index) {
                            final currentPlan = provider.paymentsList![index];
                            return currentPlan.firstPendingPayment == null
                                ? InactiveInstallmentsTile(
                                    message: currentPlan.message ?? '',
                                    plotNumber: currentPlan.plotNumber ?? '',
                                  )
                                : InstallmentsTile(
                                    planId: currentPlan.sId!,
                                    dueDate: currentPlan
                                        .firstPendingPayment!.dueDate!,
                                    plotNumber: currentPlan.plotNumber ?? '',
                                    installmentNumber: currentPlan
                                            .firstPendingPayment!
                                            .installmentNumber ??
                                        0,
                                    amount: currentPlan
                                            .firstPendingPayment!.amount ??
                                        0,
                                  );
                          }),
                    );
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
