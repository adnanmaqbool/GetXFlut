
enum AppTheme {
  Light,
  Dark,
  Default;

  String get name => toString().split('.').last;

  static AppTheme fromName(String name) {
    return AppTheme.values.firstWhere(
          (e) => e.name.toLowerCase() == name.toLowerCase(),
      orElse: () => AppTheme.Default,
    );
  }
}

