class CardVerso {
  //variables generales pour la carte
  float xCard;
  float yCard;
  int cardWidth;
  int cardHeight;
  PFont typoAnnexeGras;
  PFont typoAnnexeLight;
  
  //appel de la classe text
  Text textEffect;

  //variable pour la classe texte
  float posXTextChange = xCard+340;
  float posYTextChange = yCard+1470;

  //variables pour le timbre
  float xTimbre=width-1760;
  float yTimbre=height-1900;
  int widthTimbre=120;
  int heightTimbre=100;

  //creation instance classe timbre
  Timbre timbrePostal;

  //position elements
  int positionMode=CENTER;
   
  //PGRAPHICS
  PGraphics pg;

  //constructeur / call 1 time
  CardVerso(float _xCard, float _yCard, int _width, int _heigth) {

    //attribution variable carte
    xCard = _xCard;
    yCard =_yCard;
    cardWidth =_width;
    cardHeight=_heigth;
    
    //attribution font texte annexe
    typoAnnexeGras = createFont("SuisseEDUIntl-Medium.otf", 14);
    typoAnnexeLight = createFont("SuisseEDUIntl-Light.otf", 14);

    //appel class text
    //String[] originalTexts = loadStrings("monTexteNeg.txt"); // debug pour voir longeur text
    //debug long cara
    /*String[] originalTexts = loadStrings("pos.txt"); // Charger votre fichier texte original
    String[] replaceTexts = loadStrings("neg.txt");   // Charger votre fichier texte de remplacement*/
    String[] originalTexts = loadStrings("monTextePos.txt"); // Charger votre fichier texte original
    String[] replaceTexts = loadStrings("monTexteNeg.txt");   // Charger votre fichier texte de remplacement
    textEffect = new Text(originalTexts, replaceTexts, posXTextChange, posYTextChange);

    //appel class timbre
    timbrePostal = new Timbre (830, 1170, widthTimbre, heightTimbre);
    pg = createGraphics(cardWidth,cardHeight);
  }

  void draw() {
    pg.beginDraw();
    pg.background(255);
    
    //configuration de la carte postale
    pg.noStroke();
    pg.fill(255);
    pg.rectMode(positionMode);
    pg.rect(xCard, yCard, cardWidth, cardHeight);

    //configuration text courant
    textEffect.draw(pg,230,340);  
    
    //affichage ligne verticale
    pg.stroke(0);
    pg.strokeWeight(1);
    pg.line(510, 30, 510, 570);


    //affichage lignes horizontales
    pg.stroke(0);
    pg.strokeWeight(1);
    pg.line(540, 180, 865, 180);
    pg.line(540, 250, 865, 250);
    pg.line(540, 320, 865, 320);
    pg.line(540, 440, 865, 440);

    //affichage timbre rectangle
    //timbrePostal.draw(pg);
    pg.stroke(0);
    pg.noFill();
    pg.strokeWeight(1);
    pg.rect(843,60,55,61);
    
    //affichage texte annexe gras
    pg.textFont(typoAnnexeGras);
    pg.textAlign(LEFT);
    pg.text("This scientific fact is taken from the 6th IPCC report.", 400, 510,190,50);
    
    //affichage texte annexe light
    pg.textFont(typoAnnexeLight);
    pg.textAlign(LEFT);
    pg.text("© Delusional Souvenirs", 400, 550,190,50);
    pg.text("Océane Serrat and Mathilde Schibler, 2024.", 400, 567,160,50);


    //affichage adresse expediteur
    //textFont(typoExpediteur);
    pg.fill(146, 146, 146);
    pg.textSize(26);
    pg.noStroke();
    //xCard+34, yCard+1470);
    pg.endDraw();
    
    imageMode(CENTER);
    image(pg, width/2, height - height/4);
  }
}
