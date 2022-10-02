// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initial_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InitialStore on _InitialStoreBase, Store {
  late final _$selectedItemAtom =
      Atom(name: '_InitialStoreBase.selectedItem', context: context);

  @override
  int get selectedItem {
    _$selectedItemAtom.reportRead();
    return super.selectedItem;
  }

  @override
  set selectedItem(int value) {
    _$selectedItemAtom.reportWrite(value, super.selectedItem, () {
      super.selectedItem = value;
    });
  }

  late final _$productsAtom =
      Atom(name: '_InitialStoreBase.products', context: context);

  @override
  List<ProductModel> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<ProductModel> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  @override
  String toString() {
    return '''
selectedItem: ${selectedItem},
products: ${products}
    ''';
  }
}
