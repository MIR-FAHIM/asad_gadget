class RootRepository {
  /// Repository method returning raw decoded response from APIManager
  Future<Map<String, dynamic>> fetchRootData() async {
    // In production: return await APIManager().get(ApiClient.someEndpoint);
    await Future.delayed(const Duration(milliseconds: 500));
    return {
      'status': 'success',
      'data': [
        {'id': 1, 'title': 'Sample Item 1', 'description': 'Module-level Repository demo'},
        {'id': 2, 'title': 'Sample Item 2', 'description': 'Returns decoded response to Controller'},
        {'id': 3, 'title': 'Sample Item 3', 'description': 'Controller parses and saves Model'},
      ]
    };
  }
}
