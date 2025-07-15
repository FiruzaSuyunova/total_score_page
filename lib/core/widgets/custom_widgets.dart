import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_dimons.dart';


///column day hour...
Widget customColumn( String number ,String text){
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(number,style: TextStyle(color: AppColors.black,fontSize: AppDimensions.d18,fontWeight: FontWeight.w700),),
      SizedBox(height: AppDimensions.d5,),
      Text(text,style: TextStyle(fontSize: AppDimensions.d12,color: AppColors.grey,fontWeight: FontWeight.w500),)
    ],
  );
}


///line
Widget line(){
  return Container(
    width: AppDimensions.d1,
    height: AppDimensions.d20,
    color: AppColors.line,
  );
}