import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '05EE6727-F13B-4F59-B60A-6B4CF8AE7E69';

class CoinData {
  //3. Create the Asynchronous method getCoinData() that returns a Future (the price data).
  Future getCoinData(String selectedCurrency) async {
    //4. Create a url combining the coinAPIURL with the currencies we're interested, BTC to USD.
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      //Update the URL to use the crypto symbol from the cryptoList
      String requestURL =
          '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';
      http.Response response = await http.get(requestURL);

      //6. Check that the request was successful.
      if (response.statusCode == 200) {
        //7. Use the 'dart:convert' package to decode the JSON data that comes back from coinapi.io.
        var decodedData = jsonDecode(response.body);
        //8. Get the last price of bitcoin with the key 'last'.
        var lastPrice = decodedData['rate'];
        //9. Output the lastPrice from the method.
        return lastPrice.toStringAsFixed(0);
      } else {
        //10. Handle any errors that occur during the request.
        print(response.statusCode);
        //Optional: throw an error if our request fails.
        throw 'Problem with the get request';
      }
    }
  }
}