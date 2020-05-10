DROP PROCEDURE P_INSERT_HABIT;
DROP PROCEDURE P_ADD_HABIT_CHECK;
DROP PROCEDURE P_DELETE_HABIT_CHECK;
DROP PROCEDURE P_DELETE_HABIT;
DROP PROCEDURE P_INSERT_TITLE;
DROP PROCEDURE P_INSERT_HISTORY;
DROP PROCEDURE P_INSERT_HABIT_CHECK;

-- 습관 등록 프로시저
CREATE OR REPLACE PROCEDURE P_INSERT_HABIT (
    P_H_NO              TB_HABIT.H_NO%TYPE,
    P_H_SUBCATEGORY     TB_HABIT.H_SUBCATEGORY%TYPE,
    P_H_START_DATE      TB_HABIT.H_START_DATE%TYPE,
    P_H_END_DATE        TB_HABIT.H_END_DATE%TYPE,
    P_H_SELECTDAY       TB_HABIT.H_SELECTDAY%TYPE,
    P_H_MONEY           TB_HABIT.H_MONEY%TYPE,
    P_H_TIME            TB_HABIT.H_TIME%TYPE,
    P_H_C_CODE          TB_HABIT.C_CODE%TYPE,
    P_M_ID              TB_MEMBER.M_ID%TYPE
    
) IS
    FIRST_CNT           NUMBER;
    MIDLE_CNT           NUMBER;
    MIDLE_CNT_MINUS     NUMBER;
    RAST_CNT            NUMBER;
    FILTER_CNTALL       NUMBER;
    COUNTALL            NUMBER;
    I                   NUMBER;
    LOOPNUM             NUMBER;
    FIRST_DAY           VARCHAR(5 CHAR);
    RAST_DAY            VARCHAR(5 CHAR);
    TYPE VA_TYPE        IS VARRAY(7) OF VARCHAR2(20);
    VA_DAY  VA_TYPE;
    
BEGIN

--TB_HABIT에 습관 추가
    INSERT INTO TB_HABIT VALUES(
        P_H_NO,
        P_H_SUBCATEGORY,
        P_H_START_DATE,
        P_H_END_DATE,
        P_H_SELECTDAY,
        P_H_MONEY,
        P_H_TIME,
        P_H_C_CODE,
        P_M_ID
    );

    
--날짜 계산
    VA_DAY := VA_TYPE('일','월','화','수','목','금','토');      
    FIRST_DAY := TO_CHAR(P_H_START_DATE, 'dy');
    RAST_DAY := TO_CHAR(P_H_END_DATE, 'dy');
    COUNTALL := P_H_END_DATE - P_H_START_DATE + 1;

-- 첫번째 주 초기화
    FIRST_CNT := CASE FIRST_DAY
        WHEN '일' THEN 7
        WHEN '월' THEN 6
        WHEN '화' THEN 5
        WHEN '수' THEN 4
        WHEN '목' THEN 3
        WHEN '금' THEN 2
        WHEN '토' THEN 1
    END;
    
-- 마지막 주 초기화
     RAST_CNT := CASE RAST_DAY
        WHEN '일' THEN 1
        WHEN '월' THEN 2
        WHEN '화' THEN 3
        WHEN '수' THEN 4
        WHEN '목' THEN 5
        WHEN '금' THEN 6
        WHEN '토' THEN 7
    END;

-- 중간 주 초기화
    MIDLE_CNT :=  COUNTALL - (FIRST_CNT + RAST_CNT);
    
-- 첫번째 주 계산
    I := CASE FIRST_DAY
        WHEN '일' THEN 1
        WHEN '월' THEN 2
        WHEN '화' THEN 3
        WHEN '수' THEN 4
        WHEN '목' THEN 5
        WHEN '금' THEN 6
        WHEN '토' THEN 7
    END;
    LOOPNUM := 8;
    
    WHILE I < LOOPNUM
    LOOP
        IF INSTR(P_H_SELECTDAY , VA_DAY(I)) = 0
        THEN
            FIRST_CNT := FIRST_CNT - 1;
        END IF;
    I := I + 1;
    END LOOP;
          
