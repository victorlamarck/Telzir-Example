import 'package:disconts/app/shared/models/category_model.dart';
import 'package:disconts/app/shared/models/product_model.dart';
import 'package:mobx/mobx.dart';

part 'initial_store.g.dart';

class InitialStore = _InitialStoreBase with _$InitialStore;

abstract class _InitialStoreBase with Store {
  @observable
  int selectedItem = 0;

  @observable
  List<ProductModel> products = [
    ProductModel(
      id: 1,
      name: 'Sérum Antiacne Normaderm',
      actualPrice: 98.00,
      olderPrice: 150.65,
      dueDate: DateTime(2022, 12),
      category: CategoryModel(id: 1, name: 'DERMOCOSMÉTICOS'),
      imageUrl:
          'https://larocheposay.vteximg.com.br/arquivos/ids/161628/3337875660617_1.jpg?v=637419182396600000',
    ),
    ProductModel(
      id: 2,
      name: 'Sérum Antiacne Normaderm',
      actualPrice: 98.00,
      olderPrice: 150.65,
      dueDate: DateTime(2022, 12),
      category: CategoryModel(id: 1, name: 'DERMOCOSMÉTICOS'),
      imageUrl:
          'https://larocheposay.vteximg.com.br/arquivos/ids/161628/3337875660617_1.jpg?v=637419182396600000',
    ),
    ProductModel(
      id: 3,
      name: 'Sérum Antiacne Normaderm',
      actualPrice: 98.00,
      olderPrice: 150.65,
      dueDate: DateTime(2022, 12),
      category: CategoryModel(id: 1, name: 'DERMOCOSMÉTICOS'),
      imageUrl:
          'https://larocheposay.vteximg.com.br/arquivos/ids/161628/3337875660617_1.jpg?v=637419182396600000',
    ),
    ProductModel(
      id: 4,
      name: 'Sérum Antiacne Normaderm',
      actualPrice: 98.00,
      olderPrice: 150.65,
      dueDate: DateTime(2022, 12),
      category: CategoryModel(id: 1, name: 'DERMOCOSMÉTICOS'),
      imageUrl:
          'https://larocheposay.vteximg.com.br/arquivos/ids/161628/3337875660617_1.jpg?v=637419182396600000',
    ),
  ];
}
