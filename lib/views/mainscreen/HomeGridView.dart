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
        SizedBox(height: 15,),

        Container(
          width: size.width,
          height: 250,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.name.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GestureDetector(
                    onTap: () => Get.toNamed(Routes.restaurantprofileScreen),
                    child: const FeatureResturantContainer(themeValue: 0,)),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: BigText(
            text: "Popular items",
            size: 18,
            color: Colors.black,
          ),
        ),
        Container(
          // width: ScreenUtil().screenWidth,
          height:280,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controller.popularItemName.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => print(""),
              child: PopularItemCard(name: controller.popularItemName[index], details: controller.popularItemDetails[index], rating: controller.popularItemRating[index], reviewsCount: controller.popularItemReviewCount[index],imageUrl: controller.popularItemImageUrl[index], price: controller.popularItemPrice[index], themeValue: 0, ),
            ),
          ),
        )
      ],
    );
  }

}