-- 마지막 주 계산 
    I := RAST_CNT;  
    LOOPNUM := 0;
    
    WHILE I > LOOPNUM
    LOOP
        IF INSTR(P_H_SELECTDAY , VA_DAY(I)) = 0
        THEN
            RAST_CNT := RAST_CNT - 1;
        END IF;
    I := I - 1;
    END LOOP;
    
-- 중간 주 계산
    MIDLE_CNT_MINUS := 0;      
    I := 1;
    LOOPNUM := 8;
    WHILE I < LOOPNUM
    LOOP
        IF INSTR(P_H_SELECTDAY , VA_DAY(I)) = 0
        THEN
            MIDLE_CNT_MINUS := MIDLE_CNT_MINUS + 1;
        END IF;
    I := I + 1;
    END LOOP;
    
    I := 0;
    LOOPNUM := MIDLE_CNT / 7;
    
    WHILE I < LOOPNUM
    LOOP
    MIDLE_CNT := MIDLE_CNT - MIDLE_CNT_MINUS;
    I := I + 1;
    END LOOP;
    
-- 첫째 주, 중간 주, 마지막 주 합산
    FILTER_CNTALL := FIRST_CNT + MIDLE_CNT + RAST_CNT;

-- TB_CURRENT_STATE에 습관 현황 추가
    INSERT INTO TB_CURRENT_STATE VALUES(
        S_C_STATE_NO.nextval,
        0,
        FILTER_CNTALL,
        0,
        P_M_ID,
        P_H_NO
    );
    
--TB_HABIT_CHECK에 습관 체크 추가
    INSERT INTO TB_HABIT_CHECK VALUES(
        S_H_CHECK_NO.nextval,
        'n',
        sysdate,
        P_M_ID,
        P_H_NO
    );
END;
/
--P_INSERT_HABIT 프로시저 테스트
--EXEC P_INSERT_HABIT(S_H_NO.NEXTVAL,'담배안핌',SYSDATE-1,SYSDATE,'일월화수목금토',3000,0,1,'smkim');
--EXEC P_INSERT_HABIT(S_H_NO.NEXTVAL,'담배필까?',SYSDATE,SYSDATE+30,'일월화수목금토',3000,0,1,'smkim');
--EXEC P_INSERT_HABIT(S_H_NO.NEXTVAL,'담배말고',SYSDATE,SYSDATE+30,'일월화수목금토',3000,0,1,'smkim');
--EXEC P_INSERT_HABIT(S_H_NO.NEXTVAL,'담배진짜그만',SYSDATE,SYSDATE+30,'일월화수목금토',3000,0,1,'smkim');
--EXEC P_INSERT_HABIT(S_H_NO.NEXTVAL,'술안마심',SYSDATE,SYSDATE+60,'일월화수목금토',4500,0,2,'smkim');
--EXEC P_INSERT_HABIT(S_H_NO.NEXTVAL,'메롱이다',SYSDATE,SYSDATE+60,'일월화수목금토',0,5,3,'smkim');

commit;

CREATE OR REPLACE PROCEDURE P_DELETE_HABIT (
    P_H_NO              TB_HABIT.H_NO%TYPE
) IS
    P_M_ID              TB_MEMBER.M_ID%TYPE;
BEGIN
    SELECT M_ID
    INTO P_M_ID
    FROM TB_HABIT
    WHERE H_NO = P_H_NO;

-- TB_HABIT_CHECK 삭제
    DELETE FROM TB_HABIT_CHECK
    WHERE H_NO = P_H_NO AND M_ID = P_M_ID;

-- TB_CURRENT_STATE 삭제
    DELETE FROM TB_CURRENT_STATE
    WHERE H_NO = P_H_NO AND M_ID = P_M_ID;

-- TB_HABIT 삭제
    DELETE FROM TB_HABIT
    WHERE H_NO = P_H_NO;
END;
/

-- 습관 체크 추가 프로시저
CREATE OR REPLACE PROCEDURE P_ADD_HABIT_CHECK (
    P_C_STATE_NO        TB_CURRENT_STATE.C_STATE_NO%TYPE
) IS
    P_C_COUNT           TB_CURRENT_STATE.C_COUNT%TYPE;
    P_C_COUNTALL        TB_CURRENT_STATE.C_COUNTALL%TYPE;
    P_H_CHECK_YN        TB_HABIT_CHECK.H_CHECK_YN%TYPE;
    P_H_NO              TB_HABIT.H_NO%TYPE;
    P_M_ID              TB_MEMBER.M_ID%TYPE;
    
