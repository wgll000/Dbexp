-- 写出下列应用对应的SQL语句，并将查询语句定义为视图。视图名根据题号依次命名为V5,V8,V11,V14,V17,V20,V23,V26,V29,V32,V35。
-- 05) 列出没有提成(comm)的所有职工的姓名与工资，并按姓名排序。
-- 08) 显示姓名中包含AR和IN的职工姓名，并按姓名排序。
-- 11) 查询出每个部门中工资最高的职工，并按部门编号排序。若同一部门有多个最高工资者，再按职工号排序。
-- 14) 列出工资比“JONES”多的所有职工，并按职工编号排序。
-- 17) 列出部门名称和这些部门职工的编号、姓名，要求同时列出那些没有职工的部门，并按部门名称和职工编号排序。
-- 20) 列出在销售部(“sales”)工作的职工的姓名，并按姓名排序。
-- 23) 列出工资高于“30号部门的最高工资”的职工姓名和工资，并按姓名排序。
-- 26) 列出所有职工的姓名、部门名称和工资，并按姓名排序。
-- 29) 列出各个部门的经理（“manager”）的最低工资。
-- 32) 列出在亚洲工作且工资最高的职工的姓名，并按姓名排序。
-- 35) 列出各部门名称及其人数，含没有职工的部门，并按部门名称排序。
CREATE VIEW V5 AS
SELECT
    ENAME,
    SAL
FROM
    EMP
WHERE
    COMM IS NULL
ORDER BY
    ENAME;

CREATE VIEW V8 AS
SELECT
    ENAME
FROM
    EMP
WHERE
    ENAME LIKE '%AR%'
    OR ENAME LIKE '%IN%'
ORDER BY
    ENAME;

CREATE VIEW V11 AS
SELECT
    DEPTNO,
    EMPNO,
    ENAME,
    SAL
FROM
    EMP
WHERE
    (DEPTNO, SAL) IN (
        SELECT
            DEPTNO,
            MAX(SAL)
        FROM
            EMP
        GROUP BY
            DEPTNO
    )
ORDER BY
    DEPTNO,
    EMPNO;

CREATE VIEW V14 AS
SELECT
    EMPNO,
    ENAME,
    SAL
FROM
    EMP
WHERE
    SAL > (
        SELECT
            SAL
        FROM
            EMP
        WHERE
            ENAME = 'JONES'
    )
ORDER BY
    EMPNO;

CREATE VIEW V17 AS
SELECT
    D.DNAME,
    E.EMPNO,
    E.ENAME
FROM
    DEPT D
    LEFT JOIN EMP E ON D.DEPTNO = E.DEPTNO
ORDER BY
    D.DNAME,
    E.EMPNO;

CREATE VIEW V20 AS
SELECT
    ENAME
FROM
    EMP
WHERE
    JOB = 'sales'
ORDER BY
    ENAME;

CREATE VIEW V23 AS
SELECT
    ENAME,
    SAL
FROM
    EMP
WHERE
    SAL > (
        SELECT
            MAX(SAL)
        FROM
            EMP
        WHERE
            DEPTNO = 30
    )
ORDER BY
    ENAME;

CREATE VIEW V26 AS
SELECT
    E.ENAME,
    D.DNAME,
    E.SAL
FROM
    EMP E
    LEFT JOIN DEPT D ON E.DEPTNO = D.DEPTNO
ORDER BY
    E.ENAME;

CREATE VIEW V29 AS
SELECT
    D.DNAME,
    MIN(E.SAL) AS MIN_SAL
FROM
    DEPT D
    LEFT JOIN EMP E ON D.DEPTNO = E.DEPTNO
    AND E.JOB = 'manager'
GROUP BY
    D.DNAME
ORDER BY
    D.DNAME;

CREATE VIEW V32 AS
SELECT
    ENAME
FROM
    EMP
WHERE
    DEPTNO LIKE '50'
    AND SAL = (
        SELECT
            MAX(SAL)
        FROM
            EMP
        WHERE
            DEPTNO LIKE '50'
    )
ORDER BY
    ENAME;

CREATE VIEW V35 AS
SELECT
    D.DNAME,
    COUNT(E.EMPNO) AS NUM_EMP
FROM
    DEPT D
    LEFT JOIN EMP E ON D.DEPTNO = E.DEPTNO
GROUP BY
    D.DNAME
ORDER BY
    D.DNAME;