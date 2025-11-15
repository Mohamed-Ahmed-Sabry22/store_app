import 'package:_9_store_app/constants.dart';
import 'package:flutter/material.dart';

class Positionedwidget extends StatelessWidget {
  const Positionedwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.19,
      left: 20,
      right: 20,
      child: Container(
        height: 170,
        width: 100,
        decoration: const BoxDecoration(
          color: thirdColor,
          borderRadius: BorderRadius.all(Radius.circular(18)),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40.0, top: 18, bottom: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Text(
                    "Autuman Sale",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        "Up to ",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      Text(
                        "50%",
                        style: TextStyle(
                          color: k2color,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                      color: k2color,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                      child: Text(
                        "Buy Now",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Spacer(),
            Image.asset('assets/images/3.png', fit: BoxFit.contain),
          ],
        ),
      ),
    );
  }
}
