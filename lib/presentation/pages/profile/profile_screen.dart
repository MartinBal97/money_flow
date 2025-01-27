import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_pocket/core/constans/app_sizes.dart';
import 'package:my_pocket/core/router/routes.dart';
import 'package:my_pocket/core/theme/app_theme.dart';
import 'package:my_pocket/domain/entities/app_user.dart';
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

  late AppUser? currentUser = authCubit.currentUser;

  @override
  void initState() {
    profileCubit.fetchUserProfile(widget.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoaded) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Profile Screen'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(Sizes.p16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(state.profileUser.profileImageUrl),
                  ),
                  gapH32,
                  Text(
                    '${state.profileUser.name}',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  gapH16,
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(Sizes.p16),
                      child: Column(
                        children: [
                          const Text('Tu nivel'),
                          RichText(
                            text: TextSpan(
                              text: 'Nivel: ',
                              style: bodyLargeBTS,
                              children: [
                                TextSpan(
                                  text: '${state.profileUser.xp}',
                                  style: Theme.of(context).textTheme.headlineMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      try {
                        authCubit.logout();
                        context.go(AppRoutes.authentication);
                      } catch (e) {
                        log('message');
                      }
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
