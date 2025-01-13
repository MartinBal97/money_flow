import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_pocket/core/constans/app_sizes.dart';
import 'package:my_pocket/core/router/routes.dart';
import 'package:my_pocket/core/theme/app_theme.dart';
import 'package:my_pocket/presentation/common_widgets/buttons_widgets.dart';
import 'package:my_pocket/presentation/common_widgets/inputs_widgets.dart';
import 'package:my_pocket/presentation/utils/utils.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _signInKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: context.heightMq),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
              child: Form(
                key: _signInKey,
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      gapH64,
                      SvgPicture.asset('assets/images/icon_app.svg'),
                      gapH40,
                      const Text('Iniciar sesión', style: disBigTS),
                      gapH32,
                      Text('Correo Electrónico*', style: smallRegularTS.copyWith(color: neutral800)),
                      gapH8,
                      CustomTextField(
                        hintText: "ejemplo@gmail.com",
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: emailValidator,
                      ),
                      gapH16,
                      Text('Contraseña', style: smallRegularTS.copyWith(color: neutral800)),
                      gapH8,
                      CustomTextField(
                        hintText: "Contraseña",
                        isPassword: true,
                        validator: passwordValidator,
                        controller: passwordController,
                        obscureText: !isPasswordVisible,
                        suffixIcon: isPasswordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                        onSuffixTap: () {
                          setState(() => isPasswordVisible = !isPasswordVisible);
                        },
                      ),
                      const Spacer(),
                      MainButton(
                        text: 'Iniciar sesión',
                        onTap: () {
                          if (_signInKey.currentState?.validate() ?? false) {
                            context.go(AppRoutes.home);
                          }
                        },
                      ),
                      gapH32,
                      SizedBox(
                        width: double.infinity,
                        child: GestureDetector(
                          onTap: () {
                            context.replace('${AppRoutes.authentication}${AppRoutes.signup}');
                          },
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: '¿No tenés una cuenta? ',
                              style: bodySmallRTS.copyWith(color: neutral500),
                              children: [
                                TextSpan(
                                  text: 'Registrate',
                                  style: bodySmallBTS.copyWith(color: neutral800),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      gapH24
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
