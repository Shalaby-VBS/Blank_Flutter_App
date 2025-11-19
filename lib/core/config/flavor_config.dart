enum Flavor { development, production }

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final String baseUrl;

  FlavorConfig._({
    required this.flavor,
    required this.name,
    required this.baseUrl,
  });

  static FlavorConfig? _instance;
  static FlavorConfig get instance => _instance!;

  static bool get isDev => _instance?.isDevelopment ?? false;

  static void setup({required Flavor flavor}) {
    _instance = FlavorConfig._(
      flavor: flavor,
      name: flavor.name,
      baseUrl: _getBaseUrl(flavor),
    );
  }

  static String _getBaseUrl(Flavor flavor) {
    switch (flavor) {
      case Flavor.development:
        return 'https://dev-api.yourapp.com';
      case Flavor.production:
        return 'https://api.yourapp.com';
    }
  }

  bool get isDevelopment => flavor == Flavor.development;
  bool get isProduction => flavor == Flavor.production;
}
