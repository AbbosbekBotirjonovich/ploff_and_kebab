import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_and_kebab/src/config/router/app_routes.dart';
import 'package:ploff_and_kebab/src/config/theme/app_images.dart';
import 'package:ploff_and_kebab/src/core/extension/extension.dart';
import 'package:ploff_and_kebab/src/presentation/components/awesome/awesome_loader.dart';

import '../../bloc/splash/splash_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().add(const SplashEvent());
  }

  @override
  Widget build(BuildContext context) => BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state.isTimerFinished) {
            Navigator.pushReplacementNamed(
              context,
              Routes.main,
            );
          }
        },
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
          ),
          child: Scaffold(
            backgroundColor: context.theme.colorScheme.background,
            body: Stack(
              children: [
                Positioned.fill(
                  child: Center(
                    child: Image.asset(AppImages.appLogo),
                  ),
                ),
                const Positioned(
                  bottom: 80,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: AwesomeLoader(
                      loaderType: awesomeLoader3,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
