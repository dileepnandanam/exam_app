User.create(email: "dileep@gmail.com", password: "123456", password_confirmation: "123456")
User.create(email: "murtuza@f22labs.com", password: "123456", password_confirmation: "123456")
User.create(email: "nirav@f22labs.com", password: "123456", password_confirmation: "123456")
User.create(email: "pradeep@f22labs.com", password: "123456", password_confirmation: "123456")
User.create(email: "shiva@f22labs.com", password: "123456", password_confirmation: "123456")

exam = Exam.create(name: "Exam 1")
  subject = Subject.create(name: "Subject 1", exam: exam)
    topic = Topic.create(name: "Topic 1", subject: subject)
      chapter = Chapter.create(name: "Chapter 1", topic: topic)
        question = Question.create(name: "Question 1", chapter: chapter)
          Option.create(name: "Option 1", question: question)
          Option.create(name: "Option 2", question: question)
          Option.create(name: "Option 3", question: question)
          Option.create(name: "Option 4", question: question, correct: true)
        question = Question.create(name: "Question 2", chapter: chapter)
          Option.create(name: "Option 1", question: question)
          Option.create(name: "Option 2", question: question)
          Option.create(name: "Option 3", question: question)
          Option.create(name: "Option 4", question: question, correct: true)
        question = Question.create(name: "Question 3", chapter: chapter)
          Option.create(name: "Option 1", question: question)
          Option.create(name: "Option 2", question: question)
          Option.create(name: "Option 3", question: question)
          Option.create(name: "Option 4", question: question, correct: true)
      chapter = Chapter.create(name: "Chapter 2", topic: topic)
        question = Question.create(name: "Question 4", chapter: chapter)
          Option.create(name: "Option 1", question: question)
          Option.create(name: "Option 2", question: question)
          Option.create(name: "Option 3", question: question)
          Option.create(name: "Option 4", question: question, correct: true)
        question = Question.create(name: "Question 5", chapter: chapter)
          Option.create(name: "Option 1", question: question)
          Option.create(name: "Option 2", question: question)
          Option.create(name: "Option 3", question: question)
          Option.create(name: "Option 4", question: question, correct: true)
        question = Question.create(name: "Question 6", chapter: chapter)
          Option.create(name: "Option 1", question: question)
          Option.create(name: "Option 2", question: question)
          Option.create(name: "Option 3", question: question)
          Option.create(name: "Option 4", question: question, correct: true)
    topic = Topic.create(name: "Topic 2", subject: subject)
      chapter = Chapter.create(name: "Chapter 3", topic: topic)
        question = Question.create(name: "Question 7", chapter: chapter)
          Option.create(name: "Option 1", question: question)
          Option.create(name: "Option 2", question: question)
          Option.create(name: "Option 3", question: question)
          Option.create(name: "Option 4", question: question, correct: true)
        question = Question.create(name: "Question 8", chapter: chapter)
          Option.create(name: "Option 1", question: question)
          Option.create(name: "Option 2", question: question)
          Option.create(name: "Option 3", question: question)
          Option.create(name: "Option 4", question: question, correct: true)
        question = Question.create(name: "Question 9", chapter: chapter)
          Option.create(name: "Option 1", question: question)
          Option.create(name: "Option 2", question: question)
          Option.create(name: "Option 3", question: question)
          Option.create(name: "Option 4", question: question, correct: true)
      chapter = Chapter.create(name: "Chapter 4", topic: topic)
        question = Question.create(name: "Question 10", chapter: chapter)
          Option.create(name: "Option 1", question: question)
          Option.create(name: "Option 2", question: question)
          Option.create(name: "Option 3", question: question)
          Option.create(name: "Option 4", question: question, correct: true)
        question = Question.create(name: "Question 11", chapter: chapter)
          Option.create(name: "Option 1", question: question)
          Option.create(name: "Option 2", question: question)
          Option.create(name: "Option 3", question: question)
          Option.create(name: "Option 4", question: question, correct: true)
        question = Question.create(name: "Question 12", chapter: chapter)
          Option.create(name: "Option 1", question: question)
          Option.create(name: "Option 2", question: question)
          Option.create(name: "Option 3", question: question)
          Option.create(name: "Option 4", question: question, correct: true)
  subject = Subject.create(name: "Subject 2", exam: exam)
    topic = Topic.create(name: "Topic 3", subject: subject)
      chapter = Chapter.create(name: "Chapter 5", topic: topic)
        question = Question.create(name: "Question 13", chapter: chapter)
          Option.create(name: "Option 1", question: question)
          Option.create(name: "Option 2", question: question)
          Option.create(name: "Option 3", question: question)
          Option.create(name: "Option 4", question: question, correct: true)
        question = Question.create(name: "Question 14", chapter: chapter)
          Option.create(name: "Option 1", question: question)
          Option.create(name: "Option 2", question: question)
          Option.create(name: "Option 3", question: question)
          Option.create(name: "Option 4", question: question, correct: true)
        question = Question.create(name: "Question 15", chapter: chapter)
          Option.create(name: "Option 1", question: question)
          Option.create(name: "Option 2", question: question)
          Option.create(name: "Option 3", question: question)
          Option.create(name: "Option 4", question: question, correct: true)
      chapter = Chapter.create(name: "Chapter 6", topic: topic)
        question = Question.create(name: "Question 16", chapter: chapter)
          Option.create(name: "Option 1", question: question)
          Option.create(name: "Option 2", question: question)
          Option.create(name: "Option 3", question: question)
          Option.create(name: "Option 4", question: question, correct: true)
        question = Question.create(name: "Question 17", chapter: chapter)
          Option.create(name: "Option 1", question: question)
          Option.create(name: "Option 2", question: question)
          Option.create(name: "Option 3", question: question)
          Option.create(name: "Option 4", question: question, correct: true)
        question = Question.create(name: "Question 18", chapter: chapter)
          Option.create(name: "Option 1", question: question)
          Option.create(name: "Option 2", question: question)
          Option.create(name: "Option 3", question: question)
          Option.create(name: "Option 4", question: question, correct: true)
    topic = Topic.create(name: "Topic 4", subject: subject)
      chapter = Chapter.create(name: "Chapter 7", topic: topic)
        question = Question.create(name: "Question 19", chapter: chapter)
          Option.create(name: "Option 1", question: question)
          Option.create(name: "Option 2", question: question)
          Option.create(name: "Option 3", question: question)
          Option.create(name: "Option 4", question: question, correct: true)
        question = Question.create(name: "Question 20", chapter: chapter)
          Option.create(name: "Option 1", question: question)
          Option.create(name: "Option 2", question: question)
          Option.create(name: "Option 3", question: question)
          Option.create(name: "Option 4", question: question, correct: true)
        question = Question.create(name: "Question 21", chapter: chapter)
          Option.create(name: "Option 1", question: question)
          Option.create(name: "Option 2", question: question)
          Option.create(name: "Option 3", question: question)
          Option.create(name: "Option 4", question: question, correct: true)
      chapter = Chapter.create(name: "Chapter 8", topic: topic)
        question = Question.create(name: "Question 22", chapter: chapter)
          Option.create(name: "Option 1", question: question)
          Option.create(name: "Option 2", question: question)
          Option.create(name: "Option 3", question: question)
          Option.create(name: "Option 4", question: question, correct: true)
        question = Question.create(name: "Question 23", chapter: chapter)
          Option.create(name: "Option 1", question: question)
          Option.create(name: "Option 2", question: question)
          Option.create(name: "Option 3", question: question)
          Option.create(name: "Option 4", question: question, correct: true)
        question = Question.create(name: "Question 24", chapter: chapter)
          Option.create(name: "Option 1", question: question)
          Option.create(name: "Option 2", question: question)
          Option.create(name: "Option 3", question: question)
          Option.create(name: "Option 4", question: question, correct: true)