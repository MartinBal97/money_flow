import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_flow/core/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Stack(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(color: blue500),
            child: SizedBox(
              height: 200,
              width: double.infinity,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Encabezado
                  _buildHeader(),

                  // Card de ingresos
                  _buildIncomeCard(context),

                  // Botones inferiores
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hola, Martin',
              style: bodySmallBTextStyle.copyWith(color: white),
            ),
            Text(
              'Nivel 2',
              style: bodySmallRTextStyle.copyWith(color: white),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(CupertinoIcons.bell, color: white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.settings_outlined, color: white),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildIncomeCard(context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ingresos noviembre',
                  style: subTitleTextStyle.copyWith(color: neutral300),
                ),
                DropdownButton<String>(
                  value: 'Efectivo',
                  underline: SizedBox(),
                  onChanged: (String? newValue) {},
                  items: ['Efectivo', 'Tarjeta', 'Otros']
                      .map((value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                ),
              ],
            ),
            SizedBox(height: 8),
            // Cantidad de ingresos
            Row(
              children: [
                Text('\$20.000,00', style: disBigTextStyle),
                IconButton(
                  icon: Icon(Icons.visibility),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 16),
            //Tabs de "Gastos" e "Ingresos"
            // Row(
            //   children: [
            //     Expanded(
            //       child: TextButton(
            //         onPressed: () {},
            //         style: TextButton.styleFrom(
            //           backgroundColor: Colors.grey[200],
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(8),
            //           ),
            //         ),
            //         child: Text('Gastos'),
            //       ),
            //     ),
            //     Expanded(
            //       child: TextButton(
            //         onPressed: () {},
            //         style: TextButton.styleFrom(
            //           backgroundColor: Colors.blue,
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(8),
            //           ),
            //           foregroundColor: Colors.white,
            //         ),
            //         child: Text('Ingresos'),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
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
