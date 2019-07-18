// [KEIS01] keis.CONFIG=======================================================
if( !keis )

/**
 * C: keis javascript 설정파일 클래스
 * <pre>
 * </pre>
 * @classDescription Keis javascript 설정파일 클래스로서 공통상수를 명시함 
 * @author 통합1팀 응용아키텍트 2011.07.14
 * 
 * */
var keis = {};

$.browser={};(function(){
	jQuery.browser.msie=false;
	$.browser.version=0;if(navigator.userAgent.match(/MSIE ([0-9]+)\./)){
	$.browser.msie=true;jQuery.browser.version=RegExp.$1;}
})();

/**
* O: komafUi 공통상수
* @author jungHwasu, 2011.03.09
*/
keis.c = {

  /** 도메인 */
  ROOT_PATH : "www.work.go.kr",
  
  /** 프레임워크 버전 */
  VERSION : "0.5",

  /** CONTEXT ROOT */
  ROOT_PATH : "",

  /** 화면명 */
  JSP_NAME : "",

  /** 세션만료체크 (종료시 몇 초 전) */
  SESSION_CHK : 5 * 60,

  /** 에러페이지 URL 경로 (세션중단) */
  PATH_ERR_NOSESSION : "",

  /** 토큰값 */
  TOKEN  : "",

  /** 웹페이지 기본 인코딩셋 */
  CHAR_SET : "UTF-8"     // 웹페이지 기본 인코딩셋
  
};

// 콤보
keis.c.COMBO = {
  LABEL_ALL    : "전체",
  LABEL_SELECT : "선택"
};

// 각종 ID 모음
keis.c.ID = {
  LOADING_BAR : "#_ku_LoadingBar",
  WIN_FORM    : "#_ku_winForm",
  WIN_POPUP   : "#_ku_winPopup",
  WIN_TIP     : "_ku_tip",
  DEBUG_PANEL : "#_ku_logPanel",
  DEBUG_TXT   : "#_ku_logPanelDesc",
  FILE_DN     : "_kuDownload"
}

// 서버요청
keis.c.REQ = {
  TYPE_FORM : "kfrm",
  TYPE_JSON : "kajx",
  TYPE_XML  : "kxml",
  DATA_JSON : "jsonp",
  DATA_XML  : "xml"
}

// 테이블 관련 공통상수
keis.c.TABLE = {
  NAVI_PAGE        : "_duNaviPage",
  NAVI_PAGE_CNT    : "_duNaviPageCnt",
  NAVI_PAGE_SIZE   : "_duNaviPageSize",
  NAVI_ROW         : "_duNaviRow",
  NAVI_ROW_CNT     : "_duNaviRowCnt",
  NAVI_ROW_SIZE    : "_duNaviRowSize",
  NAVI_PARAM       : "_duNaviParam",
  NAVI_URL         : "_duNaviUrl",
  NAVI_RES         : "_duNaviRes",
  NAVI_TARGET_ROW  : "devonTargetRow",
  NO_DATA          : "조회결과가 존재하지 않습니다.",
  NOT_ROW          : "notRow",
  FIRST_ROW        : "duTableFirstRow",
  PAGING_DATATYPE  : "komaf",
  DEFAULT_DATATYPE : "local",
  RELOAD           : "reloadGrid",
  UPDATEPAGER      : "updatepager",
  DATALLOADING     : "dataloading",
  PAGE             : "page",
  PREFIX           : "tab"
};

// window
keis.c.WINDOW = {
  ID_SEQ      : "_autoGenId_",
  PARAM_TOKEN : "_metaToken"
};


// 클래스 관련 공통상수
keis.c.CLASS = {
  FOCUS   : "kuFocus",
  INVALID : "kuInvalid",
  TIP     : "kuTip"
};

// REDRAW 관련 공통상수
keis.c.REDRAW = {
  DIV_FOCUS : "_duRedrawFocus_"
};

// Validator
keis.c.VD = {
  DIV_INVALID : "_duVdInvalid_"
};

// Date
keis.c.DATE = {
  FORMAT      : "YYYY-MM-DD", // 기본 날짜형식
  SERVER_DATE : null,
  LOCAL_DATE  : null,
  PICKER_BTN_IMG : "/htdocs/css/komafUi/images/calendar.gif"
};

