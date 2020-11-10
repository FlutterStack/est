import 'dart:io';

class Utils {
  //////////////////////////
  // getApiHost()
  //////////////////////////
  String _getApiHost() {
    var apiHost = '';
    if (Platform.isIOS) {
      apiHost = 'http://localhost:3000/';
    } else {
      apiHost = 'http://10.0.2.2:3000/';
    }
    return apiHost;
  }

  //////////////////////////
  // getEndPoint()
  //////////////////////////
  String getEndPoint(String uri) {
    return _getApiHost() + uri;
  }
}
