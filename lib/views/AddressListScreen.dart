import 'package:ffood/Route/Routes.dart';
import 'package:ffood/controllers/AddressScreenController.dart';
import 'package:ffood/controllers/WelcomeController.dart';
import 'package:ffood/widgets/address_list_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controllers/AddressListScreenController.dart';
import '../util/app_colors.dart';
import '../util/colors.dart';
import '../util/size_utils.dart';
import '../widgets/back_button.dart';
import '../widgets/big_text.dart';
import '../widgets/dish_container_box.dart';


class AddressListScreen extends GetView<AddressListController>

{
  const AddressListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value:   SystemUiOverlayStyle(
          systemNavigationBarColor: AppColors.white, // Navigation bar
          statusBarColor: AppColors.statusBarGrey,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark
          // Status bar
      ),
      child: SafeArea(child: Scaffold(body: Container(
        width: size.width,
        height: size.height,
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: CustomBackButton()),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14.0),
                  child: BigText(text: "Delivery Address"),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      height: 38.h,
                      width: 38.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.r),
                          child: Image.asset("assets/sidemenuuser.png")),
                    )),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(

              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: controller.name.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                        onTap: () => Get.toNamed(Routes.restaurantprofileScreen),
                        child: AddressItemCard(name: controller.name[index],
                          details: controller.details[index],
                          rating: controller.rating[index],
                          reviewsCount: controller.reviewCount[index],
                          imageUrl: controller.imageUril[index],
                          price: controller.price[index],themeValue: 0,),),
                  )),
            ),
            SizedBox(
              height: 30.h,
            ),
            GestureDetector(
              onTap: () => Get.toNamed(Routes.addressScreen),

              child: Container(
                  width: 120.w,
                  height: 70.h,
                  // height: MediaQuery.of(context).size.height * 0.06,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration:  ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(100.r))),
                      color: orangeColor),
                  child: BigText(text: "Add New Address",size: 15.sp, color: Colors.white,)

                // Text(
                //   'LOGIN',
                //   style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height/50),
                // ),
              ),
            ),
          ],
        ),
        ),
      ),),
    );;
  }

}