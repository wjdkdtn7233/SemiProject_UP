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
START WITH 1
MAXVALUE 99999
--MINVALUE ~ 감소하는 값이있을경우 설정
--[CYCLE | NOCYCLE] -- 값 순환 여부 지정
NOCYCLE -- 값이 순환하지 않는다.
--[CACHE 바이트 크기 | NOCACHE]
NOCACHE;

CREATE SEQUENCE S_C_STATE_NO INCREMENT BY 1 START WITH 1 MAXVALUE 99999 NOCYCLE NOCACHE;
CREATE SEQUENCE S_H_NO INCREMENT BY 1 START WITH 1 MAXVALUE 99999 NOCYCLE NOCACHE;
CREATE SEQUENCE S_H_CHECK_NO INCREMENT BY 1 START WITH 1 MAXVALUE 99999 NOCYCLE NOCACHE;
CREATE SEQUENCE S_HIS_NO INCREMENT BY 1 START WITH 1 MAXVALUE 99999 NOCYCLE NOCACHE;
CREATE SEQUENCE S_P_CODE INCREMENT BY 1 START WITH 1 MAXVALUE 99999 NOCYCLE NOCACHE;
CREATE SEQUENCE S_T_CODE INCREMENT BY 1 START WITH 1 MAXVALUE 99999 NOCYCLE NOCACHE;
CREATE SEQUENCE S_W_CODE INCREMENT BY 1 START WITH 1 MAXVALUE 99999 NOCYCLE NOCACHE;

--데이터 삽입/삭제
--타이틀 삭제
DELETE FROM TB_TITLE;
COMMIT;

