import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AdvancedImage extends StatelessWidget {
  final String? imageUrl;
  final double height;
  final double width;
  final BorderRadius? borderRadius;
  final BoxFit fit;
  final bool expandOnClick;
  final bool progressIndicator;
  final Widget? errorWidget;
  final bool greyScale;
  final String? defaultType;
  final VoidCallback? onTap;

  const AdvancedImage({
    Key? key,
    required this.imageUrl,
    this.height = 60,
    this.width = 60,
    this.borderRadius,
    this.fit = BoxFit.cover,
    this.expandOnClick = false,
    this.progressIndicator = false,
    this.errorWidget,
    this.greyScale = false,
    this.defaultType,
    this.onTap,
  })  : assert(!(expandOnClick && onTap != null)),
        super(key: key);

  Widget _getErrorWidget() {
    if (errorWidget == null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Image.asset(
            'assets/images/logo.jpg',
            fit: BoxFit.contain,
            width: width,
            height: height,
          ),
        ),
      );
    }

    return errorWidget!;
  }

  Widget _getImage() {
    return CachedNetworkImage(
      progressIndicatorBuilder: (context, url, progress) {
        if (progressIndicator) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container();
      },
      imageUrl: imageUrl ?? '',
      height: height,
      width: width,
      errorWidget: (context, url, data) {
        return _getErrorWidget();
      },
      imageBuilder: (_, image) {
        if (greyScale) {
          return Opacity(
            opacity: 0.2,
            child: ClipRRect(
              borderRadius: borderRadius ?? BorderRadius.circular(99),
              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  Colors.grey,
                  BlendMode.saturation,
                ),
                child: Image(
                  height: height,
                  width: width,
                  fit: fit,
                  image: image,
                ),
              ),
            ),
          );
        }

        return ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.circular(99),
          child: Image(
            height: height,
            width: width,
            fit: fit,
            image: image,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!expandOnClick) {
      return _getImage();
    }

    return GestureDetector(
      onTap: () {
        Modular.to.push(
          MaterialPageRoute(
            builder: (context) {
              return DetailImageScreen(imageUrl: imageUrl ?? '');
            },
          ),
        );
      },
      child: Hero(
        tag: 'expandedImage',
        child: _getImage(),
      ),
    );
  }
}

class DetailImageScreen extends StatelessWidget {
  final String imageUrl;

  const DetailImageScreen({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Imagem'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: size.height * 0.7,
            child: Hero(
              tag: 'expandedImage',
              child: InteractiveViewer(
                panEnabled: false,
                boundaryMargin: const EdgeInsets.all(80),
                minScale: 0.5,
                maxScale: 4,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  errorWidget: (context, url, data) {
                    return Center(
                      child: Image.asset(
                        'assets/images/logo.jpg',
                        fit: BoxFit.contain,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
