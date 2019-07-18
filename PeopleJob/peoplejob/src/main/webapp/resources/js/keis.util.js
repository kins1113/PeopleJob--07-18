// [KEIS14] keis.UTIL=======================================================
/**
* F: 유틸리티 함수<br>
* @classDescription 유틸리티 함수 모음
* @author 통합1팀 응용아키텍트 2011.07.14
*/
keis.util = {
	/**
	 * F: 만나이를 가져옵니다.
	 * @param {String} string 주민번호13자리
	 * @return {int} 나이
	 */
	getManAge : function(resino) {
		var age = null;

		if(keis.chk.isReg(resino, keis.c.REG_PTN.IS_JUMIN)){
			
			var date      = new Date();			//날짜 객체
		    var year      = date.getFullYear(); //올해
		    var month     = date.getMonth()+1;	//이번달
		    var day       = date.getDate();		//현재일자

		    var jumin1    = resino.substring(0,6); //주민번호 앞자리
		    var jumin2    = resino.substring(6,13); //주민번호 뒷자리
		    
		    var juminType = jumin2.substr(0,1);  //2000년 이후 출생 구분을 위해
		    var bYear     = ''; //출생 년

		    if(juminType == '1' || juminType == '2' || juminType == '5' || juminType == '6'){
		        bYear = '19' + jumin1;
		    }else
		    if(juminType == '3' || juminType == '4' || juminType == '7' || juminType == '8'){
		        bYear = '20' + jumin1;
		    }else{
		    	alert('주민등록번호를 확인해 주십시오.');
		    	return false;
		    }

		    var fullDate  = year;
		        fullDate += (month < 10) ? "0" + month : ""+ month;
		        fullDate += (day   < 10) ? "0" + day   : ""+ day;

		    age = Number(fullDate) - Number(bYear);
		    age =  parseInt(age/10000);
			
		}
		
		return age;
	},
	
	/**
	 * F: 체크박스 전체 선택 해제 합니다.
	 * @param {String} 기준이 되는 element Id
	 * @param {String} 전체 선택할 체크박스 name
	 * @return  없음
	 */	
	chkboxFixChk : function (allchk, chk){
	    var all = document.getElementById(allchk);
	    var chk = document.getElementsByName(chk);

	    if( all.checked == true){
	        for( var i=0; i<chk.length; i++ ){
	            chk[i].checked = true;
	        }
	    }else{
	        for( var j=0; j<chk.length; j++ ){
	            chk[j].checked = false;
	        }
	    }
	},
	
	
	/**
	 * F: 체크박스 전체 선택 해제 합니다.
	 * @param {String} 이동할 대상 Id
	 * @return  없음
	 */	
	focus : function (objectName){
	    document.getElementById(objectName).focus();
	},
	
	
	/**
	 * F: 라디오 버튼을 전체 선택 해제 합니다.
	 * @param {boolean} flag 해제 선택
	 * @param {String} chk 해제 선택할 대상 이름 
	 * @return  없음
	 */	
	chkboxChk : function (flag, chk){
	    var chk = document.getElementsByName(chk);

	    for( var j=0; j<chk.length; j++ ){
            chk[j].checked = flag;
        }
	},
	
	
	/**
	 * F: 라디오 버튼을 전체 선택 해제 합니다.
	 * @param {String} 라디오버튼 이름
	 * @return  {String} 라디오 Value
	 */	
	getRadioValue : function (name){
	    var radioElements = document.getElementsByName(name);
	    var radioValue = "";
	    
	    for( var i=0; i<radioElements.length; i++ ){
            if(radioElements[i].checked) radioValue = radioElements[i].value;
        }
	    
	    return radioValue;
	},
	

	/**
	 * F: 셀렉트박스 선택된 값을 가져옵니다..
	 * @param {String} 라디오버튼 이름
	 * @return  {String} 라디오 Value
	 */	
	getSelectBoxValue : function (name){
	    var selectElements = document.getElementsByName(name);
	    var radioValue = "";
	                    
	    for( var i=0; i<selectElements.length; i++ ){
            if(selectElements[i].selected)radioValue = selectElements[i].value;
        }
	    
	    return radioValue;
	},
	
	
	/**
	 * F: 라디오박스 선택된 값을 가져옵니다..
	 * @param {String} 라디오버튼 이름
	 * @return  {String} 라디오 Value
	 */	
	getRadaioBoxValue : function (name){
	    var radioElements = document.getElementsByName(name);
	    var radioValue = "";
	    
	    for( var i=0; i<radioElements.length; i++ ){
            if(radioElements[i].checked) radioValue = radioElements[i].value;
        }
	    
	    return radioValue;
	},
	
	
	/**
	 * F: 화면 가로, 세로 사이즈
	 * @param 없음 
	 * @return  [int, int]
	 */	
	page_size : function(){
		var de = document.documentElement;
		var w = window.innerWidth || self.innerWidth || (de&&de.clientWidth) || document.body.clientWidth;
		var h = window.innerHeight || self.innerHeight || (de&&de.clientHeight) || document.body.clientHeight
		return [w,h];
	},
	
	
	/**
	 * F: 자식윈도우 닫기
	 * @param  {Object} 자식윈도우 Object
	 * @return 없음
	 */	
	
	closeWindow : function (childWin) {
	   for(i=0; i<childWin.length; i++) {
	      if("undefined" != typeof(childWin[i])) {
	         childWin[i].close();
	      }
	   }
	}
}
