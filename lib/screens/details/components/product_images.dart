import 'package:flutter/material.dart';
import 'package:totofood/models/Product.dart';
import 'package:totofood/models/QuanLyAnh.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key? key,
    required this.product
  }) : super(key: key);

  final Product product;
  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Hero(
                tag: widget.product.idSanPham.toString(),
                child: Image.network(
                  'https://capcut.avashope.com/image/${widget.product.idAnh.fileAnh}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        // SizedBox(height: getProportionateScreenWidth(20)),

      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(8),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image.network(
          'https://capcut.avashope.com/image/${widget.product.idAnh.fileAnh}',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
