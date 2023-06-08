import 'package:http/http.dart'as http;
import 'package:my_grocery/const.dart';

class RemoteBannerService{
  var client = http.Client();
  var remoteUrl ='$baseUrl/api/banners';
  
  Future<dynamic> get() async{
    try {
      var response = await client.get(
          Uri.parse('$remoteUrl?populate=image')

      );
     // print(response.body);
      return response;
    }
    catch(e){
      print(e);
    }
  }
}