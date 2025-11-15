import 'package:_9_store_app/constants.dart';
import 'package:_9_store_app/models/product_model.dart';
import 'package:_9_store_app/services/get_all_products.dart';
import 'package:_9_store_app/widgets/card.dart';
import 'package:_9_store_app/widgets/positionedwidget.dart';
import 'package:_9_store_app/widgets/search_feild.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              color: kPrimaryColor,
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome to Store !",
                    style: TextStyle(color: Colors.white, fontSize: 26),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(
                      Icons.notifications_active,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 110),
                  const SearchFeild(),
                  const SizedBox(height: 180),
                  FutureBuilder(
                    future: AllProductsServices().getAllProduct(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<ProductModel> products = snapshot.data!;
                        return GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 35,
                                mainAxisSpacing: 30,
                                childAspectRatio: 0.9,
                              ),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return ProductCard(product: products[index]);
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        return Padding(
                          padding: const EdgeInsets.only(top: 80),
                          child: const Center(
                            child: CircularProgressIndicator(color: k2color),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            const Positionedwidget(),
          ],
        ),
      ),
    );
  }
}
