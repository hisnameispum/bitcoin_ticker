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

class CoinData {
  String rate;


  void getCoinData() async{
    const apiKey = '05EE6727-F13B-4F59-B60A-6B4CF8AE7E69';
    const url= 'curl https://rest.coinapi.io/v1/exchangerate/BTC/USD \ --request GET --header "X-CoinAPI-Key: ${apiKey} ';
    http.Response response = await http.get(url);
    print(response.body);
  }
}