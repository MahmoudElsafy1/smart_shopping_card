import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants.dart';
import '../models/product.dart';

class Store {
  bool flag=false;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  addProduct(Product product) {
    _firestore.collection(kProductsCollection).add({
      kProductName: product.pName,
      kProductDescription: product.pDescription,
      kProductWeight: product.pweight,
      kProductCategory: product.pCategory,
      kProductPrice: product.pPrice,
      kProductExpiryDate: product.pexpirydate,
      kProductimageLoc: product.pimageLocation
    });
  }

  Stream<QuerySnapshot> loadProducts() {
    return _firestore.collection(kProductsCollection).snapshots();
  }

  deleteProduct(documentId) {
    _firestore.collection(kProductsCollection).doc(documentId).delete();
  }

  editProduct(data, documentId) {
    _firestore.collection(kProductsCollection).doc(documentId).update(data);
  }

  Stream<QuerySnapshot> queryData(String queryData) {

    return  _firestore.collection(kProductsCollection)
        .where(kProductName, isGreaterThanOrEqualTo:queryData)
            .where(kProductName, isLessThan: queryData +'z').snapshots();




  }

}
