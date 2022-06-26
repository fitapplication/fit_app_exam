import 'dart:math';

int algorithm(var sleepHours, var exerciceHours) {
  double par2 = 0;
  double par1 = 0;
  int results = 0;

  if (sleepHours < 8) {
    par1 = (sleepHours - 8) / 8;
  }
  if (exerciceHours < 2) {
    par2 = (exerciceHours - 2) / 2;
  }
  if (par1 == par2) {
    results = 3;
  } else if (par2 < par1) {
    results = 2;
  } else if (par1 < par2) {
    results = 1;
  }

  return results;
}

String check(int test) {
  String imagecheck = '';

  if (test == 1) {
    imagecheck = "https://c.tenor.com/OTiUFg5Z2coAAAAC/pusheen-play.gif";
  } else if (test == 2) {
    imagecheck = "https://c.tenor.com/MVwqWHzPXNwAAAAC/pusheen-goodnight.gif";
  } else if (test == 3) {
    imagecheck = 'https://c.tenor.com/sJnOE_eYvFcAAAAC/pusheen.gif';
  }
  return imagecheck;
}

String checktext(int test) {
  String textcheck = '';
  if (test == 1) {
    textcheck = 'Your pet needs more execise!';
  } else if (test == 2) {
    textcheck = 'Your pet needs more sleep!';
  } else if (test == 3) {
    textcheck = 'Your pet is perfectly healty!';
  }
  return textcheck;
}
