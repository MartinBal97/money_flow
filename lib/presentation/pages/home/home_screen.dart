import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:money_flow/core/app_theme.dart';

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
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Stack(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(color: blue500),
            child: SizedBox(
              height: 250,
              width: double.infinity,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Encabezado
                  _buildHeader(),

                  // Card de ingresos
                  //_buildIncomeCard(context),

                  Card(
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
                                    style: subTitleTextStyle.copyWith(color: neutral300),
                                  ),
                                ],
                              ),
                              DropdownButton<String>(
                                value: dropDownValue,
                                borderRadius: BorderRadius.circular(16),
                                underline: SizedBox(),
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
                                          style: bodyLargeBTextStyle.copyWith(color: blue500, fontWeight: sb),
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
                              moneyVisibility
                                  ? Text('\$20.000,00', style: disBigTextStyle)
                                  : Text('\$********', style: disBigTextStyle),
                              IconButton(
                                icon: moneyVisibility
                                    ? Icon(Icons.visibility_outlined)
                                    : Icon(Icons.visibility_off_outlined),
                                onPressed: () {
                                  setState(() => moneyVisibility = !moneyVisibility);
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          //Tabs de "Gastos" e "Ingresos"
                          AnimatedToggleSwitch<bool>.size(
                            height: 35,
                            current: spendingOrIncomesToggle,
                            values: const [false, true],
                            iconOpacity: 1,
                            indicatorSize: const Size(double.infinity, 30),
                            customIconBuilder: (context, local, global) => Text(
                              local.value ? 'Ingresos' : 'Gastos',
                              style: bodySmallRTextStyle.copyWith(
                                color: Color.lerp(blue500, white, local.animationValue),
                                fontWeight: FontWeight.lerp(r, sb, local.animationValue),
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
                  ),

                  // // Botones inferiores
                  _buildActionButtons(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
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
        style: bodySmallBTextStyle.copyWith(color: white),
      ),
      subtitle: Text(
        'Nivel 2',
        style: bodySmallRTextStyle.copyWith(color: white),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildActionButton(CupertinoIcons.arrow_up, 'Gasto'),
        _buildActionButton(CupertinoIcons.arrow_down, 'Ingreso'),
        _buildActionButton(CupertinoIcons.add, 'Habitual'),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 14, vertical: 20)),
        side: WidgetStateProperty.all(BorderSide.none),
        backgroundColor: WidgetStateProperty.all(aliceBlue),
        shape: WidgetStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        )),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 5,
        children: [
          Icon(icon, color: blue500),
          Text(label, style: TextStyle(fontSize: 14, color: blue500)),
        ],
      ),
    );
  }
}
