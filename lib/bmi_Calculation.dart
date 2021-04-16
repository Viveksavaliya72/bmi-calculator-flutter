import 'dart:math';
class BmiCalculation{

  BmiCalculation({this.height,this.weight});

  final int height;
  final int weight;
  double _bmi;

  String calculateBmi(){
     _bmi = weight /pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){

    if(_bmi>=25){
      return "OverWeight";
    }
    else if(_bmi>18.5){
      return"Normal";
    }
    else{
      return "UnderWeight";
    }
  }

  String getInterPretation(){

    if(_bmi>=25){
      return "You Are Overweight You Need Some Exercise";
    }
    else if(_bmi>18.5){
      return"Congratulation You Have Normal Weight";
    }
    else{
      return "You Are Underweight You Need To Gain Some Weight";
    }
  }

}