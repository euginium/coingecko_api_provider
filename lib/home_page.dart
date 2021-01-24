import 'package:coingecko_api/coin_data_class.dart';
import 'package:coingecko_api/coin_detail_page.dart';
import 'package:coingecko_api/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  // List<CoinData> coinData = [];
  bool isLoading = true;

  // Future getDataInfo() async {
  //   await context.read<Data>().getCoinIdData(coinData);
  //   setState(() {
  //     isLoading = false;
  //   });
  //   return;
  // }

  // Future<List<CoinData>> _refresh() async {
  //   await Future.delayed(Duration(seconds: 2));
  //   setState(() {
  //     context.read<Data>().getCoinIdData(coinData);
  //   });
  //   return coinData;
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getDataInfo();

    //use this below to intialise sometihng in a stateful widget for provider.
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<Data>().getCoinIdData2();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    //always declare your provider at the context
    Data dataNotifier = Provider.of<Data>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CoinGecko api',
          style: TextStyle(color: Colors.green.shade400, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 25),
            //header
            Padding(
              padding: EdgeInsets.only(left: 22.0, right: 25.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTextHeader('Coin'),
                  _buildTextHeader('Price'),
                ],
              ),
            ),
            Divider(
              thickness: 1.5,
              color: Colors.white,
            ),
            isLoading
                ? LinearProgressIndicator()
                : Container(
                    color: Colors.grey.shade900,
                    height: context.read<Data>().deviceOrient(context),
                    child: RefreshIndicator(
                      key: _refreshIndicatorKey,
                      onRefresh: () {},
                      child: ListView.builder(
                        itemCount: dataNotifier.coinData.length,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, int i) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => CoinDetailPage(
                                    i: i,
                                  ),
                                ),
                              );
                            },
                            child: Ink(
                              child: Column(
                                children: [
                                  Consumer<Data>(
                                    builder: (_, data, child) {
                                      return ListTile(
                                        title: Text(
                                          '${data.coinData[i].name}',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        leading: CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.white,
                                          child: Image.network(
                                            '${data.coinData[i].coinImg}',
                                            scale: 10,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        trailing: Container(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'RM ${data.coinData[i].currentPrice}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  Divider(
                                    thickness: 1,
                                    indent: 10.0,
                                    endIndent: 10.0,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

Widget _buildTextHeader(String text) {
  return Text(
    '$text',
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
  );
}
