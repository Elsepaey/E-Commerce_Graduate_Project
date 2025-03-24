// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:graduate_project/model/item.dart';

// class ApiService {
//   final String apiUrl =
//       'https://mohamednowar.pythonanywhere.com/api/products/'; 

//   Future<List<Item>> fetchItems() async {
//     final response = await http.get(Uri.parse(apiUrl));

//     if (response.statusCode == 200) {
//       List<dynamic> jsonData = json.decode(response.body)['products'];
//       return jsonData
//           .map((item) => Item(
//                 //slug: item['id'],
//                 title: item['name'],
//                 price: item['price'],
//                 description: item['description'],
//                 //careGuide: item['Care_Guide'],
//                // quantity: item['quantity'],
//                 imgpath: item['image'],
//                 //category: item['category'],
//               ))
//           .toList();
//     } else {
//       throw Exception('Failed to load items');
//     }
//   }
// }
  




  
  