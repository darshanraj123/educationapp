import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/lessons': (context) => LessonsScreen(),
        '/lesson_content': (context) => LessonContentScreen(),
        '/quiz': (context) => QuizScreen(),
        '/results': (context) => ResultScreen(),
      },
      
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Python Educational App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            const Text(
              'Welcome to the Python Educational App',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/lessons');
              },
              child: const Text('Start Learning Python'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/quiz');
              },
              child: const Text('Take Python Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}

class LessonsScreen extends StatelessWidget {
  final List<String> pythonTopics = [
    'Introduction to Python',
    'Variables and Data Types',
    'Control Structures',
    'Functions',
    'Lists and Dictionaries',
    'Modules and Libraries',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Python Lessons'),
      ),
      body: ListView.builder(
        itemCount: pythonTopics.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pythonTopics[index]),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/lesson_content',
                arguments: pythonTopics[index],
              );
            },
          );
        },
      ),
    );
  }
}

class LessonContentScreen extends StatelessWidget {
  final Map<String, String> lessonContent = {
    'Introduction to Python': '''
      Introduction to Python:
      
      Python is a high-level, interpreted programming language. 
      It is known for its simplicity and readability, making it an excellent choice for beginners.

      Python Features:
      - Easy to learn and use.
      - Open-source and community-driven.
      - Versatile and can be used for various applications.

      Python Syntax:
      Python uses indentation to define code blocks, which makes the code clean and readable.

      Example:
      ```
      print("Hello, World!")
      ```

      This code prints "Hello, World!" to the console.
    ''',
    'Variables and Data Types': '''
      Variables and Data Types:

      In Python, you can create variables to store data. Python supports various data types, including:
      - int (integer)
      - float (floating-point number)
      - str (string)
      - bool (boolean)

      Example:
      ```
      age = 21
      name = "Darshan"
      is_student = True
      ```

      You can perform operations and manipulate data using these data types.
    ''',
    'Control Structures': '''
      Control Structures:

      Control structures allow you to control the flow of your program. Common control structures in Python include:
      - if statements
      - for loops
      - while loops

      Example:
      ```
      if x > 10:
          print("x is greater than 10")
      ```

      These structures help you make decisions and repeat actions in your code.
    ''',
    'Functions': '''
      Functions:

      Functions are reusable blocks of code that perform a specific task. In Python, you can define functions using the `def` keyword.

      Example:
      ```
      def greet(name):
          print("Hello, " + name + "!")
      ```

      Functions make your code organized and modular.
    ''',
    'Lists and Dictionaries': '''
      Lists and Dictionaries:

      Lists are collections of items in Python, and dictionaries are collections of key-value pairs.

      Example:
      ```
      # List
      fruits = ["apple", "banana", "cherry"]

      # Dictionary
      person = {"name": "John", "age": 30}
      ```

      You can access and manipulate data efficiently using these data structures.
    ''',
    'Modules and Libraries': '''
      Modules and Libraries:

      Python has a vast ecosystem of modules and libraries that extend its functionality. You can import and use these modules in your code.

      Example:
      ```
      import math

      # Using a math function
      result = math.sqrt(25)
      ```

      Modules and libraries save you time and effort by providing pre-built functionality.
    ''',
  };

  @override
  Widget build(BuildContext context) {
    final String topic = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(topic),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          lessonContent[topic] ?? 'Lesson content not found.',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Map<String, dynamic>> pythonQuiz = [
    {
      'question': 'What is Python?',
      'options': ['A programming language', 'A snake', 'A fruit'],
      'correctAnswer': 'A programming language',
    },
    {
      'question': 'What is the purpose of indentation in Python?',
      'options': [
        'To make the code look pretty',
        'To define code blocks',
        'To add spaces between words',
      ],
      'correctAnswer': 'To define code blocks',
    },
    {
      'question': 'Which statement is used for decision making in Python?',
      'options': ['if', 'for', 'while'],
      'correctAnswer': 'if',
    },
    {
      'question': 'What does the len() function do in Python?',
      'options': [
        'Returns the length of a string',
        'Counts the number of vowels',
        'Finds the maximum value in a list'
      ],
      'correctAnswer': 'Returns the length of a string',
    },
    {
      'question': 'Which of the following is NOT a valid data type in Python?',
      'options': ['int', 'double', 'char'],
      'correctAnswer': 'char',
    },
    {
      'question': 'What is the result of 3 + 4 * 2 in Python?',
      'options': ['7', '14', '11'],
      'correctAnswer': '11',
    },
    {
      'question': 'Which of the following is a Python framework for web applications?',
      'options': ['Django', 'Angular', 'React'],
      'correctAnswer': 'Django',
    },
    {
      'question': 'How do you define a function in Python?',
      'options': ['func', 'function', 'def'],
      'correctAnswer': 'def',
    },
    {
      'question': 'What does the "for" loop do in Python?',
      'options': [
        'Loops through a sequence of numbers',
        'Executes code a fixed number of times',
        'Repeats code until a condition is met'
      ],
      'correctAnswer': 'Loops through a sequence of numbers',
    },
    {
      'question': 'Which symbol is used for comments in Python?',
      'options': ['//', '#', '/* */'],
      'correctAnswer': '#',
    },
  ];

  List<String?> selectedAnswers = List.filled(10, null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Python Quiz'),
      ),
      body: ListView.builder(
        itemCount: pythonQuiz.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Question ${index + 1}: ${pythonQuiz[index]['question']}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Column(
                  children: List<Widget>.generate(
                    pythonQuiz[index]['options'].length,
                    (i) {
                      return RadioListTile(
                        title: Text(pythonQuiz[index]['options'][i]),
                        value: pythonQuiz[index]['options'][i],
                        groupValue: selectedAnswers[index], // Track user's selection
                        onChanged: (value) {
                          setState(() {
                            selectedAnswers[index] = value; // Update user's selection
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Calculate the score based on selected answers
          int correctAnswers = 0;
          for (int index = 0; index < pythonQuiz.length; index++) {
            if (selectedAnswers[index] == pythonQuiz[index]['correctAnswer']) {
              correctAnswers++;
            }
          }
          Navigator.pushNamed(
            context,
            '/results',
            arguments: correctAnswers,
          );
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int correctAnswers = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            const Text(
              'Your Score:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '$correctAnswers / 10',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Return to the quiz screen
              },
              child: const Text('Return to Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
