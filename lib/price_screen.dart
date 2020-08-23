import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/coin_data.dart' as coin_data;
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {


  List<Text> currencyList;

  List<Text> returnText() {
    List<Text> currencyList = [];
    for (String currency in coin_data.currenciesList) {
      currencyList.add(Text(currency));
    }
    return currencyList;
  }
  CupertinoPicker getCupertinoPicker(){
    return CupertinoPicker(
      onSelectedItemChanged: (int selectedIndex) {
        print(currencyList[selectedIndex]);
      },
      itemExtent: 32.0,
      children: currencyList,
    );
  }




  DropdownButton<String> getDropdownButton() {
    return DropdownButton<String>(
      value: selectedCurrency,
      items: getDropDownItems(),
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
        });
      },
    );
  }

  List<DropdownMenuItem> getDropDownItems() {
    List<DropdownMenuItem<String>> dropDownMenuItems = [];
    for (int i = 0; i < coin_data.currenciesList.length; i++) {
      var newItem = DropdownMenuItem(
        child: Text(coin_data.currenciesList[i]),
        value: coin_data.currenciesList[i],
      );
      dropDownMenuItems.add(newItem);
    }
    return dropDownMenuItems;
  }

  String selectedCurrency;

  @override
  Widget build(BuildContext context) {
    const apiKey = '05EE6727-F13B-4F59-B60A-6B4CF8AE7E69';
    const url= 'curl https://rest.coinapi.io/v1/exchangerate/BTC/USD \ --request GET --header "X-CoinAPI-Key: ${apiKey} ';

    currencyList = returnText();
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isAndroid? getDropdownButton(): getCupertinoPicker(),
          ),
        ],
      ),
    );
  }
}
