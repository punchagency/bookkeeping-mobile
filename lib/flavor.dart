enum Flavor {
  dev,
  stg,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Dev';
      case Flavor.stg:
        return 'spaceAppStg';
      case Flavor.prod:
        return 'spaceAppProd';
      default:
        return 'title';
    }
  }
}