BEGIN
-- 습관 현황 변수 매칭
    SELECT H_NO, M_ID, C_COUNT, C_COUNTALL
    INTO P_H_NO, P_M_ID, P_C_COUNT, P_C_COUNTALL
    FROM TB_CURRENT_STATE
    WHERE C_STATE_NO = P_C_STATE_NO;
    
    SELECT H_CHECK_YN
    INTO P_H_CHECK_YN
    FROM TB_HABIT_CHECK
    WHERE M_ID = P_M_ID AND H_NO = P_H_NO AND TO_CHAR(H_CHECK_DATE, 'YYYY/MM/DD') = TO_CHAR(sysdate, 'YYYY/MM/DD');
    
    IF P_C_COUNT < P_C_COUNTALL
    THEN
        IF P_H_CHECK_YN = 'n'
        THEN
    -- TB_CURRENT_STATE COUNT 갱신
            UPDATE TB_CURRENT_STATE
            SET
                C_COUNT = C_COUNT + 1
            WHERE C_STATE_NO = P_C_STATE_NO;
    
    -- TB_CURRENT_STATE PERCENT 갱신
            UPDATE TB_CURRENT_STATE
            SET
                 C_PERCENT = C_COUNT/C_COUNTALL * 100
            WHERE C_STATE_NO = P_C_STATE_NO;
    
    -- TB_HABIT_CHECK 갱신
            UPDATE TB_HABIT_CHECK
            SET
                H_CHECK_YN = 'y'
            WHERE M_ID = P_M_ID AND H_NO = P_H_NO AND TO_CHAR(H_CHECK_DATE, 'YYYY/MM/DD') = TO_CHAR(sysdate, 'YYYY/MM/DD');
        END IF;
    END IF;
END;
/

--P_UPDATE_HABIT 프로시저 테스트
--EXEC P_ADD_HABIT_CHECK(2);
--commit;

-- 습관 체크 해제 프로시저
CREATE OR REPLACE PROCEDURE P_DELETE_HABIT_CHECK (
    P_C_STATE_NO        TB_CURRENT_STATE.C_STATE_NO%TYPE
) IS
    P_C_COUNT           TB_CURRENT_STATE.C_COUNT%TYPE;
    P_C_COUNTALL        TB_CURRENT_STATE.C_COUNTALL%TYPE;
    P_H_CHECK_YN        TB_HABIT_CHECK.H_CHECK_YN%TYPE;
    P_H_NO              TB_HABIT.H_NO%TYPE;
    P_M_ID              TB_MEMBER.M_ID%TYPE;
    
BEGIN
-- 습관 현황 변수 매칭
    SELECT H_NO, M_ID, C_COUNT, C_COUNTALL
    INTO P_H_NO, P_M_ID, P_C_COUNT, P_C_COUNTALL
    FROM TB_CURRENT_STATE
    WHERE C_STATE_NO = P_C_STATE_NO;
    
    SELECT H_CHECK_YN
    INTO P_H_CHECK_YN
    FROM TB_HABIT_CHECK
    WHERE M_ID = P_M_ID AND H_NO = P_H_NO AND TO_CHAR(H_CHECK_DATE, 'YYYY/MM/DD') = TO_CHAR(sysdate, 'YYYY/MM/DD');
    
    IF P_C_COUNT <= P_C_COUNTALL
    THEN
        IF P_H_CHECK_YN = 'y'
        THEN
    -- TB_CURRENT_STATE COUNT 갱신
            UPDATE TB_CURRENT_STATE
            SET
                C_COUNT = C_COUNT - 1
            WHERE C_STATE_NO = P_C_STATE_NO;
    
    -- TB_CURRENT_STATE PERCENT 갱신
            UPDATE TB_CURRENT_STATE
            SET
                 C_PERCENT = C_COUNT/C_COUNTALL * 100
            WHERE C_STATE_NO = P_C_STATE_NO;
    
    -- TB_HABIT_CHECK 해제
            UPDATE TB_HABIT_CHECK
            SET
                H_CHECK_YN = 'n'
            WHERE M_ID = P_M_ID AND H_NO = P_H_NO AND TO_CHAR(H_CHECK_DATE, 'YYYY/MM/DD') = TO_CHAR(sysdate, 'YYYY/MM/DD');
         END IF;
    END IF;
