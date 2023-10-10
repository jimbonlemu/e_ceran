import 'package:e_ceran/global_assets/data/stuff_data.dart';

class HistoryTransactionData {
  String transactionID;
  String transactionDate;
  String customerName;
  List<String> transactionStuff =
      staticStuffList.map((e) => e.stuffName).toList().cast<String>();
  int transactionTotalPrice;

  HistoryTransactionData({
    required this.transactionID,
    required this.customerName,
    required this.transactionDate,
    required this.transactionStuff,
    required this.transactionTotalPrice,
  });
}

var staticHistoryTransactionData = [
  HistoryTransactionData(
      customerName: 'Ipul',
      transactionID: "12312318",
      transactionDate: "10/10/2023",
      transactionStuff: [
        "Bensin 1 L",
        "Bensin 1,5 L",
        "Es Batu",
      ],
      transactionTotalPrice: 20000),
  HistoryTransactionData(
      customerName: 'Inul',
      transactionID: "12312318",
      transactionDate: "10/10/2023",
      transactionStuff: [
        "Bensin 1 L",
        "Bensin 1,5 L",
      ],
      transactionTotalPrice: 40000),
  HistoryTransactionData(
      customerName: 'Tian',
      transactionID: "12312318",
      transactionDate: "10/10/2023",
      transactionStuff: [
        "Es Batu",
      ],
      transactionTotalPrice: 2000),
];
