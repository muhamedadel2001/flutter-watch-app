import 'package:flutter/material.dart';
import 'package:movies_app/data/remote/responses/tv_shows_response.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/app_cubit.dart';
import '../../style/colors.dart';
import '../../widgets/default_apppar.dart';
import '../../widgets/default_network_image.dart';

class TvShowsDetails extends StatelessWidget {
  final TvResults tvModel;
  const TvShowsDetails({Key? key, required this.tvModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: DefaultAppPar(title: tvModel.name),
      body: Stack(
        children: [
          Container(
            decoration:  const BoxDecoration(
                gradient: LinearGradient(
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                  colors: [black, darkRed, black],
                )),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Padding(
                      padding:
                      EdgeInsetsDirectional.only(top: 2.h, bottom: 1.h),
                      child: DefaultNetworkImage(
                        imageUrl: AppCubit.get(context)
                            .imageUrl(imagePath: tvModel.backdropPath),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          textAlign: TextAlign.center,
                          tvModel.overview,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: white,
                          ),
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );;
  }
}
