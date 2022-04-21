import 'package:http/http.dart' as http;
import 'dart:convert';
import 'constants_url.dart';

class FetchData {
  Future<dynamic> getData(String selectedCurrency) async {
    http.Response response = await http
        .get(Uri.parse('$coinAPIURL/BTC/$selectedCurrency?apikey=$apiKey'));
    try {
      if (response.statusCode == 200) {
        String data = response.body;
        dynamic decodeData = jsonDecode(data);
        dynamic rate = decodeData['rate'];
        print(rate.toStringAsFixed(2));
        return rate.toStringAsFixed(2).toString();
      }
    } catch (e) {
      print(response.statusCode);
      print(e);
      rethrow ;
    }
  }
}
