import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pocket/core/constans/firebase_options.dart';
import 'package:my_pocket/core/router/router.dart';
import 'package:my_pocket/core/theme/app_theme.dart';
import 'package:my_pocket/data/firebase_auth_repo.dart';
import 'package:my_pocket/presentation/cubits/cubit/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final authRepo = FirebaseAuthRepo();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(authRepo: authRepo)..checkAuth(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'myPocket',
        routerConfig: appRouter,
        theme: AppTheme().getTheme(),
      ),
    );
  }
}
