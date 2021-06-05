import 'package:dio/dio.dart';
import 'package:papikost/core/api/api.dart';

class Services extends Api {
  Dio dio = Dio();

  // getAll() async {
  //   FormData formData = FormData.fromMap({'ubah': 18});

  //   var response = await dio.post(url2, data: formData);

  //   print(response.data);
  // }
}
