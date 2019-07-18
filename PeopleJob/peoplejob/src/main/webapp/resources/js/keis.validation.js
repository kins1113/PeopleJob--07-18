// [KEIS15] keis.Validation=======================================================

/**
 * O : 정합성 검사엔진<br>
 *
 * @classDescription 정합성 검사를 하기위한 엔진을 컨트롤 한다.
 * @author 통합1팀 응용아키텍트 2011.07.14
 */
keis.z_vdCore = {

  rulePool : [], // 규칙목록 (인덱스 별)
  chkPool  : [], // 검사목록 (인덱스 별)
  observe  : [], // 감시목록 (전체)

  /**
   * 개체를 생성한다.
   * @return {Number} 개체 index
   */
  getInstance : function() {

    keis.z_vdCore.rulePool.push( {} );

    return keis.z_vdCore.rulePool.length - 1;

  },

  /**
   * 정합성 체크엔진을 구동한다.
   * @param {Number} idx rule 인덱스
   */
  init : function( idx ) {

    this.rulePool[idx].init = true;

    this.chkPool[ idx ] = {};
    this.chkPool[ idx ].rule = [];

    for( var exp in this.rulePool[idx].rule ) {

      $(exp).each( function(){
        keis.z_vdCore.setChkPool( keis.window.getId(this), exp );
      });

      $(exp)
        .die( "blur.kuValid" )
        .die( "focus.kuValid" )
        .die( "liveCreate.kuValid" )
        .live( "liveCreate.kuValid", $.proxy(this, "liveCreate") );
//        .live( "blur.kuValid",       $.proxy(this, "blur")       )
//        .live( "focus.kuValid",      $.proxy(this, "focus")      );

//      $(exp).trigger( "liveCreate.kuValid" );

    }

  },

  /**
   * 입력받은 모든 데이터에 대해서 정합성 엔진을 초기화한다.
   */
  initAll : function() {
    for( var i = 0, cnt = keis.z_vdCore.rulePool.length; i < cnt; i++ ) {
      keis.z_vdCore.init( i );
    }
  },

  /**
   * F: 정합성 검사결과를 화면에 출력한다.
   *
   * @param {Object} result 정합성 검사결과
   */
  showValidResult : function( id, result ) {

    if( keis.c.VALIDATOR.SHOW_TIP != true ) return;

    if( result.msg.length == 0 ) {
      keis.window.hideTip();
    } else {
      keis.window.showTip( result.msg, {id:id} );
    }

  },

  /**
   * 검사목록에 활성화된 INPUT 객체의 Validation 규칙을 추가한다.
   * @param {String} id       활성화된 INPUT 객체의 id
   * @param {String} selector 셀렉터
   */
  setChkPool : function( id, selector ) {
	  
    for( var i = 0, iCnt = this.rulePool.length; i < iCnt; i++ ) {

      var param = this.rulePool[i].rule[selector];
      
      if( keis.chk.isNull(param) ) continue;
      
      var chkParam = this.chkPool[i].rule[id];
      
      if( keis.chk.isNull(chkParam) ) {
    	  
        $("#"+id).prop("title", $("#"+id).prop("title") + keis.c.VALIDATOR.RULE_DESC );
        
        this.chkPool[i].rule[id] = param;
        this.setObserveRule( id, param );
      }

    }

  },

  /**
   * 감시목록에 활성화된 INPUT 객체의 Validation 규칙을 추가한다.
   *
   * @param {String} id
   * @param {keis.data} param  검사할 규칙
   */
  setObserveRule : function( id, param ) {
	 
    var flag = false;

    if( keis.chk.isNull(this.observe[id]) ) {
      this.observe[id] = {};
      this.observe[id].rule = param;
      this.observe[id].val  = $("#"+id).val();
      this.observe[id].observed = false;

      flag = true;

    } else if( ! this.observe[id].rule.equals(param) )  {
      this.observe[id].rule.merge( param );
      flag = true;
    }

    if( flag == true ) {
    	
      var chkResult = this.chkValid( $("#"+id).val(), this.observe[id].rule );
      this.setLabel( id, chkResult.msg );

      var obj = $("#"+id);

      for( var attr in this.observe[id].rule.getData() ) {

        switch( attr.toLowerCase() ) {
          case "maxlen" :
          case "maxbyt" :
          case "fixlen" :
          case "fixbyt" :
            obj.prop( "maxlength", param.get(attr) );
            break;
          case "mask" :
            obj.prop( "maxlength", param.get(attr).length );
            break;
          case "date" :
            obj.datepicker({ buttonImage : keis.c.ROOT_PATH + keis.c.DATE.PICKER_BTN_IMG });
            obj.prop( "maxlength", keis.c.DATE.FORMAT.length );
            obj.next().prop( "id", id + "Pick" );
            break;
        }
      }

    }

  },

  /**
   * 동적으로 생성될 때 실행될 이벤트
   * @param {Object} event
   */
  liveCreate : function( event ) {

    var selector = event.handleObj.selector;
    var id       = keis.window.getId( event.currentTarget );
    var self     = $("#"+id);

    if( self.prop("liveCreated") != true ) {

      keis.msg.debug( "new created !! : " + id );

      this.setChkPool( id, selector );
      self.prop( "liveCreated", true );
    }

  },


  /**
   * 포커스 로직을 처리한다.
   * @param {Object} event
   */
  focus : function( event ) {
    var selector = event.handleObj.selector;
    var id       = keis.window.getId( event.currentTarget );

//    this.setChkPool( id, selector );

    var chkParam  = this.observe[id].rule;
    var chkResult = this.chkValid( $("#"+id).val(), chkParam );

    this.showValidResult( id, chkResult );

    this.setLabel( id, chkResult.msg );

    // 포커스 상태에 들어갈 경우 감시 이벤트 활성화
    this.observe[id].observed = true;
    this.observe[id].preVal = $("#"+id).val();

   // this.keyObserve( id );

  },

  /**
   * 입력상자에서 포커스가 빠져나갔을 경우 이벤트를 처리한다.
   * @param {Object} event
   */
  blur : function( event ) {

    keis.window.hideTip();

    var id  = $(event.currentTarget).prop("id");
    var obj = $("#"+id);

    // 감시 제거
    this.observe[id].observed = false;

    var chkRule = this.observe[id].rule;

    if( chkRule.hasKey("mask") ) {

      var mask   = chkRule.get("mask");
      var mskVal = keis.str(obj).setUnmask(mask).setMask(mask).val();

      obj.val(mskVal);
      keis.z_vdCore.observe[id].val = mskVal;

    } else if( chkRule.hasKey("date") ) {

      var date = keis.date( obj.val() );
      if( date.val() != null ) obj.val( date.toString() );

    }

  },

  /**
   * 키 입력 이벤트를 지속적으로 감시한다.
   * @param {keis.data} id
   */
  keyObserve : function( id ) {

    // 감시상태가 아니라면 함수 종료
    if( this.observe[id].observed != true ) return;

    var obj = $( "#" + id );

    // 입력값이 바뀔 때까지 기다린다.
    if (keis.z_vdCore.observe[id].val == obj.val()) {

      setTimeout( function(){ keis.z_vdCore.keyObserve(id); }, keis.c.VALIDATOR.CHECK_INTERVAL );
      return false;
    }

    this.observe[id].preVal = this.observe[id].val;
    this.observe[id].val    = obj.val();

    // 검사를 수행한다.
    var chkParam  = this.observe[id].rule;
    var chkResult = this.chkValid( obj.val(), chkParam );

    this.showValidResult( id, chkResult );
    this.setLabel( id, chkResult.msg );

    // 입력값을 다시 체크한다.
    if( this.observe[id].observed != true ) return;
    setTimeout( function(){ keis.z_vdCore.keyObserve(id); }, keis.c.VALIDATOR.CHECK_INTERVAL );

  },

  /**
   * id에 해당하는 오브젝트의 validation을 수행한다.<br>
   * @param {String} 정합성 검사를 수행할 값
   * @param {keis.data} rule 정합성 규칙
   * @return {Object} 수행결과를 담은 JSON 데이터 {result:true/false, msg:[에러메세지], rule:[검사한 규칙], param:[규칙에 설정한 파라미터], chkVal:[검사한 값] }
   */
  chkValid : function( chkVal, rule ) {

    var result = {};
    result.result = true;
    result.msg    = [];
    result.rule   = [];
    result.param  = [];
    result.chkVal = [];

    var param, errMsg;
   
    var opt = rule.getData();

    for( var attr in opt ) {

      param  = opt[ attr ];
      errMsg = "";

      switch( attr ) {
        case "required" :
          if( keis.chk.isEmpty(chkVal) ) errMsg = getMsg( attr );
          break;
        case "minlen" :
          if( !keis.chk.isMinLen(keis.str(chkVal).clearXss(), param) ) errMsg = getMsg( attr, param, keis.str(chkVal).clearXss().length() );
          break;
        case "maxlen" :
          if( !keis.chk.isMaxLen(keis.str(chkVal).clearXss(), param) ) errMsg = getMsg( attr, param, keis.str(chkVal).clearXss().length() );
          break;
        case "fixlen" :
          if( !keis.chk.isMinLen(keis.str(chkVal).clearXss(), param) || !keis.chk.isMaxLen(keis.str(chkVal).clearXss(), param) ) errMsg = getMsg( attr, param, keis.str(chkVal).clearXss().length() );
          break;
        case "minbyt" :
          if( !keis.chk.isMinByte(keis.str(chkVal).clearXss(), param) ) errMsg = getMsg( attr, param, keis.str(chkVal).clearXss().bytes() );
          break;
        case "maxbyt" :
          if (!keis.chk.isMaxByte(keis.str(chkVal).clearXss(), param)) errMsg = getMsg( attr, param, keis.str(chkVal).clearXss().bytes() );
          break;
        case "fixbyt" :
          if( !keis.chk.isMinByte(keis.str(chkVal).clearXss(), param) || !keis.chk.isMaxByte(keis.str(chkVal).clearXss(), param) ) errMsg = getMsg( attr, param, keis.str(chkVal).clearXss().getByte() );
          break;
        case "num" :
          if( !keis.chk.isNum(chkVal) ) errMsg = getMsg( attr );
          break;
        case "eng" :
          if( !keis.chk.isEng(chkVal) ) errMsg = getMsg( attr );
          break;
        case "noe" :
          if( !keis.chk.isNumEng(chkVal) ) errMsg = getMsg( attr );
          break;
        case "kor" :
          if( !keis.chk.isKor(chkVal) ) errMsg = getMsg( attr );
          break;
        case "nok" :
          if( !keis.chk.isKor(chkVal) ) errMsg = getMsg( attr );
          break;
        case "nae" :
          if( !keis.chk.isNumAndEng(chkVal) ) errMsg = getMsg( attr );
          break;
        case "notnum" :
          if( !keis.chk.isNotNum(chkVal) ) errMsg = getMsg( attr );
          break;
        case "date" :
          if( !keis.chk.isDate(chkVal) ) errMsg = getMsg( attr );
          break;
        case "psn" :
          if( !keis.chk.isPsn(chkVal) ) errMsg = getMsg( attr );
          break
        case "fsn" :
          if( !keis.chk.isFsn(chkVal) ) errMsg = getMsg( attr );
          break;
        case "csn" :
          if( !keis.chk.isCsn(chkVal) ) errMsg = getMsg( attr );
          break;
        case "lsn" :
          if (!keis.chk.isLsn(chkVal)) errMsg = getMsg( attr );
          break;
        case "email" :
          if( !keis.chk.isEmail(chkVal) ) errMsg = getMsg( attr );
          break;
        case "homephone" :
          if( !keis.chk.isHomePhone(chkVal) ) errMsg = getMsg( attr );
          break;
        case "cellphone" :
          if( !keis.chk.isCellPhone(chkVal) ) errMsg = getMsg( attr );
          break;
        case "mask" :
          if( !keis.chk.isMasked( keis.str(chkVal).setUnmask(param).setMask(param), param) ) errMsg = getMsg( attr, param );
          break;
      }

      if( errMsg != "" ) {
        result.result = false;
        result.msg.push( errMsg );
        result.rule.push( attr );
        result.param.push( param );
        result.chkVal.push( chkVal );
      }

    }

    return result;

    function getMsg( ruleName, param ) {
      arguments[0] = "keis.api.vdRule." + arguments[0];
      return keis.msg.get( arguments );
    }

  },

  /**
   * 라벨을 변경한다.
   * @param {String} id
   * @param {Array} msg
   */
  setLabel : function( id, msg ) {

    if( msg.length > 0 ) {

      var txt = keis.z_vdCore.getLabelTitle(id) + keis.c.VALIDATOR.RULE_DESC + msg.join( keis.c.VALIDATOR.NEW_LINE );
      $("#"+id).attr( "title", txt );

    }

  },

  /**
   * 라벨을 초기화한다.
   * @param {String} id
   * @private
   */
  clearLabel : function( id ) {

    $("#"+id).attr( "title", keis.z_vdCore.getLabelTitle(id) );

  },

  /**
   * 라벨의 원래 title 값을 구한다.
   * @param {String} id
   * @return {String} 원래 title 값
   */
  getLabelTitle : function( id ) {

    var obj = $("#"+id);
    var title = obj.prop("title");

    if( title.indexOf(keis.c.VALIDATOR.RULE_DESC) >= 0 ) {

      title = title.split(keis.c.VALIDATOR.RULE_DESC)[0];

      return title;

    }

    return "";

  },

  /**
   * (ID에 해당하는) 개체의 포맷이 적용되기 이전값을 반환한다.
   * @param {String} id 개체의 ID
   * @return {String}
   */
  getUnmaskedVal : function( id ) {

    var obj = ( keis.chk.isTypStr(id) ) ? $("#"+id) : $(id);
    if( obj.length != 1 ) return "";

    var val = obj.val();
    if( val == "" ) return "";

    var param = keis.z_vdCore.observe[id];

    if( keis.chk.isNull(param) ) return val;

    param = param.getData();

    for( var attr in param ) {

      switch( attr ) {
        case "date" :

          var d = keis.date( val );
          var f = keis.str( d.format() ).remove( /[-|.|:| ]/g ).val();

          return d.toString( f );

        case "mask" :

          return keis.str( val ).setUnmask( param[attr] ).val();

        default :
      }

    }

    return val;

  },


  /**
   * 동적 생성 객체를 감시목록에 추가한다.
   *
   * @param {Number} idx rule 인덱스
   */
  refresh : function( idx ) {

    var idFocused = keis.etc.getFocusId();

    if( this.rulePool[idx].init != true ) return;

    for( var exp in this.rulePool[idx].rule ) {
      $(exp).trigger( "liveCreate.kuValid" );
    }

    $("#"+idFocused).focus();

  },

  /**
   * 감시그룹에 속한 모든 동적 생성 객체를 감시목록에 추가한다.
   */
  refreshAll : function() {

    for( var i = 0, cnt = this.rulePool.length; i < cnt; i++ ) {
      this.refresh( i );
    }

  }

};


