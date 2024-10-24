class Text {
  String[] textArrayOriginal;
  String[] textArrayReplace;
  String currentText;
  int currentIndex = 0;
  int randomIndexOriginal;
  int randomIndexReplace;
  int interval = 400; // 1/2 seconde (en millisecondes)
  int lastTime;
  boolean replaceText = false;
  boolean isReplacing = false;  // Ajout d'un drapeau pour savoir si on est en train de remplacer le texte
  float posXTextChange;
  float posYTextChange;
  float xWidth;
  float yHeight;
  PFont myFont;

  Text(String[] _textArrayOriginal, String[] _textArrayReplace, float _posXTextChange, float _posYTextChange) {
    textArrayOriginal = _textArrayOriginal;
    textArrayReplace = _textArrayReplace;
    randomIndexOriginal = int(random(textArrayOriginal.length));
    randomIndexReplace = int(random(textArrayReplace.length)); // Initialisation ici
    currentText = textArrayOriginal[randomIndexOriginal];
    lastTime = millis();
    posXTextChange = _posXTextChange;
    posYTextChange = _posYTextChange;

    myFont = createFont("SuisseEDUIntl-Medium.otf", 45);
  }

  void draw(PGraphics pg, float _x, float _y) {
    pg.fill(0);
    pg.textSize(25);
    pg.textFont(myFont);
    pg.textAlign(LEFT);
    xWidth = 400;
    yHeight = 500;
    pg.text(currentText, _x, _y, xWidth, yHeight);

    if (replaceText == true && !isReplacing) {
      // On commence le remplacement : on choisit un index pour le remplacement et on active le flag
      randomIndexReplace = int(random(textArrayReplace.length));
      isReplacing = true;  // Active le flag pour indiquer que le remplacement a commencé
    }

    if (replaceText == true) {
      // Vérifie si une demi-seconde s'est écoulée
      if (millis() - lastTime >= interval) {
        currentIndex++;
        if (currentIndex >= min(currentText.length(), textArrayReplace[randomIndexReplace].length())) {
          currentIndex = 0;
          replaceText = false;  // Fin du remplacement
          isReplacing = false;  // Réinitialise le flag une fois que le remplacement est terminé
        }
        lastTime = millis();
      }

      // Construit le texte avec les caractères interchangeés
      char[] charArray = currentText.toCharArray();
      charArray[currentIndex] = textArrayReplace[randomIndexReplace].charAt(currentIndex);
      currentText = new String(charArray);

      // Affiche le texte mis à jour
      pg.text(currentText, posXTextChange, posYTextChange, xWidth, yHeight);
    }
  }
}
