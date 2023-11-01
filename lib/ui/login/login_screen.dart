import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_app/blocs/login_bloc/login_bloc.dart';
import 'package:task_app/routes/route_generator.dart';
import 'package:task_app/ui/widgets/animations/animations.dart';

import '../resources/reources.dart';
import '../widgets/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [ColorManager.gradient1, ColorManager.gradient2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: AppSize.s20, vertical: AppSize.s10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'logoTag',
                  child: Text("Vitality",
                      style: context.textTheme.displayMedium!.copyWith(
                          fontFamily: "Pauline",
                          color: ColorManager.mud,
                          fontSize: FontSize.s60.sp)),
                ),
                const Gap(AppSize.s50),
                FadeAnimation(
                  child: SlideAnimation(
                    begin: Offset(0, 200),
                    child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(AppSize.s20),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(AppSize.s20)),
                      child: BlocConsumer<LoginBloc, LoginState>(
                        listener: (context, state) {
                          if (state is LoginSuccess) {
                            Navigator.pushReplacementNamed(
                                context, Routes.home); // Navigation

                            Fluttertoast.showToast(
                              msg: "Login Successful",
                              gravity: ToastGravity.BOTTOM,
                            );
                          }
                          if (state is LoginFailure) {
                            Fluttertoast.showToast(
                              msg: "Login Failed",
                              gravity: ToastGravity.BOTTOM,
                            );
                            print('failed');
                          }
                        },
                        builder: (context, state) {
                          return Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      'Email',
                                    ),
                                  ],
                                ),
                                Gap(AppSize.s5.h),
                                Material(
                                  color: ColorManager.white.withOpacity(0.5),
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s50),
                                  child: TextFormField(
                                    controller: _emailController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter an email address';
                                      }
                                      if (!isEmailValid(value)) {
                                        return 'Please enter a valid email address';
                                      }
                                      return null;
                                    },
                                    style: context.textTheme.bodyMedium,
                                    decoration: const InputDecoration(
                                        hintText: 'imdaudk@gmail.com'),
                                  ),
                                ),
                                Gap(AppSize.s20.h),
                                const Row(
                                  children: [
                                    Text('Password'),
                                  ],
                                ),
                                Gap(AppSize.s5.h),
                                Material(
                                  color: ColorManager.white.withOpacity(0.5),
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s50),
                                  child: BlocBuilder<LoginBloc, LoginState>(
                                      builder: (context, state) {
                                    if (state
                                        is LoginPasswordVisibilityChanged) {
                                      return PasswordField(
                                          isPasswordVisible:
                                              state.isPasswordVisible,
                                          passwordController:
                                              _passwordController);
                                    } else {
                                      return PasswordField(
                                          isPasswordVisible: false,
                                          passwordController:
                                              _passwordController);
                                    }
                                  }),
                                ),
                                Gap(AppSize.s5.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Forgot your password?',
                                      style: context.textTheme.labelMedium!
                                          .copyWith(
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationColor:
                                                  ColorManager.cyan,
                                              color: ColorManager.cyan),
                                      textAlign: TextAlign.end,
                                    ),
                                  ],
                                ),
                                const Gap(AppSize.s30),
                                InkWell(
                                  onTap: () {
                                    if (state is LoginLoading) {
                                      return;
                                    } else {
                                      if (_formKey.currentState!.validate()) {
                                        BlocProvider.of<LoginBloc>(context).add(
                                            LoginButtonPressed(
                                                email: _emailController.text,
                                                password:
                                                    _passwordController.text));
                                      }
                                    }
                                  },
                                  child: Hero(
                                    tag: 'login_button',
                                    child: Container(
                                      width: AppSize.s150.w,
                                      height: AppSize.s50.h,
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: AppSize.s10,
                                          horizontal: AppSize.s40),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              AppSize.s30),
                                          color: ColorManager.cyan),
                                      child: state is LoginLoading
                                          ? SizedBox(
                                              height: AppSize.s20.h,
                                              width: AppSize.s20.h,
                                              child:
                                                  const CircularProgressIndicator())
                                          : Text(
                                              'Sign in',
                                              style: context
                                                  .textTheme.bodyMedium!
                                                  .copyWith(
                                                      color:
                                                          ColorManager.white),
                                            ),
                                    ),
                                  ),
                                ),
                                const Gap(AppSize.s5),
                                Text(
                                  'Create an account',
                                  style: context.textTheme.labelLarge!
                                      .copyWith(color: ColorManager.cyan),
                                ),
                                const Gap(AppSize.s30),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SvgPicture.asset(
                                      SvgAssets.google,
                                      height: AppSize.s40,
                                    ),
                                    SvgPicture.asset(
                                      SvgAssets.facebook,
                                      height: AppSize.s40,
                                    ),
                                    SvgPicture.asset(
                                      SvgAssets.instragram,
                                      height: AppSize.s40,
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required this.isPasswordVisible,
    required TextEditingController passwordController,
  }) : _passwordController = passwordController;

  final bool isPasswordVisible;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !isPasswordVisible,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter password';
        }
        return null; // Return null if the input is valid
      },
      controller: _passwordController,
      style: context.textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: 'Password',
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            BlocProvider.of<LoginBloc>(context).add(TogglePasswordVisibility());
          },
        ),
      ),
      onSaved: (value) {
        _passwordController.text = value!;
      },
    );
  }
}