// GIS 관련 공통상수
keis.c.GIS = {
  // GIS 서버주소
//  URL                 : 'http://192.168.1.191:8188/MapX',
  URL                 : 'http://kmanas.iptime.org:8188/MapX',
  // 기본 해상도
  RESOLUTION          : 1.40625,
  // MAP 유형
  SRS_CODE            : 'EPSG:4326', // NON-LCC
//  SRS_CODE            : 'EPSG:7118', // LCC,
  // 기본 확대레벨
  ZOOM_LEVEL          : 4,
  // 기준 경도
  BASE_LONGITUDE      : 128.10,
  // 기준 위도
  BASE_LATITUDE       : 36.30,
  // Flash Player Version
  FLASH_VER           : "10.2.0",
  // Flash Player Location
  FLASH_PLAYER_URL    : function() { return keis.c.ROOT_PATH + "/htdocs/js/gis/InSIDEMapXClient.swf" },
  // Flash Player Installer Location
  FLASH_INSTALLER_URL : function() { return keis.c.ROOT_PATH + "/htdocs/js/gis/playerProductInstall.swf" },
  // GIS 인스턴스 임시저장소
  INIT_TARGET         : [],
  // GIS 기본실행함수 임시저장소
  CALL_FN             : []
}


// Biz 관련 공통상수
keis.c.BIZ = {
  serverDate      : null,
  SESSION_VALID   : null,
  SESSION_TIMEOUT : 30 * 60
};

// 정규식처리 관련 공통상수 (번역 대상에 포함되지 않음)
keis.c.REG_PTN = {

  TRIM : /(^ *)|( *$)/g,
  LTRIM : /(^ *)/g,
  RTRIM : /( *$)/g,
  INNER_TRIM : / +/g,
  INNER_SPACE : / /g,
  NUM : /[0-9]/g,
  NOT_NUM : /[^0-9]/g,
  NOT_NUM_PARSE : /[^0-9\.-]/g,
  ENG : /[a-zA-Z]/g,
  NOT_ENG : /[^a-zA-Z]/g,
  KOR : /[ㄱ-ㅎㅏ-ㅣ가-힣]/g,
  NOT_KOR : /[^ㄱ-ㅎㅏ-ㅣ가-힣]/g,
  NOT_NUM_OR_ENG : /[^0-9a-zA-Z]/g,
  MONEY : /(\d)(?=(?:\d{3})+(?!\d))/g,

  HAS_HTML : /<\/?[a-zA-Z][a-zA-Z0-9]*[^<>]*>/,
  IS_NUM : /^[0-9]+$/,
  IS_NOT_NUM : /^[^0-9]+$/,
  IS_ENG : /^[a-zA-Z]+$/,
  IS_NUM_ENG : /^[0-9a-zA-Z]+$/,
  IS_KOR : /^[ㄱ-ㅎㅏ-ㅣ가-힣]+$/,
  IS_NUM_KOR : /^[0-9ㄱ-ㅎㅏ-ㅣ가-힣]+$/,
  IS_RRN : /^(\d{2})(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1])(|\D)[1-4](\d{6})$/,
  IS_FGN : /^(\d{2})(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1])(|\D)[5-8](\d{6})$/,
  IS_EMAIL : /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/,
  IS_HOME_PHONE : /^(0[2-8][0-5]?)(|\D)([1-9]{1}[0-9]{2,3})(|\D)([0-9]{4})$/,
  IS_CELL_PHONE1 : /^(01[1346-9])(|\D)([1-9]{1}[0-9]{2,3})(|\D)([0-9]{4})$/,
  IS_CELL_PHONE2 : /^(010)(|\D)([2-9]{1}[0-9]{3})(|\D)([0-9]{4})$/,
  IS_JUMIN : /^[0-9]{13}$/,
  IS_UPPERCASE : /^[A-Z]+$/,
  IS_LOWERCASE : /^[a-z]+$/,
  
  UNMASK : [ "X", "9", "*" ],

  MASK_CHR : /[a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣]/,
  MASK_NUM : /[0-9]/,
  MASK_ALL : /./,

  HAN_1ST : ['ㄱ','ㄲ','ㄴ','ㄷ','ㄸ','ㄹ','ㅁ','ㅂ','ㅃ','ㅅ','ㅆ','ㅇ','ㅈ','ㅉ','ㅊ','ㅋ','ㅌ','ㅍ','ㅎ' ],
  HAN_2ND : ['ㅏ','ㅐ','ㅑ','ㅒ','ㅓ','ㅔ','ㅕ','ㅖ','ㅗ','ㅘ','ㅙ','ㅚ','ㅛ','ㅜ','ㅝ','ㅞ','ㅟ','ㅠ','ㅡ','ㅢ','ㅣ'],
  HAN_3RD : ['','ㄱ','ㄲ','ㄳ','ㄴ','ㄵ','ㄶ','ㄷ','ㄹ','ㄺ','ㄻ','ㄼ','ㄽ','ㄾ','ㄿ','ㅀ','ㅁ','ㅂ','ㅄ','ㅅ','ㅆ','ㅇ','ㅈ','ㅊ','ㅋ','ㅌ','ㅍ','ㅎ'],

  HAN_JOSA : ['은','는','이','가','을','를'],

  HAN_JOSA_MERGE_1 : /(은\W는\W|는\W은\W)/,
  HAN_JOSA_MERGE_2 : /(이\W가\W|가\W이\W)/,
  HAN_JOSA_MERGE_3 : /(을\W를\W|를\W을\W)/

}


