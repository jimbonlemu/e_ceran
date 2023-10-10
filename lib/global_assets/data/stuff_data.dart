import 'package:e_ceran/global_assets/images_path.dart';

class StuffData {
  String stuffID;
  String stuffImage;
  String stuffName;
  int stuffPrice;
  int stuffStock;

  StuffData({
    required this.stuffID,
    required this.stuffImage,
    required this.stuffName,
    required this.stuffPrice,
    required this.stuffStock,
  });
}

var staticStuffList = [
  StuffData(
    stuffID: "1",
    stuffImage: ImagesPath.fuel1L,
    stuffName: "Bensin 1 L",
    stuffPrice: 12000,
    stuffStock: 20,
  ),
  StuffData(
    stuffID: "2",
    stuffImage: ImagesPath.fuel1_5L,
    stuffName: "Bensin 1,5 L",
    stuffPrice: 18000,
    stuffStock: 7,
  ),
  StuffData(
    stuffID: "3",
    stuffImage: ImagesPath.iceBlock,
    stuffName: "Es Batu",
    stuffPrice: 500,
    stuffStock: 40,
  ),
];
