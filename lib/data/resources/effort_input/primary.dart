const List<List<String>> tableReq = [
  ['ABAP (SAP)', '28', '18', '16', '60'],
  ['ASP', '51', '54', '15', '69'],
  ['Assembler', '119', '98', '25', '320'],
  ['Brio', '14', '14', '13', '16'],
  ['C', '97', '99', '39', '333'],
  ['C++', '50', '53', '25', '80'],
  ['C#', '54', '59', '29', '70'],
  ['COBOL', '61', '55', '23', '297'],
  ['Cognos Impromptu Scripts', '47', '42', '30', '100'],
  ['Cross System Products (CSP)', '20', '18', '10', '38'],
  ['Cool:Gen/IEF', '32', '24', '10', '82'],
  ['Datastage', '71', '65', '31', '157'],
  ['Excel', '209', '191', '131', '315'],
  ['Focus', '43', '45', '45', '45'],
  ['FoxPro', '36', '35', '34', '38'],
  ['HTML', '34', '40', '14', '48'],
  ['J2EE', '46', '49', '15', '67'],
  ['Java', '53', '53', '14', '134'],
  ['JavaScript', '47', '53', '31', '63'],
  ['JCL', '62', '48', '25', '221'],
  ['LINC II', '29', '30', '22', '38'],
  ['Lotus Notes', '23', '21', '19', '40'],
  ['Natural', '40', '34', '34', '53'],
  ['.NET', '57', '60', '53', '60'],
  ['Oracle', '37', '40', '17', '60'],
  ['PACBASE', '35', '32', '22', '60'],
  ['Perl', '24', '15', '15', '60'],
  ['PL/I ', '64', '80', '16', '80'],
  ['PL/SQL', '37', '35', '13', '60'],
  ['Powerbuilder', '26', '28', '7', '40'],
  ['REXX', '77', '80', '50', '80'],
  ['Sabretalk', '70', '66', '45', '109'],
  ['SAS', '38', '37', '22', '55'],
  ['Siebel', '59', '60', '51', '60'],
  ['SLOGAN', '75', '75', '74', '75'],
  ['SQL', '21', '21', '13', '37'],
  ['VB.NET', '52', '60', '26', '60'],
  ['Visual Basic', '42', '44', '20', '60']
];

List<String> getString(List<List<String>> fullList, int index) {
  List<String> newList = new List.empty(growable: true);
  for (int i = 0; i < fullList.length; i++) {
    for (int j = index; j < index + 1; j++) {
      newList.add(tableReq[i][j]);
    }
  }
  return newList;
}

int getIndex(String language) {
  int index = 0;
  List<String> languageValues = getString(tableReq, 1);
  for (int i = 0; i < languageValues.length; i++) {
    if (languageValues[i] == language) {
      index = i;
      break;
    }
  }
  return index;
}