--타이틀 삽입
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '습관뉴비', '습관의 첫 단계!', '습관 등록 1회 성공', '#FAE0D4','https://postfiles.pstatic.net/MjAyMDA1MDlfODcg/MDAxNTg4OTU4NDAyMTIx.rCZ_Ulim0rl97piAYxidol4a5Ntqr7vTXRzb9vgT89Ig.CHwgXgNHw7LZnr2lA5eK3bsdTJL6ytuKge90SizLWYYg.JPEG.yeooow/1%EC%8A%B5%EA%B4%80%EB%89%B4%EB%B9%84.jpeg?type=w773');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '뉴비탈출', '습관 바꾸기의 시작은 이제부터!', '습관 1회 성공', '#FFC19E','https://postfiles.pstatic.net/MjAyMDA1MDlfMjQg/MDAxNTg4OTU4NDAyMTIy.-IwTkCGyVhqwoQt2AyCvXapgM7ONgadQ0x2ronBY2VQg.V_K0VBmv7JaPrX6G-8XFOe6CyZmzQhhcq-PhQo8IXGgg.JPEG.yeooow/2%EB%89%B4%EB%B9%84%ED%83%88%EC%B6%9C.jpeg?type=w773');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '시작이 반', '감 잡았어!', '습관 등록 3회 성공', '#F29661','https://postfiles.pstatic.net/MjAyMDA1MDlfMTI2/MDAxNTg4OTU4NDAyMTIy.q4_6hqqgMHuGKtpL87qrLUjV6jA3zSyA1W3XSESlDywg.3jSmncT93CdALgfzAv9IiwZf2hNfxbRz1jkEZWNaTEkg.JPEG.yeooow/3%EC%8B%9C%EC%9E%91%EC%9D%B4%EB%B0%98.jpeg?type=w773');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '프로습관러', '바뀔 나의 모습을 상상해봐', '하나의 습관 3회 성공', '#FF5E00','https://postfiles.pstatic.net/MjAyMDA1MDlfNjIg/MDAxNTg4OTU4NDAyMTIy.VkNGyMxuwaRf_bVVMOZuuemWojfrvVB6Pdo95W1Hl6sg.1mKKPzC9qnaLkP1b7S_i3C44JxnJMD7P5JwHufou6EEg.JPEG.yeooow/4%ED%94%84%EB%A1%9C%EC%8A%B5%EA%B4%80%EB%9F%AC.jpeg?type=w773');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '습관계의 인싸', '포기하지 않는 당신에게 cheers!', '습관 3개 50% 달성', '#FFBB00','https://postfiles.pstatic.net/MjAyMDA1MDlfMTIx/MDAxNTg4OTU4NDAyMTIz.fvv4FVUrrTTbC3Pd0hDn1hTihGWriQkCLA3EzXKroJcg.vGpYr6rpHkV1BxHRUelruz-C-Fj6I68JmFXcwLx-ggwg.JPEG.yeooow/5%EC%8A%B5%EA%B4%80%EA%B3%84%EC%9D%98%EC%9D%B8%EC%8B%B8.jpeg?type=w773');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '연쇄건망증', '아직 괜찮아요!', '하나의 습관 누적 3회 실패', '#FF33FF','https://postfiles.pstatic.net/MjAyMDA1MDlfMjQy/MDAxNTg4OTU4NDAyMTIz.sPIUzwEl1h8XCoFJSjHpHG82odLPW0BhXfwPebsS4IMg.9pt-xO7PqKVP6Fd_hnS5gLEfx_Wfj8O832bjrx2rBA0g.JPEG.yeooow/6%EC%97%B0%EC%87%84%EA%B1%B4%EB%A7%9D%EC%A6%9D.jpeg?type=w773');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '작심삼일의 대가', '당신이 바로 전설의 작심삼일러..?', '하나의 습관 누적 3회 성공 후 다음 회 실패', '#FF00FF','https://postfiles.pstatic.net/MjAyMDA1MDlfMjM5/MDAxNTg4OTU4NDAyMzM5.tofpZY1qyVaKzZDMw7aKlntAyC_3JadsGKXlHpiWkFcg.g654TvIYod_5BAOq3adgxClFymZuzmOdk6K33tJQ240g.JPEG.yeooow/7%EC%9E%91%EC%8B%AC%EC%82%BC%EC%9D%BC%EC%9D%98%EB%8C%80%EA%B0%80.jpeg?type=w773');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '언제나 내일의 나에게 맡기는', '꾸준한 이용... 부탁드립니다.', '하나의 습관 첫 등록 후 다음 회 실패', '#CC00CC','https://postfiles.pstatic.net/MjAyMDA1MDlfNSAg/MDAxNTg4OTU4NDAyMzg0.oPaZa9EAhLNjoJob2yA4YCg-3A4iX_4z3nHWzhEKVOYg._HizzRoxv1-sF0yDJoIP6UaPv49aFsC85lDmKNOOHQ0g.JPEG.yeooow/8%EC%96%B8%EC%A0%9C%EB%82%98%EB%82%B4%EC%9D%BC%EC%9D%98%EB%82%98%EC%97%90%EA%B2%8C%EB%A7%A1%EA%B8%B0%EB%8A%94.jpeg?type=w773');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '저도 운동 좋아하는데요', '자 이제 시작이야!!', '운동 습관 등록 1회 성공', '#E4F7BA','https://postfiles.pstatic.net/MjAyMDA1MDlfOSAg/MDAxNTg4OTU4NDAyMzg3.ITnW0jeFwvFe0aVvHXzm_xfDUTMuL60CzV4A5lKLTXkg.XC8bJMuV0UwQE0B1uUDHSVgn8nz55JO5kvd38P4JJJcg.JPEG.yeooow/9%EC%A0%80%EB%8F%84%EC%9A%B4%EB%8F%99%EC%A2%8B%EC%95%84%ED%95%98%EB%8A%94%EB%8D%B0%EC%9A%94.jpeg?type=w773');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '내일의 몸짱', '내일이 기대되는 당신!', '운동 습관 1회 성공', '#CEF279','https://postfiles.pstatic.net/MjAyMDA1MDlfMjIx/MDAxNTg4OTU4NDAyMzg3.GEe5-u1870QnvYukjGz1mQc55D2-zks5HF7Xgb9s-44g.ANN6HUYtkpa_q0Pz2flK4p3V-zk85H7aUP1jixLSAIwg.JPEG.yeooow/10%EB%82%B4%EC%9D%BC%EC%9D%98%EB%AA%B8%EC%A7%B1.jpeg?type=w773');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '운동은 나의 삶', '내가 운동이고, 운동이 곧 나다.', '하나의 운동 습관 50% 달성', '#BCE55C','https://postfiles.pstatic.net/MjAyMDA1MDlfMTAx/MDAxNTg4OTU4NDAyMzk1.5be6ZQtVebvOVhWpm7zGPJsvKeYnvdQUxkSwPWlhdB8g.T7Md3-J5lOL8IVK9mJcw3WKbqe_eQAJ0cVIkEiXE5gYg.JPEG.yeooow/11%EC%9A%B4%EB%8F%99%EC%9D%80%EB%82%98%EC%9D%98%EC%82%B6.jpeg?type=w773');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '하얗게 불태운', '국가대표급 운동량!', '하나의 운동 습관 100% 달성', '#1DDB16','https://postfiles.pstatic.net/MjAyMDA1MDlfMjY2/MDAxNTg4OTU4NDAyNDEz.1PNs5HsQK2NOpCeCtVewcaS77j2IdTn5wWd8_fyEJB0g.WBuMrezydAkWQctVqDkxoNSJ4_Axp9u-a8x8iUFGo90g.JPEG.yeooow/12%ED%95%98%EC%96%97%EA%B2%8C%EB%B6%88%ED%83%9C%EC%9A%B4.jpeg?type=w773');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '금연뉴비', '어서와 금연은 처음이지?', '금연 습관 등록 1회 성공', '#D9E5FF','https://postfiles.pstatic.net/MjAyMDA1MDlfMjYw/MDAxNTg4OTU4NDAyNTcw.TQEqniH08Nf2-ClNiCVZkIY23tBXDsCwpOh2uhvcuosg.Z6Verib9oIkUJd3DSduF7YQGHe2b4IZunktnBvcdqxQg.JPEG.yeooow/13%EA%B8%88%EC%97%B0%EB%89%B4%EB%B9%84.jpeg?type=w773');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '니코틴과의 이별', '건강의 청신호', '하나의 금연 습관 누적 3회 성공', '#B2CCFF','https://postfiles.pstatic.net/MjAyMDA1MDlfMTU4/MDAxNTg4OTU4NDAyNjA4.1dWZyATcGSpW-2RrCqSbOb9rH6ynjhFULX7e5BlWSisg.obVJzL7EBQVBnXENeMWoSVDjRZu4YwVntfKKpSRmTHQg.JPEG.yeooow/14%EB%8B%88%EC%BD%94%ED%8B%B4%EA%B3%BC%EC%9D%98%EC%9D%B4%EB%B3%84.jpeg?type=w773');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '활짝 웃는 폐', '담배와의 악연은 여기까지!', '하나의 금연 1개 습관 50% 달성', '#6799FF','https://postfiles.pstatic.net/MjAyMDA1MDlfMTY4/MDAxNTg4OTU4NDAyNjUx.zPQUrQqffde8K5KfcKbUvXzrwzByWzx3EPjMSmOigmog.nlU7u4ffSxwoGcDDb1sky5VpRIyKL1a8_hSAZyw-h-gg.JPEG.yeooow/15%ED%99%9C%EC%A7%9D%EC%9B%83%EB%8A%94%ED%8F%90.jpeg?type=w773');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '비흡연자', '드디어 비흡연자에 합류성공!', '하나의 금연 1개 습관 100% 달성', '#0100FF','https://postfiles.pstatic.net/MjAyMDA1MDlfMTMw/MDAxNTg4OTU4NDAyNjU5.Sqw1bOVMtoPBB_EBgaObbtwOK9CO8SAh75ouYTx3PNog.Mf2-HlGHozGea-spXDdJpVe3Ib1jGXGkPePUDBtSFQUg.JPEG.yeooow/16%EB%B9%84%ED%9D%A1%EC%97%B0%EC%9E%90.jpeg?type=w773');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '첫 페이지', '독서습관 들이기 첫 번째 행동!', '독서 습관 등록 1회 성공', '#FFD9EC','https://postfiles.pstatic.net/MjAyMDA1MDlfNDkg/MDAxNTg4OTU4NDAyNjYw.ZVgKqaf630zit3rLZw2c_QWqFru0vd4VrRZxRsk_Nv8g.tb0dnO6Qo8jjKi5aWWvaFLiRKLZR_roqexeu3-sbQAcg.JPEG.yeooow/17%EC%B2%AB%ED%8E%98%EC%9D%B4%EC%A7%80.jpeg?type=w773');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '독서습관러', '매일 책을 생각하는 자세 아주 좋아!', '하나의 독서 습관 누적 3회 성공', '#FFB2D9','https://postfiles.pstatic.net/MjAyMDA1MDlfMTQy/MDAxNTg4OTU4NDAyNjg3.PrRXc8lBIId0b-Xvyfr0T74cry3xpCyIZbm3MsoLwyQg.Lu1dOl1YEr6z9Y5zojbapljL_0i_X6t6AzBzyX5Sng8g.JPEG.yeooow/18%EB%8F%85%EC%84%9C%EC%8A%B5%EA%B4%80%EB%9F%AC.jpeg?type=w773');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '독서프로', '당신의 독서하는 모습 반할 것 같아..', '하나의 독서 습관 50% 달성', '#F361A6','https://postfiles.pstatic.net/MjAyMDA1MDlfMjM4/MDAxNTg4OTU4NDAyODE0.Nn_eR19WEy5_Gd4-JMRLn5VPiyJBjZ3Z0lB3SIvKILcg.qvz9Y5kIvtSkh6ddlBAyakWP2ufpJSoSY1Lwtjd6KAgg.JPEG.yeooow/19%EB%8F%85%EC%84%9C%ED%94%84%EB%A1%9C.jpeg?type=w773');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '독서왕', '평생습관이 되어버린 독서생활', '하나의 독서 습관 100% 달성', '#FF007F','https://postfiles.pstatic.net/MjAyMDA1MDlfMjY5/MDAxNTg4OTU4NDAyODQ5.uHWkJSTa7Zo3T4mXLehAdY5daKLPOTTu4Giw1LhBH_Eg.89QktIUcgNa9VIJTB19wH10q253WtADiCQRPI2--NA0g.JPEG.yeooow/20%EB%8F%85%EC%84%9C%EC%99%95.jpeg?type=w773');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '볼빨간 금주 뉴비', '안녕? 금주 오늘이 처음이지?', '금주 습관 등록 1회 성공', '#FAF4C0','https://postfiles.pstatic.net/MjAyMDA1MDlfMjU1/MDAxNTg4OTU4NDAyODcy.uiuiCDIy8n9jJyLGHimCQ83QMwoeixHoBC3oU6qN4Zcg.59AKqoHqH_O1FBiYow2Grq3-7-SJXhPTP11pSOKSZbIg.JPEG.yeooow/21%EB%B3%BC%EB%B9%A8%EA%B0%84%EA%B8%88%EC%A3%BC%EB%89%B4%EB%B9%84.jpeg?type=w773');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '힘들수록 금주!', '어때 술 생각 좀 나?', '하나의 금주 습관 누적 3회 성공', '#FAED7D','https://postfiles.pstatic.net/MjAyMDA1MDlfMjc0/MDAxNTg4OTU4NDAyODg1.X8H1wRnJlIa6DZifYpBz7yPtL8rxxqsTzPg7GD2YF3Ig.xk_-i8jV5tWFlocaopo7vO8CUZpJCRnuTXnrmtOQkAMg.JPEG.yeooow/22%ED%9E%98%EB%93%A4%EC%88%98%EB%A1%9D%EA%B8%88%EC%A3%BC.jpeg?type=w773');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '프로금주러', '더 이상 간 때문이 아니야!', '하나의 금주 습관 50% 달성', '#E5D85C','https://postfiles.pstatic.net/MjAyMDA1MDlfMjA2/MDAxNTg4OTU4NDAyOTA4.ypvxH039oMUXScYAT0VYPSpVLbH8jsYWo_VjvAwcqBwg.eVt6NLBXz43XWSq0ZkwO_vjhkkBDQCKuJRRl38_iBJUg.JPEG.yeooow/23%ED%94%84%EB%A1%9C%EA%B8%88%EC%A3%BC%EB%9F%AC.jpeg?type=w773');
INSERT INTO TB_TITLE VALUES (S_T_CODE.nextval, '상쾌한 아침', '항상 피로했던 당신의 아침은??', '하나의 금주 습관 100% 달성', '#FFE400','https://postfiles.pstatic.net/MjAyMDA1MDlfNSAg/MDAxNTg4OTU4NDAyOTQ2.AF4ebXKiUw2_HIKC7NNYrdkYYK7VhD2DsTzcNr9yq5Qg.pkudx-0e8LXrtGdPFHRObJ5_LEd4ZHWlFM45IWLSWkwg.JPEG.yeooow/24%EC%83%81%EC%BE%8C%ED%95%9C%EC%95%84%EC%B9%A8.jpeg?type=w773');

COMMIT;

-- 명언 삭제 
DELETE FROM TB_WISE;

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

--카테고리 삭제
DELETE FROM TB_CATEGORY;
COMMIT;

--카테고리 삽입
INSERT INTO TB_CATEGORY VALUES (S_C_CODE.nextval, '금연');
INSERT INTO TB_CATEGORY VALUES (S_C_CODE.nextval, '금주');
INSERT INTO TB_CATEGORY VALUES (S_C_CODE.nextval, '독서');
INSERT INTO TB_CATEGORY VALUES (S_C_CODE.nextval, '운동');
COMMIT;

-- 멤버 삭제 
DELETE FROM TB_MEMBER;

COMMIT;
-- 멤버 생성

INSERT INTO TB_MEMBER VALUES('smkim','qwer1234!','김성민','smina2005@naver.com','성민1',0,0,sysdate,'N','unnamed.jpg','unnamed.jpg');
COMMIT;

insert into tb_m_title values ('smkim',1);
insert into tb_m_title values ('smkim',2);
insert into tb_m_title values ('smkim',3);
insert into tb_m_title values ('smkim',4);
insert into tb_m_title values ('smkim',5);
insert into tb_m_title values ('smkim',6);
commit;