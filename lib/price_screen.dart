import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/coin_data.dart' as coin_data;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}


class _PriceScreenState extends State<PriceScreen> {

  List<DropdownMenuItem> getDropDownItems(){
    List<DropdownMenuItem<String>> dropDownMenuItems = [];
    for (int i=0;i<coin_data.currenciesList.length;i++){
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
            child: DropdownButton<String>(
              value: selectedCurrency,
              items: getDropDownItems(),
              onChanged: (value){
                setState(() {
                  selectedCurrency = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}