import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
   var _imagemApp = AssetImage("imagens/padrao.png");
   var _mensagem = "Escolha um Laura";
   void  _opcaoSelecionada(String escolhaLaura){
     var opcoes =["pedra", "papel", "tesoura"];
     var numero = Random().nextInt(3);
     var escolhaApp = opcoes[numero];

     print("Escolha do app:" + escolhaApp);
     print("Escolha da Laura:" + escolhaLaura);

     switch(escolhaApp){
        case "pedra":
        setState(() {
          this._imagemApp = AssetImage("imagens/pedra.png");
        });
        break;
         case "papel":
        setState(() {
          this._imagemApp = AssetImage("imagens/papel.png");
        });
        break;
         case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("imagens/tesoura.png");
        });
        break;
     }
     if(
       (escolhaLaura == "pedra" && escolhaApp == "tesoura") ||
       (escolhaLaura == "tesoura" && escolhaApp == "papel") ||
       (escolhaLaura == "papel" && escolhaApp == "pedra")
     ){
setState(() {
 this._mensagem = "Parabens a Laura ganhou";
});
     }else if(
       (escolhaApp == "pedra" && escolhaLaura == "tesoura") ||
       (escolhaApp == "tesoura" && escolhaLaura == "papel") ||
       (escolhaApp == "papel" && escolhaLaura == "pedra")
     ){
setState(() {
 this._mensagem = "Perdeu Laura kkkk!!!";
});
     }else{ setState(() {
 this._mensagem = "Empatamos Laura!!!";
});}
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Jokenpo da Laura")
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                  //text
                  //imagem
                  //text resultado
                  //linha 3 imagens
                  Padding(
                     padding: EdgeInsets.only(top: 32, bottom: 16) ,
                     child: Text(
                       "Escolha do app",
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.bold
                       ),
                     ),
                  ),
                  Image(image: this._imagemApp,),
                   Padding(
                     padding: EdgeInsets.only(top: 32, bottom: 16) ,
                     child: Text(
                       this._mensagem,
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
                      onTap: () => _opcaoSelecionada("pedra"),
                      child: Image.asset("imagens/pedra.png",height: 100,),
              
                    ),
                    GestureDetector(
                       onTap: () => _opcaoSelecionada("papel"),
                      child: Image.asset("imagens/papel.png",height: 100,),
                    ),

                    GestureDetector(
                       onTap: () => _opcaoSelecionada("tesoura"),
                      child: Image.asset("imagens/tesoura.png",height: 100,),
                    ),
                   /* Image.asset("imagens/pedra.png",height: 100,),
                    Image.asset("imagens/papel.png",height: 100,),
                    Image.asset("imagens/tesoura.png",height: 100,)*/
                  ],
                )
                  ],),
    );
  }
}