END;
/

--EXEC P_DELETE_HABIT_CHECK(1);
--COMMIT;

create or replace PROCEDURE P_INSERT_HISTORY (

P_M_ID	TB_MEMBER.M_ID%TYPE

) IS

P_HIS_SUBCATEGORY	TB_HISTORY.HIS_SUBCATEGORY%TYPE;
P_HIS_STARTDATE		TB_HISTORY.HIS_STARTDATE%TYPE;
P_HIS_END_DATE		TB_HISTORY.HIS_END_DATE%TYPE;
P_HIS_PERCENT		TB_HISTORY.HIS_PERCENT%TYPE;
P_C_CODE		    TB_CATEGORY.C_CODE%TYPE;
P_H_NO			    TB_HABIT.H_NO%TYPE;
E_NO                NUMBER;

BEGIN

--달성율 100% 이거나 완료 날짜가 지난 HABIT DATA 가져오기
SELECT H_NO,H_SUBCATEGORY,H_START_DATE, H_END_DATE, C_PERCENT, C_CODE
INTO P_H_NO, P_HIS_SUBCATEGORY, P_HIS_STARTDATE, P_HIS_END_DATE, P_HIS_PERCENT, P_C_CODE
FROM TB_HABIT H
inner JOIN TB_CURRENT_STATE CS using(h_no)
WHERE h_no in (select h_no
from tb_habit
where m_id = P_M_ID) and TO_CHAR(H_END_DATE, 'YYYY/MM/DD') < TO_CHAR(sysdate, 'YYYY/MM/DD') or C_PERCENT = 100;

--TB_HISTORY에 이미 있는 내용인지 확인
E_NO := 0;
SELECT H_NO INTO E_NO
FROM TB_HISTORY
WHERE H_NO = P_H_NO AND M_ID = P_M_ID;

--예외처리
EXCEPTION
WHEN NO_DATA_FOUND THEN
Null;

--TB_HISTORY에 습관 추가
IF E_NO = 0 THEN
    INSERT INTO TB_HISTORY VALUES(
       	S_HIS_NO.NEXTVAL,
        P_HIS_SUBCATEGORY,
        P_HIS_STARTDATE,
    	P_HIS_END_DATE,
    	P_HIS_PERCENT,
       	P_C_CODE,
        P_M_ID,
    	P_H_NO
    ); 
END IF;

END;
/

CREATE OR REPLACE PROCEDURE P_INSERT_TITLE (
    P_M_ID          TB_MEMBER.M_ID%TYPE
) IS
    MT_CNT          NUMBER;
    HIS_CNT         NUMBER;
BEGIN

-- 프로습관러 타이틀
--  하나의 습관 3회 성공(60퍼 이상이면 성공)
    SELECT COUNT(*)
    INTO HIS_CNT
    FROM TB_HISTORY
    WHERE M_ID = P_M_ID AND HIS_PERCENT >= 60;

    IF HIS_CNT > 2
    THEN
        SELECT COUNT(*)
        INTO MT_CNT
        FROM TB_M_TITLE
        WHERE M_ID = P_M_ID AND T_CODE = 4;
        
        IF MT_CNT = 0
        THEN
            INSERT INTO TB_M_TITLE
            VALUES(P_M_ID,4);
        END IF;
    END IF;
    
-- 습관계인싸 타이틀
-- 습관 3개 50% 달성
    SELECT COUNT(*)
    INTO HIS_CNT
    FROM TB_HISTORY
    WHERE M_ID = P_M_ID AND HIS_PERCENT >= 50;

    IF HIS_CNT > 2
    THEN
        SELECT COUNT(*)
        INTO MT_CNT
        FROM TB_M_TITLE
        WHERE M_ID = P_M_ID AND T_CODE = 5;
        
        IF MT_CNT = 0
        THEN
            INSERT INTO TB_M_TITLE
            VALUES(P_M_ID,5);
        END IF;
    END IF;

