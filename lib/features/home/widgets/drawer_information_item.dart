import 'dart:io';
import 'package:expense_tracker/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerInformationItem extends StatelessWidget {
  final String? image;
  final String name;
  final String description;
  final VoidCallback onEditeTap;

  const DrawerInformationItem({
    super.key,
    this.image,
    required this.name,
    required this.description,
    required this.onEditeTap,
  });

  @override
  Widget build(BuildContext context) {
    ImageProvider imageProvider;

    if (image == null || image!.isEmpty) {
      imageProvider = const NetworkImage(
        "https://static.vecteezy.com/system/resources/thumbnails/032/176/197/small/business-avatar-profile-black-icon-man-of-user-symbol-in-trendy-flat-style-isolated-on-male-profile-people-diverse-face-for-social-network-or-web-vector.jpg",
      );
    } else if (image!.startsWith('http') || image!.startsWith('https')) {
      imageProvider = NetworkImage(image!);
    } else {
      imageProvider = FileImage(File(image!));
    }

    return Padding(
      padding: EdgeInsets.only(
        left: getWidth(12),
        right: getWidth(12),
        top: getHeight(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  height: getHeight(34),
                  width: getWidth(34),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 3, color: AppColors.warningDark),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: imageProvider,
                    ),
                  ),
                ),
                13.w.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(
                        text: name.isEmpty ? "No Name" : name,
                        fontSize: getSp(10),
                        color: AppColors.warningDark,
                        fontWeight: FontWeight.w900,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      CustomText(
                        text: description.isEmpty
                            ? "No Description"
                            : description,
                        fontSize: getSp(8),
                        color: AppColors.backgroundLight,
                        fontWeight: FontWeight.w400,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onEditeTap,
            icon: Icon(
              Icons.edit_outlined,
              size: getSp(25),
              color: AppColors.backgroundLight,
            ),
          ),
        ],
      ),
    );
  }
}
