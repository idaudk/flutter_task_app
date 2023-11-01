import 'package:flutter/material.dart';
import 'package:task_app/ui/widgets/gap.dart';

import '../../resources/color_manager.dart';
import '../../resources/reources.dart';

class MoodCounter extends StatelessWidget {
  int counterValue;
  IconData icon;
  Color titleColor;
  MoodCounter({
    required this.counterValue,
    required this.icon,
    this.titleColor = ColorManager.cyan,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: EdgeInsets.symmetric(
          vertical: AppSize.s20.h, horizontal: AppSize.s10.w),
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(AppSize.s17.r)),
      child: Row(
        children: [
          Text(
            counterValue.toString(),
            style: context.textTheme.displayMedium!.copyWith(color: titleColor),
          ),
          Gap(AppSize.s5.w),
          Text(
            'happy days\nthis week',
            style:
                context.textTheme.bodySmall!.copyWith(fontSize: FontSize.s9.sp),
          ),
          Gap(AppSize.s5.w),
          Icon(
            icon,
            color: ColorManager.yellow,
            size: AppSize.s30.r,
          )
        ],
      ),
    ));
  }
}
