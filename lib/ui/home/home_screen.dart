import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:task_app/blocs/home_bloc/home_bloc.dart';
import 'package:task_app/routes/route_generator.dart';
import 'package:task_app/ui/resources/reources.dart';
import 'package:task_app/ui/widgets/animations/animations.dart';
import 'package:task_app/ui/widgets/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: ScreenUtil().screenHeight,
            width: ScreenUtil().screenWidth,
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
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Appbar(context),
                Gap(AppSize.s20.h),
                const Expanded(child: Gap(0)),
                Hero(
                  tag: 'login_button',
                  child: BounceAnimation(
                    child: Container(
                      padding: EdgeInsets.all(AppSize.s20.r),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.5),
                              blurRadius: 0,
                              spreadRadius: 1.0,
                              offset: const Offset(0, -3),
                            ),
                          ],
                          gradient: LinearGradient(
                            colors: [
                              ColorManager.homegradient1,
                              ColorManager.homegradient2
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(AppSize.s40.r)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              MoodCounter(
                                  counterValue: 3, icon: CupertinoIcons.smiley),
                              Gap(AppSize.s20.w),
                              MoodCounter(
                                counterValue: 4,
                                icon: Icons.sentiment_dissatisfied_outlined,
                                titleColor: ColorManager.red,
                              ),
                            ],
                          ),
                          Gap(AppSize.s20.h),
                          Stack(
                            children: [
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: AppSize.s20.h,
                                      horizontal: AppSize.s10.w),
                                  decoration: BoxDecoration(
                                      color: ColorManager.white,
                                      borderRadius:
                                          BorderRadius.circular(AppSize.s17.r)),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(top: AppSize.s10.h),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: BlocBuilder<CalendarBloc,
                                                  CalendarState>(
                                                key: UniqueKey(),
                                                builder: (context, state) {
                                                  return Text(
                                                    '${getMonthNameFromNumber(context.read<CalendarBloc>().calendarController.displayDate?.month ?? DateTime.now().month)} ${context.read<CalendarBloc>().calendarController.displayDate?.year ?? DateTime.now().year}',
                                                    style: context
                                                        .textTheme.titleLarge!
                                                        .copyWith(
                                                            fontSize: FontSize
                                                                .s20.sp),
                                                  );
                                                },
                                              ),
                                            ),
                                            Expanded(
                                                flex: 2,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        context
                                                            .read<
                                                                CalendarBloc>()
                                                            .add(
                                                                CalendarBackwardEvent());
                                                      },
                                                      child: Icon(
                                                        CupertinoIcons
                                                            .left_chevron,
                                                        size: AppSize.s25.r,
                                                      ),
                                                    ),
                                                    Gap(AppSize.s35.w),
                                                    InkWell(
                                                      onTap: () {
                                                        context
                                                            .read<
                                                                CalendarBloc>()
                                                            .add(
                                                                CalendarForwardEvent());
                                                      },
                                                      child: Icon(
                                                        size: AppSize.s25.r,
                                                        CupertinoIcons
                                                            .right_chevron,
                                                      ),
                                                    ),
                                                  ],
                                                ))
                                          ],
                                        ),
                                      ),
                                      Gap(AppSize.s30.h),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: ColorManager.white,
                                          border: Border.all(
                                              width: 0.5,
                                              color: ColorManager.black
                                                  .withOpacity(0.3)),
                                          borderRadius: BorderRadius.circular(
                                              AppSize.s20.r),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              AppSize.s20.r),
                                          child: BlocBuilder<CalendarBloc,
                                              CalendarState>(
                                            builder: (context, state) {
                                              return AnimatedSwitcher(
                                                duration:
                                                    Duration(milliseconds: 700),
                                                child: SfCalendar(
                                                  controller: context
                                                      .read<CalendarBloc>()
                                                      .calendarController,
                                                  headerHeight: 0,
                                                  allowViewNavigation: false,
                                                  showNavigationArrow: false,
                                                  viewNavigationMode:
                                                      ViewNavigationMode.none,
                                                  selectionDecoration:
                                                      BoxDecoration(
                                                          color: ColorManager
                                                              .cyan
                                                              .withOpacity(
                                                                  0.3)),
                                                  monthCellBuilder:
                                                      (context, details) {
                                                    return Container(
                                                      margin: EdgeInsets.zero,
                                                      alignment:
                                                          Alignment.center,
                                                      padding: EdgeInsets.all(
                                                          AppSize.s6.r),
                                                      decoration: BoxDecoration(
                                                          color: randomColor(),
                                                          border: Border.all(
                                                              color: ColorManager
                                                                  .black
                                                                  .withOpacity(
                                                                      0.3),
                                                              width: 0.5)),
                                                      child: Text(
                                                        details.date.day
                                                            .toString(),
                                                        style: context.textTheme
                                                            .labelMedium,
                                                      ),
                                                    );
                                                  },
                                                  resourceViewHeaderBuilder:
                                                      (context, details) {
                                                    return Text('hello');
                                                  },
                                                  view: CalendarView.month,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Gap(AppSize.s20.h),
                Hero(
                  tag: 'add_mood',
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.mood);
                    },
                    icon: const Icon(
                      Icons.add,
                      size: 24.0,
                    ),
                    label: const Text(
                      'Add Model',
                    ), // <-- Text
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
}

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
