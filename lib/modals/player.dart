import 'package:flutter/material.dart' ;

Widget player(String player1Name,String player2Name,int player1Score,int player2Score){
  return Container( 
              height:200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.white,
                      child: Image(image:AssetImage('images/x.jpg'),fit: BoxFit.cover, ),
                    ),
                    Text(player1Name,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
                //score
                Text(player1Score.toString(),
                style:  TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),),

                Text('::', style:  TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),),


                Text(player2Score.toString(),
                 style:  TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.white,
                      child: Image(image:AssetImage('images/o.jpg'),fit: BoxFit.cover, ),
                    ),
                    Text(player2Name,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
                 
              ],
            ),
            );
}