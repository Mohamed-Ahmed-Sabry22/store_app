import 'package:_9_store_app/constants.dart';
import 'package:_9_store_app/models/product_model.dart';
import 'package:_9_store_app/services/cart_manager.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key, required this.product, required this.onChanged});

  final ProductModel product;
  final VoidCallback onChanged; // callback عشان نحدث الـ Total Price

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    bool checked = CartManager.checkedItems[widget.product] ?? false;
    int quantity = CartManager.quantities[widget.product] ?? 1;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        height: 110,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: thirdColor,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                height: double.infinity,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      widget.product.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Spacer(flex: 2),
                    Row(
                      children: [
                        Text(
                          widget.product.title.length > 20
                              ? widget.product.title.substring(0, 20) + '...'
                              : widget.product.title,
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            setState(() {
                              CartManager.updateChecked(
                                widget.product,
                                !checked,
                              );
                            });
                            widget.onChanged(); // تحديث الـ Total Price
                          },
                          child: Icon(
                            Icons.check_box,
                            color: checked
                                ? const Color.fromARGB(255, 59, 123, 167)
                                : greyColor,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                    Spacer(flex: 3),
                    Row(
                      children: [
                        Text(
                          "${widget.product.price} \$",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 25,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: greyColor, width: 1),
                          ),
                          child: Row(
                            children: [
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  if (quantity > 1) {
                                    setState(() {
                                      CartManager.updateQuantity(
                                        widget.product,
                                        quantity - 1,
                                      );
                                    });
                                    widget.onChanged(); // تحديث الـ Total Price
                                  }
                                },
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                    color: greyColor,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Text(
                                "1",
                                style: TextStyle(
                                  color: greyColor,
                                  fontSize: 16,
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    CartManager.updateQuantity(
                                      widget.product,
                                      quantity + 1,
                                    );
                                  });
                                  widget.onChanged(); // تحديث الـ Total Price
                                },
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                    color: greyColor,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Spacer(flex: 2),
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
