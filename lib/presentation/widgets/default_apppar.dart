import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../style/colors.dart';

class DefaultAppPar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(6.h);
  final String title;
  
  const DefaultAppPar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: darkRed,
      centerTitle: true,
      elevation: 10,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
        ),
      ),
    );
  }
}
