// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailProductStore on _DetailProductStoreBase, Store {
  late final _$productAtom =
      Atom(name: '_DetailProductStoreBase.product', context: context);

  @override
  ProductModel? get product {
    _$productAtom.reportRead();
    return super.product;
  }

  @override
  set product(ProductModel? value) {
    _$productAtom.reportWrite(value, super.product, () {
      super.product = value;
    });
  }

  late final _$quantityAtom =
      Atom(name: '_DetailProductStoreBase.quantity', context: context);

  @override
  int? get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(int? value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  late final _$sizeAtom =
      Atom(name: '_DetailProductStoreBase.size', context: context);

  @override
  int? get size {
    _$sizeAtom.reportRead();
    return super.size;
  }

  @override
  set size(int? value) {
    _$sizeAtom.reportWrite(value, super.size, () {
      super.size = value;
    });
  }

  late final _$colorAtom =
      Atom(name: '_DetailProductStoreBase.color', context: context);

  @override
  int? get color {
    _$colorAtom.reportRead();
    return super.color;
  }

  @override
  set color(int? value) {
    _$colorAtom.reportWrite(value, super.color, () {
      super.color = value;
    });
  }

  late final _$_DetailProductStoreBaseActionController =
      ActionController(name: '_DetailProductStoreBase', context: context);

  @override
  dynamic init({String? id}) {
    final _$actionInfo = _$_DetailProductStoreBaseActionController.startAction(
        name: '_DetailProductStoreBase.init');
    try {
      return super.init(id: id);
    } finally {
      _$_DetailProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
product: ${product},
quantity: ${quantity},
size: ${size},
color: ${color}
    ''';
  }
}
