// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthenticationViewModel on AuthenticationViewModelBase, Store {
  Computed<Profile>? _$profileComputed;

  @override
  Profile get profile =>
      (_$profileComputed ??= Computed<Profile>(() => super.profile,
              name: 'AuthenticationViewModelBase.profile'))
          .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: 'AuthenticationViewModelBase.isLoading'))
          .value;

  late final _$_profileAtom =
      Atom(name: 'AuthenticationViewModelBase._profile', context: context);

  @override
  Observable<Profile> get _profile {
    _$_profileAtom.reportRead();
    return super._profile;
  }

  @override
  set _profile(Observable<Profile> value) {
    _$_profileAtom.reportWrite(value, super._profile, () {
      super._profile = value;
    });
  }

  late final _$_isLoadingAtom =
      Atom(name: 'AuthenticationViewModelBase._isLoading', context: context);

  @override
  Observable<bool> get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(Observable<bool> value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('AuthenticationViewModelBase.login', context: context);

  @override
  Future<void> login(BuildContext context,
      {String? username, String? password}) {
    return _$loginAsyncAction.run(
        () => super.login(context, username: username, password: password));
  }

  late final _$registerAsyncAction =
      AsyncAction('AuthenticationViewModelBase.register', context: context);

  @override
  Future<void> register(BuildContext context,
      {String username = '',
      String password = '',
      String confirmPassword = '',
      String name = '',
      String email = '',
      String phone = ''}) {
    return _$registerAsyncAction.run(() => super.register(context,
        username: username,
        password: password,
        confirmPassword: confirmPassword,
        name: name,
        email: email,
        phone: phone));
  }

  @override
  String toString() {
    return '''
profile: ${profile},
isLoading: ${isLoading}
    ''';
  }
}
