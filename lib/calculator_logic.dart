import 'dart:math';

class CalculatorLogic{

  CalculatorLogic({required this.height, required this.weight});

  final int height;
  final int weight;
  double _index = 1;

  String calculate(){
    _index = weight / pow(height/100,2);
    return _index.toStringAsFixed(1);
  }

  String getResult(){
    if(_index > 25){
      return 'Overweight';
    } else if(_index > 18){
      return 'Normal';
    } else{
      return 'Underweight';
    }
  }

  String getDescription(){
    if(_index > 25){
      return 'Ты толстый!';
    } else if(_index > 18){
      return 'Пойдет :)';
    } else{
      return 'Ты худой!';
    }
  }
}