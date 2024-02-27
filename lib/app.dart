import 'package:check_internet_connection/config/routes/app_routes.dart';
import 'package:check_internet_connection/config/themes/app_theme.dart';
import 'package:check_internet_connection/config/utils/app_strings.dart';
import 'package:check_internet_connection/config/utils/hex_color.dart';
import 'package:check_internet_connection/features/internet_connection/presentation/bloc/internet_connection_bloc.dart';
import 'package:check_internet_connection/features/internet_connection/presentation/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetConnection extends StatelessWidget {
  const InternetConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => InternetConnectionBloc(),
      child: MaterialApp(
        home: const MyHomePage(),
        title: AppStrings.appName,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        color: HexColor(
          '#2a363b',
        ),
        theme: appTheme(),
      ),
    );
  }
}
