ALTER TABLE
"EMP"
ADD
    CONSTRAINT "CHK_EMP_SAL" CHECK (
        "SAL" >= 5000
        AND "SAL" <= 100000
    );

ALTER TABLE
"EMP"
ADD
    CONSTRAINT "CHK_EMP_HIREDATE" CHECK ("HIREDATE" > TO_DATE('2002-02-02', 'YYYY-MM-DD'));

ALTER TABLE
"EMP"
ADD
    CONSTRAINT "CHK_EMP_JOB" CHECK (
        "JOB" IN (
            'clerk',
            'salesman',
            'analyst',
            'manager',
            'president'
        )
    );

ALTER TABLE
"DEPT"
ADD
    CONSTRAINT "CHK_DEPT_INCOME" CHECK ("INCOME" > 0);

ALTER TABLE
"DEPT"
ADD
    CONSTRAINT "CHK_DEPT_EMPS" CHECK ("EMPS" >= 0);