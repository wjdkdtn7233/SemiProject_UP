<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>popup plugIn</title>
    <!-- 팝업 css 경로와 달력 css 경로 -->
    <link rel="stylesheet" href="/up/resources/vendor/sweetalert2/sweetalert2.min.css" />
    <link rel="stylesheet" href="/up/resources/vendor/datepicker/datepicker.min.css" />
    <!-- 스타일 지정 -->
    <style>
        .title {
            color: white;
            font-size: 36px;
            text-shadow: 0 1px #000;
        }

        .content {
            color: white;
            font-size: 18px;
            text-shadow: 0 1px #000;
        }

        .datepicker-container {
            font-family: 'Helvetica', '나눔고딕', '맑은고딕'
        }

        input,
        img {
            vertical-align: middle
        }
    </style>
</head>

<body>
    <button id="btn1" type="button">아이디 비밀번호 찾기 팝업</button>
    <button id="btn2" type="button">회원가입 필수 입력 창 공백 팝업</button>
    <button id="btn3" type="button">비밀번호 규칙 팝업</button>
    <button id="btn4" type="button">아이디 중복여부 체크 팝업</button>
    <button id="btn5" type="button">이메일 더블체크 및 인증메일 발송 팝업</button>
    <button id="btn6" type="button">존재하는 이메일 팝업</button>
    <button id="btn7" type="button">존재하지 않는 이메일 팝업</button>
    <button id="btn8" type="button">비밀번호 오류 팝업</button>
    <button id="btn9" type="button">회원탈퇴 동의 체크 오류 팝업</button>
    <button id="btn10" type="button">btn10</button>

    <div>
        <!-- 시작일 -->
        <input type="text" name="startdate" id="datepicker" readonly="">
        <a href="#" id="show-cal"><img src="/up/resources/img/calendar.png" height="20"></a> ~
        <!-- 종료일 -->
        <input type="text" name="enddate" id="datepicker2" readonly="">
        <a href="#" id="show-cal2"><img src="/up/resources/img/calendar.png" height="20"></a>
    </div>

    <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>

    <!-- 날짜와 팝업 js -->
    <script src="/up/resources/vendor/sweetalert2/sweetalert2.all.min.js"></script>
    <script src="/up/resources/vendor/sweetalert2/sweetalert2.all.js"></script>
    <script src="/up/resources/vendor/sweetalert2/sweetalert2.js"></script>
    <script src="/up/resources/vendor/sweetalert2/sweetalert2.min.js"></script>
    <script src="/up/resources/vendor/datepicker/datepicker.min.js"></script>
    <script src="/up/resources/vendor/datepicker/i18n/datepicker.ko-KR.js"></script>

    <script>
        /* 팝업창 스크립트 시작 */

        // a : 팝업창이 화면에 띄워질 위치
        // b : 아이콘 타입
        // c : 띄워줄 문구
        // d : 띄워줄 유지 시간
        // sweetalert2 를 통해 토스트창 띄워주기
        /* 아래에 예시로 만든거 활용하셔서 쓰시면 됩니다.*/
        function toastUP(a, b, c, d) {
            swal({
                toast: true,
                position: a,
                type: b,
                title: c,
                showConfirmButton: false,
                timer: d
            })
        };

        $("#btn1").click(function () {
            // 확인, 취소버튼에 따른 후속 처리 구현
            swal({
                title: '확인', // 제목
                text: "아이디와 비밀번호 중 찾으시려는 것을 선택하세요", // 내용
                type: 'warning', // 종류
                confirmButtonText: 'ID 찾기',
                confirmButtonColor: '#4e73df', // 확인버튼 표시 문구
                showCancelButton: true, // 취소버튼 표시 여부
                cancelButtonText: '비밀번호 찾기',
                cancelButtonColor: '#4e73df', // 취소버튼 표시 문구
            }).then(function (result) { // 버튼이 눌러졌을 경우의 콜백 연결

                // 버튼 클릭시 아이디 및 비밀번호 찾기 기능 가기 추가 *********************************************************
                if (result.value) { // 확인 버튼이 눌러진 경우
                    swal('아이디 찾기', '아이디를 찾으러 갑니다.', 'success');
                } else if (result.dismiss === 'cancel') { // 취소버튼이 눌러진 경우
                    swal('비밀번호 찾기', '비밀번호 찾으러 갑니다.', 'error');
                }
            });
        });

        $("#btn2").click(function () {

            // 필수 입력 란 체크 후 가입내용 확인하라는 팝업창 띄워줌
            swal({
                toast: true,
                position: 'bottom-right',
                type: 'warning',
                title: "필수 입력란이 비어있습니다. \n 기입 내용을 확인해주세요.",
                showConfirmButton: false,
                timer: 1500
            })
        });

        $("#btn3").click(function () {

            // 비밀번호 정규식사용하고 규칙 명시
            swal({
                toast: true,
                position: 'bottom-right',
                type: 'warning',
                title: "비밀번호는 영어, 숫자를 조합하여 \n 6자리 이상 기재해주세요.",
                showConfirmButton: false,
                timer: 1500
            })
        });

        $("#btn4").click(function () {

            // ID 중복 여부 체크 명시
            swal({
                toast: true,
                position: 'bottom-right',
                type: 'warning',
                title: "ID 중복체크를 해주세요!",
                showConfirmButton: false,
                timer: 1500
            })
        });

        $("#btn5").click(function () {

            // 입력받은 이메일 표기 및 체크, 인증메일 발송
            swal({
                title: 'yeooow@naver.com', // 제목
                html: "위 이메일 주소가 정확한지 확인하세요! <br> 이메일 주소가 맞다면, 발송 버튼을 클릭하세요.", // 내용
                type: 'warning', // 종류
                confirmButtonText: '인증 메일 발송',
                confirmButtonColor: '#4e73df', // 확인버튼 표시 문구
                showCancelButton: true, // 취소버튼 표시 여부
                cancelButtonText: '이메일 수정',
                cancelButtonColor: '#4e73df', // 취소버튼 표시 문구
            }).then(function (result) { // 버튼이 눌러졌을 경우의 콜백 연결

                // 버튼 클릭시 아이디 및 비밀번호 찾기 기능 가기 추가 *********************************************************
                if (result.value) { // 확인 버튼이 눌러진 경우
                    swal({
                        title: '인증 메일 발송',
                        html: '인증메일을 보냈습니다. <br/> 이메일을 확인하세요.',
                        type: 'success'
                    });
                } else if (result.dismiss === 'cancel') { // 취소버튼이 눌러진 경우
                    swal('이메일 수정', '이메일을 수정하세요.', 'error');
                }
            });
        });

        $("#btn6").click(function () {

            // 존재하는 이메일이라고 텍스트 띄워줌
            swal({
                title: '',
                html: '존재하는 이메일 입니다. <br/> 해당 이메일로 ID를 발송하시겠습니까?',
                type: 'question'
            }).then(function (result) { // 버튼이 눌러졌을 경우의 콜백 연결
                if (result.value) { // 확인 버튼이 눌러진 경우
                    swal('성공!', '이메일을 확인해주세요.', 'success');
                }
            });
        });

        $("#btn7").click(function () {
            // 옵션 지정하여 메시지 창 표시
            swal({
                title: '', // 제목
                html: '존재하지 않는 이메일 입니다.<br/>메일 주소를 확인해주세요.', // 내용
                type: 'error', // 종류
                showCloseButton: true, // 닫기 버튼 표시 여부
                confirmButtonText: '확인', // 확인버튼 표시 문구
                confirmButtonColor: '#a00' // 확인버튼 색상 - 레드
            });
        });

        $("#btn8").click(function () {

            // 비밀번호 오류창 띄움
            swal({
                toast: true,
                position: 'bottom-right',
                type: 'error',
                title: "비밀번호가 올바르지않거나, \n 비밀번호가 확인되지 않았습니다.",
                showConfirmButton: false,
                timer: 1500
            })
        });

        $("#btn9").click(
            function () {
                /* ex) */
                toastUP('bottom-right', 'error',
                    '회원탈퇴에 동의하지 않으셨습니다. \n 동의에 체크 해주세요.', 1500)
                // 회원탈퇴 동의 체크란 오류창 띄움
                /* 
                 swal({
                     toast: true,
                     position: 'bottom-right',
                     type: 'error',
                     title: "회원탈퇴에 동의하지 않으셨습니다. \n 동의에 체크 해주세요.",
                     showConfirmButton: false,
                     timer: 1500
                 }) */
            });
    </script>
    <script>
        // 시작일 달력 이미지 클릭시 발동
        $(function () {
            $("#datepicker").datepicker({
                authoHide: true,
                format: 'yyyy-mm-dd',
                language: 'ko-KR',
                weekStart: 0,
                trigger: '#show-cal'
            });
        });
        // 종료일 달력 이미지 클릭시 발동
        $(function () {
            $("#datepicker2").datepicker({
                authoHide: true,
                format: 'yyyy-mm-dd',
                language: 'ko-KR',
                weekStart: 0,
                trigger: '#show-cal2'
            });
        });
    </script>
    <!-- 달력 html -->
    <div class="datepicker-container datepicker-dropdown datepicker-top-left datepicker-hide"
        style="top: 42.5px; left: 8px; z-index: 1000;">
        <div class="datepicker-panel datepicker-hide" data-view="years picker">
            <ul>
                <li data-view="years prev">‹</li>
                <li data-view="years current"></li>
                <li data-view="years next">›</li>
            </ul>
            <ul data-view="years"></ul>
        </div>
        <div class="datepicker-panel datepicker-hide" data-view="months picker">
            <ul>
                <li data-view="year prev">‹</li>
                <li data-view="year current"></li>
                <li data-view="year next">›</li>
            </ul>
            <ul data-view="months"></ul>
        </div>
        <div class="datepicker-panel" data-view="days picker">
            <ul>
                <li data-view="month prev">‹</li>
                <li data-view="month current">2020년 4월</li>
                <li data-view="month next">›</li>
            </ul>
            <ul data-view="week">
                <li class="" data-view="">일</li>
                <li class="" data-view="">월</li>
                <li class="" data-view="">화</li>
                <li class="" data-view="">수</li>
                <li class="" data-view="">목</li>
                <li class="" data-view="">금</li>
                <li class="" data-view="">토</li>
            </ul>
            <ul data-view="days">
                <li class="muted" data-view="day prev">29</li>
                <li class="muted" data-view="day prev">30</li>
                <li class="muted" data-view="day prev">31</li>
                <li class="" data-view="day">1</li>
                <li class="" data-view="day">2</li>
                <li class="" data-view="day">3</li>
                <li class="" data-view="day">4</li>
                <li class="" data-view="day">5</li>
                <li class="" data-view="day">6</li>
                <li class="" data-view="day">7</li>
                <li class="" data-view="day">8</li>
                <li class="" data-view="day">9</li>
                <li class="" data-view="day">10</li>
                <li class="" data-view="day">11</li>
                <li class="" data-view="day">12</li>
                <li class="" data-view="day">13</li>
                <li class="" data-view="day">14</li>
                <li class="" data-view="day">15</li>
                <li class="" data-view="day">16</li>
                <li class="" data-view="day">17</li>
                <li class="" data-view="day">18</li>
                <li class="" data-view="day">19</li>
                <li class="" data-view="day">20</li>
                <li class="" data-view="day">21</li>
                <li class="" data-view="day">22</li>
                <li class="" data-view="day">23</li>
                <li class="" data-view="day">24</li>
                <li class="" data-view="day">25</li>
                <li class="" data-view="day">26</li>
                <li class="" data-view="day">27</li>
                <li class="highlighted picked" data-view="day picked">28</li>
                <li class="" data-view="day">29</li>
                <li class="" data-view="day">30</li>
                <li class="muted" data-view="day next">1</li>
                <li class="muted" data-view="day next">2</li>
                <li class="muted" data-view="day next">3</li>
                <li class="muted" data-view="day next">4</li>
                <li class="muted" data-view="day next">5</li>
                <li class="muted" data-view="day next">6</li>
                <li class="muted" data-view="day next">7</li>
                <li class="muted" data-view="day next">8</li>
                <li class="muted" data-view="day next">9</li>
            </ul>
        </div>
    </div>

</body>

</html>