import 'dart:io';

class Utils {
  //////////////////////////
  // getApiHost()
  //////////////////////////
  String _getApiHost() {
    var apiHost = '';
    if (Platform.isIOS) {
      apiHost = 'https://expertpropertiesapi.herokuapp.com/';
    } else {
      apiHost = 'https://expertpropertiesapi.herokuapp.com/';
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
