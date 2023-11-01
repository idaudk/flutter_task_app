import 'package:flutter/widgets.dart';
import 'package:task_app/ui/widgets/gap.dart';

import '../../resources/reources.dart';

class sliderPath extends StatelessWidget {
  const sliderPath({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          height: AppSize.s15.h,
          decoration: BoxDecoration(
              color: ColorManager.cyan.withOpacity(0.3),
              borderRadius: BorderRadius.circular(AppSize.s4.r)),
        )),
        Gap(AppSize.s5.w),
        Expanded(
            child: Container(
          height: AppSize.s15.h,
          decoration: BoxDecoration(
              color: ColorManager.cyan.withOpacity(0.3),
              borderRadius: BorderRadius.circular(AppSize.s4.r)),
        )),
        Gap(AppSize.s5.w),
        Expanded(
            child: Container(
          height: AppSize.s15.h,
          decoration: BoxDecoration(
              color: ColorManager.cyan.withOpacity(0.3),
              borderRadius: BorderRadius.circular(AppSize.s4.r)),
        )),
        Gap(AppSize.s5.w),
        Expanded(
            child: Container(
          height: AppSize.s15.h,
          decoration: BoxDecoration(
              color: ColorManager.cyan.withOpacity(0.3),
              borderRadius: BorderRadius.circular(AppSize.s4.r)),
        )),
        Gap(AppSize.s5.w),
        Expanded(
            child: Container(
          height: AppSize.s15.h,
          decoration: BoxDecoration(
              color: ColorManager.cyan.withOpacity(0.3),
              borderRadius: BorderRadius.circular(AppSize.s4.r)),
        ))
      ],
    );
  }
}