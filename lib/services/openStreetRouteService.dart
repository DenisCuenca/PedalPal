/// OPENROUTESERVICE DIRECTION SERVICE REQUEST
/// Parameters are : startPoint, endPoint and api key

const String baseUrl =
    'https://api.openrouteservice.org/v2/directions/foot-walking';
const String apiKey =
    '5b3ce3597851110001cf6248a787289c958542629432093cd1ec1cd0';

getRouteUrl(String startPoint, String endPoint) {
  return Uri.parse('$baseUrl?api_key=$apiKey&start=$startPoint&end=$endPoint');
}
// https://api.openrouteservice.org/v2/directions/foot-walking?api_key=5b3ce3597851110001cf6248a787289c958542629432093cd1ec1cd0&start=8.681495,49.41461&end=8.687872,49.420318
