--sequence drop
DROP SEQUENCE S_C_CODE;         -- 카테고리시퀀스
DROP SEQUENCE S_C_STATE_NO;     -- 습관 현황 시퀀스
DROP SEQUENCE S_H_NO;           -- 습관 시퀀스
DROP SEQUENCE S_H_CHECK_NO;     -- 습관 체크 시퀀스
DROP SEQUENCE S_HIS_NO;         -- 히스토리 시퀀스
DROP SEQUENCE S_P_CODE;         -- 팝업 시퀀스
DROP SEQUENCE S_T_CODE;         -- 타이틀 시퀀스
DROP SEQUENCE S_W_CODE;         -- 명언 시퀀스

--sequence
CREATE SEQUENCE S_C_CODE
INCREMENT BY 1 -- 다음 값에 대한 증가치, 생략하면 기본 1;
START WITH 10000
MAXVALUE 99999
--MINVALUE ~ 감소하는 값이있을경우 설정
--[CYCLE | NOCYCLE] -- 값 순환 여부 지정
NOCYCLE -- 값이 순환하지 않는다.
--[CACHE 바이트 크기 | NOCACHE]
NOCACHE;

CREATE SEQUENCE S_C_STATE_NO INCREMENT BY 1 START WITH 10000 MAXVALUE 99999 NOCYCLE NOCACHE;
CREATE SEQUENCE S_H_NO INCREMENT BY 1 START WITH 10000 MAXVALUE 99999 NOCYCLE NOCACHE;
CREATE SEQUENCE S_H_CHECK_NO INCREMENT BY 1 START WITH 10000 MAXVALUE 99999 NOCYCLE NOCACHE;
CREATE SEQUENCE S_HIS_NO INCREMENT BY 1 START WITH 10000 MAXVALUE 99999 NOCYCLE NOCACHE;
CREATE SEQUENCE S_P_CODE INCREMENT BY 1 START WITH 10000 MAXVALUE 99999 NOCYCLE NOCACHE;
CREATE SEQUENCE S_T_CODE INCREMENT BY 1 START WITH 10000 MAXVALUE 99999 NOCYCLE NOCACHE;
CREATE SEQUENCE S_W_CODE INCREMENT BY 1 START WITH 10000 MAXVALUE 99999 NOCYCLE NOCACHE;

--데이터 삽입/삭제
--타이틀 삭제
DELETE FROM TB_TITLE; --명언
COMMIT;

--타이틀 삽입
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '습관뉴비', '습관의 첫 단계!', '습관 등록 1회 성공', '#FFFF00');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '뉴비탈출', '습관 바꾸기의 시작은 이제부터!', '습관 1회 성공', '#FF0000');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '시작이 반', '감 잡았어!', '습관 등록 3회 성공', '#FFFF33');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '프로습관러', '바뀔 나의 모습을 상상해봐', '하나의 습관 3회 성공', '#FF8000');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '습관계의 인싸', '포기하지 않는 당신에게 cheers!', '습관 3개 50% 달성', '#FF9933');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '연쇄건망증', '아직 괜찮아요!', '하나의 습관 누적 3회 실패', '#FF33FF');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '작심삼일의 대가', '당신이 바로 전설의 작심삼일러..?', '하나의 습관 누적 3회 성공 후 다음 회 실패', '#FF00FF');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '언제나 내일의 나에게 맡기는', '꾸준한 이용... 부탁드립니다.', '하나의 습관 첫 등록 후 다음 회 실패', '#CC00CC');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '저도 운동 좋아하는데요', '자 이제 시작이야!!', '운동 습관 등록 1회 성공', '#006600');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '내일의 몸짱', '내일이 기대되는 당신!', '운동 습관 1회 성공', '#00CC00');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '운동은 나의 삶', '내가 운동이고, 운동이 곧 나다.', '하나의 운동 습관 50% 달성', '#00FF00');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '하얗게 불태운', '국가대표급 운동량!', '하나의 운동 습관 100% 달성', '#33FF33');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '금연뉴비', '어서와 금연은 처음이지?', '금연 습관 등록 1회 성공', '#00994C');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '니코틴과의 이별', '건강의 청신호', '하나의 금연 습관 누적 3회 성공', '#00CC66');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '활짝 웃는 폐', '담배와의 악연은 여기까지!', '하나의 금연 1개 습관 50% 달성', '#00FF80');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '비흡연자', '드디어 비흡연자에 합류성공!', '하나의 금연 1개 습관 100% 달성', '#33FF99');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '첫 페이지', '독서습관 들이기 첫 번째 행동!', '독서 습관 등록 1회 성공', '#009999');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '독서습관러', '매일 책을 생각하는 자세 아주 좋아!', '하나의 독서 습관 누적 3회 성공', '#00CCCC');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '독서프로', '당신의 독서하는 모습 반할 것 같아..', '하나의 독서 습관 50% 달성', '#00FFFF');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '독서왕', '평생습관이 되어버린 독서생활', '하나의 독서 습관 100% 달성', '#33FFFF');

