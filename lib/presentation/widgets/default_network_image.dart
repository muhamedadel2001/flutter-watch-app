import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DefaultNetworkImage extends StatelessWidget {
  final double? height;
  final double? width;
  final String imageUrl;
  final BoxFit? boxFit;

  const DefaultNetworkImage(
      {Key? key, this.height, this.width, required this.imageUrl, this.boxFit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isNotEmpty) {
      return Image.network(
        imageUrl,
        height: height,
        width: width,
        fit: boxFit,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return Padding(
              padding: EdgeInsets.all(2.sp),
              child: CircularProgressIndicator(
                  strokeWidth: 4.w,
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null),
            );
          }
        },
        errorBuilder: (context, error, stack) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error,
                  size: 75.sp,
                  color: Colors.red,
                )
              ],
            ),
          );
        },
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              size: 75.sp,
              color: Colors.red,
            )
          ],
        ),
      );
    }
  }
}
