// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ActivityViewModel on ActivityViewModelBase, Store {
  Computed<Activity>? _$activityComputed;

  @override
  Activity get activity =>
      (_$activityComputed ??= Computed<Activity>(() => super.activity,
              name: 'ActivityViewModelBase.activity'))
          .value;
  Computed<List<Activity>>? _$activitiesComputed;

  @override
  List<Activity> get activities =>
      (_$activitiesComputed ??= Computed<List<Activity>>(() => super.activities,
              name: 'ActivityViewModelBase.activities'))
          .value;
  Computed<List<Activity>>? _$historiesComputed;

  @override
  List<Activity> get histories =>
      (_$historiesComputed ??= Computed<List<Activity>>(() => super.histories,
              name: 'ActivityViewModelBase.histories'))
          .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: 'ActivityViewModelBase.isLoading'))
          .value;

  late final _$_activitiesAtom =
      Atom(name: 'ActivityViewModelBase._activities', context: context);

  @override
  ObservableList<Activity> get _activities {
    _$_activitiesAtom.reportRead();
    return super._activities;
  }

  @override
  set _activities(ObservableList<Activity> value) {
    _$_activitiesAtom.reportWrite(value, super._activities, () {
      super._activities = value;
    });
  }

  late final _$_historiesAtom =
      Atom(name: 'ActivityViewModelBase._histories', context: context);

  @override
  ObservableList<Activity> get _histories {
    _$_historiesAtom.reportRead();
    return super._histories;
  }

  @override
  set _histories(ObservableList<Activity> value) {
    _$_historiesAtom.reportWrite(value, super._histories, () {
      super._histories = value;
    });
  }

  late final _$_activityAtom =
      Atom(name: 'ActivityViewModelBase._activity', context: context);

  @override
  Observable<Activity> get _activity {
    _$_activityAtom.reportRead();
    return super._activity;
  }

  @override
  set _activity(Observable<Activity> value) {
    _$_activityAtom.reportWrite(value, super._activity, () {
      super._activity = value;
    });
  }

  late final _$_isLoadingAtom =
      Atom(name: 'ActivityViewModelBase._isLoading', context: context);

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

  late final _$getHistoryAsyncAction =
      AsyncAction('ActivityViewModelBase.getHistory', context: context);

  @override
  Future<void> getHistory(BuildContext context, {String? username}) {
    return _$getHistoryAsyncAction
        .run(() => super.getHistory(context, username: username));
  }

  late final _$getActivityAsyncAction =
      AsyncAction('ActivityViewModelBase.getActivity', context: context);

  @override
  Future<void> getActivity(BuildContext context, {String? username}) {
    return _$getActivityAsyncAction
        .run(() => super.getActivity(context, username: username));
  }

  @override
  String toString() {
    return '''
activity: ${activity},
activities: ${activities},
histories: ${histories},
isLoading: ${isLoading}
    ''';
  }
}
