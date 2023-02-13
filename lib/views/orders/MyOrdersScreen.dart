import 'package:ffood/views/orders/OrdersEmptyScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../controllers/MainScreen/MainScreenController.dart';
import '../../controllers/orders/MyOrdersController.dart';
import '../../themecolor/ThemeColors.dart';
import '../../util/colors.dart';
import '../../util/get_storage_key.dart';
import '../../util/images.dart';
import '../../util/size_utils.dart';
import '../../widgets/big_text.dart';
import '../../widgets/order_screens_widgets/history_card.dart';
import '../../widgets/order_screens_widgets/my_order_card.dart';



import 'package:get_storage/get_storage.dart';

class MyOrdersScreen extends GetView<MyOrdersController>

{
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Get.lazyPut(() => MyOrdersController());

    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value:   SystemUiOverlayStyle(
          systemNavigationBarColor:  ThemeColors().mainBgColor  , // Navigation bar
          statusBarColor:  ThemeColors().statusBarColor,
          statusBarBrightness: GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  Brightness.dark : Brightness.light,
          statusBarIconBrightness: GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  Brightness.light : Brightness.dark

        // Status bar
      ),
      child: SafeArea(child: Scaffold(
          backgroundColor: ThemeColors().mainBgColor,
          body: SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
              GestureDetector(
              // onTap: navigateToHomeScreen,
              child: GestureDetector(
              onTap: (){

                if(controller.isFromSide.value)
                  {
                    Get.back();
                  }
                else
                  {
                    var cm = Get.find<MainScreenController>();

                    cm.navigationTapped(0);
                    cm.currentIndex.value = 0 ;
                    cm.currentIndex.refresh();
                  }


            },
              child: Container(
                width: 38,
                height: 38,
                margin: getMargin(left: 15),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration:  ShapeDecoration(
                    shadows: [
                      BoxShadow(
                        blurRadius: 4,
                        spreadRadius: 0,
                        offset: const Offset(0, 4),
                        color: Colors.black.withOpacity(0.25),
                      )
                    ],
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(10))),
                    color: ThemeColors().mainColor),
                // child:   Icon(Icons.arrow_back_ios, size: 15,color: blackColor),
                child:   Image.asset(Images.icBack,color: ThemeColors().lightDark,),
              ),
            ),
          ),
          SizedBox(width: 10,),
                      Expanded(child: Center(child: BigText(text: "My Orders",color: ThemeColors().kPrimaryTextColor,))),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 20.0.w),
                        child: Container(
                          height: 38.h,
                          width: 38.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(image: AssetImage(
                                "assets/sidemenuuser.png",
                              ),)
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width,
                    height: 55.h,
                    padding: EdgeInsets.all(3.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      border: Border.all(color: tabBorderColor),
                    ),
                    child: TabBar(
                        onTap: (index){
                          print(index);
                        },
                        indicator: BoxDecoration(
                            color: orangeColor,
                            borderRadius: BorderRadius.circular(25.0)),
                        // labelColor: orangeColor,
                        unselectedLabelColor: ThemeColors().kPrimaryTextColor,
                        controller: controller.tabController,
                        tabs: const [
                          Tab(
                            text: "Upcoming",
                          ),
                          Tab(
                            text: "History",
                          )
                        ]),
                  ),
                  controller.orders == 0 ?  const Expanded(child: OrdersEmptyScreen()):Expanded(
                    child: Container(
                      child: TabBarView(
                        controller: controller.tabController,
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: 3,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                    onTap: (){
                                      // navigateToOrderDetail();

                                    },
                                    child: MyOrderCard()),
                              )),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                                child: BigText(
                                  text: "Latest Orders",
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 3,
                                    itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                          child: HistoryCard()),
                                    )),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ))),
    );;
  }

}