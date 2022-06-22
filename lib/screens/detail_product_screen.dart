import 'package:flutter/material.dart';
import 'package:flutter_mini_project/models/product_model.dart';
import 'package:flutter_mini_project/services/product_service.dart';

class DetailProductScreen extends StatelessWidget {
  const DetailProductScreen({Key? key, required int idProduct})
      : _idProduct = idProduct,
        super(key: key);

  final int _idProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        actions: [
          MaterialButton(
            onPressed: () {},
            child: Image(
              image: Image.asset("assets/heart-icon.png").image,
              width: 40,
            ),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        child: Text(
          "Checkout",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<ProductModel?>(
          future: ProductService().getDetailProduct(_idProduct),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return snapshot.data != null
                  ? ContentDetailProduct(detailProduct: snapshot.data!)
                  : Center(
                      child: Text(
                        "Terjadi Kesahalan",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class ContentDetailProduct extends StatelessWidget {
  const ContentDetailProduct({Key? key, required ProductModel detailProduct})
      : _detailProduct = detailProduct,
        super(key: key);

  final ProductModel _detailProduct;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.network(_detailProduct.image).image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            _detailProduct.title,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: <Widget>[
              const Icon(Icons.star),
              Text(
                _detailProduct.rating["rate"].toString(),
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: <Widget>[
              const Icon(Icons.attach_money),
              Text(
                _detailProduct.price.toString(),
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            _detailProduct.description,
            style: Theme.of(context).textTheme.bodyText2,
            textAlign: TextAlign.justify,
          ),
        )
      ],
    );
  }
}
