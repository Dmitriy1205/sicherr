import 'dart:convert';

bool isBase64(String input){
  try{
    base64Decode(input);
    return true;
  }catch(e){
    return false;
  }
}