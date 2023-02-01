import 'package:ffood/themecolor/ThemeColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/MainScreen/HomeScreenController.dart';
import '../util/colors.dart';
import '../widgets/big_text.dart';
import '../widgets/home_listview_card.dart';

class HomeListView extends GetView<HomeScreenController>

{
  const HomeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: BigText(text: "All restaurants", size: 18,color: 0 == 1 ? ThemeColors().kPrimaryTextColor:ThemeColors().kPrimaryTextColor,),
        ),

        Container(
          // width: 43.w,
          // height: 69.h,
          // padding: const EdgeInsets.all(10).w,
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: HomeListViewCard(themeValue: 0,),
                  );
                })

        ),
      ],
    );
  }

}