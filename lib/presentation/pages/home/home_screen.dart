import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_pocket/core/constans/app_sizes.dart';
import 'package:my_pocket/core/router/routes.dart';
import 'package:my_pocket/core/theme/app_theme.dart';
import 'package:my_pocket/domain/entities/app_user.dart';
import 'package:my_pocket/presentation/common_widgets/buttons_widgets.dart';
import 'package:my_pocket/presentation/cubits/cubit/auth/auth_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool spendingOrIncomesToggle = false;
  String dropDownValue = 'Efectivo';
  bool moneyVisibility = true;

  late final AuthCubit authCubit = context.read<AuthCubit>();
  //late final ProfileCubit profileCubit = context.read<ProfileCubit>();

  late AppUser? currentUser = authCubit.currentUser;

  @override
  Widget build(BuildContext context) {
    //* final authCubit = context.read<AuthCubit>();

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Stack(
        children: [
          const DecoratedBox(
            decoration: BoxDecoration(color: blue500),
            child: SizedBox(height: 250, width: double.infinity),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(Sizes.p16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  gapH8,
                  _buildIncomeCard(),
                  gapH16,
                  _buildActionButtons(),
                  gapH24,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Transacciones', style: subtitleTS),
                      GestureDetector(
                        onTap: () {},
                        child: Text('Ver todos', style: bodySmallRTS.copyWith(color: blue500)),
                      )
                    ],
                  ),
                  gapH8,
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: neutral300, width: 1.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      title: const Text('Supermercado', style: subtitleTS),
                      subtitle: Text('15 de Noviembre', style: smallRegularTS.copyWith(color: neutral400)),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('-\$1.500,00', style: subtitleTS.copyWith(color: error500)),
                          gapH4,
                          Text('10:56', style: smallRegularTS.copyWith(color: neutral400)),
                        ],
                      ),
                      leading: const CircleAvatar(
                        radius: 20,
                        backgroundColor: blue200,
                        child: Icon(Icons.shopping_cart, color: blue500, size: 16),
                      ),
                    ),
                  ),
                  gapH16,
                  const Text('Tus metas', style: subtitleTS),
                  gapH16,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: Sizes.p10,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(Sizes.p16),
                          width: 237,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(Sizes.p8),
                          ),
                          child: Row(
                            spacing: Sizes.p20,
                            children: [
                              Image.asset('assets/images/onboard_1.png', width: 50),
                              const Text(
                                'Crea tu meta \nfinanciera',
                                style: bodyLargeRTS,
                              )
                            ],
                          ),
                        ),
                        Banner(
                          message: 'Muy pronto',
                          color: blue600,
                          location: BannerLocation.topStart,
                          textStyle: bodyLargeBTS.copyWith(color: white, fontSize: 11),
                          child: Container(
                            padding: const EdgeInsets.all(Sizes.p16),
                            width: 237,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(Sizes.p8),
                            ),
                            child: Row(
                              spacing: Sizes.p20,
                              children: [
                                Image.asset('assets/images/onboard_2.png', width: 50),
                                const Text(
                                  'Retos \nfinancieros',
                                  style: bodyLargeRTS,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  /*  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Vacaciones', style: bodySmallBTS),
                              Text('\$15.000,00', style: bodySmallBTS),
                            ],
                          ),
                          gapH8,
                          LinearProgressIndicator(value: 0.6),
                        ],
                      ),
                    ),
                  ) */
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ListTile _buildHeader() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: white,
        child: SvgPicture.asset('assets/images/coin.svg', width: 35),
      ),
      title: Text(
        'Hola, ${currentUser?.name}',
        style: bodySmallBTS.copyWith(color: white),
      ),
      subtitle: Text(
        'Nivel 2', //TODO: Cambiar por el nivel del usuario
        style: bodySmallRTS.copyWith(color: white),
      ),
    );
  }

  Card _buildIncomeCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      spendingOrIncomesToggle ? 'Ingresos noviembre' : 'Gastos noviembre',
                      style: subtitleTS.copyWith(color: neutral300),
                    ),
                  ],
                ),
              ],
            ),
            // Cantidad de ingresos
            Row(
              children: [
                moneyVisibility
                    ? const Text('\$20.000,00', style: disBigTS)
                    : const Text('\$********', style: disBigTS),
                IconButton(
                  icon: moneyVisibility
                      ? const Icon(Icons.visibility_outlined)
                      : const Icon(Icons.visibility_off_outlined),
                  onPressed: () {
                    setState(() => moneyVisibility = !moneyVisibility);
                  },
                ),
              ],
            ),
            gapH16,
            //Tabs de "Gastos" e "Ingresos"
            AnimatedToggleSwitch<bool>.size(
              height: 35,
              current: spendingOrIncomesToggle,
              values: const [false, true],
              iconOpacity: 1,
              indicatorSize: const Size(double.infinity, 30),
              customIconBuilder: (context, local, global) => Text(
                local.value ? 'Ingresos' : 'Gastos',
                style: bodySmallRTS.copyWith(
                  color: Color.lerp(blue500, white, local.animationValue),
                  fontWeight: FontWeight.lerp(fwR, fwSb, local.animationValue),
                ),
              ),
              borderWidth: 3,
              iconAnimationType: AnimationType.onSelected,
              style: ToggleStyle(
                backgroundColor: secondaryColor,
                indicatorColor: blue500,
                borderRadius: BorderRadius.circular(100),
                borderColor: Colors.transparent,
              ),
              selectedIconScale: 1,
              onChanged: (value) {
                setState(() => spendingOrIncomesToggle = value);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: Sizes.p16,
      children: [
        Expanded(
          child: CustomButton(
            text: 'Añadir gasto',
            widget: const Icon(CupertinoIcons.arrow_up, color: blue500, size: 32),
            onTap: () {
              context.push(AppRoutes.expensesIncomes, extra: {
                'isTypeIncome': false,
              });
            },
          ),
        ),
        Expanded(
          child: CustomButton(
            text: 'Añadir ingreso',
            widget: const Icon(CupertinoIcons.arrow_down, color: blue500, size: 32),
            onTap: () {
              context.push(AppRoutes.expensesIncomes, extra: {
                'isTypeIncome': true,
              });
            },
          ),
        ),
      ],
    );
  }
}




 // DropdownButton<String>(
                //   value: dropDownValue,
                //   borderRadius: BorderRadius.circular(16),
                //   underline: const SizedBox(),
                //   icon: const Icon(CupertinoIcons.chevron_down, color: blue500, size: 15),
                //   onChanged: (String? newValue) {
                //     setState(() => dropDownValue = newValue!);
                //   },
                //   items: ['Efectivo', 'Tarjeta', 'Otros']
                //       .map(
                //         (value) => DropdownMenuItem(
                //           value: value,
                //           child: Text(
                //             value,
                //             style: bodyLargeBTS.copyWith(color: blue500, fontWeight: fwSb),
                //           ),
                //         ),
                //       )
                //       .toList(),
                // ),