part of 'internet_connection_bloc.dart';

abstract class InternetConnectionState {
  const InternetConnectionState();

  List<Object> get props => [];
}

class InternetConnectionInitial extends InternetConnectionState {}

class ConnectedState extends InternetConnectionState {
  final String message;

  ConnectedState({required this.message});
}

class NotConnectedState extends InternetConnectionState {
  final String message;

  NotConnectedState({required this.message});
}
