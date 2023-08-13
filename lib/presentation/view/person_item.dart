import 'package:flutter/material.dart';
import 'package:movies_app/data/remote/responses/persons_response.dart';
import 'package:sizer/sizer.dart';

import '../../business_logic/app_cubit.dart';
import '../style/colors.dart';
import '../widgets/default_network_image.dart';

class PersonItem extends StatelessWidget {
  final PersonsResults personModel;
  const PersonItem({Key? key, required this.personModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              personModel.name,
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
                      .imageUrl(imagePath: personModel.profilePath)),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  personModel.knownForDepartment,
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
    );
  }
}
