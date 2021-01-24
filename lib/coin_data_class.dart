class CoinData {
  String name, coinImg, symbol;
  String currentPrice;

  String ath_date, atl_date;
  String market_cap, market_cap_rank, total_volume, max_supply;
  String market_cap_change_percentage_24h,
      market_cap_change_24,
      high_24h,
      low_24h,
      price_change_24h,
      price_change_percentage_24h,
      total_supply,
      ath,
      ath_change_percentage,
      atl;

  CoinData(
      {this.name,
      this.currentPrice,
      this.coinImg,
      this.ath,
      this.ath_change_percentage,
      this.ath_date,
      this.atl,
      this.atl_date,
      this.high_24h,
      this.low_24h,
      this.market_cap,
      this.market_cap_change_24,
      this.market_cap_change_percentage_24h,
      this.market_cap_rank,
      this.max_supply,
      this.price_change_24h,
      this.price_change_percentage_24h,
      this.total_supply,
      this.total_volume,
      this.symbol});
}
