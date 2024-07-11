-- ----------------------------------------------------------------
-- 1 Base de dados e criação de tabela
--escreva a sua solução aqui
CREATE DATABASE student_prediction;
CREATE TABLE student (
	id SERIAL PRIMARY KEY,
	SALARY int,
	MOTHER_EDU int,
	FATHER_EDU int,
	PREP_STUDY int,
	PREP_EXAM int,
	GRADE int
);

-- ----------------------------------------------------------------
-- 2 Resultado em função da formação dos pais
--escreva a sua solução aqui
DO $$
DECLARE
	cur_aprovados_phd REFCURSOR;
	student RECORD;
	i int := 0;
BEGIN
	OPEN cur_aprovados_phd FOR SELECT grade, father_edu, mother_edu FROM student;
	LOOP
		FETCH cur_aprovados_phd into student;
		EXIT WHEN NOT FOUND;
		IF student.grade > 0 AND (student.father_edu = 6 OR student.mother_edu = 6) THEN
			i := i + 1;
		END IF;
	END LOOP;
	CLOSE cur_aprovados_phd;
	RAISE NOTICE '%', i;
END;
$$

-- ----------------------------------------------------------------
-- 3 Resultado em função dos estudos
--escreva a sua solução aqui
DO $$
DECLARE
	cur_aprovados_estudos REFCURSOR;
	student RECORD;
	i int := 0;
	number_prep_study int := 1;
	number_grade int := 0;
BEGIN
	OPEN cur_aprovados_estudos FOR EXECUTE
	FORMAT(
	'SELECT prep_study, grade FROM student
	WHERE prep_study = $1
	AND grade > $2'
	) USING number_prep_study, number_grade;
	LOOP
		FETCH cur_aprovados_estudos into student;
		EXIT WHEN NOT FOUND;
		i := i + 1;
	END LOOP;
	CLOSE cur_aprovados_estudos;
	IF i = 0 THEN
		RAISE NOTICE '-1';
	ELSE
		RAISE NOTICE '%', i;
	END IF;
END;
$$

-- ----------------------------------------------------------------
-- 4 Salário versus estudos
--escreva a sua solução aqui


-- ----------------------------------------------------------------
-- 5. Limpeza de valores NULL
--escreva a sua solução aqui

-- ----------------------------------------------------------------