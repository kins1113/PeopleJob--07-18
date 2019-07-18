// [KEIS16] keis.WINDOW=======================================================

/**
 * O: 윈도우 창 컨트롤에 관련된 유틸리티 클래스
 * @classDescription 윈도우 창 컨트롤에 관련된 유틸리티 클래스
 * @author 통합1팀 응용아키텍트 2011.07.14
 */
keis.window = {

  z_idSeq : 0, // 오브젝트에 부여하는 ID
  z_req   : new keis.mdata(), // 화면에 넘겨주는 데이터가 저장되는 공간

  /**
  * F: 팝업을 호출한다.<br>
  * <pre>
  * var popup = keis.window.openPopup( "", 200, 300 );
  *
  * 1. 팝업창의 입력상자에 접근해 값을 변경
  * $("#inputPopup", popup.document ).val( "merong" );
  * $( popup.document ).find("#inputPopup").val("merong");
  *
  * 2. 팝업창의 스크립트를 실행
  * $(popup)[0].fnPopupScript();
  *
  * 3. 팝업창에서 부모창에 접근해 값을 변경
  * $("#inputOpner", opner.document).val("merong");
  * </pre>
  *
  * @param {String} url    호출할 페이지
  * @param {String} width  창 너비
  * @param {String} height 창 높이
  * @param {Object} option 옵션
  * <pre>
  * scrollbars  : {Boolean} 스크롤바 생성여부 (기본값 : false )
  * status      : {Boolean} 상태바 생성여부 (기본값 : false )
  * toolbar     : {Boolean} 툴바 생성여부 (기본값 : false )
  * copyhistory : {Boolean} ? (기본값 : false )
  * menubar     : {Boolean} 메뉴바 생성여부 (기본값 : false )
  * location    : {Boolean} 주소입력창 생성여부 (기본값 : false )
  * directories : {Boolean} ? (기본값 : false )
  * method      : {String}  팝업화면에 데이터를 보내는 방법 (POST (기본값) / GET)
  * domain      : {String}  URL의 메인도메인 (외부링크를 열고 싶을 경우 해당 항목을 "" 처리한 후 full-URL을 입력한다.)
  * </pre>
  * @author 정화수, 2011.03.18
  * @return {Object} 팝업윈도우 핸들러
  */
  openPopup : function( url, width, height, option ) {

    var op = $.extend({
      id          : keis.c.ID.WIN_POPUP,
      scrollbars  : false,
      status      : false,
      resizable   : true, // 크기조절을 막는 기능은 IE에서만 된다.
      toolbar     : false,
      copyhistory : false,
      menubar     : false,
      location    : false,
      directories : false,
      method      : "post",
      domain      : keis.c.ROOT_PATH
    }, option || {} );

    op.width       = width;
    op.innerWidth  = width + 6;
    op.height      = height;
    op.innerHeight = height + 32;

    var param = "";
    var temp = "";
    for( var c in op ) {
      switch( op[c] ) {
        case true  : temp = "yes"; break;
        case false : temp = "no";  break;
        default    : temp = op[c];
      }
      param += ( c + "=" + temp + "," );
    }
    param = param.replace( /,$/, "" );

    var id = op.id.replace("#","") + "_" + (keis.window.z_idSeq++);
    var popup = window.open( "", id, param );

    var form = keis.window.getForm( keis.window.z_req );

    form.attr({
      "method" : "post",
      "target" : id,
      "action" : op.domain + url
    }).submit();

    return popup;

  },

  /**
  * F: 현재 화면에 페이지를 연다. (페이지를 이동한다.)
  *
  * @param {String} url  페이지 주소
  * @param {Object} option 옵션
  * <pre>
  * method  : {Number} 1.back history 안남기고 이동, 2.단순이동, 3.리로딩
  * target  : {String} 페이지가 전송될 타겟윈도우ID
  * domain  : {String} URL의 메인도메인 (외부링크를 열고 싶을 경우 해당 항목을 "" 처리한다.)
  * encrypt : {Boolean} 전송값 암호화여부 (기본값:true)
  * </pre>
  * @author 정화수, 2011.03.19
  */
  openPage : function( url, option ) {

    var op = $.extend({
      method  : 1,
      target  : "_self",
      domain  : keis.c.ROOT_PATH
    }, option || {} );

    switch( op.method ) {
      case 1 :  // not permit to record back history
        var form = keis.window.getForm( keis.window.z_req );
        form.attr({
          "method" : "post",
          "target" : op.target,
          "action" : op.domain + url
        }).submit();
        break;

      case 2 :  // forward
        document.location.href = op.domain + url;
        break;

      case 3 :  // reload
        document.location.reload();
        break;
    }

  },

  /**
  * F: 화면에 넘겨주기 위한 파라미터를 추가한다.
  * @param {String} key 키
  * @param {String} value 값
  */
  addParam : function( key, value ) {
    keis.window.z_req.add( key, value );
  },

  /**
  * F: 화면에 넘겨주기 위한 FORM 파라미터를 추가한다.
  * @param {String} expression  셀럭터
  */
  addForm : function( expression ) {
   keis.window.z_req.addForm( expression );
  },

  /**
   * F: 세팅한 파라미터를 초기화한다.
   */
  clearParam : function() {
    keis.window.z_req.clear();
  },

  /**
  * F: 데이터 전송을 위한 form 객체를 가져온다.
  * @param {keis.mdata} mdata  form에 담을 데이터
  * @author 정화수, 2011.3.21
  */
  getForm : function( mdata ) {

    // 폼을 가져온다. (없으면 하나 만든다.)
    var form = $(keis.c.ID.WIN_FORM);
    if( form.length == 0 ) {
      form = $("<form>").attr({
        id : keis.c.ID.WIN_FORM.replace("#",""),
        "accept-charset" : keis.window.getCharset()
      }).appendTo("body");
    }

    // 폼 데이터를 초기화시킨다.
    form.children().remove();

    // TOKEN 데이터 추가
    $("<input>").attr({
      type  : "hidden",
      name  : keis.c.WINDOW.PARAM_TOKEN,
      value : keis.c.TOKEN
    }).appendTo(form);

    // 데이터가 없다면 메서드를 종료한다.
    if( keis.chk.isNull(mdata) ) return form;

    // 전송할 데이터셋을 만든다.
    var hd  = mdata.getHeader();

    for( var i = 0, icnt = hd.length; i < icnt; i++ ) {
      for( var j = 0, jcnt = mdata.size(); j < jcnt; j ++ ) {
        $("<input>").attr({
          type  : "hidden",
          name  : hd[i],
          value : mdata.get(hd[i],j)
        }).appendTo(form);
      }
    }

    return form;

  },

  /**
   * F: 툴팁을 붙인다.
   * <pre>
   * keis.window.showTip( "툴팁에 보여줄 텍스트", {id:"idInput", top:10, left:20} );
   * </pre>
   * @param {String} text    툴팁에 보여줄 텍스트
   * @param {Object} option  옵션
   * <pre>
   * id   : {String} 툴팁을 붙일 개체 id
   * top  : {Number} 툴팁이 위치할 top  좌표
   * left : {Number} 툴팁이 위치할 left 좌표
   * </pre>
   */
  showTip : function( text, option ) {

    var op = $.extend({
      id    : "",
      top   :  0,
      left  :  0,
      width :  0,
      height : 0
    }, option || {} );

    // top, left 를 설정한다.
    if( $("#"+op.id).length == 1 ) {
      var p = $("#"+op.id).offset();
      op.top    = p.top;
      op.width  = $("#"+op.id).width();
      op.left   = p.left + op.width + 7;
      op.height = $("#"+op.id).height();
    }

    // TIP 객체를 생성한다.
    var tip = $("#"+keis.c.ID.WIN_TIP );
    if( tip.length == 0 ) {
      tip = $("<div>").addClass(keis.c.CLASS.TIP).attr("id", keis.c.ID.WIN_TIP).appendTo("body");
    }

    // 출력내용을 설정한다.
    if( keis.chk.isTypArr(text) ) {
      var _msg = "";
      $.each( text, function() {
        _msg += this + "<br />";
      });
      text = _msg;
    }

    // TIP을 설정한다.
    tip.html( text ).css({
      "top"   : op.top,
      "left"  : op.left
    }).show();

  },

  /**
   * F: 툴팁을 지운다.
   */
  hideTip : function() {
    $("#" + keis.c.ID.WIN_TIP ).hide();
  },

  /**
   * F: 화면에 부여할 ID를 구한다.<br>
   * ID는 한 화면에서 순차적으로 부여된다.
   * @param {Object} obj
   */
  getId : function( obj ) {
    if( !keis.chk.isTypObj(obj) ) return "";
    if( $(obj).prop("id") == "" ) {
      keis.window.z_idSeq ++;
      $(obj).prop( "id", keis.c.WINDOW.ID_SEQ + keis.window.z_idSeq );
    }
    return $(obj).prop("id");
  },

  /**
   * F: URL에서 파라미터를 추출한다.
   * @param {String} param 파라미터명
   * @return {String} 파라미터값
   */
  getUrlParam : function( param ) {

    var strReturn = "";
    var strHref = window.location.href;
    var bFound = false;

    var cmpstring = param + "=";
    var cmplen = cmpstring.length;

    if ( strHref.indexOf("?") > -1 ){

      var strQueryString = strHref.substr(strHref.indexOf("?")+1);
      var aQueryString = strQueryString.split("&");

      for ( var iParam = 0; iParam < aQueryString.length; iParam++ ){

        if (aQueryString[iParam].substr(0,cmplen)==cmpstring){
          var aParam = aQueryString[iParam].split("=");
          strReturn = aParam[1];
          bFound=true;
          break;
        }

      }

    }

    if( bFound == false ) return null;
    return strReturn;

  },

  /**
   * F: 현재 창이 팝업으로 열렸는지 확인한다.
   * @return {Boolean}
   * @author 정화수, 2011.04.19
   */
  isPopup : function() {
    return ( opener != null && opener.document != null );
  },

  /**
   * F: 현재 창의 문자셋을 가져온다.
   * @return {String} 문자셋(대문자)
   * @author 정화수, 2011.03.21
   */
  getCharset : function() {
    return ( document.charset || document.characterSet || document.defaultCharset || keis.c.CHAR_SET ).toUpperCase();
  },


  /**
   * F: 웹접근성 팝업 오픈
   * @return {String} 문자셋(대문자)
   * @author 정화수, 2011.03.21
   */
  newWindow : function (a_str_windowURL, a_str_windowName, a_int_windowWidth, a_int_windowHeight, a_bool_scrollbars, a_bool_resizable, a_bool_menubar, a_bool_toolbar, a_bool_addressbar, a_bool_statusbar, a_bool_fullscreen) {
		var int_windowLeft = (screen.width - a_int_windowWidth) / 2;
		var int_windowTop = (screen.height - a_int_windowHeight) / 2;
		var str_windowProperties = 'height=' + a_int_windowHeight + ',width=' + a_int_windowWidth + ',top=' + int_windowTop + ',left=' + int_windowLeft + ',scrollbars=' + a_bool_scrollbars + ',resizable=' + a_bool_resizable + ',menubar=' + a_bool_menubar + ',toolbar=' + a_bool_toolbar + ',location=' + a_bool_addressbar + ',statusbar=' + a_bool_statusbar + ',fullscreen=' + a_bool_fullscreen + '';
		var obj_window = window.open(a_str_windowURL, replaceAll(a_str_windowName, ' ', ''), str_windowProperties);
		if (parseInt(navigator.appVersion) >= 4) {
			obj_window.window.focus();
		}
  }

};

function replaceAll(str, ori, rep){
	if(str == null) return "";
	return str.split(ori).join(rep);
}