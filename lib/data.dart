import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'coin_data_class.dart';
import 'package:http/http.dart' as http;

class Data with ChangeNotifier {
  String base_url =
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=myr&order=market_cap_desc&per_page=100&page=1&sparkline=false';

  //container height for device orientation
  deviceOrient(BuildContext context) {
    var orient = MediaQuery.of(context).orientation;
    if (orient == Orientation.landscape) {
      return 225.0;
    } else if (orient == Orientation.portrait) {
      return 660.0;
    }
    notifyListeners();
  }

  //get coindata list from coingecko  API
  Future<List<CoinData>> getCoinIdData(List<CoinData> data) async {
    http.Response response = await http.get(base_url);
    var results = jsonDecode(response.body);
    for (int i = 0; i < 100; i++) {
      CoinData _coinData = new CoinData(
        name: results[i]['name'],
        symbol: results[i]["symbol"],
        currentPrice: results[i]['current_price'].toString(),
        coinImg: results[i]['image'],
        ath: results[i]['ath'].toString(),
        ath_change_percentage: results[i]['ath_change_percentage'].toString(),
        ath_date: results[i]['ath_date'],
        atl: results[i]['atl'].toString(),
        atl_date: results[i]['atl_date'],
        high_24h: results[i]['high_24h'].toString(),
        low_24h: results[i]['low_24h'].toString(),
        market_cap: results[i]['market_cap'].toString(),
        market_cap_change_24: results[i]['market_cap_change_24h'].toString(),
        market_cap_change_percentage_24h:
            results[i]['market_cap_change_percentage_24h'].toString(),
        market_cap_rank: results[i]['market_cap_rank'].toString(),
        max_supply: results[i]['max_supply'].toString(),
        price_change_24h: results[i]['price_change_24h'].toString(),
        price_change_percentage_24h:
            results[i]['price_change_percentage_24h'].toString(),
        total_supply: results[i]['total_supply'].toString(),
        total_volume: results[i]['total_volume'].toString(),
      );
      // print(i);
      data.add(_coinData);
    }
    notifyListeners();
  }

  List<CoinData> coinData = [];
  Future<List<CoinData>> getCoinIdData2() async {
    http.Response response = await http.get(base_url);
    var results = jsonDecode(response.body);
    for (int i = 0; i < 100; i++) {
      CoinData _coinData = new CoinData(
        name: results[i]['name'],
        symbol: results[i]["symbol"],
        currentPrice: results[i]['current_price'].toString(),
        coinImg: results[i]['image'],
        ath: results[i]['ath'].toString(),
        ath_change_percentage: results[i]['ath_change_percentage'].toString(),
        ath_date: results[i]['ath_date'],
        atl: results[i]['atl'].toString(),
        atl_date: results[i]['atl_date'],
        high_24h: results[i]['high_24h'].toString(),
        low_24h: results[i]['low_24h'].toString(),
        market_cap: results[i]['market_cap'].toString(),
        market_cap_change_24: results[i]['market_cap_change_24h'].toString(),
        market_cap_change_percentage_24h:
            results[i]['market_cap_change_percentage_24h'].toString(),
        market_cap_rank: results[i]['market_cap_rank'].toString(),
        max_supply: results[i]['max_supply'].toString(),
        price_change_24h: results[i]['price_change_24h'].toString(),
        price_change_percentage_24h:
            results[i]['price_change_percentage_24h'].toString(),
        total_supply: results[i]['total_supply'].toString(),
        total_volume: results[i]['total_volume'].toString(),
      );
      // print(i);
      coinData.add(_coinData);
    }
    notifyListeners();
  }
}
