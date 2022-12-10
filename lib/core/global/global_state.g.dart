// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GlobalState on GlobalStateBase, Store {
  Computed<ThemeMode>? _$themeModeComputed;

  @override
  ThemeMode get themeMode =>
      (_$themeModeComputed ??= Computed<ThemeMode>(() => super.themeMode,
              name: 'GlobalStateBase.themeMode'))
          .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: 'GlobalStateBase.isLoading'))
          .value;

  late final _$_themeModeAtom =
      Atom(name: 'GlobalStateBase._themeMode', context: context);

  @override
  Observable<ThemeMode> get _themeMode {
    _$_themeModeAtom.reportRead();
    return super._themeMode;
  }

  @override
  set _themeMode(Observable<ThemeMode> value) {
    _$_themeModeAtom.reportWrite(value, super._themeMode, () {
      super._themeMode = value;
    });
  }

  late final _$_isLoadingAtom =
      Atom(name: 'GlobalStateBase._isLoading', context: context);

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

  late final _$switchThemeAsyncAction =
      AsyncAction('GlobalStateBase.switchTheme', context: context);

  @override
  Future<void> switchTheme({String? id}) {
    return _$switchThemeAsyncAction.run(() => super.switchTheme(id: id));
  }

  @override
  String toString() {
    return '''
themeMode: ${themeMode},
isLoading: ${isLoading}
    ''';
  }
}
