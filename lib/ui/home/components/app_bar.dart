  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_app/ui/widgets/gap.dart';

import '../../resources/reources.dart';

Widget Appbar(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.sun_haze,
              color: ColorManager.cyan,
              size: AppSize.s25.r,
            ),
            Gap(AppSize.s5.w),
            Text('Fri 30 Jun', style: context.textTheme.titleMedium)
          ],
        )),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.settings,
                ),
                color: ColorManager.cyan,
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        ColorManager.white), // Set the background color
                    shape: MaterialStateProperty.all(CircleBorder())),
                onPressed: () {},
              ),
            ],
          ),
        )
      ],
    );
  }