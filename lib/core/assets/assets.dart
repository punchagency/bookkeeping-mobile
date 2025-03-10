// file directory
const pngDir = "assets/pngs";
const svgDir = "assets/svgs";
const animDir = "assets/anim";

//General
final smaple = 'smaple'.png;
final smaple1 = 'smaple'.svg;
final smaple2 = 'smaple'.gif;

extension AssetExt on String {
  get goPng {
    return "assets/goicons/$this.png";
  }

  String get png {
    return "$pngDir/$this.png";
  }

  String get svg {
    return "$svgDir/$this.svg";
  }

  get gif {
    return "$animDir/$this.gif";
  }
}
