import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../util/get_storage_key.dart';



class ThemeColors {
  var bottomFooterGradient = GetStorage().read(GetStorageKey.IS_DARK_MODE)
      ? [
          Colors.lightBlue,
          Colors.lightBlue.shade100,
        ]
      : [
          const Color(0xFF6200EE),
          Colors.deepPurple.shade300,
        ];



  var kPrimaryTextColor = GetStorage().read(GetStorageKey.IS_DARK_MODE)
      ? const Color(0xDDFFFFFF)
      : const Color(0xDD000000);
  var kSecondaryTextColor = GetStorage().read(GetStorageKey.IS_DARK_MODE)
      ? const Color(0x89FFFFFF)
      : const Color(0x89000000);

  var kSecondaryTextColorReverse = GetStorage().read(GetStorageKey.IS_DARK_MODE)
      ? const Color(0xDD393948)
      : const Color(0xDDFFFFFF);
  var kBlackColor = Colors.black;
  var kWhiteColor = Colors.white;

  var mainOrangeWhite = GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#FFFFFF') :  fromHex('#FC8019');

  var lightDark =  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#FFFFFF') :  fromHex('#000000');
  var darkLight =  !GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#FFFFFF') :  fromHex('#2D2D3A');
  var mainBgColor =  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#2D2D3A') :  fromHex('#FFFFFF');
  var mainColor =  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#393948') :  fromHex('#FFFFFF');
  var greyBlack =  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#393948') :  fromHex('#EEEEEE');
  var themeBlack =  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#000000') :  fromHex('#FFFFFF');
  var outline =  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#474755') :  fromHex('#5B5B5E');
  var shadow =  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#000000') :  fromHex('#BDBDBD');
  var tagBoxColor =  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#FC8019') :  fromHex('#F6F6F6');
  var tagBoxColorNew =  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#474755') :  fromHex('#474755');
  var heartshaepColor =  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#FFFFFF') :  fromHex('#FFFFFF');
  var heartbgColor =  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#000000') :  fromHex('#FC8019');
  var loginPageLabelColor =  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#FC8019') :  fromHex('#FFFFFF');


  var outline1 =  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#474755') :  fromHex('#FFFFFF');
  var drawerColor =  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#393948') :  fromHex('#FAFAFA');
  var statusBarColor =  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#2D2D3A') :  fromHex('#f8f8f8');

  /* Featured color */
    var featuredMainColor =  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#393948') :  fromHex('#FFFFFF');
  var featuredTagBoxColor =  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#474755') :  fromHex('#F6F6F6');


  var rprofileselected = GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#FC8019') :  fromHex('#FC8019');
  var rprofileunselected = GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#393948') :  fromHex('#FFFFFF');
  var orangeWhiteColorSelected = GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#000000') :  fromHex('#FFFFFF');
  var orangeWhiteColorunSelected = GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#FC8019') :  fromHex('#FC8019');

  /* Button Color*/

  var btnbgColorSelected = GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#FFFFFF') :  fromHex('#FC8019');
  var btnbgColorUnSelected = GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#FC8019') :  fromHex('#FC8019');
  var btntxtColorSelected = GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#FC8019') :  fromHex('#FC8019');
  var btntxtColorUnSelected = GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#FC8019') :  fromHex('#FC8019');


  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
