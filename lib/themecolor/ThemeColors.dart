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

  var mainOrangeWhite = GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#FFFFFF') :  fromHex('#FC8019');

  var lightDark =  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#FFFFFF') :  fromHex('#000000');
  var darkLight =  !GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#FFFFFF') :  fromHex('#2D2D3A');
  var mainBgColor =  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#2D2D3A') :  fromHex('#FFFFFF');
  var mainColor =  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#393948') :  fromHex('#FFFFFF');
  var greyBlack =  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#393948') :  fromHex('#EEEEEE');
  var outline =  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#474755') :  fromHex('#5B5B5E');
  var shadow =  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#000000') :  fromHex('#BDBDBD');
  var tagBoxColor =  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#FC8019') :  fromHex('#F6F6F6');
  var heartshaepColor =  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#FC8019') :  fromHex('#FFFFFF');
  var loginPageLabelColor =  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#FC8019') :  fromHex('#FFFFFF');


  var outline1 =  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#474755') :  fromHex('#FFFFFF');
  var drawerColor =  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#393948') :  fromHex('#FAFAFA');
  var statusBarColor =  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#2D2D3A') :  fromHex('#f8f8f8');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
