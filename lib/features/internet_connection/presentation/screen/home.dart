import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../config/utils/utils.dart';
import '../bloc/internet_connection_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              ImgAssets.imgName,
              height: 100,
              width: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.detailScreen);
              },
              child: const Text('Go'),
            ),
            BlocBuilder<InternetConnectionBloc, InternetConnectionState>(
              builder: (context, state) {
                return _buildConnectionStatus(state);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConnectionStatus(InternetConnectionState state) {
    if (state is ConnectedState) {
      return Text(state.message);
    } else if (state is NotConnectedState) {
      return Text(state.message);
    }
    return const SizedBox();
  }
}
