class Product {
  String pName;
  String pPrice;
  String pweight;
  String pDescription;
  String pCategory;
  String  pimageLocation;
  String pexpirydate;
  int  pQuantity=1;
  String pid="";

  Product(
      {
        required this.pName,
        required this.pCategory,
        required this.pDescription,
        required this.pweight,
        required this.pPrice,
        required this.pexpirydate,
        required this.pimageLocation,
        this.pid="",
        this.pQuantity=1,

      });
}