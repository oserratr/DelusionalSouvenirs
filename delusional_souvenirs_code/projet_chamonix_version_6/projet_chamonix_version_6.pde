import processing.pdf.*;

//Declaration classe card verso
CardVerso postCard;
CardRecto goCard;

//variable pour parents sur soundfile
PApplet parent = this;

//Variable declaration pour classe card verso
float xCard;
float yCard;
int cardWidth;
int cardHeigth;

//Variable declaration pour classe card recto
float xCardRecto;
float yCardRecto;

boolean debug=true;
boolean isPlaying = false; // Variable pour indiquer si le son est en train de jouer
int lastRebootTime = 0; // Temps pour gérer le timer de reboot

void setup() {
  fullScreen(2);
  background(0);

  //Attribution valeurs verso carte
  cardWidth = 900;
  cardHeigth = 600;
  xCard = width/2;
  yCard = height-(height/4);
  xCardRecto = width/2;
  yCardRecto = height/4;

  //Création d'une nouvelle carte
  postCard = new CardVerso(xCard, yCard, cardWidth, cardHeigth);
  goCard = new CardRecto(xCardRecto, yCardRecto, cardWidth, cardHeigth);

  //voir pour framerate
  frameRate(120);
}

void draw() {
  background(0);
  postCard.draw();
  goCard.update();
  imageMode(CENTER);
  image(goCard.pgCardRecto, width / 2, height / 4);
  exportPdfSon();

  // Gestion du timer pour reboot() si le son ne joue pas
  if (!isPlaying && millis() - lastRebootTime > 1000) {
    reboot();
    lastRebootTime = millis(); // Met à jour le dernier temps de reboot
  }

  // appel de la fonction debug
  if (debug) {
    float dur = goCard.carteImage.sample.duration();
    float pos = goCard.carteImage.sample.position();

    stroke(255, 0, 0);
    noFill();
    rect(50, 50, 800, 20);
    fill(255, 0, 0);
    rect(50, 50, map(pos, 0, dur, 0, 800), 20);
  }
}

void mouseClicked() {
  if (mouseButton == RIGHT && !isPlaying) {  // Ne déclenche que si le son n'est pas en cours de lecture
    println("droit");
    postCard.textEffect.replaceText = true;
    goCard.carteImage.rectoImage = true;
    goCard.carteImage.sample.play();
    goCard.carteImage.rms.input(goCard.carteImage.sample);
    isPlaying = true; // Indique que le son joue
  } else if (isPlaying) {
    println("Le son est déjà en cours de lecture.");
  }
}


void reboot() {
  int randomIndexOriginal = int(random(postCard.textEffect.textArrayOriginal.length));
  postCard.textEffect.currentText = postCard.textEffect.textArrayOriginal[randomIndexOriginal];
  postCard.textEffect.replaceText = false;
  int randomIndexImage = int(random(goCard.carteImage.images.length));
  goCard.carteImage.currentImage = goCard.carteImage.images[randomIndexImage];
  goCard.carteImage.rectoImage = false;
  goCard.carteImage.frameCounter = 0;
}

void exportPdfSon() {
  if (goCard.carteImage.sample.position() > goCard.carteImage.sample.duration() - 1) {
    generatePostCard();
    goCard.carteImage.sample.jump(0);
    delay(3000);
    reboot();
    isPlaying = false; // Réinitialise l'état pour redémarrer le timer
  }
}

// Controllers pour debug (d pour faire apparaitre/disparaitre barre de chargement) & (j pour aller jusqu'a la fin de la card)
void keyPressed() {
  if (key == 'd') {
    debug = !debug;
  }
  if (key == 'j') {
    goCard.carteImage.sample.jump(goCard.carteImage.sample.duration() - 10);
  }
}

PGraphicsPDF pdf;
void generatePostCard() {

  // Obtenir le chemin du dossier dynamiquement
  String filePath = System.getProperty("user.home") + "/Desktop/output.pdf";

 /* int milli_width = 150 * 2;
  int milli_height = 100 * 2;*/
  
  int milli_width = 405 ;
  int milli_height = 270 ;

  //pdf = (PGraphicsPDF) createGraphics(milli_width, milli_height, PDF, "test" + int(random(10000)) + ".pdf");
  pdf = (PGraphicsPDF) createGraphics(milli_width, milli_height, PDF, filePath);
  pdf.beginDraw();
  pdf.textMode(SHAPE);

  // Pour générer un pdf des deux pages, enlever le commentaire suivant:
  /*goCard.pgCardRecto.loadPixels();
   
   pdf.image(
   goCard.pgCardRecto.get(0, 0, goCard.pgCardRecto.width, goCard.pgCardRecto.height),
   0, 0, milli_width, milli_height
   );
   
   pdf.nextPage();*/

  pdf.image(
    postCard.pg.get(0, 0, postCard.pg.width, postCard.pg.height),
    0, 0, milli_width, milli_height
    );

  pdf.dispose();
  pdf.endDraw();
  println("PDF généré dans le dossier : " + filePath);

  // Commande pour imprimer le PDF avec une imprimante spécifique en noir et blanc, format 10x15 cm, paysage, ajusté et centré
  //String[] cmd = {"sh", "-c", "lp -o media=Custom.100x150mm -o ColorModel=Gray -o fit-to-page -o scaling=100 -o page-left=0 -o page-right=0 -o page-top=0 -o page-bottom=0 -o landscape " + filePath}; // Envoie le PDF à l'imprimante
  String[] cmd = {"sh", "-c", "lp -o media=Custom.100x150mm -o ColorModel=Gray -o landscape -o fit-to-page -o scaling=200 -o page-left=0 -o page-right=0 -o page-top=0 -o page-bottom=0 " + filePath}; // Envoie le PDF à l'imprimante
  exec(cmd); // Exécute la commande pour imprimer
}
