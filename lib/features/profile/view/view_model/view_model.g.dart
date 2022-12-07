// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileViewModel on ProfileViewModelBase, Store {
  Computed<Profile>? _$profileComputed;

  @override
  Profile get profile =>
      (_$profileComputed ??= Computed<Profile>(() => super.profile,
              name: 'ProfileViewModelBase.profile'))
          .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: 'ProfileViewModelBase.isLoading'))
          .value;

  late final _$_profileAtom =
      Atom(name: 'ProfileViewModelBase._profile', context: context);

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
      Atom(name: 'ProfileViewModelBase._isLoading', context: context);

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

  late final _$editProfileAsyncAction =
      AsyncAction('ProfileViewModelBase.editProfile', context: context);

  @override
  Future<void> editProfile(BuildContext context,
      {String? username,
      String? password,
      String? confirmPassword,
      String? name,
      String? email,
      String? phone}) {
    return _$editProfileAsyncAction.run(() => super.editProfile(context,
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
