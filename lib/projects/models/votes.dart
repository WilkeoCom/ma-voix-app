class Votes {
  int _numberFor = 0;
  int _numberAbstain = 0;
  int _numberAgainst = 0;

  int get total => _numberFor + _numberAbstain + _numberAgainst;
  double get forPourcentage => _numberFor / total * 100;
  double get abstainPourcentage => _numberAbstain / total * 100;
  double get againstPourcentage => _numberAgainst / total * 100;

  Votes({
    required numberFor,
    required numberAbstain,
    required numberAgainst,
  }) {
    _numberFor = numberFor;
    _numberAbstain = numberAbstain;
    _numberAgainst = numberAgainst;
  }

  addFor() {
    _numberFor++;
  }

  addAbstain() {
    _numberAbstain++;
  }

  addAgainst() {
    _numberAgainst++;
  }
}
