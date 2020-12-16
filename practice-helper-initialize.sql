DROP TABLE IF EXISTS users, rep_list, students_teachers, lesson_notes, practice_log;

CREATE TABLE users (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50),
  email VARCHAR(50),
  password VARCHAR(50),
  signup_date DATE,
  account_type SET("student", "teacher", "individual"),
  PRIMARY KEY (id)
);

CREATE TABLE rep_list (
  user_id INT NOT NULL,
  song_name VARCHAR(50),
  composer_artist VARCHAR(50),
  style VARCHAR(50),
  tempo INT,
  time_sig VARCHAR(50),
  versions VARCHAR(50),
  rep_or_queue SET("rep", "queue"),
  FOREIGN KEY (user_id)
  REFERENCES users (id)
);

CREATE TABLE students_teachers (
  student_id INT NOT NULL,
  teacher_id INT NOT NULL,
  FOREIGN KEY (student_id)
  REFERENCES users (id)
);

CREATE TABLE lesson_notes (
  student_id INT NOT NULL,
  teacher_id INT NOT NULL,
  date_assigned DATE,
  notes VARCHAR(5000),
  FOREIGN KEY (student_id)
  REFERENCES users (id)
);

CREATE TABLE practice_log (
  user_id INT NOT NULL,
  date DATE,
  start VARCHAR(50),
  end VARCHAR(50),
  content VARCHAR(5000),
  goals VARCHAR(5000),
  FOREIGN KEY (user_id)
  REFERENCES users (id)
);