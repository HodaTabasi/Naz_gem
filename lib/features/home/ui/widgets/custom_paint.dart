// import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';

// //Add this CustomPaint widget to the Widget Tree


//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
@override
void paint(Canvas canvas, Size size) {

Path path_0 = Path();
path_0.moveTo(0,size.height*0.1118012);
path_0.lineTo(size.width,size.height*0.1118012);
path_0.lineTo(size.width,size.height*0.6261242);
path_0.cubicTo(size.width,size.height*0.6826522,size.width*0.9820845,size.height*0.7320559,size.width*0.9564111,size.height*0.7463230);
path_0.lineTo(size.width*0.5147201,size.height*0.9918199);
path_0.cubicTo(size.width*0.5050671,size.height*0.9971801,size.width*0.4949329,size.height*0.9971801,size.width*0.4852799,size.height*0.9918199);
path_0.lineTo(size.width*0.04358950,size.height*0.7463230);
path_0.cubicTo(size.width*0.01791481,size.height*0.7320559,0,size.height*0.6826522,0,size.height*0.6261242);
path_0.lineTo(0,size.height*0.1118012);
path_0.close();

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = Color(0xff2C2E3D).withOpacity(0.1);
canvas.drawPath(path_0,paint_0_fill);

Path path_1 = Path();
path_1.moveTo(0,0);
path_1.lineTo(size.width,0);
path_1.lineTo(size.width,size.height*0.5586770);
path_1.cubicTo(size.width,size.height*0.6144211,size.width*0.9825685,size.height*0.6633416,size.width*0.9573673,size.height*0.6783292);
path_1.lineTo(size.width*0.5156764,size.height*0.9409876);
path_1.cubicTo(size.width*0.5054227,size.height*0.9470870,size.width*0.4945773,size.height*0.9470870,size.width*0.4843236,size.height*0.9409876);
path_1.lineTo(size.width*0.04263236,size.height*0.6783292);
path_1.cubicTo(size.width*0.01743017,size.height*0.6633416,0,size.height*0.6144211,0,size.height*0.5586764);
path_1.lineTo(0,0);
path_1.close();

Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
paint_1_fill.color = Color(0xff2C2E3D).withOpacity(1.0);
canvas.drawPath(path_1,paint_1_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
return true;
}
}