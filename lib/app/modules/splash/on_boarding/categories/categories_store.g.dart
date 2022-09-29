// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoriesStore on _CategoriesStoreBase, Store {
  late final _$isMarkedAtom =
      Atom(name: '_CategoriesStoreBase.isMarked', context: context);

  @override
  bool get isMarked {
    _$isMarkedAtom.reportRead();
    return super.isMarked;
  }

  @override
  set isMarked(bool value) {
    _$isMarkedAtom.reportWrite(value, super.isMarked, () {
      super.isMarked = value;
    });
  }

  @override
  String toString() {
    return '''
isMarked: ${isMarked}
    ''';
  }
}
