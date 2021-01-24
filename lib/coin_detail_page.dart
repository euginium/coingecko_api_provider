import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data.dart';

class CoinDetailPage extends StatelessWidget {
  int i;
  CoinDetailPage({this.i});
  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (context, data, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Column(
            children: [
              Container(
                child: ListTile(
                  title: Text(
                    '${data.coinData[i].name}',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('${data.coinData[i].symbol.toUpperCase()}'),
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Image.network(
                      '${data.coinData[i].coinImg}',
                      scale: 8,
                    ),
                  ),
                  trailing: Text(
                    'RM ${data.coinData[i].currentPrice}',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.blue.shade200,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Expanded(
                flex: 4,
                child: Container(
                  color: Colors.grey.shade900,
                  child: ListView(
                    children: [
                      ListTile(
                        title: _buildTextTitle('Market cap:'),
                        trailing: _buildTextTrail(
                            '${data.coinData[i].market_cap}', Colors.blue),
                      ),
                      ListTile(
                        title: _buildTextTitle('Total Vol:'),
                        trailing:
                            _buildTextTrail('${data.coinData[i].total_volume}'),
                      ),
                      ListTile(
                        title: _buildTextTitle('Market Cap Rank:'),
                        trailing: _buildTextTrail(
                            '${data.coinData[i].market_cap_rank}'),
                      ),
                      ListTile(
                        title: _buildTextTitle('Market Cap Change %:'),
                        trailing: _buildTextTrail(
                            '${data.coinData[i].market_cap_change_24.substring(0, capNumbers(data.coinData[i].market_cap_change_24.length))}'),
                      ),
                      ListTile(
                        title: _buildTextTitle('Market Cap Change 24H %:'),
                        trailing: _buildTextTrail(
                            '${data.coinData[i].market_cap_change_percentage_24h}%'),
                      ),
                      ListTile(
                        title: _buildTextTitle('High 24H:'),
                        trailing: _buildTextTrail(
                            'RM ${data.coinData[i].high_24h}',
                            Colors.green.shade400),
                      ),
                      ListTile(
                        title: _buildTextTitle('Low 24H:'),
                        trailing: _buildTextTrail(
                            'RM ${data.coinData[i].low_24h}', Colors.redAccent),
                      ),
                      ListTile(
                        title: _buildTextTitle('Price change 24H:'),
                        trailing: _buildTextTrail(
                            'RM ${data.coinData[i].price_change_24h}'),
                      ),
                      ListTile(
                        title: _buildTextTitle('Price change % 24H:'),
                        trailing: _buildTextTrail(
                            'RM ${data.coinData[i].price_change_percentage_24h}%'),
                      ),
                      ListTile(
                        title: _buildTextTitle('Total Supply:'),
                        trailing:
                            _buildTextTrail('${data.coinData[i].total_supply}'),
                      ),
                      ListTile(
                        title: _buildTextTitle('Max Supply:'),
                        trailing:
                            _buildTextTrail('${data.coinData[i].max_supply}'),
                      ),
                      ListTile(
                        title: _buildTextTitle('All Time High(ATH):'),
                        trailing: _buildTextTrail('RM ${data.coinData[i].ath}',
                            Colors.green.shade400),
                      ),
                      ListTile(
                        title: _buildTextTitle('ATH change %:'),
                        trailing: _buildTextTrail(
                            '${data.coinData[i].ath_change_percentage}%'),
                      ),
                      ListTile(
                        title: _buildTextTitle('ATH Date:'),
                        trailing: _buildTextTrail(
                            '${data.coinData[i].ath_date.substring(0, 10)}'),
                      ),
                      ListTile(
                        title: _buildTextTitle('All Time Low (ATL):'),
                        trailing: _buildTextTrail(
                            'RM ${data.coinData[i].atl}', Colors.redAccent),
                      ),
                      ListTile(
                        title: _buildTextTitle('ATL Date:'),
                        trailing: _buildTextTrail(
                            '${data.coinData[i].atl_date.substring(0, 10)}'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget _buildTextTitle(String text) {
  return Text(
    '${text}',
    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
  );
}

// inside [] are optional variables: in this case, default is white.
Widget _buildTextTrail(String text, [Color color = Colors.white]) {
  return Text(
    '${text}',
    style: TextStyle(fontSize: 15, color: color),
  );
}

capNumbers(int valueLength) {
  if (valueLength < 5) {
    return 5;
  }
  if (valueLength > 5) {
    return 6;
  }
}
