import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _opcoes = ["pedra","papel","tesoura"];
  var _imagem = AssetImage("image/padrao.png");
  var _msg = "Faça a sua escolha";

  void fazerEscolha(String escolha){

    int _numero = Random().nextInt(3);
    String escolhaApp = _opcoes[_numero];

   switch(escolhaApp){
     case "pedra":
       setState(() {
         this._imagem = AssetImage("image/pedra.png");
       });
       break;

     case "papel":
       setState(() {
         this._imagem = AssetImage("image/papel.png");
       });
       break;

     case "tesoura":
       setState(() {
         this._imagem = AssetImage("image/tesoura.png");
       });
       break;

   }

   //usuário ganha
   if( escolha == "pedra" && escolhaApp == "tesoura" ||
       escolha == "papel" && escolhaApp == "pedra" ||
       escolha == "tesoura" && escolhaApp == "papel"){

     setState(() {
       this._msg = "Parabéns você ganhou!";
     });

     //App ganha
   }else if(escolhaApp == "pedra" && escolha == "tesoura" ||
       escolhaApp == "papel" && escolha == "pedra" ||
       escolhaApp == "tesoura" && escolha == "papel"){

     setState(() {
       this._msg = "Você perdeu!";
     });
//empate
   }else{
     setState(() {
       this._msg = "Empatou!";
     });
   }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),

      ),
      body: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,

           children: <Widget>[
             Padding(
               padding: EdgeInsets.only(top: 32,bottom: 16),
               child: Text(
                   "Escolha do app",
               textAlign: TextAlign.center,
                 style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold
                 ),
               ),
             ),

             Image(image: this._imagem),
             Padding(
               padding: EdgeInsets.only(top: 32,bottom: 16),
               child: Text(
                 this._msg,
                 textAlign: TextAlign.center,
                 style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.bold
                 ),
               ),
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: <Widget>[

             GestureDetector(
               child: Image.asset("image/pedra.png", height:95),
               onTap: () => this.fazerEscolha("pedra"),
             ),
                 GestureDetector(
                   child: Image.asset("image/papel.png", height:95),
                   onTap: () => this.fazerEscolha("papel"),
                 ),
                 GestureDetector(
                   child: Image.asset("image/tesoura.png", height:95),
                   onTap: () => this.fazerEscolha("tesoura"),
                 ),
               ],
             )
           ],
        ),
    );
  }
}
