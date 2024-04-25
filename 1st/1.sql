SELECT name_student, date_attempt, result
FROM
    subject s
        JOIN attempt a ON s.subject_id = a.subject_id AND s.name_subject = 'Основы баз данных'
        JOIN student USING(student_id)
ORDER BY result DESC;
