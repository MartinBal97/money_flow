import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_pocket/core/constans/app_sizes.dart';
import 'package:my_pocket/core/router/routes.dart';
import 'package:my_pocket/core/theme/app_theme.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  PageController pageController = PageController();
  int? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    pageController.addListener(() {
      setState(() {
        _currentPage = pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue100,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: Sizes.p24),
            width: double.infinity,
            color: blue100,
            child: SvgPicture.asset('assets/images/logo_2.svg'),
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              children: [
                _buildScreenPageView(
                  Image.asset('assets/images/onboard_1.png'),
                  'Registrá gastos e ingresos financieros en simples pasos',
                ),
                _buildScreenPageView(
                  Image.asset('assets/images/onboard_2.png'),
                  'Tené tus estadísticas al alcance de la mano',
                ),
                _buildScreenPageView(
                  Image.asset('assets/images/onboard_3.png'),
                  'Lográ tus objetivos con las metas de ahorro',
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: Sizes.p10,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: _currentPage == 0 ? blue500 : neutral300,
                  //color: blue500,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: SizedBox(width: 8, height: 8),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: _currentPage == 1 ? blue500 : neutral300,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: SizedBox(width: 8, height: 8),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: _currentPage == 2 ? blue500 : neutral300,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: SizedBox(width: 8, height: 8),
              ),
            ],
          ),
          gapH32,
          MainButton(
            backGroundcolor: blue500,
            textColor: white,
            onTap: () {
              context.go('${AppRoutes.authentication}${AppRoutes.signin}');
            },
            text: 'Iniciar sesión',
          ),
          gapH4,
          MainButton(
            text: 'Registrate',
            backGroundcolor: aliceBlue,
            textColor: blue500,
            onTap: () {
              context.go('${AppRoutes.authentication}${AppRoutes.signup}');
            },
          ),
          gapH48
        ],
      ),
    );
  }

  Widget _buildScreenPageView(Image image, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 30,
      children: [
        Container(
          height: context.heightMq / 2.2,
          width: double.infinity,
          decoration: BoxDecoration(color: blue100),
          child: image,
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p40),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: disLargeTS,
            ),
          ),
        )
      ],
    );
  }
}

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color? backGroundcolor;
  final Color? textColor;

  const MainButton({
    super.key,
    required this.text,
    this.onTap,
    this.backGroundcolor = blue500,
    this.textColor = white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: WidgetStatePropertyAll(0),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.p12)),
            ),
            backgroundColor: WidgetStatePropertyAll(backGroundcolor),
          ),
          onPressed: onTap,
          child: Text(text, style: buttonsTS.copyWith(color: textColor)),
        ),
      ),
    );
  }
}
