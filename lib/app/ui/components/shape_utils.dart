import 'package:flutter/material.dart';

class ShapeUtils {
  static

      /// Coming from https://stackoverflow.com/questions/7007429/how-to-draw-a-triangle-a-star-a-square-or-a-heart-on-the-canvas
      Path createHome(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3653960, size.height * 0.7049885);
    path_0.lineTo(size.width * 0.3653960, size.height * 0.6168029);
    path_0.cubicTo(
        size.width * 0.3654079,
        size.height * 0.6114250,
        size.width * 0.3665109,
        size.height * 0.6061019,
        size.width * 0.3686416,
        size.height * 0.6011385);
    path_0.cubicTo(
        size.width * 0.3707723,
        size.height * 0.5961740,
        size.width * 0.3738891,
        size.height * 0.5916663,
        size.width * 0.3778149,
        size.height * 0.5878731);
    path_0.cubicTo(
        size.width * 0.3817396,
        size.height * 0.5840798,
        size.width * 0.3863960,
        size.height * 0.5810750,
        size.width * 0.3915178,
        size.height * 0.5790298);
    path_0.cubicTo(
        size.width * 0.3966396,
        size.height * 0.5769846,
        size.width * 0.4021257,
        size.height * 0.5759404,
        size.width * 0.4076634,
        size.height * 0.5759558);
    path_0.lineTo(size.width * 0.4930297, size.height * 0.5759558);
    path_0.cubicTo(
        size.width * 0.5042317,
        size.height * 0.5759471,
        size.width * 0.5149842,
        size.height * 0.5802394,
        size.width * 0.5229406,
        size.height * 0.5878981);
    path_0.cubicTo(
        size.width * 0.5268644,
        size.height * 0.5916740,
        size.width * 0.5299792,
        size.height * 0.5961673,
        size.width * 0.5321050,
        size.height * 0.6011183);
    path_0.cubicTo(
        size.width * 0.5342307,
        size.height * 0.6060692,
        size.width * 0.5353257,
        size.height * 0.6113808,
        size.width * 0.5353267,
        size.height * 0.6167452);
    path_0.lineTo(size.width * 0.5353267, size.height * 0.7049596);
    path_0.cubicTo(
        size.width * 0.5352931,
        size.height * 0.7096010,
        size.width * 0.5362109,
        size.height * 0.7142029,
        size.width * 0.5380257,
        size.height * 0.7184971);
    path_0.cubicTo(
        size.width * 0.5398416,
        size.height * 0.7227904,
        size.width * 0.5425188,
        size.height * 0.7266904,
        size.width * 0.5459010,
        size.height * 0.7299702);
    path_0.cubicTo(
        size.width * 0.5493000,
        size.height * 0.7332663,
        size.width * 0.5533337,
        size.height * 0.7358808,
        size.width * 0.5577733,
        size.height * 0.7376625);
    path_0.cubicTo(
        size.width * 0.5622119,
        size.height * 0.7394442,
        size.width * 0.5669693,
        size.height * 0.7403596,
        size.width * 0.5717723,
        size.height * 0.7403548);
    path_0.lineTo(size.width * 0.6300198, size.height * 0.7403548);
    path_0.cubicTo(
        size.width * 0.6571832,
        size.height * 0.7404308,
        size.width * 0.6832713,
        size.height * 0.7300587,
        size.width * 0.7025842,
        size.height * 0.7115077);
    path_0.cubicTo(
        size.width * 0.7121000,
        size.height * 0.7023740,
        size.width * 0.7196594,
        size.height * 0.6914990,
        size.width * 0.7248238,
        size.height * 0.6795125);
    path_0.cubicTo(
        size.width * 0.7299881,
        size.height * 0.6675250,
        size.width * 0.7326564,
        size.height * 0.6546635,
        size.width * 0.7326733,
        size.height * 0.6416692);
    path_0.lineTo(size.width * 0.7326733, size.height * 0.3903817);
    path_0.cubicTo(
        size.width * 0.7326376,
        size.height * 0.3799000,
        size.width * 0.7302228,
        size.height * 0.3695538,
        size.width * 0.7256030,
        size.height * 0.3600808);
    path_0.cubicTo(
        size.width * 0.7209822,
        size.height * 0.3506077,
        size.width * 0.7142693,
        size.height * 0.3422394,
        size.width * 0.7059406,
        size.height * 0.3355721);
    path_0.lineTo(size.width * 0.5079406, size.height * 0.1829423);
    path_0.cubicTo(
        size.width * 0.4911931,
        size.height * 0.1699856,
        size.width * 0.4703208,
        size.height * 0.1631019,
        size.width * 0.4489129,
        size.height * 0.1634760);
    path_0.cubicTo(
        size.width * 0.4275050,
        size.height * 0.1638500,
        size.width * 0.4069000,
        size.height * 0.1714577,
        size.width * 0.3906436,
        size.height * 0.1849904);
    path_0.lineTo(size.width * 0.1970396, size.height * 0.3355144);
    path_0.cubicTo(
        size.width * 0.1883396,
        size.height * 0.3419990,
        size.width * 0.1812446,
        size.height * 0.3502923,
        size.width * 0.1762743,
        size.height * 0.3597865);
    path_0.cubicTo(
        size.width * 0.1713050,
        size.height * 0.3692808,
        size.width * 0.1685851,
        size.height * 0.3797346,
        size.width * 0.1683168,
        size.height * 0.3903817);
    path_0.lineTo(size.width * 0.1683168, size.height * 0.6413519);
    path_0.cubicTo(
        size.width * 0.1683594,
        size.height * 0.6544010,
        size.width * 0.1710495,
        size.height * 0.6673144,
        size.width * 0.1762317,
        size.height * 0.6793538);
    path_0.cubicTo(
        size.width * 0.1814139,
        size.height * 0.6913933,
        size.width * 0.1889881,
        size.height * 0.7023240,
        size.width * 0.1985208,
        size.height * 0.7115202);
    path_0.cubicTo(
        size.width * 0.2080535,
        size.height * 0.7207163,
        size.width * 0.2193574,
        size.height * 0.7279990,
        size.width * 0.2317891,
        size.height * 0.7329510);
    path_0.cubicTo(
        size.width * 0.2442198,
        size.height * 0.7379038,
        size.width * 0.2575337,
        size.height * 0.7404298,
        size.width * 0.2709703,
        size.height * 0.7403837);
    path_0.lineTo(size.width * 0.3278812, size.height * 0.7403837);
    path_0.cubicTo(
        size.width * 0.3375376,
        size.height * 0.7404231,
        size.width * 0.3468178,
        size.height * 0.7367500,
        size.width * 0.3536960,
        size.height * 0.7301673);
    path_0.cubicTo(
        size.width * 0.3605743,
        size.height * 0.7235846,
        size.width * 0.3644921,
        size.height * 0.7146260,
        size.width * 0.3645941,
        size.height * 0.7052481);
    path_0.lineTo(size.width * 0.3653960, size.height * 0.7049885);
    path_0.close();

    path_0.close();
    return path_0;
  }
}
