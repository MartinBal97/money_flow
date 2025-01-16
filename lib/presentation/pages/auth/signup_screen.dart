import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_pocket/core/constans/app_sizes.dart';
import 'package:my_pocket/core/router/routes.dart';
import 'package:my_pocket/core/theme/app_theme.dart';
import 'package:my_pocket/presentation/common_widgets/buttons_widgets.dart';
import 'package:my_pocket/presentation/common_widgets/inputs_widgets.dart';
import 'package:my_pocket/presentation/utils/utils.dart';

// const appBarHeight = kToolbarHeight; // Altura estándar del AppBar (56px)
// final topPadding = MediaQuery.paddingOf(context).top; // Padding de la barra de estado
// final totalTopPadding = appBarHeight + topPadding; // Altura total del espacio superior

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController1 = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final PageController pageController = PageController();
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
                key: _signUpKey,
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      gapH64,
                      SvgPicture.asset('assets/images/icon_app.svg'),
                      gapH40,
                      const Text('Registro', style: disBigTS),
                      gapH32,
                      const Text('¿Cuál es tu correo electrónico?', style: subtitleTS),
                      gapH10,
                      CustomTextField(
                        hintText: "ejemplo@gmail.com",
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: emailValidator,
                      ),
                      gapH20,
                      const Text('Elegí una contraseña', style: subtitleTS),
                      gapH10,
                      CustomTextField(
                        hintText: "Contraseña",
                        isPassword: true,
                        validator: passwordValidator,
                        controller: passwordController1,
                        obscureText: !isPasswordVisible,
                        suffixIcon: isPasswordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                        onSuffixTap: () {
                          setState(() => isPasswordVisible = !isPasswordVisible);
                        },
                      ),
                      gapH10,
                      CustomTextField(
                        hintText: "Repetir contraseña",
                        isPassword: true,
                        validator: passwordValidator,
                        controller: passwordController2,
                        obscureText: !isPasswordVisible,
                        suffixIcon: isPasswordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                        onSuffixTap: () {
                          setState(() => isPasswordVisible = !isPasswordVisible);
                        },
                      ),
                      gapH20,
                      const Text('¿Cuál es tu nombre?', style: subtitleTS),
                      gapH10,
                      CustomTextField(
                        hintText: "Nombre",
                        isPassword: false,
                        validator: nameValidator,
                        controller: nameController,
                      ),
                      const Spacer(),
                      gapH16,
                      MainButton(
                        text: 'Continuar',
                        onTap: () {
                          if (_signUpKey.currentState?.validate() ?? false) {
                            if (passwordController1.value.text != passwordController2.value.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.redAccent,
                                  content: Text('Las contraseñas no coinciden'),
                                ),
                              );
                              return;
                            }
                            context.go(AppRoutes.home);
                          }
                        },
                      ),
                      gapH32,
                      SizedBox(
                        width: double.infinity,
                        child: GestureDetector(
                          onTap: () {
                            context.replace('${AppRoutes.authentication}${AppRoutes.signin}');
                          },
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: '¿Ya tienes una cuenta? ',
                              style: bodySmallRTS.copyWith(color: neutral500),
                              children: [
                                TextSpan(
                                  text: 'Inicia sesión',
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
