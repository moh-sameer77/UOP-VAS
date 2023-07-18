import 'question.dart';

int R = 0, I = 0, A = 0, S = 0, E = 0, C = 0;

class QuizBrain {
  int _questionNumber = 0;
//R=0,  I=1, A=2, S=3, E=4, C=5
  // ignore: prefer_final_fields
  List<Question> _questionBank = [
    Question('Do you like to work on cars? ', true, 0), //R
    Question('Do you like to do puzzles?', true, 1), //I
    Question('Are you good at working independently?', true, 2), //A

    Question('Are you an ambitious person,\nDo you set goals for yourself?',
        true, 4), //E
    Question('Do you like to organize things,\n(files, desks/offices)?', true,
        5), //C
    Question('Do you like to build things?', true, 0), //R
    Question('Do you like to read about art and music?', true, 2), //A
    Question('Do youlike to have clear instructions to follow?', true, 5), //C
    Question(
        'Do you like to try to influence or persuade people1?', true, 4), //E
    Question('Do you like to do experiments?', true, 1), //I
    Question('Do you like to teach or train people?', true, 3), //S
    Question(
        'Do you like trying to help people solve their problems?', true, 3),
    Question('Do like to work in teams?', true, 3), //S //S
    Question('Do you like to take care of animals?', true, 0), //R
    Question(
        'Would you mind working 8 hours per day in an office? ', true, 5), //C
    Question('Do you like selling things?', true, 4), //E
    Question('Do you enjoy creative writing?', true, 2), //A
    Question('Do you enjoy science?', true, 1), //I
    Question('Are you quick to take on new responsibilities? ', true, 4), //E
    Question('Are you interested in healing people? ', true, 3), //S
    Question(
        'Do you enjoy trying to figure out how things work? ', true, 1), //I
    Question('Do you like putting things together or assembling things? ', true,
        0), //R
    Question('Are you a creative person? ', true, 2), //A
    Question('Do you pay attention to details?', true, 5), //C
    Question('Do you like to do filing or typing?', true, 5), //C
    Question(
        'Do you like to analyze things (problems/situations)?', true, 1), //I
    Question('Do you like to play instruments or sing?', true, 2), //A
    Question('Do you enjoy learning about other cultures?', true, 3), //S
    Question('Would you like to start your own business? ', true, 4), //E
    Question('Do you like to cook?', true, 0), //R
    Question('Do you like acting in a plays?', true, 2), //A
    Question('Are you a practical person?', true, 0), //R
    Question('Do you like to work with number or charts?', true, 1), //I
    Question('Do you like to get into discussions about issues? ', true, 3), //S
    Question('Are you good at keeping records of youe work?', true, 5), //C
    Question('Do you like to lead? ', true, 4), //E
    Question('Do you like working outdoors?', true, 0), //R
    Question('Would you like to work in an office?', true, 5), //C
    Question('Are you good at math? ', true, 1), //I
    Question('Do you like helping people?', true, 3), //S
    Question('Do you like to draw?', true, 2), //A
    Question('Do you like to give speeches?', true, 4), //E
  ];
  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void getAnswerValue() {
    if (_questionBank[_questionNumber].questionAnswer) {
      if (_questionBank[_questionNumber].questionValue == 0) {
        R++;
      } else if (_questionBank[_questionNumber].questionValue == 1) {
        I++;
      } else if (_questionBank[_questionNumber].questionValue == 2) {
        A++;
      } else if (_questionBank[_questionNumber].questionValue == 3) {
        S++;
      } else if (_questionBank[_questionNumber].questionValue == 4) {
        E++;
      } else {
        C++;
      }
    }
  }

  String MaxNumber() {
    Map<String, int> map1 = {'R': R, 'I': I, 'A': A, 'S': S, 'E': E, 'C': C};

    var sortedByValueMap = Map.fromEntries(
        map1.entries.toList()..sort((e1, e2) => e2.value.compareTo(e1.value)));
    var ss = "${sortedByValueMap.keys.toList()}";
    List<String> letter = [ss[1], ss[4], ss[7]];
    letter.sort();
    String xx = letter[0] + letter[1] + letter[2];
    print(xx);
    return xx;
  }

  void reset() {
    _questionNumber = 0;
  }

  List<String> code() {
    Map<String, List<String>> map = {};
    map["CER"] = ["Software engineering", "Banking and Finance", "Marketing"];
    map["CIR"] = [
      "Computer Science",
      "Data Science and Artificial intelligence",
      "Information Security ",
      "Virtual and Augmented"
    ];
    map["AIR"] = ["Reality Architecture"];
    map["ARS"] = [
      "Interior design",
      "Digital Film Design Technology",
      "Radio and television"
    ];
    map["AER"] = ["Graphic Design"];
    map["CEI"] = [
      "Business Administration",
      "E-business & Commerce",
      "Accounting",
      "Business Intelligence & Data analytics",
      "Financial Technology"
    ];
    map["AIS"] = [
      "Arabic language and Literature",
      "English language and Literature",
      "Modern Language French and English"
    ];
    map["ACI"] = ["Mathematics"];
    map["IRS"] = ["Educational Sciences"];
    map["CES"] = ["Basic humanities"];
    map["AES"] = ["Private law", "Public law", "Digital promotional media"];
    map["EIR"] = ["Pharmacy ", "Civil Engineering "];
    map["EIS"] = ["Clinical Nutrition and diets"];
    map["AEI"] = ["Journalism and digital media"];

    List<String>? x;

    map.forEach((key, value) {
      //bool key = map.containsKey(MaxNumber()); // search for the key.
      x = map[MaxNumber()];
      x ??= map["CIR"];
    });
    List<String> ss = x!.toList();
    print(x);
    return ss;
  }
}
