// ignore_for_file: non_constant_identifier_names

class Product{
  final String ProductId;
  final String Name;
  final double price;

  Product ({required this.ProductId,required this.Name,required this.price});


 
  Map<String, dynamic> toMap() {
    return{
      'productId':ProductId,
      'name':Name,
      'price':price 
    };
  }

  Product.fromFirestore(Map<String,dynamic> firestore)
  :ProductId=firestore['productId'],
  Name=firestore['name'],
  price=firestore['price'];
} 