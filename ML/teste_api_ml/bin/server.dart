import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import '../src/controller/products_controller.dart';
import '../src/models/services/products_service.dart';

// Configure routes.
final _router = Router();


void main(List<String> args) async {
  final ProductsService productsService = ProductsService();
  final ProductsController productsController = ProductsController(productsService);
  _router.get('/products', productsController.getAllProducts);
  _router.get('/products/<id>', productsController.getProductById);

  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '3000');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}
