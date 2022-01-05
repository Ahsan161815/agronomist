import 'package:translator/translator.dart';

class CustomTranslator{

  final translator = GoogleTranslator();

  Future<Translation> translate(String input) async {


    // final input = "Здравствуйте. Ты в порядке?";

    var output = await translator.translate(input, from: 'en', to: 'ur');
    return output;
    // prints Hello. Are you okay?

    // var translation = await translator.translate("Dart is very cool!", to: 'pl');
    // print(translation);
    // // prints Dart jest bardzo fajny!
    //
    // print(await "example".translate(to: 'pt'));
    // // prints exemplo

  }
}