import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/blocs/mood_reason_bloc/mood_reason_bloc.dart';
import 'package:task_app/routes/route_generator.dart';
import 'package:task_app/ui/mood/mood_screen.dart';
import 'package:task_app/ui/widgets/gap.dart';

import '../resources/reources.dart';

class MoodReasonScreen extends StatelessWidget {
  const MoodReasonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppSize.s20.w, vertical: AppSize.s20.h),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorManager.gradient1, ColorManager.gradient2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.chevron_left_sharp,
                  ),
                  color: ColorManager.cyan,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          ColorManager.white), // Set the background color
                      shape: MaterialStateProperty.all(const CircleBorder())),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text('Fri 30 Jun', style: context.textTheme.titleMedium)
              ],
            ),
            // Gap(AppSize.s70.h),
            const Expanded(child: Gap(0)),
            // Expanded(child: Gap(0)),
            Text(
              'Why do you feel 😊 ?',
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge!
                  .copyWith(fontFamily: "Pauline", fontSize: FontSize.s26.sp),
            ),
            Gap(AppSize.s60.h),
            Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.s10.w,
                  vertical: AppSize.s5.h,
                ),
                decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(AppSize.s40.r)),
                child: Hero(
                  tag: 'mood_screen',
                  child: Material(
                    type: MaterialType.transparency,
                    child: Container(
                      padding: EdgeInsets.all(AppSize.s8.r),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s40.r),
                          color: ColorManager.lightBlue),
                      child: BlocBuilder<GridBloc, GridState>(
                        builder: (context, state) {
                          return GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.all(0),
                            shrinkWrap: true,
                            itemCount: 12,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 10.h,
                              crossAxisCount: 4,
                            ),
                            itemBuilder: (context, index) {
                              bool isSelected = false;

                              if (state is GridSelected) {
                                isSelected = state.selectedIndex == index;
                              }
                              return GestureDetector(
                                onTap: () {
                                  context
                                      .read<GridBloc>()
                                      .add(SelectGridEvent(index));
                                },
                                child: GridItem(
                                  iconColor: isSelected
                                      ? ColorManager.white
                                      : ColorManager.black,
                                  bgColor: isSelected
                                      ? ColorManager.cyan
                                      : ColorManager.white,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                )),
            Gap(AppSize.s80.h),
            Button(
                onTap: () {
                  Navigator.pushReplacementNamed(context, Routes.home);
                },
                text: 'Log my mood'),
          ],
        ),
      ),
    ));
  }
}

class GridItem extends StatelessWidget {
  final Color iconColor;
  final Color bgColor;
  const GridItem({
    required this.iconColor,
    required this.bgColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: AppSize.s60.r,
          width: AppSize.s60.r,
          margin: const EdgeInsets.all(0),
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(AppSize.s100.r)),
          child: Center(
              child: Icon(
            Icons.family_restroom,
            size: AppSize.s25.r,
            color: iconColor,
          )),
        ),
        Gap(AppSize.s5.h),
        Text(
          'Family',
          style: context.textTheme.bodySmall,
        )
      ],
    );
  }
}
