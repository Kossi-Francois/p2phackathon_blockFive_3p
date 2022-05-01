
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/widgets.dart';


class Helper{

  static String ALEPH_URL_BACKEND  = "http://ce4b-34-75-233-26.ngrok.io/";
  static String Heroku_URL_BACKEND = "";

  static String key_img   = "key_img";
  static String key_email = "email";
  static String key_mdp   = "mdp";
  static String key_isLogged = "key_isLogged";
  static String key_onChain = "key_onChain";
  static String key_ipfs = "key_ipfs";
  static String IpfsHash = "IpfsHash";


  static String currentEmail = "";
  static String currentMdp = "";


  static Future<void> setAuth(String email, String mdp) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString(key_email, email);
    prefs.setString(key_mdp, mdp);
  }


  static Future<Map<String, dynamic>> initAuth()  async {
    final prefs = await SharedPreferences.getInstance();

    currentEmail = prefs.getString(key_email) ?? "";
    currentMdp = prefs.getString(key_mdp) ?? "";

    final bool isLogged = prefs.getBool(key_isLogged) ?? false;

    return {key_email :  currentEmail, key_mdp: currentMdp, key_isLogged: isLogged} as Map<String, dynamic>;
  }


  static Future<void> pickNuploadImg() async {

    const String remoteUrl = "saveIMG";

    await initAuth();

    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);


    final bytes = File(image!.path).readAsBytesSync();
    String base64Image =  base64Encode(bytes);

    //print("img_pan : $base64Image");

    var response = await http.post(Uri.parse(ALEPH_URL_BACKEND + remoteUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body:
        jsonEncode({ key_img: base64Image, key_email: currentEmail}));

    print(currentEmail);

    print(response.body );


  }


  static Future<void> saveIdentificaion(String email, String mdp) async {

    await setAuth(email,  mdp);

    const String remoteUrl = "signIn";

    var response = await http.post(Uri.parse(ALEPH_URL_BACKEND + remoteUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body:
        jsonEncode({ key_email: email as String, key_mdp: mdp as String}));


    print(response.body);
    //print(email);

  }

  static void checkIdentification(String email, String mdp){

    print(mdp);
  }


  static Future<List<DataModel>> getData(bool onChain) async {

    await initAuth();

    const String remoteUrl = "getData";

    print("in get dat");

    var response = await http.post(Uri.parse(ALEPH_URL_BACKEND + remoteUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body:
        jsonEncode({ key_email: currentEmail, key_onChain: onChain}));


    Map<String, dynamic> message = (jsonDecode(response.body) as Map<String, dynamic>)["message"];

    List<DataModel> listData =  [];


    message.forEach((k, v) => print("Key : $k, Value : $v") );

    message.forEach((k, v) => listData.add( DataModel.fromJson(v as Map<String, dynamic> ) ) );


    print(response.body);

    return listData;

  }

  static  imageFromBase64String(String base64String) {
    return Image.memory( base64Decode(base64String), height: 100,);
  }


}






class DataModel{

  //final bool onChain ;
  final String IpfsHash;
  final String img;


  const DataModel({
    required this.IpfsHash,
    required this.img,});


  factory DataModel.fromJson(Map<String, dynamic> json) {

    return DataModel(
      //onChain: json[Helper.key_onChain],
      IpfsHash: (json[Helper.key_ipfs] as Map<String, dynamic>)[Helper.IpfsHash] as String,
      img: json[Helper.key_img] as String
    );

  }


}