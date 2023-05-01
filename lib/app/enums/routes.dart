

enum RouteName {
  Login('/'),
  Home('/home');

  static RouteName stringToRoute(String? v){
    RouteName rote = RouteName.values.firstWhere((e) => e.value == v);
    return rote;
  }

  int numPage(){
    return stringToRoute(value).index - 1;
  }

  final String value;
  const RouteName(this.value);
}