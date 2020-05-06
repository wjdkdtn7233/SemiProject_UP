DROP PROCEDURE P_INSERT_HABIT;
DROP PROCEDURE P_UPDATE_HABIT;

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
         
END;
/
--P_INSERT_HABIT 프로시저 테스트
--EXEC P_INSERT_HABIT(S_H_NO.NEXTVAL,'서브카테고리',SYSDATE,SYSDATE+30,'월화수',3000,0,1,'smkim');

-- 습관 업데이트 프로시저
CREATE OR REPLACE PROCEDURE P_UPDATE_C_H (
    P_C_STATE_NO        TB_CURRENT_STATE.C_STATE_NO%TYPE
) IS
    FIRST_CNT           NUMBER;
    MIDLE_CNT           NUMBER;
    MIDLE_CNT_MINUS     NUMBER;
    P_H_NO              TB_HABIT.H_NO%TYPE;
    P_M_ID              TB_MEMBER.M_ID%TYPE;
    
    
BEGIN
-- P_H_NO 매칭
    SELECT H_NO
    INTO P_H_NO
    FROM TB_CURRENT_STATE
    WHERE C_STATE_NO = P_C_STATE_NO;

-- P_H_NO 매칭
    SELECT M_ID
    INTO P_M_ID
    FROM TB_CURRENT_STATE
    WHERE C_STATE_NO = P_C_STATE_NO;
    
    
-- TB_CURRENT_STATE 최신화
 
         
END;
/