-- 하얗게 불태운 타이틀
-- 하나의 운동 습관 100% 달성
    SELECT COUNT(*)
    INTO HIS_CNT
    FROM TB_HISTORY
    WHERE M_ID = P_M_ID AND HIS_PERCENT >= 100
    AND C_CODE = 4;

    IF HIS_CNT > 0
    THEN
        SELECT COUNT(*)
        INTO MT_CNT
        FROM TB_M_TITLE
        WHERE M_ID = P_M_ID AND T_CODE = 11;
        
        IF MT_CNT = 0
        THEN
            INSERT INTO TB_M_TITLE
            VALUES(P_M_ID,11);
        END IF;
    END IF;

-- 운동은 나의삶 타이틀
--  하나의 운동 습관 50% 달성
    SELECT COUNT(*)
    INTO HIS_CNT
    FROM TB_HISTORY
    WHERE M_ID = P_M_ID AND HIS_PERCENT >= 50
    AND C_CODE = 4;

    IF HIS_CNT > 0
    THEN
        SELECT COUNT(*)
        INTO MT_CNT
        FROM TB_M_TITLE
        WHERE M_ID = P_M_ID AND T_CODE = 11;
        
        IF MT_CNT = 0
        THEN
            INSERT INTO TB_M_TITLE
            VALUES(P_M_ID,11);
        END IF;
    END IF;
    
-- 비흡연자 타이틀
--  하나의 금연 1개 습관 100% 달성
    SELECT COUNT(*)
    INTO HIS_CNT
    FROM TB_HISTORY
    WHERE M_ID = P_M_ID  AND HIS_PERCENT >= 100
    AND C_CODE = 1;

    IF HIS_CNT > 0
    THEN
        SELECT COUNT(*)
        INTO MT_CNT
        FROM TB_M_TITLE
        WHERE M_ID = P_M_ID AND T_CODE = 16;
        
        IF MT_CNT = 0
        THEN
            INSERT INTO TB_M_TITLE
            VALUES(P_M_ID,16);
        END IF;
    END IF;
    
-- 활짝 웃는 폐 타이틀
-- 하나의 금연 1개 습관 50% 달성
    SELECT COUNT(*)
    INTO HIS_CNT
    FROM TB_HISTORY
    WHERE M_ID = P_M_ID  AND HIS_PERCENT >= 50
    AND C_CODE = 1;

    IF HIS_CNT > 0
    THEN
        SELECT COUNT(*)
        INTO MT_CNT
        FROM TB_M_TITLE
        WHERE M_ID = P_M_ID AND T_CODE = 15;
        
        IF MT_CNT = 0
        THEN
            INSERT INTO TB_M_TITLE
            VALUES(P_M_ID,15);
        END IF;
    END IF;

-- 활짝 웃는 폐 타이틀
-- 하나의 금연 습관 누적 3회 성공
    SELECT COUNT(*)
    INTO HIS_CNT
    FROM TB_HISTORY
    WHERE M_ID = P_M_ID AND HIS_PERCENT >= 60
    AND C_CODE = 1;

    IF HIS_CNT > 2
    THEN
        SELECT COUNT(*)
        INTO MT_CNT
        FROM TB_M_TITLE
        WHERE M_ID = P_M_ID AND T_CODE = 14;
        
        IF MT_CNT = 0
        THEN
            INSERT INTO TB_M_TITLE
            VALUES(P_M_ID,14);
        END IF;
    END IF;
    
-- 독서왕 타이틀
-- 하나의 독서 습관 100% 달성
    SELECT COUNT(*)
    INTO HIS_CNT
    FROM TB_HISTORY
    WHERE M_ID = P_M_ID AND HIS_PERCENT >= 100
    AND C_CODE = 3;

    IF HIS_CNT > 0
    THEN
        SELECT COUNT(*)
        INTO MT_CNT
        FROM TB_M_TITLE
        WHERE M_ID = P_M_ID AND T_CODE = 20;
        
        IF MT_CNT = 0
        THEN
            INSERT INTO TB_M_TITLE
            VALUES(P_M_ID,20);
        END IF;
    END IF;
    
