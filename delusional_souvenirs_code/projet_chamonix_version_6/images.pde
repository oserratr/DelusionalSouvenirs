import processing.sound.*;
class Image {

  SoundFile sample;
  Amplitude rms;


  PGraphics pgParent;
  PImage[] images = new PImage[119];
  boolean rectoImage = false;
  int randomIndexImage = 0;
  PImage currentImage;

  int i = height;
  //transparence variable
  float alpha = 255;

  int frameCounter = 0;

  Image(PGraphics _pgParent) {
    images[0] = loadImage("1.jpg");
    images[1] = loadImage("2.jpg");
    images[2] = loadImage("3.jpg");
    images[3] = loadImage("4.jpg");
    images[4] = loadImage("5.jpg");
    images[5] = loadImage("6.jpg");
    images[6] = loadImage("7.jpg");
    images[7] = loadImage("8.jpg");
    images[8] = loadImage("9.jpg");
    images[9] = loadImage("10.jpg");
    images[10] = loadImage("11.jpg");
    images[11] = loadImage("12.jpg");
    images[12] = loadImage("13.jpg");
    images[13] = loadImage("14.jpg");
    images[14] = loadImage("15.jpg");
    images[15] = loadImage("16.jpg");
    images[16] = loadImage("17.jpg");
    images[17] = loadImage("18.jpg");
    images[18] = loadImage("19.jpg");
    images[19] = loadImage("20.jpg");
    images[20] = loadImage("21.jpg");
    images[21] = loadImage("22.jpg");
    images[22] = loadImage("23.jpg");
    images[23] = loadImage("24.jpg");
    images[24] = loadImage("25.jpg");
    images[25] = loadImage("26.jpg");
    images[26] = loadImage("27.jpg");
    images[27] = loadImage("28.jpg");
    images[28] = loadImage("29.jpg");
    images[29] = loadImage("30.jpg");
    images[30] = loadImage("31.jpg");
    images[31] = loadImage("32.jpg");
    images[32] = loadImage("33.jpg");
    images[33] = loadImage("34.jpg");
    images[34] = loadImage("35.jpg");
    images[35] = loadImage("36.jpg");
    images[36] = loadImage("37.jpg");
    images[37] = loadImage("38.jpg");
    images[38] = loadImage("39.jpg");
    images[39] = loadImage("40.jpg");
    images[40] = loadImage("41.jpg");
    images[41] = loadImage("42.jpg");
    images[42] = loadImage("43.jpg");
    images[43] = loadImage("44.jpg");
    images[44] = loadImage("45.jpg");
    images[45] = loadImage("46.jpg");
    images[46] = loadImage("47.jpg");
    images[47] = loadImage("48.jpg");
    images[48] = loadImage("49.jpg");
    images[49] = loadImage("50.jpg");
    images[50] = loadImage("51.jpg");
    images[51] = loadImage("52.jpg");
    images[52] = loadImage("53.jpg");
    images[53] = loadImage("54.jpg");
    images[54] = loadImage("55.jpg");
    images[55] = loadImage("56.jpg");
    images[56] = loadImage("57.jpg");
    images[57] = loadImage("58.jpg");
    images[58] = loadImage("59.jpg");
    images[59] = loadImage("60.jpg");
    images[60] = loadImage("61.jpg");
    images[61] = loadImage("62.jpg");
    images[62] = loadImage("63.jpg");
    images[63] = loadImage("64.jpg");
    images[64] = loadImage("65.jpg");
    images[65] = loadImage("66.jpg");
    images[66] = loadImage("67.jpg");
    images[67] = loadImage("68.jpg");
    images[68] = loadImage("69.jpg");
    images[69] = loadImage("70.jpg");
    images[70] = loadImage("71.jpg");
    images[71] = loadImage("72.jpg");
    images[72] = loadImage("73.jpg");
    images[73] = loadImage("74.jpg");
    images[74] = loadImage("75.jpg");
    images[75] = loadImage("76.jpg");
    images[76] = loadImage("77.jpg");
    images[77] = loadImage("78.jpg");
    images[78] = loadImage("79.jpg");
    images[79] = loadImage("80.jpg");
    images[80] = loadImage("81.jpg");
    images[81] = loadImage("82.jpg");
    images[82] = loadImage("83.jpg");
    images[83] = loadImage("84.jpg");
    images[84] = loadImage("85.jpg");
    images[85] = loadImage("86.jpg");
    images[86] = loadImage("87.jpg");
    images[87] = loadImage("88.jpg");
    images[88] = loadImage("89.jpg");
    images[89] = loadImage("90.jpg");
    images[90] = loadImage("91.jpg");
    images[91] = loadImage("92.jpg");
    images[92] = loadImage("93.jpg");
    images[93] = loadImage("94.jpg");
    images[94] = loadImage("95.jpg");
    images[95] = loadImage("96.jpg");
    images[96] = loadImage("97.jpg");
    images[97] = loadImage("98.jpg");
    images[98] = loadImage("99.jpg");
    images[99] = loadImage("100.jpg");
    images[100] = loadImage("101.jpg");
    images[101] = loadImage("102.jpg");
    images[102] = loadImage("103.jpg");
    images[103] = loadImage("104.jpg");
    images[104] = loadImage("105.jpg");
    images[105] = loadImage("106.jpg");
    images[106] = loadImage("107.jpg");
    images[107] = loadImage("108.jpg");
    images[108] = loadImage("109.jpg");
    images[109] = loadImage("110.jpg");
    images[110] = loadImage("111.jpg");
    images[111] = loadImage("112.jpg");
    images[112] = loadImage("113.jpg");
    images[113] = loadImage("114.jpg");
    images[114] = loadImage("115.jpg");
    images[115] = loadImage("116.jpg");
    images[116] = loadImage("117.jpg");
    images[117] = loadImage("118.jpg");
    images[118] = loadImage("119.jpg");
    randomIndexImage = int (random(images.length));
    currentImage = images[randomIndexImage];

    pgParent = _pgParent;

    sample = new SoundFile(parent, "1mintest.mp3");

    rms = new Amplitude(parent);
  }

  void draw() {
  //random image
  pgParent.imageMode(CORNER);
  if (this.frameCounter == 0) {
    pgParent.image(currentImage, 0, 0, 900, 600);
    sample.stop();
  }

  if (rectoImage == true) {
    // Tracer deux fois plus de lignes en dupliquant le bloc de code de dessin

    for (int j = 0; j < 2; j++) {  // Boucle pour tracer 2 fois plus de lignes

      //fabrication des lignes
      float x = random(5, 900);
      int newX = int(x);
      float y = random(i, 600);
      int newY = int(y);
      float lineHeight = random(300);
      color c = pgParent.get(newX, newY);

      //map du son à la largeur des rectangles
      float largeur = map (rms.analyze(), 0, 1, 1, 50);
      println (rms.analyze());

      //lignes
      pgParent.strokeWeight (largeur);
      pgParent.strokeCap(SQUARE);
      pgParent.stroke(c, random(alpha));
      pgParent.line(x, y, x, y+lineHeight);

      // Réduction de la valeur de i et ajustement de l'alpha
      i = i - 1;
      if (i < 5) {
        i = 5;
      }

      alpha = alpha - 0.2;
      if (alpha < 50) {
        alpha = 50;
      }
      
      if (largeur < 0) {
        largeur = largeur * -1;
      }
    }
  }

  frameCounter++;
}

}
