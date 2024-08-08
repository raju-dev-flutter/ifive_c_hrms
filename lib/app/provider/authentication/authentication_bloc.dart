import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../app.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
      {required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(initialState()) {
    on<AuthenticationEvent>(_authenticationEvent);
  }
  final AuthenticationRepository _authenticationRepository;

  static initialState() => AuthenticationUninitialized();

  void _authenticationEvent(
      AuthenticationEvent event, Emitter<AuthenticationState> emit) async {
    if (event is AppStarted) {
      await Future.delayed(const Duration(seconds: 2));
      // final bool hasPermissionToken =
      //     await _authenticationRepository.hasPermissionToken();
      final bool hasToken = await _authenticationRepository.hasToken();
      // if (hasPermissionToken) {
      if (hasToken) {
        emit(AuthenticationAuthenticated());
      } else {
        emit(AuthenticationUnauthenticated());
      }
      // } else {
      //   emit(AppPermissionNotGranted());
      // }
    }
    if (event is AppPermission) {
      await _authenticationRepository
          .persistedPermissionToken(event.permission);
      // final bool hasPermissionToken =
      //     await _authenticationRepository.hasPermissionToken();
      final bool hasToken = await _authenticationRepository.hasToken();
      // if (hasPermissionToken) {
      if (hasToken) {
        emit(AuthenticationAuthenticated());
      } else {
        emit(AuthenticationUnauthenticated());
      }
      // } else {
      //   emit(AppPermissionNotGranted());
      // }
    }
    if (event is LoggedIn) {
      debugPrint('====== LoggedIn ==========');
      // await _authenticationRepository.persistedToken(event.token);
      emit(AuthenticationAuthenticated());
    }
    if (event is LoggedOut) {
      // emit(AuthenticationLoading());
      await _authenticationRepository.deleteToken();
      emit(AuthenticationUnauthenticated());
    }
  }
}
