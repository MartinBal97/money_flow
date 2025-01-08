import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_pocket/core/constans/app_sizes.dart';
import 'package:my_pocket/core/theme/app_theme.dart';
import 'package:my_pocket/presentation/common_widgets/buttons_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool spendingOrIncomesToggle = false;
  String dropDownValue = 'Efectivo';
  bool moneyVisibility = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Stack(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(color: blue500),
            child: SizedBox(height: 250, width: double.infinity),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Encabezado
                  _buildHeader(),
                  gapH8,
                  // Card de ingresos
                  _buildIncomeCard(),
                  gapH16,
                  // Botones de acciones
                  _buildActionButtons(),
                  gapH24,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Transacciones', style: subtitleTS),
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
                      title: Text('Supermercado', style: subtitleTS),
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
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: blue200,
                        child: Icon(Icons.shopping_cart, color: blue500, size: 16),
                      ),
                    ),
                  ),
                  gapH16,
                  Text('Tus metas', style: subtitleTS),

                  /* Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Meta 1', style: bodySmallBTS),
                              Text('20.000,00', style: bodySmallBTS),
                            ],
                          ),
                           gapH8,
                          CircularProgressIndicator(value: 0.6),
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
        child: SvgPicture.asset(
          'assets/images/coin.svg',
          width: 35,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(CupertinoIcons.bell, color: white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.settings, color: white),
            onPressed: () {},
          ),
        ],
      ),
      title: Text(
        'Hola, Martin',
        style: bodySmallBTS.copyWith(color: white),
      ),
      subtitle: Text(
        'Nivel 2',
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
                DropdownButton<String>(
                  value: dropDownValue,
                  borderRadius: BorderRadius.circular(16),
                  underline: const SizedBox(),
                  icon: Icon(CupertinoIcons.chevron_down, color: blue500, size: 15),
                  onChanged: (String? newValue) {
                    setState(() => dropDownValue = newValue!);
                  },
                  items: ['Efectivo', 'Tarjeta', 'Otros']
                      .map(
                        (value) => DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: bodyLargeBTS.copyWith(color: blue500, fontWeight: fwSb),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
            // Cantidad de ingresos
            Row(
              children: [
                moneyVisibility ? Text('\$20.000,00', style: disBigTS) : Text('\$********', style: disBigTS),
                IconButton(
                  icon: moneyVisibility ? Icon(Icons.visibility_outlined) : Icon(Icons.visibility_off_outlined),
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
      children: [
        CustomButton(
          text: 'Gasto',
          widget: Icon(CupertinoIcons.arrow_down, color: blue500, size: 32),
          onTap: () {},
        ),
        CustomButton(
          text: 'Ingreso',
          widget: Icon(CupertinoIcons.arrow_up, color: blue500, size: 32),
          onTap: () {},
        ),
        CustomButton(
          text: 'Habitual',
          widget: SvgPicture.asset('assets/images/gastohabitual.svg', width: 32),
          onTap: () {},
        ),
      ],
    );
  }
}
