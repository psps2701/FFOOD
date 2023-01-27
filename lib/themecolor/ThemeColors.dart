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
  var kBlackColor = Colors.black;


  var lightDark =  GetStorage().read(GetStorageKey.IS_DARK_MODE) ?  fromHex('#FFFFFF') :  fromHex('#000000');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
