import 'package:flutter/material.dart';
import 'package:movies_app/data/remote/responses/tv_shows_response.dart';
import 'package:sizer/sizer.dart';
import 'package:movies_app/core/screens.dart' as screens;

import '../../business_logic/app_cubit.dart';
import '../style/colors.dart';
import '../widgets/default_network_image.dart';

class TvItem extends StatelessWidget {
  const TvItem({Key? key, required this.tvModel}) : super(key: key);
  final TvResults tvModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, screens.tvShowsDetailsScreen,
            arguments: tvModel);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20.sp),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                tvModel.name,
                style: TextStyle(
                  color: lightRed,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(top: 2.h, bottom: 1.h),
                child: DefaultNetworkImage(
                    imageUrl: AppCubit.get(context)
                        .imageUrl(imagePath: tvModel.posterPath)),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    tvModel.overview,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
