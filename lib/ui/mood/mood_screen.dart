import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_view/gif_view.dart';
import 'package:task_app/routes/route_generator.dart';
import 'package:task_app/ui/widgets/animations/animations.dart';
import 'package:task_app/ui/widgets/gap.dart';

import '../../blocs/mood_bloc/mood_bloc.dart';
import '../resources/reources.dart';

class MoodScreen extends StatefulWidget {
  const MoodScreen({super.key});

  @override
  State<MoodScreen> createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Fri 30 Jun', style: context.textTheme.titleMedium)
              ],
            ),
            const Expanded(child: Gap(0)),
            Text(
              'Hi Daud, tell us how you feel?',
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge!
                  .copyWith(fontFamily: "Pauline", fontSize: FontSize.s26.sp),
            ),
            Gap(AppSize.s40.h),
            Stack(
              children: [
                ScaleAnimation(
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: AppSize.s30.h,
                        right: AppSize.s20.w,
                        left: AppSize.s20.w),
                    decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(AppSize.s40.r)),
                    child: Column(
                      children: [
                        Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Hero(
                                  tag: 'add_mood',
                                  child: Container(
                                    height: AppSize.s200.r,
                                    width: AppSize.s200.r,
                                    decoration: BoxDecoration(
                                        color:
                                            ColorManager.cyan.withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(
                                            AppSize.s200.r)),
                                  )),
                              BlocBuilder<SliderBloc, SliderState>(
                                builder: (context, state) {
                                  if (state is SliderValueChangedState) {
                                    final sliderValue = state.value;
                                    String emotion = sliderValue > 50
                                        ? GifAssets.happy
                                        : GifAssets.sad;
                                    return ScaleAnimation(
                                      child: GifView.asset(
                                        emotion,
                                        height: AppSize.s270.r,
                                        width: AppSize.s270.r,
                                        frameRate: 30,
                                      ),
                                    );
                                  }
                                  return ScaleAnimation(
                                    child: GifView.asset(
                                      GifAssets.happy,
                                      height: AppSize.s270.r,
                                      width: AppSize.s270.r,
                                      frameRate: 30,
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('sad'), Text('happy')],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  BlocBuilder<SliderBloc, SliderState>(
                                    builder: (context, state) {
                                      return SliderTheme(
                                        data: const SliderThemeData(
                                            thumbColor: ColorManager.cyan,
                                            thumbShape: RectSliderThumbShape()),
                                        child: Slider(
                                          value:
                                              context.select((SliderBloc bloc) {
                                            if (bloc.state
                                                is SliderValueChangedState) {
                                              return (bloc.state
                                                      as SliderValueChangedState)
                                                  .value;
                                            } else {
                                              return 80.0;
                                            }
                                          }),
                                          max: 100,
                                          divisions: 4,
                                          activeColor: Colors.transparent,
                                          inactiveColor: Colors.transparent,
                                          thumbColor: ColorManager.cyan,
                                          onChanged: (double value) {
                                            BlocProvider.of<SliderBloc>(context)
                                                .add(SliderValueChanged(value));
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                  sliderPath()
                                ],
                              ),
                            ),
                          ],
                        ),
                        Gap(AppSize.s30.h),
                        BlocBuilder<SliderBloc, SliderState>(
                          builder: (context, state) {
                            if (state is SliderValueChangedState) {
                              final sliderValue = state.value;
                              String emotion = sliderValue > 50
                                  ? 'Happy ish'
                                  : 'Sad as fudge';
                              return Column(
                                children: [
                                  Text(
                                    emotion,
                                    style: context.textTheme.displayMedium,
                                  )
                                ],
                              );
                            }
                            return Text(
                              'Happy ish',
                              style: context.textTheme.displayMedium,
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
                // Hero(
                //     tag: 'calendar_container',
                //     child: Container(
                //       height: ,
                //       width: double.maxFinite,
                //       color: Colors.red,
                //     ))
              ],
            ),
            Gap(AppSize.s40.h),
            Hero(
              tag: 'mood_screen',
              child: Material(
                type: MaterialType.transparency,
                child: Button(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.moodReason);
                    },
                    text: 'tell us why you feel this way'),
              ),
            ),
            Gap(AppSize.s10.h),
            Button(
              onTap: () {},
              bgColor: ColorManager.white,
              txtColor: ColorManager.cyan,
              text: 'I don\'t want to go into it right now',
            ),
          ],
        ),
      ),
    ));
  }
}

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

class RectSliderThumbShape extends SliderComponentShape {
  final double enabledThumbRadius;
  final double? disabledThumbRadius;
  final double elevation;
  final double pressedElevation;
  final double borderRadius;

  const RectSliderThumbShape({
    this.enabledThumbRadius = 10.0,
    this.disabledThumbRadius,
    this.elevation = 1.0,
    this.pressedElevation = 6.0,
    this.borderRadius = 8.0, // Adjust the border radius as needed
  });

  double get _disabledThumbRadius => disabledThumbRadius ?? enabledThumbRadius;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(
        isEnabled == true ? enabledThumbRadius : _disabledThumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    assert(context != null);
    assert(center != null);
    assert(enableAnimation != null);
    assert(sliderTheme != null);
    assert(sliderTheme.disabledThumbColor != null);
    assert(sliderTheme.thumbColor != null);

    final Canvas canvas = context.canvas;
    final Tween<double> radiusTween = Tween<double>(
      begin: _disabledThumbRadius,
      end: enabledThumbRadius,
    );
    final ColorTween colorTween = ColorTween(
      begin: sliderTheme.disabledThumbColor,
      end: sliderTheme.thumbColor,
    );

    final Color color = colorTween.evaluate(enableAnimation)!;
    final double radius = radiusTween.evaluate(enableAnimation);

    final Tween<double> elevationTween = Tween<double>(
      begin: elevation,
      end: pressedElevation,
    );

    final double evaluatedElevation =
        elevationTween.evaluate(activationAnimation);

    final Rect thumbRect = Rect.fromCenter(
      center: center,
      width: 1 * radius,
      height: 3 * radius,
    );

    bool paintShadows = true;
    assert(() {
      if (debugDisableShadows) {
        paintShadows = false;
      }
      return true;
    }());

    // if (paintShadows) {
    //   canvas.drawShadow(thumbRect, Colors.black, evaluatedElevation, true);
    // }
    canvas.drawRRect(
      RRect.fromRectAndRadius(thumbRect, Radius.circular(borderRadius)),
      Paint()..color = color,
    );
  }
}
