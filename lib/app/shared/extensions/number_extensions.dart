extension DoubleExtensions on double {
  String toMoney() {
    return 'R\$ ${toStringAsFixed(2).replaceAll('.', ',')}';
  }
}

extension NumExtensions on num {
  String toMoney() {
    return 'R\$ ${toStringAsFixed(2).replaceAll('.', ',')}';
  }
}
