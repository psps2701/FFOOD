import 'package:ffood/Route/Routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../controllers/MainScreen/HomeScreenController.dart';
import '../../util/colors.dart';
import '../../util/size_utils.dart';
import '../../widgets/big_text.dart';
import '../../widgets/dish_container_box.dart';
import '../../widgets/popular_item_card.dart';
import '../../widgets/small_text.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeGridView extends GetView<HomeScreenController>

{
  const HomeGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BigText(
                text: "Featured Restaurants",
                size: 18,
                color: true? Colors.black:Color(0xFF332b2b),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 22.0),
                child: Row(
                  children: [
                    SmallText(
                      text: "View All",
                      size: 16,
                      color: orangeColor,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: orangeColor,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 15,),
        controller.homeResposneModel.value.data!.featuredRestaurants!.isNotEmpty ?
        Container(
          width: size.width,
          height: 240.h,

          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.homeResposneModel.value.data!.featuredRestaurants!.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GestureDetector(
                    onTap: () => Get.toNamed(Routes.restaurantProfileScreen),
                    child: FeatureResturantContainer(themeValue: 0,)),
              )),
        ):Container(),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: BigText(
            text: "Popular items",
            size: 18,
            color: Colors.black,
          ),
        ),
        controller.homeResposneModel.value.data!.popularItems!.isNotEmpty ?
        Container(
          // width: ScreenUtil().screenWidth,
          height:280,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controller.homeResposneModel.value.data!.popularItems!.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => print(""),
              child: PopularItemCard(name: controller.homeResposneModel.value.data!.popularItems![index].name.toString(), details: controller.homeResposneModel.value.data!.popularItems![index].name.toString(), rating: controller.homeResposneModel.value.data!.popularItems![index].name.toString(), reviewsCount: controller.homeResposneModel.value.data!.popularItems![index].price.toString(),imageUrl: controller.homeResposneModel.value.data!.popularItems![index].image.toString(), price: controller.homeResposneModel.value.data!.popularItems![index].price.toString(), themeValue: 0, ),
            ),
          ),
        ):Container()
      ],
    );
  }

}