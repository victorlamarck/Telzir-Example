import 'package:disconts/app/modules/home/detail_product/detail_product_store.dart';
import 'package:disconts/app/shared/core/app_colors.dart';
import 'package:disconts/app/shared/core/app_fonts.dart';
import 'package:disconts/app/shared/widgets/advanced_image.dart';
import 'package:disconts/app/shared/extensions/number_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DetailProductPage extends StatefulWidget {
  final String? id;
  const DetailProductPage({Key? key, this.id}) : super(key: key);
  @override
  DetailProductPageState createState() => DetailProductPageState();
}

class DetailProductPageState extends State<DetailProductPage> {
  final controller = Modular.get<DetailProductStore>();
  @override
  void initState() {
    super.initState();
    if (widget.id != null) controller.init(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 30,
          child: Image.asset(
            'assets/images/logo.jpg',
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 16),
          ProductImage(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: AppColors.backgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 22),
                Text(
                  'controller.product?.name ?? ' '',
                  style: AppFonts.roboto.copyWith(
                    fontSize: 20,
                    color: AppColors.primaryBlack,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'controller.product?.category?.name ?? ' '',
                  style: AppFonts.roboto.copyWith(
                    fontSize: 16,
                    color: AppColors.green,
                  ),
                ),
                const SizedBox(height: 23),
                Text(
                  'controller.product?.description ?? ' '',
                  style: AppFonts.roboto.copyWith(
                    fontSize: 16,
                    color: AppColors.green,
                  ),
                ),
                const SizedBox(height: 18),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'DISPONÍVEL PARA:',
              style: AppFonts.openSans.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (valeu) {},
                  activeColor: Colors.grey.shade400,
                  checkColor: AppColors.green,
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                const SizedBox(width: 4),
                Text(
                  'Retirada',
                  style: AppFonts.openSans.copyWith(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(width: 16),
                Checkbox(
                  value: false,
                  onChanged: (valeu) {},
                  activeColor: Colors.grey.shade400,
                  checkColor: AppColors.green,
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                const SizedBox(width: 4),
                Text(
                  'Entrega',
                  style: AppFonts.openSans.copyWith(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(width: 16),
                Checkbox(
                  value: false,
                  onChanged: (valeu) {},
                  activeColor: Colors.grey.shade400,
                  checkColor: AppColors.green,
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                const SizedBox(width: 4),
                Text(
                  'Doação',
                  style: AppFonts.openSans.copyWith(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.place_outlined,
                    color: AppColors.green,
                    size: 30,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Retirar em ',
                      style: AppFonts.roboto.copyWith(
                        fontSize: 16,
                        color: AppColors.primaryBlack,
                      ),
                      children: [
                        TextSpan(
                          text: 'Brasília, DF',
                          style: AppFonts.roboto.copyWith(
                            fontSize: 16,
                            color: AppColors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Quant.',
                          style: AppFonts.roboto.copyWith(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Observer(builder: (_) {
                            return DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton<int>(
                                  isExpanded: true,
                                  items: controller.dropdownQtd,
                                  value: controller.quantity,
                                  borderRadius: BorderRadius.circular(16),
                                  menuMaxHeight: 250,
                                  onChanged: (value) =>
                                      controller.quantity = value,
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tamanho',
                          style: AppFonts.roboto.copyWith(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Observer(builder: (_) {
                            return DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton<int>(
                                  isExpanded: true,
                                  items: controller.dropdownSize,
                                  value: controller.size,
                                  borderRadius: BorderRadius.circular(16),
                                  menuMaxHeight: 250,
                                  onChanged: (value) => controller.size = value,
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cor',
                          style: AppFonts.roboto.copyWith(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Observer(
                            builder: (_) {
                              return DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton<int>(
                                    isExpanded: true,
                                    items: controller.dropdownColor,
                                    value: controller.color,
                                    borderRadius: BorderRadius.circular(16),
                                    menuMaxHeight: 250,
                                    onChanged: (value) =>
                                        controller.color = value,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductImage extends StatefulWidget {
  const ProductImage({super.key});

  @override
  State<ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  final controller = Modular.get<DetailProductStore>();

  @override
  Widget build(BuildContext context) {
    var discount = ((1 -
                ((controller.product?.actualPrice ?? 1) /
                    (controller.product?.olderPrice ?? 1))) *
            100)
        .toInt();

    var dueDate =
        '${controller.product?.dueDate?.month}/${controller.product?.dueDate?.year}';
    return Stack(
      alignment: Alignment.center,
      children: [
        AdvancedImage(
          imageUrl: controller.product?.imageUrl,
          height: 375,
          width: double.maxFinite,
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'VENC. ${dueDate}',
              style: AppFonts.roboto.copyWith(
                fontSize: 14,
                color: AppColors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${(controller.product?.olderPrice ?? 0).toMoney()}',
                          style: AppFonts.openSans.copyWith(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(width: 8),
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
                    Text(
                      '${(controller.product?.actualPrice ?? 0).toMoney()}',
                      style: AppFonts.openSans.copyWith(
                        fontSize: 20,
                        color: AppColors.green,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Vendido por:',
                style: AppFonts.roboto.copyWith(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
              Text(
                'Fornecedor ABCD',
                style: AppFonts.roboto.copyWith(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
