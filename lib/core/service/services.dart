import 'package:dio/dio.dart';

class Services {
  Dio dio = Dio();

  static const url = 'https://jsonplaceholder.typicode.com/posts';

  // Future<List<String>>
  static getAll() async {
    print('nyhh');
  }

  // getAll() async {
  //   var hasil = await http.get(Uri.parse(url));

  //   // var decode = jsonDecode(hasil.body);

  //   print(hasil.body[0]);
  // }
}