-- 독서프로 타이틀
-- 하나의 독서 습관 50% 달성
    SELECT COUNT(*)
    INTO HIS_CNT
    FROM TB_HISTORY
    WHERE M_ID = P_M_ID AND HIS_PERCENT >= 50
    AND C_CODE = 3;

    IF HIS_CNT > 0
    THEN
        SELECT COUNT(*)
        INTO MT_CNT
        FROM TB_M_TITLE
        WHERE M_ID = P_M_ID AND T_CODE = 19;
        
        IF MT_CNT = 0
        THEN
            INSERT INTO TB_M_TITLE
            VALUES(P_M_ID,19);
        END IF;
    END IF;
    
-- 독서습관러 타이틀
-- 하나의 독서 습관 누적 3회 성공
    SELECT COUNT(*)
    INTO HIS_CNT
    FROM TB_HISTORY
    WHERE M_ID = P_M_ID AND HIS_PERCENT >= 60
    AND C_CODE = 3;

    IF HIS_CNT > 2
    THEN
        SELECT COUNT(*)
        INTO MT_CNT
        FROM TB_M_TITLE
        WHERE M_ID = P_M_ID AND T_CODE = 18;
        
        IF MT_CNT = 0
        THEN
            INSERT INTO TB_M_TITLE
            VALUES(P_M_ID,18);
        END IF;
    END IF;
    
-- 상쾌한 아침 타이틀
-- 하나의 금주 습관 100% 달성
    SELECT COUNT(*)
    INTO HIS_CNT
    FROM TB_HISTORY
    WHERE M_ID = P_M_ID AND HIS_PERCENT >= 100
    AND C_CODE = 2;

    IF HIS_CNT > 0
    THEN
        SELECT COUNT(*)
        INTO MT_CNT
        FROM TB_M_TITLE
        WHERE M_ID = P_M_ID AND T_CODE = 24;
        
        IF MT_CNT = 0
        THEN
            INSERT INTO TB_M_TITLE
            VALUES(P_M_ID,24);
        END IF;
    END IF;
    
-- 프로금주러 타이틀
-- 하나의 금주 습관 50% 달성
    SELECT COUNT(*)
    INTO HIS_CNT
    FROM TB_HISTORY
    WHERE M_ID = P_M_ID AND HIS_PERCENT >= 50
    AND C_CODE = 2;

    IF HIS_CNT > 0
    THEN
        SELECT COUNT(*)
        INTO MT_CNT
        FROM TB_M_TITLE
        WHERE M_ID = P_M_ID AND T_CODE = 23;
        
        IF MT_CNT = 0
        THEN
            INSERT INTO TB_M_TITLE
            VALUES(P_M_ID,23);
        END IF;
    END IF;
    
-- 힘들수록 금주! 타이틀
-- 하나의 금주 습관 누적 3회 성공
    SELECT COUNT(*)
    INTO HIS_CNT
    FROM TB_HISTORY
    WHERE M_ID = P_M_ID AND HIS_PERCENT >= 60
    AND C_CODE = 2;

    IF HIS_CNT > 2
    THEN
        SELECT COUNT(*)
        INTO MT_CNT
        FROM TB_M_TITLE
        WHERE M_ID = P_M_ID AND T_CODE = 22;
        
        IF MT_CNT = 0
        THEN
            INSERT INTO TB_M_TITLE
            VALUES(P_M_ID,22);
        END IF;
    END IF;
END;
/
--exec P_INSERT_TITLE('smkim');

--HABIT CHECK 프로시저
CREATE OR REPLACE PROCEDURE P_INSERT_HABIT_CHECK (
    P_M_ID              TB_MEMBER.M_ID%TYPE,
    P_H_NO              TB_HABIT.H_NO%TYPE
) IS
    TODAY_CNT   NUMBER;
BEGIN
-- 습관 체크에 오늘날짜에 관한 게 없을 경우 추가
    SELECT COUNT(*)
    INTO TODAY_CNT
    FROM TB_HABIT_CHECK
    WHERE M_ID = P_M_ID
    AND H_NO = P_H_NO AND TO_CHAR(H_CHECK_DATE, 'YYYY/MM/DD') = TO_CHAR(sysdate, 'YYYY/MM/DD');

    IF TODAY_CNT = 0
    THEN
        INSERT INTO TB_HABIT_CHECK VALUES(
        S_H_CHECK_NO.nextval,
        'n',
        sysdate,
        P_M_ID,
        P_H_NO); 
    END IF;
END;
/

--exec P_INSERT_HABIT_CHECK('smkim',1);