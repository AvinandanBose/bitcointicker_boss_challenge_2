import 'package:http/http.dart' as http;
import 'dart:convert';
import 'constants_url.dart';
import 'coin_data.dart';
class FetchData {
  Future<dynamic> getData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String bitcoin in cryptoList) {
      http.Response response = await http.get(
          Uri.parse('$coinAPIURL/$bitcoin/$selectedCurrency?apikey=$apiKey'));
      try {
        if (response.statusCode == 200) {
          String data = response.body;
          dynamic decodeData = jsonDecode(data);
          dynamic rate = decodeData['rate'];
          cryptoPrices[bitcoin] = rate.toStringAsFixed(2);
          // print(rate.toStringAsFixed(2));
          // print(cryptoPrices[bitcoin]);

        }
      }catch (e) {
        print(response.statusCode);
        print(e);
        rethrow;
      }

    }
    print(cryptoPrices);
    return cryptoPrices;
  }
}