/**
 * F: 정합성 검사  개체
 *
 * <pre>
 *
 * // 객체 선언
 * var group = keis.validator();
 *
 * // 규칙 선언
 * group.add("#inpDate", {date:true} ).add( "[name^=item]", {required:true} ).init();
 *
 * // 정합성 검사
 * group.isValid();
 *
 * </pre>
 *
 * @classDescription 정합성 검사를 수행한다.
 * @author 통합1팀 응용아키텍트 2011.07.14
 * @return {keis.validator}
 */
keis.validator = function() {

  var z_self = arguments.callee;
  if(!(this instanceof z_self)) return new z_self();

  this.idx      = keis.z_vdCore.getInstance();
  this.rulePool = keis.z_vdCore.rulePool[ this.idx ];

}

keis.validator.prototype = {

  /**
   * 정합정 체크로직을 세팅한다.<br><br>
   *
   * required  : {Boolean} 필수입력<br>
   * minlen    : {Number}  최소길이<br>
   * maxlen    : {Number}  최대길이<br>
   * minbyt    : {Number}  최소글자<br>
   * maxbyt    : {Number}  최대글자<br>
   * fixlen    : {Number}  고정길이<br>
   * fixbyt    : {Number}  고정글자<br>
   * date      : {Boolean} 날짜형식<br>
   * psn       : {Boolean} 주민등록번호<br>
   * email     : {Boolean} 이메일<br>
   * homephone : {Boolean} 집전화번호<br>
   * cellphone : {Boolean} 휴대전화번호<br>
   * num       : {Boolean} 숫자만 허용<br>
   * eng       : {Boolean} 영문만 허용<br>
   * kor       : {Boolean} 한글만 허용<br>
   * noe       : {Boolean} 영문숫자만 허용<br>
   * nae       : {Boolean} 영문&숫자만 허용<br>
   * nok       : {Boolean} 한글숫자만 허용<br>
   * notnum    : {Boolean} 숫자 비허용<br>
   * mask      : {String}  패턴 (X:문자, 9:숫자, *:문자 또는 숫자) <br>
   * fsn       : {Boolean} 국내거소신고번호<br>
   * csn       : {Boolean} 사업자등록번호<br>
   * lsn       : {Boolean} 법인등록번호<br>
   * focus     : {String} 포커스 이동 위치<br>
   * msghead     : {String} 사용자 메시지<br>    
   *
   * @param {String} expression 셀렉터
   * @param {Object} param 정합성 체크옵션
   * @return {keis.validator}
   */
  add : function( expression, param ) {

    if( keis.chk.isNull(param) || keis.chk.isEmpty(expression) ) return this;

    this.rulePool.rule = this.rulePool.rule || [];

    var realParam = new keis.data();

    for( var i in param ) {

      attr = i.toLowerCase();

      switch( attr ) {
        case "required"  :
        case "date"      :
        case "psn"       :
        case "email"     :
        case "homephone" :
        case "cellphone" :
        case "num"       :
        case "eng"       :
        case "noe"       :
        case "kor"       :
        case "nok"       :
        case "notnum"    :
        case "fsn"       :
        case "csn"       :
        case "nae"       :
        case "lsn"       :
          if( param[i] != true ) continue;
          break;
        case "minlen"    :
        case "maxlen"    :
        case "minbyt"    :
        case "maxbyt"    :
        case "fixlen"    :
        case "fixbyt"    :
          if( !keis.chk.isNum(param[i]) ) continue;
          break;
        default :
          if( keis.chk.isEmpty(param[i]) ) continue;
          break;
         
      }
	
      realParam.add( attr, param[i] );

    }

    if( realParam.size() > 0 ) {
      this.rulePool.rule[ expression ] = realParam;
    }

    return this;

  },

  /**
   * 입력항목의 정합성 여부를 확인한다.
   * @param {Boolean} showAlert 알람창 출력여부
   * @return {Boolean} 정합성 검사 성공여부
   */
  isValid : function( showAlert ) {

    showAlert = showAlert || true;
    var chkPool = keis.z_vdCore.chkPool[this.idx];

    var chkRslt, idx = 0, msg = "";

    for( var id in chkPool.rule ) {
      
      chkRslt =  keis.z_vdCore.chkValid( $("#"+id).val(), chkPool.rule[id] );

      if( chkRslt.result ) continue;

      for( var z = 0; z <= 1; z++ ) {

        switch( z ) {

          case 0 :
                 if( chkRule("required") ) msg = getMsg( "required" );
            else if( chkRule("minlen") )   msg = getMsg( "minlen", chkRslt.param[idx], keis.str(chkRslt.chkVal[idx]).clearXss().length() );
            else if( chkRule("maxlen") )   msg = getMsg( "maxlen", chkRslt.param[idx], keis.str(chkRslt.chkVal[idx]).clearXss().length() );
            else if( chkRule("fixlen") )   msg = getMsg( "fixlen", chkRslt.param[idx], keis.str(chkRslt.chkVal[idx]).clearXss().length() );
            else if( chkRule("minbyt") )   msg = getMsg( "minlen", chkRslt.param[idx], keis.str(chkRslt.chkVal[idx]).clearXss().bytes() );
            else if( chkRule("maxbyt") )   msg = getMsg( "maxlen", chkRslt.param[idx], keis.str(chkRslt.chkVal[idx]).clearXss().bytes() );
            else if( chkRule("fixbyt") )   msg = getMsg( "fixlen", chkRslt.param[idx], keis.str(chkRslt.chkVal[idx]).clearXss().bytes() );
            else if( chkRule("num") )      msg = getMsg( "num" );
            else if( chkRule("eng") )      msg = getMsg( "eng" );
            else if( chkRule("noe") )      msg = getMsg( "noe" );
            else if( chkRule("kor") )      msg = getMsg( "kor" );
            else if( chkRule("nok") )      msg = getMsg( "nok" );
            else if( chkRule("nae") )      msg = getMsg( "nae" );
            else if( chkRule("notnum") )   msg = getMsg( "notnum" );
            else if( chkRule("date") )     msg = getMsg( "date" );
            break;

          case 1 :
                 if( chkRule("psn") )      msg = getMsg( "psn" );
            else if( chkRule("fsn") )      msg = getMsg( "fsn" );
            else if( chkRule("csn") )      msg = getMsg( "csn" );
            else if( chkRule("lsn") )      msg = getMsg( "lsn" );
            else if( chkRule("email") )    msg = getMsg( "email" );
            else if( chkRule("homephone")) msg = getMsg( "homephone" );
            else if( chkRule("cellphone")) msg = getMsg( "cellphone" );
            else if( chkRule("mask") )     msg = getMsg( "mask", chkRslt.param[idx] );

            break;
        }

        if( showMsg(id,msg) ) return false;

      }

    }

    return true;


    function chkRule( ruleName ) {
      idx = $.inArray( ruleName, chkRslt.rule );
      return idx >= 0;
    }

    function getMsg( ruleName, param ) {
      arguments[0] = "keis.api.vdMsg." + arguments[0];
      return keis.msg.get( arguments );
    }

    function showMsg( id, msg ) {

      if( msg == "" ) return false;

      if( showAlert != true ) return true;

      var title = keis.z_vdCore.getLabelTitle( id );

      if( title != "" ) {
        msg = "@" + keis.c.REG_PTN.HAN_JOSA[0] + " " + msg;
      }
      
      //메시지 출력시 사용자가 커스텀할수 있게 변경
      if(!chkPool.rule[id].hasKey("msghead")) keis.msg.alert( msg, title );
      else keis.msg.alert( chkPool.rule[id].get("msghead") + " " + msg, title );
                                        
      //포커스 이동시 사용자가 커스텀할게 할수있게 변경
      if(!chkPool.rule[id].hasKey("focus")) $("#"+id).focus();
      else $("#" + chkPool.rule[id].get("focus")).focus(); 

      return true;

    }

  },


  /**
   * validation 엔진을 초기화한다.
   */
  init : function() {

    if( $.isReady ) {
      keis.z_vdCore.init( this.idx );
    } else {
      $().ready( $.proxy(this, "init") );
    }

  }

}


