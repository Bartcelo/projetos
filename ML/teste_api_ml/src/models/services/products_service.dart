import '../../data/fakdata.dart';
import '../product_model.dart';

class ProductsService {
  Future<List<ProductModel>> findAllProducts() async {
    await Future.delayed(const Duration(milliseconds: 50));
    final List<ProductModel> allProducts =
        products.map((productMap) => ProductModel.fromMap(productMap)).toList();
        return allProducts;
  }
Future <ProductModel> findProductById(int id) async{
    await Future.delayed(const Duration(milliseconds: 50));
    final List<ProductModel> allProducts =
        products.map((productMap) => ProductModel.fromMap(productMap)).toList();
    final ProductModel selectProduct = allProducts.firstWhere((product) => product.id == id);

    return selectProduct;

}


}
