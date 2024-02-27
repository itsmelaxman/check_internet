import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_connection_event.dart';
part 'internet_connection_state.dart';

class InternetConnectionBloc
    extends Bloc<InternetConnectionEvent, InternetConnectionState> {
  StreamSubscription<ConnectivityResult>? _subscription;

  InternetConnectionBloc() : super(InternetConnectionInitial()) {
    _subscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        if (result == ConnectivityResult.wifi ||
            result == ConnectivityResult.mobile) {
          add(
            ConnectedEvent(),
          );
        } else {
          add(
            NotConnectedEvent(),
          );
        }
      },
    );

    on<InternetConnectionEvent>((event, emit) {
      if (event is ConnectedEvent) {
        emit(ConnectedState(message: 'Connected to the internet'));
      } else if (event is NotConnectedEvent) {
        emit(NotConnectedState(message: 'No network connection available'));
      }
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
