import 'package:flutter/material.dart';
import 'package:flutter_mini_project/models/product_model.dart';
import 'package:flutter_mini_project/services/product_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  size: 30,
                )),
            Image(
              image: Image.asset("assets/heart-icon.png").image,
              width: 50,
            ),
            CircleAvatar(
              child: Image(
                image: Image.asset("assets/person-icon.png").image,
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "RealProducts",
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: FutureBuilder<List<ProductModel>?>(
                  future: ProductService().getAllDataProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      List<ProductModel>? listDataProducts = snapshot.data;
                      return GridView.count(
                          childAspectRatio: 0.5,
                          crossAxisCount: 2,
                          children: listDataProducts?.isNotEmpty ?? false
                              ? listDataProducts!
                                  .map((value) =>
                                      ProductCardComponent(productModel: value))
                                  .toList()
                              : [Text("tidak ada data")]);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCardComponent extends StatelessWidget {
  const ProductCardComponent({Key? key, required ProductModel productModel})
      : _productModel = productModel,
        super(key: key);

  final ProductModel _productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "/detail_product",
          arguments: _productModel.id),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: Image(
                  image: Image.asset("assets/heart-icon.png").image,
                  width: 30,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: double.infinity,
                height: 125,
                child: Image(
                  image: Image.network(_productModel.image).image,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                _productModel.title,
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: <Widget>[
                  const Icon(Icons.star),
                  Text(
                    _productModel.rating["rate"].toString(),
                    style: Theme.of(context).textTheme.bodyText2,
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: <Widget>[
                  const Icon(Icons.attach_money),
                  Text(
                    _productModel.price.toString(),
                    style: Theme.of(context).textTheme.bodyText2,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
