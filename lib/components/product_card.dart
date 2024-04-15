import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:totofood/models/Product.dart';
import 'package:totofood/models/QuanLyAnh.dart';
import 'package:totofood/screens/details/details_screen.dart';
import 'package:totofood/components/default_button.dart';
import '../constants.dart';
import '../size_config.dart';

class ProductCard extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Function? press;
  final double width, aspectRetio;
  final Product product;
  final String text;
  final int hideButton;

  const ProductCard({
    Key? key,
    this.press,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
    required this.formKey,
    required this.text,
    required this.hideButton,
  }) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Padding(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
          child: SizedBox(
            width: getProportionateScreenWidth(widget.width),
            child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    DetailsScreen.routeName,
                    arguments: ProductDetailsArguments(product: widget.product),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  AspectRatio(
                  aspectRatio: widget.aspectRetio,
                  child: Container(
                    decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Hero(
                      tag: widget.product.idSanPham.toString(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          'https://capcut.avashope.com/image/${widget.product.idAnh.fileAnh}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.product.tenSanPham,
                  style: const TextStyle(color: Colors.black),
                  maxLines: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.product.giaBan} đ",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        fontWeight: FontWeight.w600,
                        color: kPrimaryColor,
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        setState(() {
                          widget.product.isFavourite = !widget.product.isFavourite;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                        height: getProportionateScreenWidth(28),
                        width: getProportionateScreenWidth(28),
                        decoration: BoxDecoration(
                          color: widget.product.isFavourite
                              ? kPrimaryColor.withOpacity(0.15)
                              : kSecondaryColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/Heart Icon_2.svg",
                          color: widget.product.isFavourite
                              ? const Color(0xFFFF4848)
                              : const Color(0xFFDBDEE4),
                        ),
                      ),
                    ),
                  ],
                ),
                if (widget.hideButton == 0)
            DefaultButton(
            text: widget.text,
            press: widget.press,
            col: kPrimaryColor,
          )else  SizedBox.shrink(),
      ],
    ),
    ),
    ),
    ),
    );
  }
}