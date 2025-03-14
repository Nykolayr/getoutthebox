import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:getoutofthebox/core/utils/size_utils.dart';

class SubscriptionOffers extends StatelessWidget {
  const SubscriptionOffers({
    super.key,
    required this.title,
    required this.price,
  });
  final String title;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getMarginOrPadding(horizontal: 8),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: StyleManager.blocColor,
          ),
          child: Padding(
            padding: getMarginOrPadding(
              horizontal: 16,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: TextStylesManager.drawerText,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  price,
                  style: TextStylesManager.drawerPrice,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
