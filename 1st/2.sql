SELECT
    name_subject,
    COUNT(attempt.subject_id) AS Количество,
    ROUND(AVG(result), 2) AS Среднее
FROM subject LEFT JOIN attempt USING(subject_id)
GROUP BY name_subject
ORDER BY 2 DESC;
