class OptionDetailsMarketData {
  const OptionDetailsMarketData({
    required this.ltp,
    required this.previousClose,
    required this.open,
    required this.openInterest,
    required this.bidPrice,
    required this.bidQuantity,
    required this.askPrice,
    required this.askQuantity,
    required this.totalBidQuantity,
    required this.totalAskQuantity,
    required this.volume,
  });

  final double ltp;
  final double previousClose;
  final double open;
  final double openInterest;
  final double bidPrice;
  final int bidQuantity;
  final double askPrice;
  final int askQuantity;
  final double totalBidQuantity;
  final double totalAskQuantity;
  final int volume;

  double get change => ltp - previousClose;

  double get changePercentage {
    if (previousClose == 0) {
      return 0;
    }

    return (change / previousClose) * 100;
  }
}
