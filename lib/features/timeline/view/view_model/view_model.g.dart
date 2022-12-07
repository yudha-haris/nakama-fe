// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TimelineViewModel on TimelineViewModelBase, Store {
  Computed<Timeline>? _$timelineComputed;

  @override
  Timeline get timeline =>
      (_$timelineComputed ??= Computed<Timeline>(() => super.timeline,
              name: 'TimelineViewModelBase.timeline'))
          .value;
  Computed<List<Timeline>>? _$timelinesComputed;

  @override
  List<Timeline> get timelines =>
      (_$timelinesComputed ??= Computed<List<Timeline>>(() => super.timelines,
              name: 'TimelineViewModelBase.timelines'))
          .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: 'TimelineViewModelBase.isLoading'))
          .value;

  late final _$_timelinesAtom =
      Atom(name: 'TimelineViewModelBase._timelines', context: context);

  @override
  ObservableList<Timeline> get _timelines {
    _$_timelinesAtom.reportRead();
    return super._timelines;
  }

  @override
  set _timelines(ObservableList<Timeline> value) {
    _$_timelinesAtom.reportWrite(value, super._timelines, () {
      super._timelines = value;
    });
  }

  late final _$_timelineAtom =
      Atom(name: 'TimelineViewModelBase._timeline', context: context);

  @override
  Observable<Timeline> get _timeline {
    _$_timelineAtom.reportRead();
    return super._timeline;
  }

  @override
  set _timeline(Observable<Timeline> value) {
    _$_timelineAtom.reportWrite(value, super._timeline, () {
      super._timeline = value;
    });
  }

  late final _$_isLoadingAtom =
      Atom(name: 'TimelineViewModelBase._isLoading', context: context);

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

  late final _$getAllTimelineAsyncAction =
      AsyncAction('TimelineViewModelBase.getAllTimeline', context: context);

  @override
  Future<void> getAllTimeline(BuildContext context) {
    return _$getAllTimelineAsyncAction.run(() => super.getAllTimeline(context));
  }

  late final _$createTimelineAsyncAction =
      AsyncAction('TimelineViewModelBase.createTimeline', context: context);

  @override
  Future<void> createTimeline(BuildContext context,
      {String? judul, String? isi}) {
    return _$createTimelineAsyncAction
        .run(() => super.createTimeline(context, judul: judul, isi: isi));
  }

  late final _$updateTimelineAsyncAction =
      AsyncAction('TimelineViewModelBase.updateTimeline', context: context);

  @override
  Future<void> updateTimeline(BuildContext context) {
    return _$updateTimelineAsyncAction.run(() => super.updateTimeline(context));
  }

  late final _$deleteTimelineAsyncAction =
      AsyncAction('TimelineViewModelBase.deleteTimeline', context: context);

  @override
  Future<void> deleteTimeline(BuildContext context, {String? id}) {
    return _$deleteTimelineAsyncAction
        .run(() => super.deleteTimeline(context, id: id));
  }

  late final _$getTimelineAsyncAction =
      AsyncAction('TimelineViewModelBase.getTimeline', context: context);

  @override
  Future<void> getTimeline(BuildContext context, {String? id}) {
    return _$getTimelineAsyncAction
        .run(() => super.getTimeline(context, id: id));
  }

  @override
  String toString() {
    return '''
timeline: ${timeline},
timelines: ${timelines},
isLoading: ${isLoading}
    ''';
  }
}
