import 'package:dio/dio.dart';

class Services {
  Dio dio = Dio();

  String url = 'https://jsonplaceholder.typicode.com/posts';

  // Future<List<String>>
  getAll() async {}

  // getAll() async {
  //   var hasil = await http.get(Uri.parse(url));

  //   // var decode = jsonDecode(hasil.body);

  //   print(hasil.body[0]);
  // }
}