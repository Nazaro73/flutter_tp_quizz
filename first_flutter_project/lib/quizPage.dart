import 'package:flutter/material.dart';


class Question {
  String question;
  bool response;
  String explanation;
  String imagePath;

  Question({
    required this.question,
    required this.response,
    required this.explanation,
    required this.imagePath
  });

  String getImage() => 'img/$imagePath';
}
class QuizzPage extends StatefulWidget {
  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  final _formKey = GlobalKey<FormState>();

  SnackBar customSnackBar({required String text}) {
    return SnackBar(
        content: Text(text)
    );
  }

  List<Question> _questionList =[

    Question(question: "L'île de Manhattan a été achetée aux Indiens algonquins pour 24dollar.",response:true,explanation:"En 1659 Steve Brandon Refugié Politique anglais décide d'acheté une partie des terre d'une tribut qui à finit par devenir newyork",imagePath:"img1.png")
    ,Question(question:"Quand on marche, 40% de notre poids est supporté par les gros orteils.",response:false,explanation:"Le poids du corp est suporté à 65% par notre talon et seulement 20% par le gros orteil et le reste equitablement entre les autre orteil",imagePath:"img3.png")
    ,Question(question:"Le regime de corée du nord c'est inspiré des civilisation des pinguins",response:true,explanation:"L'ancien president Kim Jung Hill s'est inspiré du systeme hierarchique des pinguin pour avoir un meilleur controle sur sa population",imagePath:"img2.png")
    ,Question(question:"Les nains sont majoritaire au Cap Vert",response:true,explanation:"Oui, le capvert n'est pas appellé le paradis des nain pour rien, 54% de la population est nain, des manifestation contre l'exploitation des nain partout dans le monde sont tres souvent organisé dans pays.",imagePath:"img4.png")
    ,Question(question:"Les process d'investissement des banque americaine sont inspiré des location de sac de riz au burkina fasso",response:false,explanation:"Non MDR quel rapport",imagePath:"img5.png")
    ,Question(question:"La crise financiere liée au covid à été evité grace à la monté du prix du carburant",response:false,explanation:"Tous ceux qui pense ca sont complotiste rien avoir",imagePath:"img6.png")
    ,Question(question:"Des duo singe de madagascar ont apris à ce servir d'une voiture",response:true,explanation:" deux singe nommée NaeJ et Qeb ont appris à démarré une voiture pour récupérer la nourriture en dessous du vehicule",imagePath:"img7.png")
    ,Question(question:"Les japonais sont minauritaire dans leur propre pays",response:true,explanation:"depuis la grande immigration chinoise au japon des chinois ce font passé pour des japonais, une etude statistique à montrer que 42% de la population ont leur 2 parent japonais",imagePath:"img8.png",)
    ,Question(question:"Les habitant de cuba n'ont pas encore connu la 3g",response:false,explanation:"Il ont eu la 3g depuit fin 2022, avant cette date il n'avait accès qu' à la 2g",imagePath:"img9.png")
    ,Question(question:"Statistiquement 1 personne sur 3 en Chine parle arabe",response:true,explanation:"En rapport d'une monté en puissance de la chine dans la zone arabe, 32% des chinois parle couremment arabe",imagePath:"img10.png")
  ];
  int numberquestion = 0;
  int score = 0;


  void _TrueAnswer() {
    setState(() {
      if(numberquestion >= 9){
        showCustomDialog(
          dialog: customAlertDialog(),
          context: context,
        );
      }else{


        if (_questionList[numberquestion].response == true){
          showCustomDialog(
            dialog: customSimpleDialog(true),
            context: context,
          );

          score++;
        }else{

          showCustomDialog(
            dialog: customSimpleDialog(false),
            context: context,
          );

        }
        numberquestion++;
      }
    });
  }
  void _FalseAnswer() {
    setState(() {
      if(numberquestion >= 9){
        showCustomDialog(
          dialog: customAlertDialog(),
          context: context,
        );
      }else {
        if (_questionList[numberquestion].response == false) {
          showCustomDialog(
            dialog: customSimpleDialog(true),
            context: context,
          );

          score++;
        } else {
          showCustomDialog(
            dialog: customSimpleDialog(false),
            context: context,
          );
        }
        numberquestion++;
      }
    });
  }

  Future<void> showCustomDialog({required Widget dialog, required BuildContext context}) async {
    await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext buildContext) {
          return dialog;
        }
    );
  }


  SimpleDialog customSimpleDialog( bool isCorrect) {
    String text = isCorrect ? "Bonne réponse" : "Mauvaise réponse" ;
    String img = isCorrect ? "img/result-sup-5.gif" : "img/result-und-5.gif" ;
    return SimpleDialog(
      title: Text("${text}",textAlign: TextAlign.center,),
      elevation: 12,
      children: [
        const Divider(),
        Image.asset("${img}"),
        SizedBox(height:30),
        Text(
          "${_questionList[numberquestion].explanation.toString()}",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height:30),
        simpleDialogOption(text:"Question Suivante"),
      ],
    );
  }

  SimpleDialogOption simpleDialogOption({required String text}) {
    return SimpleDialogOption(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text(text,textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.blueAccent),),
    );
  }

  AlertDialog customAlertDialog() {
    String text= (score >= 5) ? "T'est chaud l'ami" : "T'est trop null";
    String img= (score >= 5) ? "img/imgg.png" : "img/imnull.png";

    return AlertDialog(
      title: const Text("Fin de la Partie!"),
      content: const Text("Vous avez repondu à toute les question"),
      actions: [
        Text(
          "Vous avez un score de ${score}/10",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10),
        ),
        Text(
          "${text}",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10),
        ),
        Image.asset("${img}"),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text("Go Home")
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quizz Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Score: ${score.toString()}",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height:30),
            Text(
              'Question ${numberquestion + 1}',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height:30),
            Image.asset("${_questionList[numberquestion].getImage()}",
                width:350,
                height: 350),
            SizedBox(height:50),
            Text(
              "${_questionList[numberquestion].question.toString()}",
              textAlign: TextAlign.center,

              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height:25),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xffF18265),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    _TrueAnswer();

                  },
                  child: Text(
                    "Vrai",
                    style: TextStyle(
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xffF18265),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),

                  onPressed: _FalseAnswer,
                  child: Text(
                    "Faux",
                    style: TextStyle(
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ],
            ),


          ],
        ),
      ),
    );

  }
}