COMMIT;

-- 명언 삭제 
DELETE FROM TB_WISE; --명언

COMMIT;

--명언 삽입
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '출발하게 만드는 힘이 "동기"라면 계속 나아가게 만드는 힘은 "습관"이다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '습관이란 인간으로 하여금 어떤 일이든지 하게 만든다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '사람이 습관을 만들지만 나중엔 습관이 사람을 만든다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '습관은 제2의 천성으로 제1의 천성을 파괴한다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '성공은 능력과 노력이 아니라 좋은 습관에서 태어난다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '오늘 시작하지 않은 것은 절대 내일 끝낼 수 없다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '습관은 습관으로 극복할 수 있다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '사람은 누구나 자기가 할 수 있다고 생각하는 것 이상의 것을 할 수 있습니다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '일찍 책장을 덮지 말라. 삶의 다음 페이지에서 또 다른 멋진 나를 발견 할 테니');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '당신의 운명이 결정되는 것은 결심하는 그 순간이다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '할 수가 없었기 때문에 포기한 것이 아니라, 포기했기 때문에 할 수 없었던 것이다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '많은 인생의 실패자들은 포기할 때 자신이 성공에서 얼마나 가까이 있었는지 모른다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '실패가 끝이 아니고 포기하는 것이 끝인 것이다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '위대한 것으로 향하기 위해 좋은 것을 포기하는 걸 두려워하지 마라.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '고통은 잠깐이다. 포기는 영원히 남는다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '포기하는 것은 선택이지 운명이 아니다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '재산을 잃은 것은 적게 잃은 것이다. 하지만 용기를 잃는 것은 전부를 잃은 것이다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '멈추지 않는 이상, 얼마나 천천히 가는지는 문제가 되지 않는다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '실패하는 사람들의 90%는 정말로 패배하는 것이 아니라 포기하는 것이다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '계획이 따르지 않는 목적은 단지 "희망사항" 일 뿐이다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '행복의 비밀은 포기해야 할 것을 포기하는 것이다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '한번 포기하는 것을 배우고 나면 그것은 습관이 된다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '오늘 어렵다고 미룬 일은 내일에도 어렵고 모레에도 어렵다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '세상은 고통으로 가득하지만, 한편 그것을 극복하는 일로도 가득 차 있다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '희망이 없는 일은 헛수고이고, 목적 없는 희망은 지속할 수 없다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '아무리 아름다운 책도 읽지 않으면 아무 쓸모가 없다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '오늘 할 수 있는 일에만 전력을 쏟으라.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '시간은 우리를 변화시키지 않는다. 시간은 단지 우리를 펼쳐 보일 뿐이다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '행동은 모든 성공의 기본 열쇠이다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '인생의 위대한 목표는 지식이 아니라 행동이다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '말하자마자 행동하는 사람, 그것이 가치 있는 사람이다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '미친 짓이란, 매번 똑같은 행동을 반복하면서 다른 결과를 기대하는 것이다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '어려워서 시작하지 않는 것이 아니라, 시작을 안 하기 때문에 어려운 것이다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '습관은 삶의 훌륭한 안내자다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '불행히도 좋은 습관은 나쁜 습관보다 포기하기 쉽다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '네가 집착하는 것 외에 평생 너를 따라다니는 습관은 없다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '생활은 습관이 짜낸 천에 불과하다.');
INSERT INTO TB_WISE VALUES (S_W_CODE.nextval, '습관은 버리기는 쉽지만 다시 들이기는 어렵다.');

COMMIT;

-- 멤버 삭제 
DELETE FROM TB_MEMBER; --명언

COMMIT;
-- 멤버 생성

INSERT INTO TB_MEMBER VALUES('smkim','qwer1234!','김성민','smina2005@naver.com','성민',0,0,sysdate,'N','unnamed.jpg','unnamed.jpg');
COMMIT;