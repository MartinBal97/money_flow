import 'package:flutter/material.dart';
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
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Registro'),
        iconTheme: const IconThemeData(color: blue500),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
          child: Form(
            key: _signUpKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: context.heightMq / 1.5,
                  child: PageView(
                    controller: pageController,
                    // physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _firstStepRegister(),
                      _secondStepRegister(),
                    ],
                  ),
                ),
                gapH16,
                MainButton(
                  text: 'Continuar',
                  onTap: () {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeOutQuad,
                    );
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
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _firstStepRegister() {
    return Padding(
      padding: const EdgeInsets.only(top: Sizes.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH40,
          const Text('¿Cuál es tu correo electrónico?', style: subtitleTS),
          gapH40,
          Text('Correo Electrónico*', style: smallRegularTS.copyWith(color: neutral800)),
          gapH8,
          CustomTextField(
            hintText: "ejemplo@gmail.com",
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            validator: emailValidator,
          ),
        ],
      ),
    );
  }

  Widget _secondStepRegister() {
    return Padding(
      padding: const EdgeInsets.only(top: Sizes.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH40,
          const Text('Elegí una contraseña', style: subtitleTS),
          gapH40,
          Text('Contraseña*', style: smallRegularTS.copyWith(color: neutral800)),
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
          gapH16,
          Text('Confirmar contraseña*', style: smallRegularTS.copyWith(color: neutral800)),
          gapH8,
          CustomTextField(
            hintText: "Repetir contraseña",
            isPassword: true,
            validator: passwordValidator,
            controller: passwordController,
            obscureText: !isPasswordVisible,
            suffixIcon: isPasswordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
            onSuffixTap: () {
              setState(() => isPasswordVisible = !isPasswordVisible);
            },
          ),
        ],
      ),
    );
  }
}
