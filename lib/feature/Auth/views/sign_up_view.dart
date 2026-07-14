
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:project_iti/core/constant/app_color.dart';
import 'package:project_iti/core/constant/app_style.dart';
import 'package:project_iti/core/helper/showsnakbar.dart';
import 'package:project_iti/core/routing/route_const.dart';
import 'package:project_iti/core/widgets/custom_button.dart';
import 'package:project_iti/core/widgets/custom_text_field.dart';
import 'package:project_iti/feature/Auth/cubit/login_cubit.dart';
import 'package:project_iti/feature/Auth/cubit/login_state.dart';
import 'package:project_iti/feature/Auth/widget/row_auth.dart';
import 'package:project_iti/feature/services/user_services.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool obscuretext = true;
  bool obscuretext2 = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        userServices: UserServices(dio: Dio()),
      ),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(24.sp),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state) {
                        if (state is SuccessState) {
                          showSankBar(
                            context,
                            text: "login_success".tr(),
                            color: Colors.green,
                          );
                        }

                        if (state is FailureState) {
                          showSankBar(
                            context,
                            text: state.error,
                            color: Colors.red,
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is LoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30.h),

                            Container(
                              width: double.infinity,
                              height: 135.h,
                              decoration: BoxDecoration(
                                color: AppColor.primaycolor,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "winter_offer".tr(),
                                    style: AppStyle.buttonStyle,
                                  ),
                                  Image.asset(
                                    "assets/images/image 1.png",
                                    width: 89.w,
                                    height: 140.h,
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 24.h),

                            Text(
                              "username".tr(),
                              style: AppStyle.textfield,
                            ),

                            SizedBox(height: 8.h),

                            CustomTextField(
                              hint: "email_hint".tr(),
                              controller: emailcontroller,
                            ),

                            SizedBox(height: 8.h),

                            Text(
                              "password".tr(),
                              style: AppStyle.textfield,
                            ),

                            SizedBox(height: 8.h),

                            CustomTextField(
                              hint: "password_hint".tr(),
                              controller: passwordController,
                              obscureText: obscuretext,
                              icon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscuretext = !obscuretext;
                                  });
                                },
                                icon: Icon(
                                  obscuretext
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                            ),

                            SizedBox(height: 8.h),

                            Text(
                              "confirm_password".tr(),
                              style: AppStyle.textfield,
                            ),

                            SizedBox(height: 8.h),

                            CustomTextField(
                              hint: "confirm_password_hint".tr(),
                              controller: confirmPasswordController,
                              obscureText: obscuretext2,
                              icon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscuretext2 = !obscuretext2;
                                  });
                                },
                                icon: Icon(
                                  obscuretext2
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                            ),

                            SizedBox(height: 50.h),

                            Custombutton(
                              buttonName: "create_account".tr(),
                              onPressed: () {
                                context.read<LoginCubit>().loginCubit(
                                      username: emailcontroller.text,
                                      password: passwordController.text,
                                    );
                              },
                            ),

                            const Spacer(),

                            RowAuth(
                              text: "already_have_account".tr(),
                              textButton: "login".tr(),
                              onTap: () => context.pushReplacementNamed(
                                RouteName.loginName,
                              ),
                            ),

                            SizedBox(height: 20.h),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
