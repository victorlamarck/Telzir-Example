import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:disconts/app/shared/extensions/number_extensions.dart';
import 'package:disconts/app/modules/home/initial/initial_store.dart';
import 'package:disconts/app/shared/core/app_colors.dart';
import 'package:disconts/app/shared/core/app_fonts.dart';
import 'package:disconts/app/shared/models/product_model.dart';
import 'package:disconts/app/shared/widgets/advanced_image.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);
  @override
  InitialPageState createState() => InitialPageState();
}

class InitialPageState extends State<InitialPage> {
  final controller = Modular.get<InitialStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  'DESTAQUES DA SEMANA',
                  style: AppFonts.openSans.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Observer(
            builder: (context) {
              if (controller.products.isEmpty) {
                return Container();
              }

              return SizedBox(
                height: 250,
                child: Swiper(
                  itemBuilder: (_, int index) {
                    final product = controller.products[index];

                    return Container(
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.white,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: ProductSpotlightCard(product: product),
                    );
                  },
                  layout: SwiperLayout.DEFAULT,
                  autoplay: true,
                  autoplayDelay: 6000,
                  loop: true,
                  itemCount: controller.products.length,
                  viewportFraction: 0.45,
                  scale: 0.4,
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton.icon(
                          style: TextButton.styleFrom(
                              backgroundColor: AppColors.backgroundColor,
                              fixedSize: Size.fromHeight(44)),
                          icon: Icon(Icons.format_list_bulleted_rounded),
                          label: Text(
                            'Categorias',
                            style: AppFonts.roboto.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextButton.icon(
                          style: TextButton.styleFrom(
                              backgroundColor: AppColors.backgroundColor,
                              fixedSize: Size.fromHeight(44)),
                          icon: Icon(Icons.check_box_outline_blank),
                          label: Text(
                            'Doações',
                            style: AppFonts.roboto.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 30,
                  alignment: Alignment.center,
                  child: CategoriesHorizontalList(),
                ),
                const SizedBox(height: 24),
                ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shrinkWrap: true,
                  itemCount: controller.products.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (_, index) {
                    final product = controller.products[index];

                    return ProductsVerticalListView(product: product);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductSpotlightCard extends StatelessWidget {
  final ProductModel product;

  const ProductSpotlightCard({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var discount =
        ((1 - ((product.actualPrice ?? 1) / (product.olderPrice ?? 1))) * 100)
            .toInt();

    var dueDate = '${product.dueDate?.month}/${product.dueDate?.year}';

    return GestureDetector(
      onTap: () => Modular.to.pushNamed('/home/product/${product.id}'),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'VENC. $dueDate',
                style: AppFonts.roboto.copyWith(
                  fontSize: 12,
                  color: AppColors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.red[200],
                ),
                child: Text(
                  '-$discount% OFF',
                  style: AppFonts.roboto.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryBlack,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          AdvancedImage(
            imageUrl: product.imageUrl,
            borderRadius: BorderRadius.circular(16),
            fit: BoxFit.cover,
            height: 140,
            width: 140,
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  product.name ?? '',
                  style: AppFonts.openSans.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryBlack,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  product.category?.name ?? '',
                  style: AppFonts.openSans.copyWith(
                    fontSize: 12,
                    color: Colors.grey[300],
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  '${(product.olderPrice)?.toMoney()}',
                  style: AppFonts.openSans.copyWith(
                    fontSize: 14,
                    color: Colors.grey[300],
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 2,
                child: Text(
                  '${(product.actualPrice)?.toMoney()}',
                  style: AppFonts.openSans.copyWith(
                    fontSize: 16,
                    color: AppColors.green,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CategoriesHorizontalList extends StatefulWidget {
  const CategoriesHorizontalList({super.key});

  @override
  State<CategoriesHorizontalList> createState() =>
      _CategoriesHorizontalListState();
}

class _CategoriesHorizontalListState extends State<CategoriesHorizontalList> {
  final controller = Modular.get<InitialStore>();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      separatorBuilder: (_, __) => const SizedBox(width: 16),
      itemBuilder: (_, index) {
        if (controller.selectedItem == index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.green,
                  width: 2,
                ),
              ),
            ),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Alimentos',
                textAlign: TextAlign.center,
                style: AppFonts.openSans.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryBlack,
                ),
              ),
            ),
          );
        }

        return TextButton(
          onPressed: () {
            controller.selectedItem = index;
            setState(() {});
          },
          child: Text(
            'Alimentos',
            textAlign: TextAlign.center,
            style: AppFonts.openSans.copyWith(
              fontSize: 12,
              color: Colors.grey[300],
            ),
          ),
        );
      },
    );
  }
}

class ProductsVerticalListView extends StatelessWidget {
  final ProductModel product;
  const ProductsVerticalListView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    var discount =
        ((1 - ((product.actualPrice ?? 1) / (product.olderPrice ?? 1))) * 100)
            .toInt();

    var dueDate = '${product.dueDate?.month}/${product.dueDate?.year}';

    return GestureDetector(
      onTap: () => Modular.to.pushNamed('/home/product/${product.id}'),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        height: 110,
        child: Row(
          children: [
            AdvancedImage(
              imageUrl: '',
              height: 76,
              width: 76,
            ),
            Expanded(
              child: SizedBox(
                height: 110,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'VENC. $dueDate',
                          style: AppFonts.roboto.copyWith(
                            fontSize: 12,
                            color: AppColors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.red[200],
                          ),
                          child: Text(
                            '-$discount% OFF',
                            style: AppFonts.roboto.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryBlack,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Expanded(
                      child: Text(
                        product.name ?? '',
                        style: AppFonts.openSans.copyWith(
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        product.category?.name ?? '',
                        style: AppFonts.openSans.copyWith(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            '${(product.olderPrice)?.toMoney()}',
                            style: AppFonts.openSans.copyWith(
                              fontSize: 14,
                              color: Colors.grey[300],
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 3,
                          child: Text(
                            '${(product.actualPrice)?.toMoney()}',
                            style: AppFonts.openSans.copyWith(
                              fontSize: 16,
                              color: AppColors.green,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
