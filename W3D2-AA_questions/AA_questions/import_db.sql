PRAGMA foreign_keys = ON;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT,
  author_id INT NOT NULL,
  
  FOREIGN KEY (author_id) REFERENCES users(id)
  -- come back and check if we can make line 11 
  -- "author_id INT NOT NULL FOREIGN KEY REFERENCE users(id)"
);

CREATE TABLE question_follows (
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  author_id INTEGER NOT NULL,
  parent_id INTEGER,
  body TEXT,
  
  FOREIGN KEY (parent_id) REFERENCES replies(id)
  FOREIGN KEY (author_id) REFERENCES users(id)
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY, 
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL, 
  
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);


INSERT INTO 
  users (fname, lname)
VALUES
  ('natasha', 'wei'),
  ('Jennifer', 'Kennedy'),
  ('Dustin', 'Pearson');

INSERT INTO 
  questions (title, body, author_id)
VALUES
  ('Q1', 'B1', (SELECT id FROM users WHERE fname = 'Jennifer' AND lname = 'Kennedy')),
  ('Q2', 'B2', (SELECT id FROM users WHERE fname = 'natasha' AND lname = 'wei')),
  ('Q3', 'B3', 3);
  
INSERT INTO 
  question_follows (question_id, user_id)
VALUES
  ((SELECT id FROM questions WHERE title = 'Q1'), (SELECT id FROM users WHERE fname = 'natasha')),
  ((SELECT id FROM questions WHERE title = 'Q2'), (SELECT id FROM users WHERE fname = 'Jennifer'));
  
INSERT INTO 
  replies (question_id, parent_id, author_id, body)
VALUES 
  ((SELECT id FROM questions WHERE title = 'Q1'), NULL, (SELECT id FROM users WHERE fname = 'natasha'), 'R1'),
  ((SELECT id FROM questions WHERE title = 'Q2'), NULL, (SELECT id FROM users WHERE fname = 'Jennifer'), 'R2'),
  ((SELECT id FROM questions WHERE title = 'Q1'), 1, (SELECT id FROM users WHERE fname = 'natasha'), 'R1'),
  ((SELECT id FROM questions WHERE title = 'Q2'), 2, (SELECT id FROM users WHERE fname = 'Jennifer'), 'R2');
  
  INSERT INTO
    question_likes (question_id, user_id)
  VALUES
    ((SELECT id FROM questions WHERE title = 'Q1'), (SELECT id FROM users WHERE fname = 'natasha')),
    ((SELECT id FROM questions WHERE title = 'Q2'), (SELECT id FROM users WHERE fname = 'Jennifer')),
    (1, 3);
    

  






