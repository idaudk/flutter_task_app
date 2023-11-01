import 'package:flutter/material.dart';

import '../../resources/reources.dart';

class Button extends StatelessWidget {
  String text;
  final Function()? onTap;
  final Color bgColor;
  final Color txtColor;
  Button({
    required this.text,
    required this.onTap,
    this.bgColor = ColorManager.cyan,
    this.txtColor = ColorManager.white,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: AppSize.s12.h),
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(AppSize.s50.r)),
        width: double.infinity,
        child: Text(
          text,
          style: context.textTheme.bodyMedium!.copyWith(color: txtColor),
        ),
      ),
    );
  }
}