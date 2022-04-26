import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

import '../models/product_model.dart';
import '../models/services/products_service.dart';

class ProductsController {
  ProductsController(this._productsService);

  final ProductsService _productsService;

  FutureOr<Response> getAllProducts(Request request) async {
    try {
      final List<ProductModel> allProducts =
          await _productsService.findAllProducts();
      return Response.ok(
          jsonEncode({
            'products': allProducts.map((product) => product.toMap()).toList(),
          }),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          });
    } catch (e) {
      return Response.internalServerError(
          body: jsonEncode({
        'error': e.toString(),
      }));
    }
  }

  FutureOr<Response> getProductById(Request request, String id) async {
    final int productId = int.parse(id);
    try {
      final ProductModel product =
          await _productsService.findProductById(productId);

      return Response.ok(jsonEncode({'product': product.toMap()}), headers: {
        HttpHeaders.contentTypeHeader: 'aplication/json',
      });
    } catch (e) {
      return Response.internalServerError(
        body: jsonEncode({
          'erro': e.toString(),
        })
      );
    }
  }
}
