import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_pocket/core/constans/app_sizes.dart';
import 'package:my_pocket/core/router/routes.dart';
import 'package:my_pocket/core/theme/app_theme.dart';
import 'package:my_pocket/domain/entities/level_system.dart';
import 'package:my_pocket/domain/entities/profile_user.dart';
import 'package:my_pocket/presentation/cubits/cubit/auth/auth_cubit.dart';
import 'package:my_pocket/presentation/cubits/cubit/profile/profile_cubit.dart';

class ProfileScreen extends StatefulWidget {
  final String uid;

  const ProfileScreen({super.key, required this.uid});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final authCubit = context.read<AuthCubit>();
  late final profileCubit = context.read<ProfileCubit>();

  //late AppUser? currentUser = authCubit.currentUser;

  @override
  void initState() {
    profileCubit.fetchUserProfile(widget.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileSuccess) {
          final ProfileUser user = state.profileUser;

          final levelSystem = LevelSystem(user.xp);

          final double progress = levelSystem.xp % 100 / 100;

          return Scaffold(
            appBar: AppBar(
              title: const Text('Profile Screen'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(Sizes.p16),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageAvatar(imageUrl: user.profileImageUrl, radius: 50),
                    gapH32,
                    Text('${user.name}', style: titleTS),
                    gapH16,
                    Card(
                      color: white,
                      child: Padding(
                        padding: const EdgeInsets.all(Sizes.p16),
                        child: Row(
                          spacing: Sizes.p16,
                          children: [
                            DecoratedBox(
                              decoration: const BoxDecoration(color: secondaryColor, shape: BoxShape.circle),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    width: 55,
                                    height: 55,
                                    child: CircularProgressIndicator(
                                      value: progress,
                                      strokeWidth: 6.0,
                                      strokeAlign: BorderSide.strokeAlignOutside,
                                      strokeCap: StrokeCap.round,
                                      valueColor: const AlwaysStoppedAnimation(blue500),
                                      backgroundColor: secondaryColor,
                                    ),
                                  ),
                                  // CircleAvatar en el centro
                                  CustomImageAvatar(imageUrl: user.profileImageUrl, radius: 23),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Tu nivel',
                                  style: bodyLargeRTS,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'Nivel ${levelSystem.level} ',
                                    style: disLargeTS,
                                    children: [
                                      TextSpan(
                                        text: '/ Nivel ${levelSystem.level + 1}',
                                        style: subtitleTS.copyWith(color: neutral300),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: white,
                      child: Padding(
                        padding: const EdgeInsets.all(Sizes.p8),
                        child: Row(
                          spacing: Sizes.p8,
                          children: [
                            SvgPicture.asset('assets/images/coin.svg', width: 20),
                            Text('Total: ${user.xp} XP', style: bodySmallBTS.copyWith(color: blue500)),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        authCubit.logout();
                        context.go(AppRoutes.authentication);
                      },
                      child: Text(
                        'Cerrar sesion',
                        style: buttonsTS.copyWith(color: error500),
                      ),
                    ),
                    gapH64,
                    gapH64,
                  ],
                ),
              ),
            ),
          );
        } else if (state is ProfileLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text('No se pudo cargar el perfil'),
            ),
          );
        }
      },
    );
  }
}

class CustomImageAvatar extends StatelessWidget {
  final String? imageUrl;
  final double? radius;

  const CustomImageAvatar({
    super.key,
    this.imageUrl = '',
    this.radius = 50,
  });

  @override
  Widget build(BuildContext context) {
    return imageUrl == null || imageUrl!.isEmpty
        ? CircleAvatar(radius: radius, child: SvgPicture.asset('assets/images/coin.svg'))
        : CircleAvatar(radius: radius, child: Image.network(imageUrl!));
  }
}
