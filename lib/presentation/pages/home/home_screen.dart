import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:my_pocket/core/constans/app_sizes.dart';
import 'package:my_pocket/core/theme/app_theme.dart';
import 'package:my_pocket/domain/entities/profile_user.dart';
import 'package:my_pocket/presentation/cubits/cubit/auth/auth_cubit.dart';
import 'package:my_pocket/presentation/cubits/cubit/profile/profile_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool spendingOrIncomesToggle = false;
  String dropDownValue = 'Efectivo';
  bool moneyVisibility = true;

  late final authCubit = context.read<AuthCubit>();
  late final profileCubit = context.read<ProfileCubit>();

  ProfileUser? user;

  @override
  void initState() {
    if (authCubit.currentUser?.uid != null) {
      profileCubit.fetchUserProfile(authCubit.currentUser!.uid);
    }

    super.initState();
  }

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
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is ProfileSuccess) {
                  user = state.profileUser;
                }

                return Padding(
                  padding: const EdgeInsets.all(Sizes.p16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(user),
                      gapH8,
                      _buildIncomeCard(),
                      gapH24,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Transacciones', style: subtitleTS),
                          GestureDetector(
                            onTap: null,
                            child: Text('Ver todos', style: bodySmallRTS.copyWith(color: blue500)),
                          )
                        ],
                      ),
                      gapH8,
                      _buildTransactionsSummary(),
                      gapH16,
                      const Text('Tus metas', style: subtitleTS),
                      gapH16,
                      _buildGoalsSummary(),
                      gapH16,
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView _buildGoalsSummary() {
    /* const Card(
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
    //todo: Si no hay metas disponibles añadir crear una meta
    return SingleChildScrollView(
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
            message: 'Falta poco',
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
    );
  }

  Widget _buildTransactionsSummary() {
    //todo: recuperar las transacciones del usuario y mostrarlas
    const transactions = 0;

    return transactions > 0
        ? SingleChildScrollView(
            child: Column(
              children: List.generate(
                transactions,
                (index) => const SingleTransactionWidget(),
              ),
            ),
          )
        : Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            color: white,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Text(
                  'Aún no registraste movimientos.\n¡Empezá agregando tu primer ingreso o gasto!',
                  style: bodyLargeRTS.copyWith(color: neutral400),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
  }

  ListTile _buildHeader(ProfileUser? user) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: white,
        child: SvgPicture.asset('assets/images/coin.svg', width: 35),
      ),
      title: Text(
        user?.name != null ? 'Hola ${user?.name}' : '',
        style: bodySmallBTS.copyWith(color: white),
      ),
      subtitle: Text(
        user?.xp != null ? 'Nivel ${user!.xp} - ${user.xp} XP' : '',
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
                      spendingOrIncomesToggle
                          ? 'Ingresos ${DateFormat.MMMM('es_ES').format(DateTime.now())}'
                          : 'Gastos ${DateFormat.MMMM('es_ES').format(DateTime.now())}',
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
}

class SingleTransactionWidget extends StatelessWidget {
  const SingleTransactionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
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