// 유효성 관련 상수
keis.c.CHK = {
IS_KEIS_HOME_PHONE : ["010", "011", "013", "0130", "016", "017", "018", "019", "02", "0303", "03033", "031", "032", "033", "041", "042", "043", "044", "050", "0502","0503", "0504", "0505", "0506", "051", "052", "053", "054", "055", "061", "062", "063", "064", "070", "080"]
}

// 파일
keis.c.FILE = {

  URL_FILE_EXIST : "/afs/frm/file/FileManager/CheckFileExistCmd.kajx",
  URL_DOWNLOAD   : "/afs/frm/file/FileManager/FileDownloadCmd.kfrm",
  URL_UPLOAD     : "/afs/frm/file/FileManager/FileUploadCmd.kajx",
  URL_SWF        : "/htdocs/js/uploadify/uploadify.swf",
  URL_CANCEL_IMG : "/htdocs/css/uploadify/cancel.png",

  BTN_PICKER_TXT : "파일선택",
  BTN_UPLOAD_TXT : "전송",
  MAX_FILE_CNT   : 1,
  SIZE_LIMIT     : 10 * 1024,
  FILE_EXT       : "*.*",
  FILE_DENY_EXT  : ""

}

// Validator
keis.c.VALIDATOR = {
  SHOW_TIP       : true,            // 툴팁 표시여부
  CHECK_INTERVAL : 200,             // 실시간 검사 체크주기 (msec)
  NEW_LINE       : ( $.browser.msie ) ? "\u000D\u000A" : ", ",  // 줄바꾸기
  RULE_DESC      : ( $.browser.msie ) ? "\u000D\u000A---------\u000D\u000A" : "\u000D\u000A : \u000D\u000A"
};


// Report Designer
keis.c.REPORT = {
	RD_WIDTH 		: 900,
	RD_HEIGHT		: 650,
	//RD_DEFULT_AGENT_URL	: "/common/report/RDPrint.jsp"
	//20111104 아래와 같이 해 주는것 풀려 다시함 
	RD_DEFULT_AGENT_URL	: sContext+"/common/report/RDPrint.jsp"	
}

//[A02] -keis.CONF =======================================================

/**
* komafUi configuration
* @private
* @author JungHwasu 2011.03.24
*/
keis.conf = {};

//AJAX
keis.conf.ajax = {
debug        : false,     // 디버깅모드
method       : "POST",    // GET/POST
loading      : true,      // 기본 로딩바 표시여부
dataType     : "json",    // 데이터 전송타입 (json/jsonp)
sync         : false,     // 동기전송 여부
timeout      : 300 * 1000 // 조회대기시간 (sec * 1000)
};

//REDRAW
keis.conf.redraw = {
label : true
};

//로그
keis.conf.log = {
debug      : true,
panelExist : false,
window : {
 width    : 400,
 height   : 200,
 fontSize : 11
}
};