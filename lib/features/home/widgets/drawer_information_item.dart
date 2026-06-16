import 'package:expense_tracker/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerInformationItem extends StatelessWidget {
  final String? image;
  final String name;
  final String description;
  const DrawerInformationItem({
    super.key,
    this.image,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: getWidth(12),
        right: getWidth(12),
        top: getHeight(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Row(
              children: [
                Container(
                  height: getHeight(34),
                  width: getWidth(34),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: BoxBorder.all(
                      width: 3,
                      color: AppColors.warningDark,
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        image ??
                            "https://static.vecteezy.com/system/resources/thumbnails/032/176/197/small/business-avatar-profile-black-icon-man-of-user-symbol-in-trendy-flat-style-isolated-on-male-profile-people-diverse-face-for-social-network-or-web-vector.jpg",
                      ),
                    ),
                  ),
                ),
                13.w.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: name,
                      fontSize: getSp(13),
                      color: AppColors.warningDark,
                      fontWeight: FontWeight.w900,
                    ),
                    CustomText(
                      text: description,
                      fontSize: getSp(8),
                      color: AppColors.backgroundLight,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(Icons.edit_outlined, size: getSp(25), color: AppColors.backgroundLight),
        ],
      ),
    );
  }
}
