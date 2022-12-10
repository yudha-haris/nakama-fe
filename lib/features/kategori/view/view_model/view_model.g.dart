// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$KategoriViewModel on KategoriViewModelBase, Store {
  Computed<Kategori>? _$kategoriComputed;

  @override
  Kategori get kategori =>
      (_$kategoriComputed ??= Computed<Kategori>(() => super.kategori,
              name: 'KategoriViewModelBase.kategori'))
          .value;
  Computed<List<Kategori>>? _$categoriesComputed;

  @override
  List<Kategori> get categories =>
      (_$categoriesComputed ??= Computed<List<Kategori>>(() => super.categories,
              name: 'KategoriViewModelBase.categories'))
          .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: 'KategoriViewModelBase.isLoading'))
          .value;

  late final _$_categoriesAtom =
      Atom(name: 'KategoriViewModelBase._categories', context: context);

  @override
  ObservableList<Kategori> get _categories {
    _$_categoriesAtom.reportRead();
    return super._categories;
  }

  @override
  set _categories(ObservableList<Kategori> value) {
    _$_categoriesAtom.reportWrite(value, super._categories, () {
      super._categories = value;
    });
  }

  late final _$_kategoriAtom =
      Atom(name: 'KategoriViewModelBase._kategori', context: context);

  @override
  Observable<Kategori> get _kategori {
    _$_kategoriAtom.reportRead();
    return super._kategori;
  }

  @override
  set _kategori(Observable<Kategori> value) {
    _$_kategoriAtom.reportWrite(value, super._kategori, () {
      super._kategori = value;
    });
  }

  late final _$_isLoadingAtom =
      Atom(name: 'KategoriViewModelBase._isLoading', context: context);

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

  late final _$getKategoriAsyncAction =
      AsyncAction('KategoriViewModelBase.getKategori', context: context);

  @override
  Future<void> getKategori(BuildContext context, {String? username}) {
    return _$getKategoriAsyncAction
        .run(() => super.getKategori(context, username: username));
  }

  late final _$updateKategoriAsyncAction =
      AsyncAction('KategoriViewModelBase.updateKategori', context: context);

  @override
  Future<void> updateKategori(BuildContext context,
      {String? judul, String? username, String? idKategori}) {
    return _$updateKategoriAsyncAction.run(() => super.updateKategori(context,
        judul: judul, username: username, idKategori: idKategori));
  }

  late final _$addKategoriAsyncAction =
      AsyncAction('KategoriViewModelBase.addKategori', context: context);

  @override
  Future<void> addKategori(BuildContext context, {String? judul}) {
    return _$addKategoriAsyncAction
        .run(() => super.addKategori(context, judul: judul));
  }

  late final _$deleteKategoriAsyncAction =
      AsyncAction('KategoriViewModelBase.deleteKategori', context: context);

  @override
  Future<void> deleteKategori(BuildContext context, {String? idKategori}) {
    return _$deleteKategoriAsyncAction
        .run(() => super.deleteKategori(context, idKategori: idKategori));
  }

  @override
  String toString() {
    return '''
kategori: ${kategori},
categories: ${categories},
isLoading: ${isLoading}
    ''';
  }
}
