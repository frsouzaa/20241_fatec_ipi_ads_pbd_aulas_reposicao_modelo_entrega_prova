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
-- 2
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


-- ----------------------------------------------------------------
-- 4 Salário versus estudos
--escreva a sua solução aqui


-- ----------------------------------------------------------------
-- 5. Limpeza de valores NULL
--escreva a sua solução aqui

-- ----------------------------------------------------------------