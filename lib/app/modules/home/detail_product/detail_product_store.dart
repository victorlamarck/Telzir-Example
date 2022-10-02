import 'package:disconts/app/shared/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'detail_product_store.g.dart';

class DetailProductStore = _DetailProductStoreBase with _$DetailProductStore;

abstract class _DetailProductStoreBase with Store {
  @observable
  ProductModel? product;

  @observable
  int? quantity;

  @observable
  int? size;

  @observable
  int? color;

  @action
  init({String? id}) {}

  List<DropdownMenuItem<int>> get dropdownQtd {
    List<DropdownMenuItem<int>> menuItems = [
      DropdownMenuItem(child: Text("1"), value: 1),
      DropdownMenuItem(child: Text("2"), value: 2),
      DropdownMenuItem(child: Text("3"), value: 3),
      DropdownMenuItem(child: Text("4"), value: 4),
      DropdownMenuItem(child: Text("5"), value: 5),
      DropdownMenuItem(child: Text("6"), value: 6),
      DropdownMenuItem(child: Text("7"), value: 7),
      DropdownMenuItem(child: Text("8"), value: 8),
      DropdownMenuItem(child: Text("9"), value: 9),
      DropdownMenuItem(child: Text("10"), value: 10),
      DropdownMenuItem(child: Text("11"), value: 11),
      DropdownMenuItem(child: Text("12"), value: 12),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<int>> get dropdownSize {
    List<DropdownMenuItem<int>> menuItems = [
      DropdownMenuItem(child: Text("PP"), value: 1),
      DropdownMenuItem(child: Text("P"), value: 2),
      DropdownMenuItem(child: Text("M"), value: 3),
      DropdownMenuItem(child: Text("G"), value: 4),
      DropdownMenuItem(child: Text("GG"), value: 5),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<int>> get dropdownColor {
    List<DropdownMenuItem<int>> menuItems = [
      DropdownMenuItem(child: Text("Azul"), value: 1),
      DropdownMenuItem(child: Text("Vermelho"), value: 2),
      DropdownMenuItem(child: Text("Cinza"), value: 3),
      DropdownMenuItem(child: Text("Amarelo"), value: 4),
      DropdownMenuItem(child: Text("Preto"), value: 5),
    ];
    return menuItems;
  }
}
