<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html><html lang="ko">
<head>
        <title>인재 검색 - 사람인</title>    <meta http-equiv="X-UA-Compatible" content="IE=Edge" >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" ><script type="text/javascript">(window.NREUM||(NREUM={})).loader_config={xpid:"Ug4CWFFXGwABVlBXAwE="};window.NREUM||(NREUM={}),__nr_require=function(t,n,e){function r(e){if(!n[e]){var o=n[e]={exports:{}};t[e][0].call(o.exports,function(n){var o=t[e][1][n];return r(o||n)},o,o.exports)}return n[e].exports}if("function"==typeof __nr_require)return __nr_require;for(var o=0;o<e.length;o++)r(e[o]);return r}({1:[function(t,n,e){function r(t){try{s.console&&console.log(t)}catch(n){}}var o,i=t("ee"),a=t(18),s={};try{o=localStorage.getItem("__nr_flags").split(","),console&&"function"==typeof console.log&&(s.console=!0,o.indexOf("dev")!==-1&&(s.dev=!0),o.indexOf("nr_dev")!==-1&&(s.nrDev=!0))}catch(c){}s.nrDev&&i.on("internal-error",function(t){r(t.stack)}),s.dev&&i.on("fn-err",function(t,n,e){r(e.stack)}),s.dev&&(r("NR AGENT IN DEVELOPMENT MODE"),r("flags: "+a(s,function(t,n){return t}).join(", ")))},{}],2:[function(t,n,e){function r(t,n,e,r,s){try{p?p-=1:o(s||new UncaughtException(t,n,e),!0)}catch(f){try{i("ierr",[f,c.now(),!0])}catch(d){}}return"function"==typeof u&&u.apply(this,a(arguments))}function UncaughtException(t,n,e){this.message=t||"Uncaught error with no additional information",this.sourceURL=n,this.line=e}function o(t,n){var e=n?null:c.now();i("err",[t,e])}var i=t("handle"),a=t(19),s=t("ee"),c=t("loader"),f=t("gos"),u=window.onerror,d=!1,l="nr@seenError",p=0;c.features.err=!0,t(1),window.onerror=r;try{throw new Error}catch(h){"stack"in h&&(t(8),t(7),"addEventListener"in window&&t(5),c.xhrWrappable&&t(9),d=!0)}s.on("fn-start",function(t,n,e){d&&(p+=1)}),s.on("fn-err",function(t,n,e){d&&!e[l]&&(f(e,l,function(){return!0}),this.thrown=!0,o(e))}),s.on("fn-end",function(){d&&!this.thrown&&p>0&&(p-=1)}),s.on("internal-error",function(t){i("ierr",[t,c.now(),!0])})},{}],3:[function(t,n,e){t("loader").features.ins=!0},{}],4:[function(t,n,e){function r(t){}if(window.performance&&window.performance.timing&&window.performance.getEntriesByType){var o=t("ee"),i=t("handle"),a=t(8),s=t(7),c="learResourceTimings",f="addEventListener",u="resourcetimingbufferfull",d="bstResource",l="resource",p="-start",h="-end",m="fn"+p,w="fn"+h,v="bstTimer",y="pushState",g=t("loader");g.features.stn=!0,t(6);var x=NREUM.o.EV;o.on(m,function(t,n){var e=t[0];e instanceof x&&(this.bstStart=g.now())}),o.on(w,function(t,n){var e=t[0];e instanceof x&&i("bst",[e,n,this.bstStart,g.now()])}),a.on(m,function(t,n,e){this.bstStart=g.now(),this.bstType=e}),a.on(w,function(t,n){i(v,[n,this.bstStart,g.now(),this.bstType])}),s.on(m,function(){this.bstStart=g.now()}),s.on(w,function(t,n){i(v,[n,this.bstStart,g.now(),"requestAnimationFrame"])}),o.on(y+p,function(t){this.time=g.now(),this.startPath=location.pathname+location.hash}),o.on(y+h,function(t){i("bstHist",[location.pathname+location.hash,this.startPath,this.time])}),f in window.performance&&(window.performance["c"+c]?window.performance[f](u,function(t){i(d,[window.performance.getEntriesByType(l)]),window.performance["c"+c]()},!1):window.performance[f]("webkit"+u,function(t){i(d,[window.performance.getEntriesByType(l)]),window.performance["webkitC"+c]()},!1)),document[f]("scroll",r,{passive:!0}),document[f]("keypress",r,!1),document[f]("click",r,!1)}},{}],5:[function(t,n,e){function r(t){for(var n=t;n&&!n.hasOwnProperty(u);)n=Object.getPrototypeOf(n);n&&o(n)}function o(t){s.inPlace(t,[u,d],"-",i)}function i(t,n){return t[1]}var a=t("ee").get("events"),s=t(21)(a,!0),c=t("gos"),f=XMLHttpRequest,u="addEventListener",d="removeEventListener";n.exports=a,"getPrototypeOf"in Object?(r(document),r(window),r(f.prototype)):f.prototype.hasOwnProperty(u)&&(o(window),o(f.prototype)),a.on(u+"-start",function(t,n){var e=t[1],r=c(e,"nr@wrapped",function(){function t(){if("function"==typeof e.handleEvent)return e.handleEvent.apply(e,arguments)}var n={object:t,"function":e}[typeof e];return n?s(n,"fn-",null,n.name||"anonymous"):e});this.wrapped=t[1]=r}),a.on(d+"-start",function(t){t[1]=this.wrapped||t[1]})},{}],6:[function(t,n,e){var r=t("ee").get("history"),o=t(21)(r);n.exports=r;var i=window.history&&window.history.constructor&&window.history.constructor.prototype,a=window.history;i&&i.pushState&&i.replaceState&&(a=i),o.inPlace(a,["pushState","replaceState"],"-")},{}],7:[function(t,n,e){var r=t("ee").get("raf"),o=t(21)(r),i="equestAnimationFrame";n.exports=r,o.inPlace(window,["r"+i,"mozR"+i,"webkitR"+i,"msR"+i],"raf-"),r.on("raf-start",function(t){t[0]=o(t[0],"fn-")})},{}],8:[function(t,n,e){function r(t,n,e){t[0]=a(t[0],"fn-",null,e)}function o(t,n,e){this.method=e,this.timerDuration=isNaN(t[1])?0:+t[1],t[0]=a(t[0],"fn-",this,e)}var i=t("ee").get("timer"),a=t(21)(i),s="setTimeout",c="setInterval",f="clearTimeout",u="-start",d="-";n.exports=i,a.inPlace(window,[s,"setImmediate"],s+d),a.inPlace(window,[c],c+d),a.inPlace(window,[f,"clearImmediate"],f+d),i.on(c+u,r),i.on(s+u,o)},{}],9:[function(t,n,e){function r(t,n){d.inPlace(n,["onreadystatechange"],"fn-",s)}function o(){var t=this,n=u.context(t);t.readyState>3&&!n.resolved&&(n.resolved=!0,u.emit("xhr-resolved",[],t)),d.inPlace(t,y,"fn-",s)}function i(t){g.push(t),h&&(b?b.then(a):w?w(a):(E=-E,R.data=E))}function a(){for(var t=0;t<g.length;t++)r([],g[t]);g.length&&(g=[])}function s(t,n){return n}function c(t,n){for(var e in t)n[e]=t[e];return n}t(5);var f=t("ee"),u=f.get("xhr"),d=t(21)(u),l=NREUM.o,p=l.XHR,h=l.MO,m=l.PR,w=l.SI,v="readystatechange",y=["onload","onerror","onabort","onloadstart","onloadend","onprogress","ontimeout"],g=[];n.exports=u;var x=window.XMLHttpRequest=function(t){var n=new p(t);try{u.emit("new-xhr",[n],n),n.addEventListener(v,o,!1)}catch(e){try{u.emit("internal-error",[e])}catch(r){}}return n};if(c(p,x),x.prototype=p.prototype,d.inPlace(x.prototype,["open","send"],"-xhr-",s),u.on("send-xhr-start",function(t,n){r(t,n),i(n)}),u.on("open-xhr-start",r),h){var b=m&&m.resolve();if(!w&&!m){var E=1,R=document.createTextNode(E);new h(a).observe(R,{characterData:!0})}}else f.on("fn-end",function(t){t[0]&&t[0].type===v||a()})},{}],10:[function(t,n,e){function r(){var t=window.NREUM,n=t.info.accountID||null,e=t.info.agentID||null,r=t.info.trustKey||null,i="btoa"in window&&"function"==typeof window.btoa;if(!n||!e||!i)return null;var a={v:[0,1],d:{ty:"Browser",ac:n,ap:e,id:o.generateCatId(),tr:o.generateCatId(),ti:Date.now()}};return r&&n!==r&&(a.d.tk=r),btoa(JSON.stringify(a))}var o=t(16);n.exports={generateTraceHeader:r}},{}],11:[function(t,n,e){function r(t){var n=this.params,e=this.metrics;if(!this.ended){this.ended=!0;for(var r=0;r<p;r++)t.removeEventListener(l[r],this.listener,!1);n.aborted||(e.duration=s.now()-this.startTime,this.loadCaptureCalled||4!==t.readyState?null==n.status&&(n.status=0):a(this,t),e.cbTime=this.cbTime,d.emit("xhr-done",[t],t),c("xhr",[n,e,this.startTime]))}}function o(t,n){var e=t.responseType;if("json"===e&&null!==n)return n;var r="arraybuffer"===e||"blob"===e||"json"===e?t.response:t.responseText;return w(r)}function i(t,n){var e=f(n),r=t.params;r.host=e.hostname+":"+e.port,r.pathname=e.pathname,t.sameOrigin=e.sameOrigin}function a(t,n){t.params.status=n.status;var e=o(n,t.lastSize);if(e&&(t.metrics.rxSize=e),t.sameOrigin){var r=n.getResponseHeader("X-NewRelic-App-Data");r&&(t.params.cat=r.split(", ").pop())}t.loadCaptureCalled=!0}var s=t("loader");if(s.xhrWrappable){var c=t("handle"),f=t(12),u=t(10).generateTraceHeader,d=t("ee"),l=["load","error","abort","timeout"],p=l.length,h=t("id"),m=t(15),w=t(14),v=window.XMLHttpRequest;s.features.xhr=!0,t(9),d.on("new-xhr",function(t){var n=this;n.totalCbs=0,n.called=0,n.cbTime=0,n.end=r,n.ended=!1,n.xhrGuids={},n.lastSize=null,n.loadCaptureCalled=!1,t.addEventListener("load",function(e){a(n,t)},!1),m&&(m>34||m<10)||window.opera||t.addEventListener("progress",function(t){n.lastSize=t.loaded},!1)}),d.on("open-xhr-start",function(t){this.params={method:t[0]},i(this,t[1]),this.metrics={}}),d.on("open-xhr-end",function(t,n){"loader_config"in NREUM&&"xpid"in NREUM.loader_config&&this.sameOrigin&&n.setRequestHeader("X-NewRelic-ID",NREUM.loader_config.xpid);var e=!1;if("init"in NREUM&&"distributed_tracing"in NREUM.init&&(e=!!NREUM.init.distributed_tracing.enabled),e&&this.sameOrigin){var r=u();r&&n.setRequestHeader("newrelic",r)}}),d.on("send-xhr-start",function(t,n){var e=this.metrics,r=t[0],o=this;if(e&&r){var i=w(r);i&&(e.txSize=i)}this.startTime=s.now(),this.listener=function(t){try{"abort"!==t.type||o.loadCaptureCalled||(o.params.aborted=!0),("load"!==t.type||o.called===o.totalCbs&&(o.onloadCalled||"function"!=typeof n.onload))&&o.end(n)}catch(e){try{d.emit("internal-error",[e])}catch(r){}}};for(var a=0;a<p;a++)n.addEventListener(l[a],this.listener,!1)}),d.on("xhr-cb-time",function(t,n,e){this.cbTime+=t,n?this.onloadCalled=!0:this.called+=1,this.called!==this.totalCbs||!this.onloadCalled&&"function"==typeof e.onload||this.end(e)}),d.on("xhr-load-added",function(t,n){var e=""+h(t)+!!n;this.xhrGuids&&!this.xhrGuids[e]&&(this.xhrGuids[e]=!0,this.totalCbs+=1)}),d.on("xhr-load-removed",function(t,n){var e=""+h(t)+!!n;this.xhrGuids&&this.xhrGuids[e]&&(delete this.xhrGuids[e],this.totalCbs-=1)}),d.on("addEventListener-end",function(t,n){n instanceof v&&"load"===t[0]&&d.emit("xhr-load-added",[t[1],t[2]],n)}),d.on("removeEventListener-end",function(t,n){n instanceof v&&"load"===t[0]&&d.emit("xhr-load-removed",[t[1],t[2]],n)}),d.on("fn-start",function(t,n,e){n instanceof v&&("onload"===e&&(this.onload=!0),("load"===(t[0]&&t[0].type)||this.onload)&&(this.xhrCbStart=s.now()))}),d.on("fn-end",function(t,n){this.xhrCbStart&&d.emit("xhr-cb-time",[s.now()-this.xhrCbStart,this.onload,n],n)})}},{}],12:[function(t,n,e){n.exports=function(t){var n=document.createElement("a"),e=window.location,r={};n.href=t,r.port=n.port;var o=n.href.split("://");!r.port&&o[1]&&(r.port=o[1].split("/")[0].split("@").pop().split(":")[1]),r.port&&"0"!==r.port||(r.port="https"===o[0]?"443":"80"),r.hostname=n.hostname||e.hostname,r.pathname=n.pathname,r.protocol=o[0],"/"!==r.pathname.charAt(0)&&(r.pathname="/"+r.pathname);var i=!n.protocol||":"===n.protocol||n.protocol===e.protocol,a=n.hostname===document.domain&&n.port===e.port;return r.sameOrigin=i&&(!n.hostname||a),r}},{}],13:[function(t,n,e){function r(){}function o(t,n,e){return function(){return i(t,[f.now()].concat(s(arguments)),n?null:this,e),n?void 0:this}}var i=t("handle"),a=t(18),s=t(19),c=t("ee").get("tracer"),f=t("loader"),u=NREUM;"undefined"==typeof window.newrelic&&(newrelic=u);var d=["setPageViewName","setCustomAttribute","setErrorHandler","finished","addToTrace","inlineHit","addRelease"],l="api-",p=l+"ixn-";a(d,function(t,n){u[n]=o(l+n,!0,"api")}),u.addPageAction=o(l+"addPageAction",!0),u.setCurrentRouteName=o(l+"routeName",!0),n.exports=newrelic,u.interaction=function(){return(new r).get()};var h=r.prototype={createTracer:function(t,n){var e={},r=this,o="function"==typeof n;return i(p+"tracer",[f.now(),t,e],r),function(){if(c.emit((o?"":"no-")+"fn-start",[f.now(),r,o],e),o)try{return n.apply(this,arguments)}catch(t){throw c.emit("fn-err",[arguments,this,t],e),t}finally{c.emit("fn-end",[f.now()],e)}}}};a("actionText,setName,setAttribute,save,ignore,onEnd,getContext,end,get".split(","),function(t,n){h[n]=o(p+n)}),newrelic.noticeError=function(t,n){"string"==typeof t&&(t=new Error(t)),i("err",[t,f.now(),!1,n])}},{}],14:[function(t,n,e){n.exports=function(t){if("string"==typeof t&&t.length)return t.length;if("object"==typeof t){if("undefined"!=typeof ArrayBuffer&&t instanceof ArrayBuffer&&t.byteLength)return t.byteLength;if("undefined"!=typeof Blob&&t instanceof Blob&&t.size)return t.size;if(!("undefined"!=typeof FormData&&t instanceof FormData))try{return JSON.stringify(t).length}catch(n){return}}}},{}],15:[function(t,n,e){var r=0,o=navigator.userAgent.match(/Firefox[\/\s](\d+\.\d+)/);o&&(r=+o[1]),n.exports=r},{}],16:[function(t,n,e){function r(){function t(){return n?15&n[e++]:16*Math.random()|0}var n=null,e=0,r=window.crypto||window.msCrypto;r&&r.getRandomValues&&(n=r.getRandomValues(new Uint8Array(31)));for(var o,i="xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx",a="",s=0;s<i.length;s++)o=i[s],"x"===o?a+=t().toString(16):"y"===o?(o=3&t()|8,a+=o.toString(16)):a+=o;return a}function o(){function t(){return n?15&n[e++]:16*Math.random()|0}var n=null,e=0,r=window.crypto||window.msCrypto;r&&r.getRandomValues&&Uint8Array&&(n=r.getRandomValues(new Uint8Array(31)));for(var o=[],i=0;i<16;i++)o.push(t().toString(16));return o.join("")}n.exports={generateUuid:r,generateCatId:o}},{}],17:[function(t,n,e){function r(t,n){if(!o)return!1;if(t!==o)return!1;if(!n)return!0;if(!i)return!1;for(var e=i.split("."),r=n.split("."),a=0;a<r.length;a++)if(r[a]!==e[a])return!1;return!0}var o=null,i=null,a=/Version\/(\S+)\s+Safari/;if(navigator.userAgent){var s=navigator.userAgent,c=s.match(a);c&&s.indexOf("Chrome")===-1&&s.indexOf("Chromium")===-1&&(o="Safari",i=c[1])}n.exports={agent:o,version:i,match:r}},{}],18:[function(t,n,e){function r(t,n){var e=[],r="",i=0;for(r in t)o.call(t,r)&&(e[i]=n(r,t[r]),i+=1);return e}var o=Object.prototype.hasOwnProperty;n.exports=r},{}],19:[function(t,n,e){function r(t,n,e){n||(n=0),"undefined"==typeof e&&(e=t?t.length:0);for(var r=-1,o=e-n||0,i=Array(o<0?0:o);++r<o;)i[r]=t[n+r];return i}n.exports=r},{}],20:[function(t,n,e){n.exports={exists:"undefined"!=typeof window.performance&&window.performance.timing&&"undefined"!=typeof window.performance.timing.navigationStart}},{}],21:[function(t,n,e){function r(t){return!(t&&t instanceof Function&&t.apply&&!t[a])}var o=t("ee"),i=t(19),a="nr@original",s=Object.prototype.hasOwnProperty,c=!1;n.exports=function(t,n){function e(t,n,e,o){function nrWrapper(){var r,a,s,c;try{a=this,r=i(arguments),s="function"==typeof e?e(r,a):e||{}}catch(f){l([f,"",[r,a,o],s])}u(n+"start",[r,a,o],s);try{return c=t.apply(a,r)}catch(d){throw u(n+"err",[r,a,d],s),d}finally{u(n+"end",[r,a,c],s)}}return r(t)?t:(n||(n=""),nrWrapper[a]=t,d(t,nrWrapper),nrWrapper)}function f(t,n,o,i){o||(o="");var a,s,c,f="-"===o.charAt(0);for(c=0;c<n.length;c++)s=n[c],a=t[s],r(a)||(t[s]=e(a,f?s+o:o,i,s))}function u(e,r,o){if(!c||n){var i=c;c=!0;try{t.emit(e,r,o,n)}catch(a){l([a,e,r,o])}c=i}}function d(t,n){if(Object.defineProperty&&Object.keys)try{var e=Object.keys(t);return e.forEach(function(e){Object.defineProperty(n,e,{get:function(){return t[e]},set:function(n){return t[e]=n,n}})}),n}catch(r){l([r])}for(var o in t)s.call(t,o)&&(n[o]=t[o]);return n}function l(n){try{t.emit("internal-error",n)}catch(e){}}return t||(t=o),e.inPlace=f,e.flag=a,e}},{}],ee:[function(t,n,e){function r(){}function o(t){function n(t){return t&&t instanceof r?t:t?c(t,s,i):i()}function e(e,r,o,i){if(!l.aborted||i){t&&t(e,r,o);for(var a=n(o),s=m(e),c=s.length,f=0;f<c;f++)s[f].apply(a,r);var d=u[g[e]];return d&&d.push([x,e,r,a]),a}}function p(t,n){y[t]=m(t).concat(n)}function h(t,n){var e=y[t];if(e)for(var r=0;r<e.length;r++)e[r]===n&&e.splice(r,1)}function m(t){return y[t]||[]}function w(t){return d[t]=d[t]||o(e)}function v(t,n){f(t,function(t,e){n=n||"feature",g[e]=n,n in u||(u[n]=[])})}var y={},g={},x={on:p,addEventListener:p,removeEventListener:h,emit:e,get:w,listeners:m,context:n,buffer:v,abort:a,aborted:!1};return x}function i(){return new r}function a(){(u.api||u.feature)&&(l.aborted=!0,u=l.backlog={})}var s="nr@context",c=t("gos"),f=t(18),u={},d={},l=n.exports=o();l.backlog=u},{}],gos:[function(t,n,e){function r(t,n,e){if(o.call(t,n))return t[n];var r=e();if(Object.defineProperty&&Object.keys)try{return Object.defineProperty(t,n,{value:r,writable:!0,enumerable:!1}),r}catch(i){}return t[n]=r,r}var o=Object.prototype.hasOwnProperty;n.exports=r},{}],handle:[function(t,n,e){function r(t,n,e,r){o.buffer([t],r),o.emit(t,n,e)}var o=t("ee").get("handle");n.exports=r,r.ee=o},{}],id:[function(t,n,e){function r(t){var n=typeof t;return!t||"object"!==n&&"function"!==n?-1:t===window?0:a(t,i,function(){return o++})}var o=1,i="nr@id",a=t("gos");n.exports=r},{}],loader:[function(t,n,e){function r(){if(!E++){var t=b.info=NREUM.info,n=p.getElementsByTagName("script")[0];if(setTimeout(u.abort,3e4),!(t&&t.licenseKey&&t.applicationID&&n))return u.abort();f(g,function(n,e){t[n]||(t[n]=e)}),c("mark",["onload",a()+b.offset],null,"api");var e=p.createElement("script");e.src="https://"+t.agent,n.parentNode.insertBefore(e,n)}}function o(){"complete"===p.readyState&&i()}function i(){c("mark",["domContent",a()+b.offset],null,"api")}function a(){return R.exists&&performance.now?Math.round(performance.now()):(s=Math.max((new Date).getTime(),s))-b.offset}var s=(new Date).getTime(),c=t("handle"),f=t(18),u=t("ee"),d=t(17),l=window,p=l.document,h="addEventListener",m="attachEvent",w=l.XMLHttpRequest,v=w&&w.prototype;NREUM.o={ST:setTimeout,SI:l.setImmediate,CT:clearTimeout,XHR:w,REQ:l.Request,EV:l.Event,PR:l.Promise,MO:l.MutationObserver};var y=""+location,g={beacon:"bam.nr-data.net",errorBeacon:"bam.nr-data.net",agent:"js-agent.newrelic.com/nr-1130.min.js"},x=w&&v&&v[h]&&!/CriOS/.test(navigator.userAgent),b=n.exports={offset:s,now:a,origin:y,features:{},xhrWrappable:x,userAgent:d};t(13),p[h]?(p[h]("DOMContentLoaded",i,!1),l[h]("load",r,!1)):(p[m]("onreadystatechange",o),l[m]("onload",r)),c("mark",["firstbyte",s],null,"api");var E=0,R=t(20)},{}]},{},["loader",2,11,4,3]);</script>
<meta http-equiv="Content-Language" content="ko-KR" >
<meta name="robots" content="nofollow" >    <meta property="og:title" content="인재 검색 - 사람인" >
<meta property="og:image" content="//www.saraminimage.co.kr/logo/saraminsnslogo.png" >
<meta property="og:site_name" content="사람인" >
<meta property="og:type" content="website" >
<meta property="og:locale" content="ko_KR" >
<meta property="fb:app_id" content="1593727887570039" >
<meta property="og:image:width" content="200" >
<meta property="og:image:height" content="200" >    <link href="android-app://kr.co.saramin.brandapp/http/m.saramin.co.kr/talent/search" rel="alternate" >
<link href="/css/jquery-ui_custom.css?v=20190718_2" media="all" rel="stylesheet" type="text/css" >
<link href="ios-app://739013038/http/m.saramin.co.kr/talent/search" rel="alternate" >
<link href="http://m.saramin.co.kr/talent/search" rel="alternate" type="text/html" title="mobile optimized version" media="only screen and (max-width: 640px)" >
<link href="/sri_css/company/contents.css?v=20190718_2" media="all" rel="stylesheet" type="text/css" >
<link href="/sri_css/company/pattern.css?v=20190718_2" media="all" rel="stylesheet" type="text/css" >
<link href="/sri_css/company/layout.css?v=20190718_2" media="all" rel="stylesheet" type="text/css" >
<link href="/css/reproduct.css?20190718_2" media="all" rel="stylesheet" type="text/css" >
<link href="/sri_css/company/talent.css?v=20190718_2" media="screen,print" rel="stylesheet" type="text/css" >
<link href="/favicon.ico?ver=2" rel="favicon" >
<link href="/favicon.ico?ver=2" rel="icon" type="image/x-icon" >
<link href="/favicon.ico?ver=2" rel="shortcut icon" type="image/x-icon" >    
    <script type='text/javascript'>
var googleSlotList = {};

var googletag = googletag || {};
googletag.cmd = googletag.cmd || [];

(function() {
var useSSL = 'https:' == document.location.protocol;
var src = (useSSL ? 'https:' : 'http:') + '//www.googletagservices.com/tag/js/gpt.js';
document.write('<scr' + 'ipt src="' + src + '"></scr' + 'ipt>');
})();
</script>

<script type='text/javascript'>
googletag.cmd.push(function() {
                        googleSlotList['div-gpt-ad-1511847708022-0'] = googletag.defineSlot('/61280259/1000-list_120x240', [120, 240], 'div-gpt-ad-1511847708022-0').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1400664864294-0'] = googletag.defineSlot('/61280259/1000-list_120x600', [120, 600], 'div-gpt-ad-1400664864294-0').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1511846653839-0'] = googletag.defineSlot('/61280259/area-list_120x240', [120, 240], 'div-gpt-ad-1511846653839-0').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1400664864294-2'] = googletag.defineSlot('/61280259/area-list_120x600', [120, 600], 'div-gpt-ad-1400664864294-2').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1400664864294-3'] = googletag.defineSlot('/61280259/area-list_728x90', [728, 90], 'div-gpt-ad-1400664864294-3').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1511845706684-0'] = googletag.defineSlot('/61280259/category-list_120x240', [120, 240], 'div-gpt-ad-1511845706684-0').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1400664864294-4'] = googletag.defineSlot('/61280259/category-list_120x600', [120, 600], 'div-gpt-ad-1400664864294-4').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1400664864294-5'] = googletag.defineSlot('/61280259/category-list_728x90', [728, 90], 'div-gpt-ad-1400664864294-5').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1426214085634-0'] = googletag.defineSlot('/61280259/Contest-box_left_307x281', [307, 281], 'div-gpt-ad-1426214085634-0').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1426214150723-0'] = googletag.defineSlot('/61280259/Contest-box_middle_307x281', [307, 281], 'div-gpt-ad-1426214150723-0').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1426214197444-0'] = googletag.defineSlot('/61280259/Contest-box_right_307x281', [307, 281], 'div-gpt-ad-1426214197444-0').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1511845587070-0'] = googletag.defineSlot('/61280259/CS_120x240', [120, 240], 'div-gpt-ad-1511845587070-0').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1400664864294-6'] = googletag.defineSlot('/61280259/CS_120x600', [120, 600], 'div-gpt-ad-1400664864294-6').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1400664864294-7'] = googletag.defineSlot('/61280259/CS_728x90', [728, 90], 'div-gpt-ad-1400664864294-7').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1511846339912-0'] = googletag.defineSlot('/61280259/etc_120x240', [120, 240], 'div-gpt-ad-1511846339912-0').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1400664864294-10'] = googletag.defineSlot('/61280259/etc_120x600', [120, 600], 'div-gpt-ad-1400664864294-10').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1400664864294-11'] = googletag.defineSlot('/61280259/etc_728x90', [728, 90], 'div-gpt-ad-1400664864294-11').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1550638948072-0'] = googletag.defineSlot('/61280259/Login_728x90', [728, 90], 'div-gpt-ad-1550638948072-0').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1400664864294-12'] = googletag.defineSlot('/61280259/logout_120x600', [120, 600], 'div-gpt-ad-1400664864294-12').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1400664864294-13'] = googletag.defineSlot('/61280259/logout_728x90', [728, 90], 'div-gpt-ad-1400664864294-13').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1533172458701-0'] = googletag.defineSlot('/61280259/Main-Big_108x360', [108, 360], 'div-gpt-ad-1533172458701-0').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1425521803564-0'] = googletag.defineSlot('/61280259/Main-Big_543x113', [543, 113], 'div-gpt-ad-1425521803564-0').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1426837722822-0'] = googletag.defineSlot('/61280259/Main-image_230x142', [230, 142], 'div-gpt-ad-1426837722822-0').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1553056482914-0'] = googletag.defineSlot('/61280259/member_120x240', [120, 240], 'div-gpt-ad-1553056482914-0').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1400664864294-14'] = googletag.defineSlot('/61280259/member_120x600', [120, 600], 'div-gpt-ad-1400664864294-14').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1400664864294-15'] = googletag.defineSlot('/61280259/member_728x90', [728, 90], 'div-gpt-ad-1400664864294-15').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1550543155169-0'] = googletag.defineSlot('/61280259/memcom_120x240', [120, 240], 'div-gpt-ad-1550543155169-0').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1400664864294-16'] = googletag.defineSlot('/61280259/memcom_120x600', [120, 600], 'div-gpt-ad-1400664864294-16').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1400664864294-17'] = googletag.defineSlot('/61280259/memcom_728x90', [728, 90], 'div-gpt-ad-1400664864294-17').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1511846020570-0'] = googletag.defineSlot('/61280259/profession-list_120x240', [120, 240], 'div-gpt-ad-1511846020570-0').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1400664864294-18'] = googletag.defineSlot('/61280259/profession-list_120x600', [120, 600], 'div-gpt-ad-1400664864294-18').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1400664864294-19'] = googletag.defineSlot('/61280259/profession-list_728x90', [728, 90], 'div-gpt-ad-1400664864294-19').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1400664864294-20'] = googletag.defineSlot('/61280259/rapid-view_120x600', [120, 600], 'div-gpt-ad-1400664864294-20').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1511933728215-0'] = googletag.defineSlot('/61280259/recruit-view_120x240', [120, 240], 'div-gpt-ad-1511933728215-0').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1400664864294-22'] = googletag.defineSlot('/61280259/recruit-view_120x600', [120, 600], 'div-gpt-ad-1400664864294-22').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1547596188605-0'] = googletag.defineSlot('/61280259/recruit-view_250x250', [250, 250], 'div-gpt-ad-1547596188605-0').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1400664864294-23'] = googletag.defineSlot('/61280259/recruit-view_728x90', [728, 90], 'div-gpt-ad-1400664864294-23').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1374566074903-2'] = googletag.defineSlot('/61280259/SearchLeft120x600', [120, 600], 'div-gpt-ad-1374566074903-2').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1384850668630-1'] = googletag.defineSlot('/61280259/SearchTop_468x60', [468, 60], 'div-gpt-ad-1384850668630-1').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1550638841234-0'] = googletag.defineSlot('/61280259/successHelper_728x90', [728, 90], 'div-gpt-ad-1550638841234-0').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1553056822382-0'] = googletag.defineSlot('/61280259/talent_120x240', [120, 240], 'div-gpt-ad-1553056822382-0').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1400664864294-24'] = googletag.defineSlot('/61280259/talent_120x600', [120, 600], 'div-gpt-ad-1400664864294-24').addService(googletag.pubads());
                    googleSlotList['div-gpt-ad-1400664864294-25'] = googletag.defineSlot('/61280259/talent_728x90', [728, 90], 'div-gpt-ad-1400664864294-25').addService(googletag.pubads());
                googletag.enableServices();
    googletag.pubads().addEventListener('slotRenderEnded', function(event) {
        if (!event.isEmpty) {
            var domId = event.slot.getSlotId().getDomId();
            if (!!document.getElementById(domId + '-wrapper')) {
                document.getElementById(domId + '-wrapper').querySelector('.google-standby-banner').style.display = 'none';
                document.getElementById(domId + '-inner').style.display = '';
            }
        }
    });
});
</script>
    <script type="text/javascript" src="//www.saraminimage.co.kr/js/libs/jquery-1.11.1.min.js"></script>
    <script type="text/javascript">var $j = jQuery.noConflict();</script>
    <script type="text/javascript" src="/js/libs/saramin/common.js?v=20190718_3"></script>
    <!--[if lt IE 9]> <script type="text/javascript" src="//www.saramin.co.kr/js/html5shiv.min.js"></script><![endif]-->
    <script type="text/javascript" src="//www.saraminimage.co.kr/js/libs/jquery.tinyscrollbar.min.js"></script>
    <script type="text/javascript" src="/js/ui-component.js?v=20190718_3"></script>
    <script type="text/javascript" src="/js/layout/default-layout.js?v=20190718_3"></script>
    <script type="text/javascript" src="/js/company-common-layout.js?v=20190718_3"></script>
    <script type="text/javascript" src="/js/company-common-layout.js?v=20190718_3"></script>
<script type="text/javascript">
    //<!--
        jQuery(document).ready(function ($) {
                $.ajax({
            data: {},
            url: '/zf_user/jobs/read-jobs/read-job-count',
            type: 'post'
        }).done(function (data) {
            $('#recently-recruit-count').html(data);
        });
        
        $('.btn_guide').on('click', function () {
            window.open('/zf_user/talent/search/guide', 'talentGuide', 'width=1100,height=800,scrollbars=no,location=no,toolbar=no');
            return false;
        });
    });
        //-->
</script>    <script>

  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-12546634-1', 'saramin.co.kr');
  ga('require', 'GTM-KN35GK2');
  ga('require','displayfeatures');
  ga('require', 'linkid');
  ga('send', 'pageview');

</script></head>
<body>
    <!-- skip navi -->
    <div id="skipnavigation">
        <a href="#content">본문 바로가기</a>
    </div>
    <!--// skip navi -->
    <header id="sri_header" class="header_position">
    <div class="wrap_logo">
    <a href="/" class="link_saramin" title="사람인 메인으로 가기"><span class="blind">사람인</span></a>
    <a href="/zf_user/memcom" class="title">기업서비스</a>
</div>    <div id="sri_gnb" class="wrap_menu primary sri_gnb_wrap_menu">
    <div class="blind">주요서비스 메뉴</div>
    <ul class="list_depth">
        <li class="depth">
            <a href="/zf_user/memcom/recruit/add" onmousedown="n_trackEvent('gnbmenu', 'button' , 'recruit-add', '')" class="link_depth">공고등록</a>
        </li>
        <li id="manage-nav" class="depth manage_nav"><!-- id는 임의로 정했습니다 -->
            <a href="/zf_user/company/recruit-manage?gnb_main=y" onmousedown="n_trackEvent('gnbmenu', 'button' , 'recruit-manage', '')" class="link_depth">공고<span>·</span>지원자관리</a>
            <div class="wrap_depth2">
                <div class="depth2_inner">
                    <a href="/zf_user/memcom/recruit/add" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'recruit-manage', 'add')" class="btn_depth2 _skip"><strong>공고 등록하기</strong></a>
                    <ul class="list_depth2">
                        <li><a href="/zf_user/company/recruit-manage/mode/entire" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'recruit-manage', 'entire')">전체공고</a>
                            <ul class="list_depth3">
                                <li><a href="/zf_user/company/recruit-manage" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'recruit-manage', 'ing')">· 진행중 공고</a></li>
                                <li><a href="/zf_user/company/recruit-manage/mode/standby" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'recruit-manage', 'standby')">· 대기중 공고</a></li>
                                <li><a href="/zf_user/company/recruit-manage/mode/end" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'recruit-manage', 'end')">· 마감된 공고</a></li>
                                <li><a href="/zf_user/company/recruit-manage/mode/incomplete" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'recruit-manage', 'incomplete')">· 미완성 공고</a></li>
                            </ul>
                        </li>
                        <li><a href="/zf_user/memcom/service-product" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'service-manage', 'recruit-service-manage')">유료서비스 관리</a></li>
                        <li><a href="/zf_user/memcom/service-manage/ai-recommend-history" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'service-manage', 'ai-recommend-histor')">추천 히스토리</a></li>
                        <li><a href="/zf_user/memcom/service-manage/keyword-service-history?result=total" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'service-manage', 'keyword-service-history')">검색키워드 상품 관리</a></li>
                        <li><a href="/zf_user/memcom/talent-manage/send-sms-email-history?top_menu_cd=recruit-manage" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'service-manage', 'send-sms-email-history')">문자·이메일 발송 내역</a></li>
                    </ul>
                    <div class="txt_desc"><img src="//www.saraminimage.co.kr/ui/layout/mypage_2016/pos_2th_txt.png" alt="공고 등록&amp;관리, 쉽고 빠르게 진행하세요! 사람인에서는 어렵지도 복잡하지도 않아요!"></div>
                </div>
            </div>
        </li>
        <li class="depth">
            <a href="/zf_user/talent/search" onmousedown="n_trackEvent('gnbmenu', 'button' , 'talent-search', '')" class="link_depth">인재검색</a>
        </li>
        <li id="recommend-nav" class="depth recommend_nav">
            <a href="/zf_user/talent-recommend" onmousedown="n_trackEvent('gnbmenu', 'button' , 'talent-recom', '')" class="link_depth">인재추천</a>
            <div class="wrap_depth2">
                <div class="depth2_inner">
                    <ul class="list_depth2">
                        <li><a href="/zf_user/talent-recommend" onmousedown="n_trackEvent('gnbmenu', 'button' , 'talent-recom', '')">인공지능 추천인재</a></li>
                        <li><a href="/zf_user/applicant/manage/recruit-recommend-redirect" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'talent-manage', 'pandora')">공고기반 추천인재</a></li>
                    </ul>
                    <div class="txt_desc"><img src="//www.saraminimage.co.kr/ui/layout/mypage_2016/pos_7th_txt.png" alt=""></div>
                </div>
            </div>
        </li>
        <li id="talent-nav" class="depth talent_nav"><!-- id는 임의로 정했습니다 -->
            <a href="/zf_user/memcom/talent-manage/scrap-talent" onmousedown="n_trackEvent('gnbmenu', 'button' , 'talent-manage', '')" class="link_depth">인재관리</a>
            <div class="wrap_depth2">
                <div class="depth2_inner">
                    <a href="/zf_user/talent/search" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'talent-manage', 'talent-search')" class="btn_depth2 _skip"><strong>인재 검색하기</strong></a>
                    <ul class="list_depth2">
                        <li><a href="/zf_user/memcom/talent-manage/scrap-talent" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'talent-manage', 'scrap-talent')">관심 인재</a></li>
                        <li><a href="/zf_user/memcom/talent-manage/today-talent" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'talent-manage', 'today-talent')">오늘 본 인재</a></li>
                        <li><a href="/zf_user/memcom/talent-manage/serv-talent" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'talent-manage', 'serv-talent')">연락처확인 인재</a></li>
                        <li><a href="/zf_user/memcom/service-manage/talent-service-history" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'talent-manage', 'talent-service-history')">인재정보 상품 사용 내역</a></li>
                        <li><a href="/zf_user/memcom/talent-manage/send-sms-email-history" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'talent-manage', 'send-sms-email-history')">문자·이메일 발송 내역</a></li>
                    </ul>
                    <div class="txt_desc"><img src="//www.saraminimage.co.kr/ui/layout/mypage_2016/pos_4th_txt.png" alt="꼭 필요하고 적합한 인재를 찾을 수 있도록! 인재검색이 쉽고 간편하게 재탄생했습니다!"></div>
                </div>
            </div>
        </li>
        <li id="exam-nav" class="depth exam_nav"><!-- id는 임의로 정했습니다 -->
            <a href="/zf_user/memcom/siat/exam-list" onmousedown="n_trackEvent('gnbmenu', 'button' , 'siat', '')" class="link_depth">인적성검사</a>
            <div class="wrap_depth2">
                <div class="depth2_inner">
                    <a href="/zf_user/memcom/siat?add_exam_immediately=y" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'siat-manage', 'add-exam')" class="btn_depth2"><strong>검사 신청하기</strong></a>
                    <ul class="list_depth2">
                        <li><a href="/zf_user/memcom/siat/exam-list" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'siat-manage', 'exam-list')">인적성검사 신청/관리</a></li>
                        <li><a href="/zf_user/memcom/service-manage/siat-use-history" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'siat-manage', 'siat-use-history')">인적성검사 사용내역</a></li>
                        <li><a href="/zf_user/service-guide/siat?type=utilize#utilize" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'goods', 'siat-description-utilize')">인적성검사 활용법</a></li>
                        <li><a href="/zf_user/service-guide/siat?type=process#process" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'goods', 'siat-description-process')">인적성검사 이용절차</a></li>
                    </ul>
                    <div class="txt_desc"><img src="//www.saraminimage.co.kr/ui/layout/mypage_2016/pos_5th_txt.png" alt="SIAT 혹시 의심가는 지원자가 있으신가요? 사람인 인적성검사를 통해 부적합한 인재를 걸러내 보세요!"></div>
                </div>
            </div>
        </li>
        <li id="interview-nav" class="depth interview_nav last_depth"><!-- id는 임의로 정했습니다 -->
            <a href="/zf_user/memcom/interview/main" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'interview-manage', '')" class="link_depth">면접관리</a>
            <div class="wrap_depth2">
                <div class="depth2_inner">
                    <a href="/zf_user/memcom/interview/write" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'interview-manage', 'add')" class="btn_depth2"><strong>면접 등록하기</strong></a>
                    <ul class="list_depth2">
                        <li><a href="/zf_user/memcom/interview/main" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'interview-manage', 'calendar')">면접 캘린더</a></li>
                        <li><a href="/zf_user/memcom/interview/interview-list" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'interview-manage', 'interviewee')">면접 대상자</a></li>
                        <li><a href="/zf_user/memcom/interview/interview-setting" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'interview-manage', 'setting')">면접 관리설정</a></li>
                    </ul>
                    <div class="txt_desc"><img src="//www.saraminimage.co.kr/ui/layout/mypage_2016/pos_6th_txt.png" alt="업계 최초! 면접 불참 확인 서비스 면접 스케쥴과 참석 유무를 확인해보세요."></div>
                </div>
            </div>
        </li>
    </ul>
</div>


<script type="text/javascript">
    </script>
    <div class="wrap_service">
    <div class="blind">기타 서비스 메뉴</div>
    <div class="wrap_member">
        <div class="member_option">
                            <!-- 로그인 전 -->
                <div class="box_member">
                    <a href="/zf_user/auth?ut=c&url=%2Fzf_user%2Ftalent%2Fsearch" class="link_login track_event">기업회원 로그인</a>
                </div>
                    </div>
    </div>
    <div class="wrap_menu sri_gnb_wrap_menu">
        <ul class="list_menu">
            <li class="depth">
                <a href="/zf_user/service/company/order" class="link_depth"
                   onmousedown="try{n_trackEvent('gnbmenu', 'button', 'order-guide', '');}catch(e){};">채용 상품 안내</a>
            </li>
            <li class="depth">
                <a href="/zf_user/service/company/order?part_id=talent_search" class="link_depth"
                   onmousedown="try{n_trackEvent('gnbmenu', 'button', 'talent-guide', '');}catch(e){};">인재 상품 안내</a>
            </li>
            <li id="payment-nav" class="depth payment_history"><!-- id는 임의로 정했습니다 -->
                <a href="/zf_user/memcom/service-manage/payment-history" onmousedown="n_trackEvent('gnbmenu', 'button' , 'payment-manage', '')" class="link_depth">결제내역</a>
                <div class="wrap_depth2">
                    <div class="depth2_inner">
                        <ul class="list_depth2">
                            <li><a href="/zf_user/memcom/service-manage/payment-history" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'service-manage', 'payment-history')">결제내역 조회</a></li>
                            <li><a href="/zf_user/memcom/service-manage/tax-history" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'service-manage', 'tax-history')">전자세금계산서 조회</a></li>
                            <li><a href="/zf_user/memcom/service-manage/coupon-history" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'service-manage', 'coupon-history')">쿠폰 사용 내역</a></li>
                            <li><a href="/zf_user/memcom/service-manage/point-history" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'service-manage', 'point-history')">S-포인트 사용 내역</a></li>
                            <li><a href="/zf_user/memcom/sms/sms-service-history-detail" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'service-manage', 'sms-service-history')">문자(SMS) 사용 내역</a></li>
                            <li><a href="/zf_user/payment/manage/oneclick" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'service-manage', 'oneclick')">원클릭 결제 관리</a></li>
                            <li><a href="/zf_user/service-guide/point-coupon" onmousedown="n_trackEvent('gnbmenu', 'layer' , 'service-guide', 's-point')">S-포인트 안내</a></li>
                        </ul>
                    </div>
                </div>
            </li>
            <li id="all-nav" class="depth total_menu"><!-- id는 임의로 정했습니다 -->
    <a href="javascript:void(0)" class="link_depth"><strong class="blind">전체메뉴</strong></a>
    <!-- button type="button" class="btn_all_menu"><span class="blind">전체메뉴</span></button -->
    <div class="wrap_depth2">
        <div class="depth2_inner">
            <ul class="list_depth2 area_all_nav">
                <li class="depth2">
                    <strong class="title_depth2">공고지원자관리</strong>
                    <a href="/zf_user/memcom/recruit/add" onmousedown="n_trackEvent('entiremenu', 'button' , 'recruit-add', 'add')" class="btn_depth2"><strong>공고 등록하기</strong></a>
                    <ul class="">
                        <li><a href="/zf_user/company/recruit-manage/mode/entire" onmousedown="n_trackEvent('entiremenu', 'layer' , 'recruit-manage', 'entire')">전체공고</a>
                            <ul class="list_depth3 depth_menu">
                                <li><a href="/zf_user/company/recruit-manage" onmousedown="n_trackEvent('entiremenu', 'layer' , 'recruit-manage', 'ing')">- 진행중 공고</a></li>
                                <li><a href="/zf_user/company/recruit-manage/mode/standby" onmousedown="n_trackEvent('entiremenu', 'layer' , 'recruit-manage', 'standby')">- 대기중 공고</a></li>
                                <li><a href="/zf_user/company/recruit-manage/mode/end" onmousedown="n_trackEvent('entiremenu', 'layer' , 'recruit-manage', 'end')">- 마감된 공고</a></li>
                                <li><a href="/zf_user/company/recruit-manage/mode/incomplete" onmousedown="n_trackEvent('entiremenu', 'layer' , 'recruit-manage', 'incomplete')">- 미완성 공고</a></li>
                            </ul>
                        </li>
                        <li><a href="/zf_user/memcom/service-product" onmousedown="n_trackEvent('entiremenu', 'layer' , 'service-manage', 'recruit-service-manage')">유료서비스 관리</a></li>
                        <li><a href="/zf_user/memcom/service-manage/ai-recommend-history">추천 히스토리</a></li>
                        <li><a href="/zf_user/memcom/service-manage/keyword-service-history?result=total" onmousedown="n_trackEvent('entiremenu', 'layer' , 'service-manage', 'keyword-service-history')">검색키워드 상품 관리</a></li>
                        <li><a href="/zf_user/memcom/talent-manage/send-sms-email-history?top_menu_cd=recruit-manage" onmousedown="n_trackEvent('entiremenu', 'layer' , 'service-manage', 'send-sms-email-history')">문자·이메일 발송 내역</a></li>
                    </ul>
                </li>
                <li class="depth2">
                    <strong class="title_depth2">인재관리</strong>
                    <a href="/zf_user/talent/search" onmousedown="n_trackEvent('entiremenu', 'layer' , 'talent-manage', 'talent-search')" class="btn_depth2"><strong>인재 검색하기</strong></a>
                    <ul>
                        <li><a href="/zf_user/memcom/talent-manage/scrap-talent" onmousedown="n_trackEvent('entiremenu', 'layer' , 'talent-manage', 'scrap-talent')">관심 인재</a></li>
                        <li><a href="/zf_user/memcom/talent-manage/today-talent" onmousedown="n_trackEvent('entiremenu', 'layer' , 'talent-manage', 'today-talent')">오늘 본 인재</a></li>
                        <li><a href="/zf_user/memcom/talent-manage/serv-talent" onmousedown="n_trackEvent('entiremenu', 'layer' , 'talent-manage', 'serv-talent')">연락처확인 인재</a></li>
                        <li><a href="/zf_user/memcom/service-manage/talent-service-history" onmousedown="n_trackEvent('entiremenu', 'layer' , 'talent-manage', 'talent-service-history')">인재정보 상품 사용 내역</a></li>
                        <li><a href="/zf_user/memcom/talent-manage/send-sms-email-history" onmousedown="n_trackEvent('entiremenu', 'layer' , 'talent-manage', 'send-sms-email-history')">문자·이메일 발송 내역</a></li>
                    </ul>
                    <strong class="title_depth2 margintop">인재추천</strong>
                    <ul>
                        <li><a href="/zf_user/talent-recommend" onmousedown="n_trackEvent('entiremenu', 'layer' , 'talent-recom', 'ai-recom')">인공지능 추천인재</a></li>
                        <li><a href="/zf_user/applicant/manage/recruit-recommend-redirect" onmousedown="n_trackEvent('entiremenu', 'layer' , 'talent-manage', 'pandora')">공고기반 추천인재</a></li>
                    </ul>
                </li>
                <li class="depth2">
                    <strong class="title_depth2">인적성검사</strong>
                    <a href="/zf_user/memcom/siat?add_exam_immediately=y" onmousedown="n_trackEvent('entiremenu', 'layer' , 'siat-manage', 'add-exam')" class="btn_depth2"><strong>검사 신청하기</strong></a>
                    <ul>
                        <li><a href="/zf_user/memcom/siat/exam-list" onmousedown="n_trackEvent('entiremenu', 'layer' , 'siat-manage', 'exam-list')">인적성검사 신청·관리</a></li>
                        <li><a href="/zf_user/memcom/service-manage/siat-use-history" onmousedown="n_trackEvent('entiremenu', 'layer' , 'siat-manage', 'siat-use-history')">인적성검사 사용내역</a></li>
                        <li><a href="/zf_user/service-guide/siat?type=utilize#utilize" onmousedown="n_trackEvent('entiremenu', 'layer' , 'goods', 'siat-description-utilize')">인적성검사 활용법</a></li>
                        <li><a href="/zf_user/service-guide/siat?type=process#process" onmousedown="n_trackEvent('entiremenu', 'layer' , 'goods', 'siat-description-process')">인적성검사 이용절차</a></li>
                    </ul>
                </li>
                <li class="depth2">
                    <strong class="title_depth2">면접관리</strong>
                    <a href="/zf_user/memcom/interview/write" onmousedown="n_trackEvent('entiremenu', 'layer' , 'interview-manage', 'add')" class="btn_depth2"><strong>면접 등록하기</strong></a>
                    <ul>
                        <li><a href="/zf_user/memcom/interview/main" onmousedown="n_trackEvent('entiremenu', 'layer' , 'interview-manage', 'calendar')">면접 캘린더</a></li>
                        <li><a href="/zf_user/memcom/interview/interview-list" onmousedown="n_trackEvent('entiremenu', 'layer' , 'interview-manage', 'interviewee')">면접 대상자</a></li>
                        <li><a href="/zf_user/memcom/interview/interview-setting" onmousedown="n_trackEvent('entiremenu', 'layer' , 'interview-manage', 'setting')">면접 관리설정</a></li>
                    </ul>
                </li>
                <li class="depth2">
                    <strong class="title_depth2">채용 상품 안내</strong>
                    <ul>
                        <li><a href="/zf_user/service/company/order?part_id=package">베스트 상품</a></li>
                        <li><a href="/zf_user/service/company/order?part_id=recruit_ads">즉시구매 채용광고</a></li>
                        <li><a href="/zf_user/service/company/order?part_id=talent_search">인재열람</a></li>
                        <li><a href="/zf_user/service/company/order?part_id=siat">SIAT인적성검사</a></li>
                        <li><a href="/zf_user/service/company/order?part_id=recruit_banner_ads">채용광고 신청문의</a></li>
                    </ul>
                </li>
                <li class="depth2">
                    <strong class="title_depth2">결제내역</strong>
                    <ul>
                        <li><a href="/zf_user/memcom/service-manage/payment-history" onmousedown="n_trackEvent('entiremenu', 'layer' , 'service-manage', 'payment-service-history')">결제내역 조회</a></li>
                        <li><a href="/zf_user/memcom/service-manage/tax-history" onmousedown="n_trackEvent('entiremenu', 'layer' , 'service-manage', 'tax-service-history')">전자세금계산서 조회</a></li>
                        <li><a href="/zf_user/memcom/service-manage/coupon-history" onmousedown="n_trackEvent('entiremenu', 'layer' , 'service-manage', 'coupon-service-history')">쿠폰 사용 내역</a></li>
                        <li><a href="/zf_user/memcom/service-manage/point-history" onmousedown="n_trackEvent('entiremenu', 'layer' , 'service-manage', 'point-service-history')">S-포인트 사용 내역</a></li>
                        <li><a href="/zf_user/memcom/sms/sms-service-history-detail" onmousedown="n_trackEvent('entiremenu', 'layer' , 'service-manage', 'sms-service-history')">문자(SMS)사용 내역</a></li>
                        <li><a href="/zf_user/payment/manage/oneclick" onmousedown="n_trackEvent('entiremenu', 'layer' , 'service-manage', 'oneclick')">원클릭 결제 관리</a></li>
                        <li><a href="/zf_user/service-guide/point-coupon" onmousedown="n_trackEvent('entiremenu', 'layer' , 'service-guide', 's-point')">S-포인트 안내</a></li>
                    </ul>
                </li>
                <li class="depth2">
                    <strong class="title_depth2">HR매거진</strong>
                    <ul>
                        <li><a href="/zf_user/hr-magazine/list" onmousedown="n_trackEvent('entiremenu', 'layer', 'HR-magazine', 'list')">HR매거진</a></li>
                        <li><a href="/zf_user/hr-magazine/series-list" onmousedown="n_trackEvent('entiremenu', 'layer', 'HR-magazine', 'series-list')">HR시리즈</a></li>
                        <li><a href="/zf_user/hr-magazine/news-list?category=news&subject_type=manage" onmousedown="n_trackEvent('entiremenu', 'layer', 'HR-magazine', 'news')">뉴스</a></li>
                        <li><a href="/zf_user/hr-magazine/video-list" onmousedown="n_trackEvent('entiremenu', 'layer', 'HR-magazine', 'video')">HR동영상</a></li>
                        <li><a href="/zf_user/hr-magazine/plus-list?category=card" onmousedown="n_trackEvent('entiremenu', 'layer', 'HR-magazine', 'card')">카드뉴스</a></li>
                        <li class="bottom_line"><a href="/zf_user/hr-magazine/plus-list?category=tip" onmousedown="n_trackEvent('entiremenu', 'layer', 'HR-magazine', 'tip')">사람인 이용 꿀팁</a></li>
                        <li><a href="#" onclick="window.open('/company/service_guide/recruit_process.php', 'recruitProcessSideBar' ,'width=826px, height=512px, resizable=no, scrollbars=no, status=no;');" onmousedown="n_trackEvent('entiremenu', 'layer', 'HR-magazine', 'recruit_process')">채용 가이드<span class="list_gnb_ico ico_1x3_depth2">새창</span></a></li>
                        <li><a href="/zf_user/hr-magazine/solution" onmousedown="n_trackEvent('entiremenu', 'layer', 'HR-magazine', 'solution')">등용문 3.0</a></li>
                        <li><a href="/zf_user/hr-magazine/outsourcing" onmousedown="n_trackEvent('entiremenu', 'layer', 'HR-magazine', 'outsourcing')">등용문 공채대행</a></li>
                        <li><a href="http://www.saraminhs.co.kr" target="_blank" onmousedown="n_trackEvent('entiremenu', 'layer', 'HR-magazine', 'saraminhs')">인재파견 [사람인HS]<span class="list_gnb_ico">새창</span></a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</li>        </ul>
    </div>
</div>
<script>
(function ($) {
    $('#btn_modify_ci').on('click', function () {
        var mcom_idx = $(this).data('mcom_idx');
        window.open('/zf_user/company-photo/logo-insert-pop?mcom_idx=' + mcom_idx, 'upload_logo', 'top=20,left=20,width=502,height=328,scrollbars=yes,resizable=no');
        return false;
    });
})(jQuery);
</script></header>    <div id="sri_section" >
                <div id="sri_wrap">
            <div id="content">
                

<div class="wrap_content search_talent_wrap more_wide">
    <div class="tit_area blind">
        <h1 class="title_contents">인재 검색</h1>
    </div>

    <script>
    var require = {
        urlArgs: 'ts=20190718_3',
        waitSeconds: 15
    };

    var options = {},
        storeData = '',
        defaultPanel = '',
        defaultCate = '',
        focusPanel = '',
        is_mandb_upselling_benefits;
    try {
        options = {"age":{"2002":18,"2001":19,"2000":20,"1999":21,"1998":22,"1997":23,"1996":24,"1995":25,"1994":26,"1993":27,"1992":28,"1991":29,"1990":30,"1989":31,"1988":32,"1987":33,"1986":34,"1985":35,"1984":36,"1983":37,"1982":38,"1981":39,"1980":40,"1979":41,"1978":42,"1977":43,"1976":44,"1975":45,"1974":46,"1973":47,"1972":48,"1971":49,"1970":50,"1969":51,"1968":52,"1967":53,"1966":54,"1965":55,"1964":56,"1963":57,"1962":58,"1961":59,"1960":60,"1959":61,"1958":62,"1957":63,"1956":64,"1955":65,"1954":66,"1953":67,"1952":68,"1951":69,"1950":70,"1949":71,"1948":72,"1947":73,"1946":74,"1945":75,"1944":76,"1943":77,"1942":78,"1941":79,"1940":80},"salary":{"3":"1,400\ub9cc\uc6d0","4":"1,600\ub9cc\uc6d0","5":"1,800\ub9cc\uc6d0","6":"2,000\ub9cc\uc6d0","7":"2,200\ub9cc\uc6d0","8":"2,400\ub9cc\uc6d0","9":"2,600\ub9cc\uc6d0","10":"2,800\ub9cc\uc6d0","11":"3,000\ub9cc\uc6d0","12":"3,200\ub9cc\uc6d0","13":"3,400\ub9cc\uc6d0","14":"3,600\ub9cc\uc6d0","15":"3,800\ub9cc\uc6d0","16":"4,000\ub9cc\uc6d0","17":"5,000\ub9cc\uc6d0","18":"6,000\ub9cc\uc6d0","19":"7,000\ub9cc\uc6d0","20":"8,000\ub9cc\uc6d0","21":"9,000\ub9cc\uc6d0","22":"1\uc5b5\uc6d0"},"location":{"1":{"tcode":1,"name":"\uad6d\ub0b4","code":{"101000":{"mcode":"101000","name":"\uc11c\uc6b8","keyword":{"101000":{"kcode":"1","tcode":"1","mcode":"101000","bcode":"101000","code":"101000","name":"\uc11c\uc6b8\uc804\uccb4"},"101010":{"kcode":"2","tcode":"1","mcode":"101000","bcode":"101010","code":"101010","name":"\uac15\ub0a8\uad6c"},"101020":{"kcode":"3","tcode":"1","mcode":"101000","bcode":"101020","code":"101020","name":"\uac15\ub3d9\uad6c"},"101030":{"kcode":"4","tcode":"1","mcode":"101000","bcode":"101030","code":"101030","name":"\uac15\ubd81\uad6c"},"101040":{"kcode":"5","tcode":"1","mcode":"101000","bcode":"101040","code":"101040","name":"\uac15\uc11c\uad6c"},"101050":{"kcode":"6","tcode":"1","mcode":"101000","bcode":"101050","code":"101050","name":"\uad00\uc545\uad6c"},"101060":{"kcode":"7","tcode":"1","mcode":"101000","bcode":"101060","code":"101060","name":"\uad11\uc9c4\uad6c"},"101070":{"kcode":"8","tcode":"1","mcode":"101000","bcode":"101070","code":"101070","name":"\uad6c\ub85c\uad6c"},"101080":{"kcode":"9","tcode":"1","mcode":"101000","bcode":"101080","code":"101080","name":"\uae08\ucc9c\uad6c"},"101090":{"kcode":"10","tcode":"1","mcode":"101000","bcode":"101090","code":"101090","name":"\ub178\uc6d0\uad6c"},"101100":{"kcode":"11","tcode":"1","mcode":"101000","bcode":"101100","code":"101100","name":"\ub3c4\ubd09\uad6c"},"101110":{"kcode":"12","tcode":"1","mcode":"101000","bcode":"101110","code":"101110","name":"\ub3d9\ub300\ubb38\uad6c"},"101120":{"kcode":"13","tcode":"1","mcode":"101000","bcode":"101120","code":"101120","name":"\ub3d9\uc791\uad6c"},"101130":{"kcode":"14","tcode":"1","mcode":"101000","bcode":"101130","code":"101130","name":"\ub9c8\ud3ec\uad6c"},"101140":{"kcode":"15","tcode":"1","mcode":"101000","bcode":"101140","code":"101140","name":"\uc11c\ub300\ubb38\uad6c"},"101150":{"kcode":"16","tcode":"1","mcode":"101000","bcode":"101150","code":"101150","name":"\uc11c\ucd08\uad6c"},"101160":{"kcode":"17","tcode":"1","mcode":"101000","bcode":"101160","code":"101160","name":"\uc131\ub3d9\uad6c"},"101170":{"kcode":"18","tcode":"1","mcode":"101000","bcode":"101170","code":"101170","name":"\uc131\ubd81\uad6c"},"101180":{"kcode":"19","tcode":"1","mcode":"101000","bcode":"101180","code":"101180","name":"\uc1a1\ud30c\uad6c"},"101190":{"kcode":"20","tcode":"1","mcode":"101000","bcode":"101190","code":"101190","name":"\uc591\ucc9c\uad6c"},"101200":{"kcode":"21","tcode":"1","mcode":"101000","bcode":"101200","code":"101200","name":"\uc601\ub4f1\ud3ec\uad6c"},"101210":{"kcode":"22","tcode":"1","mcode":"101000","bcode":"101210","code":"101210","name":"\uc6a9\uc0b0\uad6c"},"101220":{"kcode":"23","tcode":"1","mcode":"101000","bcode":"101220","code":"101220","name":"\uc740\ud3c9\uad6c"},"101230":{"kcode":"24","tcode":"1","mcode":"101000","bcode":"101230","code":"101230","name":"\uc885\ub85c\uad6c"},"101240":{"kcode":"25","tcode":"1","mcode":"101000","bcode":"101240","code":"101240","name":"\uc911\uad6c"},"101250":{"kcode":"26","tcode":"1","mcode":"101000","bcode":"101250","code":"101250","name":"\uc911\ub791\uad6c"}}},"102000":{"mcode":"102000","name":"\uacbd\uae30","keyword":{"102000":{"kcode":"27","tcode":"1","mcode":"102000","bcode":"102000","code":"102000","name":"\uacbd\uae30\uc804\uccb4"},"102010":{"kcode":"28","tcode":"1","mcode":"102000","bcode":"102010","code":"102010","name":"\uac00\ud3c9\uad70"},"102020":{"kcode":"29","tcode":"1","mcode":"102000","bcode":"102020","code":"102020","name":"\uace0\uc591\uc2dc"},"102030":{"kcode":"30","tcode":"1","mcode":"102000","bcode":"102030","code":"102030","name":"\uace0\uc591\uc2dc \ub355\uc591\uad6c"},"102040":{"kcode":"31","tcode":"1","mcode":"102000","bcode":"102040","code":"102040","name":"\uace0\uc591\uc2dc \uc77c\uc0b0\ub3d9\uad6c"},"102050":{"kcode":"32","tcode":"1","mcode":"102000","bcode":"102050","code":"102050","name":"\uace0\uc591\uc2dc \uc77c\uc0b0\uc11c\uad6c"},"102060":{"kcode":"33","tcode":"1","mcode":"102000","bcode":"102060","code":"102060","name":"\uacfc\ucc9c\uc2dc"},"102070":{"kcode":"34","tcode":"1","mcode":"102000","bcode":"102070","code":"102070","name":"\uad11\uba85\uc2dc"},"102080":{"kcode":"35","tcode":"1","mcode":"102000","bcode":"102080","code":"102080","name":"\uad11\uc8fc\uc2dc"},"102090":{"kcode":"36","tcode":"1","mcode":"102000","bcode":"102090","code":"102090","name":"\uad6c\ub9ac\uc2dc"},"102100":{"kcode":"37","tcode":"1","mcode":"102000","bcode":"102100","code":"102100","name":"\uad70\ud3ec\uc2dc"},"102110":{"kcode":"38","tcode":"1","mcode":"102000","bcode":"102110","code":"102110","name":"\uae40\ud3ec\uc2dc"},"102120":{"kcode":"39","tcode":"1","mcode":"102000","bcode":"102120","code":"102120","name":"\ub0a8\uc591\uc8fc\uc2dc"},"102130":{"kcode":"40","tcode":"1","mcode":"102000","bcode":"102130","code":"102130","name":"\ub3d9\ub450\ucc9c\uc2dc"},"102140":{"kcode":"41","tcode":"1","mcode":"102000","bcode":"102140","code":"102140","name":"\ubd80\ucc9c\uc2dc"},"102150":{"kcode":"42","tcode":"1","mcode":"102000","bcode":"102150","code":"102150","name":"\ubd80\ucc9c\uc2dc \uc18c\uc0ac\uad6c"},"102160":{"kcode":"43","tcode":"1","mcode":"102000","bcode":"102160","code":"102160","name":"\ubd80\ucc9c\uc2dc \uc624\uc815\uad6c"},"102170":{"kcode":"44","tcode":"1","mcode":"102000","bcode":"102170","code":"102170","name":"\ubd80\ucc9c\uc2dc \uc6d0\ubbf8\uad6c"},"102180":{"kcode":"45","tcode":"1","mcode":"102000","bcode":"102180","code":"102180","name":"\uc131\ub0a8\uc2dc"},"102190":{"kcode":"46","tcode":"1","mcode":"102000","bcode":"102190","code":"102190","name":"\uc131\ub0a8\uc2dc \ubd84\ub2f9\uad6c"},"102200":{"kcode":"47","tcode":"1","mcode":"102000","bcode":"102200","code":"102200","name":"\uc131\ub0a8\uc2dc \uc218\uc815\uad6c"},"102210":{"kcode":"48","tcode":"1","mcode":"102000","bcode":"102210","code":"102210","name":"\uc131\ub0a8\uc2dc \uc911\uc6d0\uad6c"},"102220":{"kcode":"49","tcode":"1","mcode":"102000","bcode":"102220","code":"102220","name":"\uc218\uc6d0\uc2dc"},"102230":{"kcode":"50","tcode":"1","mcode":"102000","bcode":"102230","code":"102230","name":"\uc218\uc6d0\uc2dc \uad8c\uc120\uad6c"},"102240":{"kcode":"51","tcode":"1","mcode":"102000","bcode":"102240","code":"102240","name":"\uc218\uc6d0\uc2dc \uc601\ud1b5\uad6c"},"102250":{"kcode":"52","tcode":"1","mcode":"102000","bcode":"102250","code":"102250","name":"\uc218\uc6d0\uc2dc \uc7a5\uc548\uad6c"},"102260":{"kcode":"53","tcode":"1","mcode":"102000","bcode":"102260","code":"102260","name":"\uc218\uc6d0\uc2dc \ud314\ub2ec\uad6c"},"102270":{"kcode":"54","tcode":"1","mcode":"102000","bcode":"102270","code":"102270","name":"\uc2dc\ud765\uc2dc"},"102280":{"kcode":"55","tcode":"1","mcode":"102000","bcode":"102280","code":"102280","name":"\uc548\uc0b0\uc2dc"},"102290":{"kcode":"56","tcode":"1","mcode":"102000","bcode":"102290","code":"102290","name":"\uc548\uc0b0\uc2dc \ub2e8\uc6d0\uad6c"},"102300":{"kcode":"57","tcode":"1","mcode":"102000","bcode":"102300","code":"102300","name":"\uc548\uc0b0\uc2dc \uc0c1\ub85d\uad6c"},"102310":{"kcode":"58","tcode":"1","mcode":"102000","bcode":"102310","code":"102310","name":"\uc548\uc131\uc2dc"},"102320":{"kcode":"59","tcode":"1","mcode":"102000","bcode":"102320","code":"102320","name":"\uc548\uc591\uc2dc"},"102330":{"kcode":"60","tcode":"1","mcode":"102000","bcode":"102330","code":"102330","name":"\uc548\uc591\uc2dc \ub3d9\uc548\uad6c"},"102340":{"kcode":"61","tcode":"1","mcode":"102000","bcode":"102340","code":"102340","name":"\uc548\uc591\uc2dc \ub9cc\uc548\uad6c"},"102350":{"kcode":"62","tcode":"1","mcode":"102000","bcode":"102350","code":"102350","name":"\uc591\uc8fc\uc2dc"},"102360":{"kcode":"63","tcode":"1","mcode":"102000","bcode":"102360","code":"102360","name":"\uc591\ud3c9\uad70"},"102370":{"kcode":"64","tcode":"1","mcode":"102000","bcode":"102370","code":"102370","name":"\uc5ec\uc8fc\uc2dc"},"102380":{"kcode":"65","tcode":"1","mcode":"102000","bcode":"102380","code":"102380","name":"\uc5f0\ucc9c\uad70"},"102390":{"kcode":"66","tcode":"1","mcode":"102000","bcode":"102390","code":"102390","name":"\uc624\uc0b0\uc2dc"},"102400":{"kcode":"67","tcode":"1","mcode":"102000","bcode":"102400","code":"102400","name":"\uc6a9\uc778\uc2dc"},"102410":{"kcode":"68","tcode":"1","mcode":"102000","bcode":"102410","code":"102410","name":"\uc6a9\uc778\uc2dc \uae30\ud765\uad6c"},"102420":{"kcode":"69","tcode":"1","mcode":"102000","bcode":"102420","code":"102420","name":"\uc6a9\uc778\uc2dc \uc218\uc9c0\uad6c"},"102430":{"kcode":"70","tcode":"1","mcode":"102000","bcode":"102430","code":"102430","name":"\uc6a9\uc778\uc2dc \ucc98\uc778\uad6c"},"102440":{"kcode":"71","tcode":"1","mcode":"102000","bcode":"102440","code":"102440","name":"\uc758\uc655\uc2dc"},"102450":{"kcode":"72","tcode":"1","mcode":"102000","bcode":"102450","code":"102450","name":"\uc758\uc815\ubd80\uc2dc"},"102460":{"kcode":"73","tcode":"1","mcode":"102000","bcode":"102460","code":"102460","name":"\uc774\ucc9c\uc2dc"},"102470":{"kcode":"74","tcode":"1","mcode":"102000","bcode":"102470","code":"102470","name":"\ud30c\uc8fc\uc2dc"},"102480":{"kcode":"75","tcode":"1","mcode":"102000","bcode":"102480","code":"102480","name":"\ud3c9\ud0dd\uc2dc"},"102490":{"kcode":"76","tcode":"1","mcode":"102000","bcode":"102490","code":"102490","name":"\ud3ec\ucc9c\uc2dc"},"102500":{"kcode":"77","tcode":"1","mcode":"102000","bcode":"102500","code":"102500","name":"\ud558\ub0a8\uc2dc"},"102510":{"kcode":"78","tcode":"1","mcode":"102000","bcode":"102510","code":"102510","name":"\ud654\uc131\uc2dc"}}},"103000":{"mcode":"103000","name":"\uad11\uc8fc","keyword":{"103000":{"kcode":"116","tcode":"1","mcode":"103000","bcode":"103000","code":"103000","name":"\uad11\uc8fc\uc804\uccb4"},"103010":{"kcode":"117","tcode":"1","mcode":"103000","bcode":"103010","code":"103010","name":"\uad11\uc0b0\uad6c"},"103020":{"kcode":"118","tcode":"1","mcode":"103000","bcode":"103020","code":"103020","name":"\ub0a8\uad6c"},"103030":{"kcode":"119","tcode":"1","mcode":"103000","bcode":"103030","code":"103030","name":"\ub3d9\uad6c"},"103040":{"kcode":"120","tcode":"1","mcode":"103000","bcode":"103040","code":"103040","name":"\ubd81\uad6c"},"103050":{"kcode":"121","tcode":"1","mcode":"103000","bcode":"103050","code":"103050","name":"\uc11c\uad6c"}}},"104000":{"mcode":"104000","name":"\ub300\uad6c","keyword":{"104000":{"kcode":"107","tcode":"1","mcode":"104000","bcode":"104000","code":"104000","name":"\ub300\uad6c\uc804\uccb4"},"104010":{"kcode":"108","tcode":"1","mcode":"104000","bcode":"104010","code":"104010","name":"\ub0a8\uad6c"},"104020":{"kcode":"109","tcode":"1","mcode":"104000","bcode":"104020","code":"104020","name":"\ub2ec\uc11c\uad6c"},"104030":{"kcode":"110","tcode":"1","mcode":"104000","bcode":"104030","code":"104030","name":"\ub2ec\uc131\uad70"},"104040":{"kcode":"111","tcode":"1","mcode":"104000","bcode":"104040","code":"104040","name":"\ub3d9\uad6c"},"104050":{"kcode":"112","tcode":"1","mcode":"104000","bcode":"104050","code":"104050","name":"\ubd81\uad6c"},"104060":{"kcode":"113","tcode":"1","mcode":"104000","bcode":"104060","code":"104060","name":"\uc11c\uad6c"},"104070":{"kcode":"114","tcode":"1","mcode":"104000","bcode":"104070","code":"104070","name":"\uc218\uc131\uad6c"},"104080":{"kcode":"115","tcode":"1","mcode":"104000","bcode":"104080","code":"104080","name":"\uc911\uad6c"}}},"105000":{"mcode":"105000","name":"\ub300\uc804","keyword":{"105000":{"kcode":"122","tcode":"1","mcode":"105000","bcode":"105000","code":"105000","name":"\ub300\uc804\uc804\uccb4"},"105010":{"kcode":"123","tcode":"1","mcode":"105000","bcode":"105010","code":"105010","name":"\ub300\ub355\uad6c"},"105020":{"kcode":"124","tcode":"1","mcode":"105000","bcode":"105020","code":"105020","name":"\ub3d9\uad6c"},"105030":{"kcode":"125","tcode":"1","mcode":"105000","bcode":"105030","code":"105030","name":"\uc11c\uad6c"},"105040":{"kcode":"126","tcode":"1","mcode":"105000","bcode":"105040","code":"105040","name":"\uc720\uc131\uad6c"},"105050":{"kcode":"127","tcode":"1","mcode":"105000","bcode":"105050","code":"105050","name":"\uc911\uad6c"}}},"106000":{"mcode":"106000","name":"\ubd80\uc0b0","keyword":{"106000":{"kcode":"90","tcode":"1","mcode":"106000","bcode":"106000","code":"106000","name":"\ubd80\uc0b0\uc804\uccb4"},"106010":{"kcode":"91","tcode":"1","mcode":"106000","bcode":"106010","code":"106010","name":"\uac15\uc11c\uad6c"},"106020":{"kcode":"92","tcode":"1","mcode":"106000","bcode":"106020","code":"106020","name":"\uae08\uc815\uad6c"},"106030":{"kcode":"93","tcode":"1","mcode":"106000","bcode":"106030","code":"106030","name":"\uae30\uc7a5\uad70"},"106040":{"kcode":"94","tcode":"1","mcode":"106000","bcode":"106040","code":"106040","name":"\ub0a8\uad6c"},"106050":{"kcode":"95","tcode":"1","mcode":"106000","bcode":"106050","code":"106050","name":"\ub3d9\uad6c"},"106060":{"kcode":"96","tcode":"1","mcode":"106000","bcode":"106060","code":"106060","name":"\ub3d9\ub798\uad6c"},"106070":{"kcode":"97","tcode":"1","mcode":"106000","bcode":"106070","code":"106070","name":"\ubd80\uc0b0\uc9c4\uad6c"},"106080":{"kcode":"98","tcode":"1","mcode":"106000","bcode":"106080","code":"106080","name":"\ubd81\uad6c"},"106090":{"kcode":"99","tcode":"1","mcode":"106000","bcode":"106090","code":"106090","name":"\uc0ac\uc0c1\uad6c"},"106100":{"kcode":"100","tcode":"1","mcode":"106000","bcode":"106100","code":"106100","name":"\uc0ac\ud558\uad6c"},"106110":{"kcode":"101","tcode":"1","mcode":"106000","bcode":"106110","code":"106110","name":"\uc11c\uad6c"},"106120":{"kcode":"102","tcode":"1","mcode":"106000","bcode":"106120","code":"106120","name":"\uc218\uc601\uad6c"},"106130":{"kcode":"103","tcode":"1","mcode":"106000","bcode":"106130","code":"106130","name":"\uc5f0\uc81c\uad6c"},"106140":{"kcode":"104","tcode":"1","mcode":"106000","bcode":"106140","code":"106140","name":"\uc601\ub3c4\uad6c"},"106150":{"kcode":"105","tcode":"1","mcode":"106000","bcode":"106150","code":"106150","name":"\uc911\uad6c"},"106160":{"kcode":"106","tcode":"1","mcode":"106000","bcode":"106160","code":"106160","name":"\ud574\uc6b4\ub300\uad6c"}}},"107000":{"mcode":"107000","name":"\uc6b8\uc0b0","keyword":{"107000":{"kcode":"128","tcode":"1","mcode":"107000","bcode":"107000","code":"107000","name":"\uc6b8\uc0b0\uc804\uccb4"},"107010":{"kcode":"129","tcode":"1","mcode":"107000","bcode":"107010","code":"107010","name":"\ub0a8\uad6c"},"107020":{"kcode":"130","tcode":"1","mcode":"107000","bcode":"107020","code":"107020","name":"\ub3d9\uad6c"},"107030":{"kcode":"131","tcode":"1","mcode":"107000","bcode":"107030","code":"107030","name":"\ubd81\uad6c"},"107040":{"kcode":"132","tcode":"1","mcode":"107000","bcode":"107040","code":"107040","name":"\uc6b8\uc8fc\uad70"},"107050":{"kcode":"133","tcode":"1","mcode":"107000","bcode":"107050","code":"107050","name":"\uc911\uad6c"}}},"108000":{"mcode":"108000","name":"\uc778\ucc9c","keyword":{"108000":{"kcode":"79","tcode":"1","mcode":"108000","bcode":"108000","code":"108000","name":"\uc778\ucc9c\uc804\uccb4"},"108010":{"kcode":"80","tcode":"1","mcode":"108000","bcode":"108010","code":"108010","name":"\uac15\ud654\uad70"},"108020":{"kcode":"81","tcode":"1","mcode":"108000","bcode":"108020","code":"108020","name":"\uacc4\uc591\uad6c"},"108030":{"kcode":"82","tcode":"1","mcode":"108000","bcode":"108030","code":"108030","name":"\ubbf8\ucd94\ud640\uad6c"},"108040":{"kcode":"83","tcode":"1","mcode":"108000","bcode":"108040","code":"108040","name":"\ub0a8\ub3d9\uad6c"},"108050":{"kcode":"84","tcode":"1","mcode":"108000","bcode":"108050","code":"108050","name":"\ub3d9\uad6c"},"108060":{"kcode":"85","tcode":"1","mcode":"108000","bcode":"108060","code":"108060","name":"\ubd80\ud3c9\uad6c"},"108070":{"kcode":"86","tcode":"1","mcode":"108000","bcode":"108070","code":"108070","name":"\uc11c\uad6c"},"108080":{"kcode":"87","tcode":"1","mcode":"108000","bcode":"108080","code":"108080","name":"\uc5f0\uc218\uad6c"},"108090":{"kcode":"88","tcode":"1","mcode":"108000","bcode":"108090","code":"108090","name":"\uc639\uc9c4\uad70"},"108100":{"kcode":"89","tcode":"1","mcode":"108000","bcode":"108100","code":"108100","name":"\uc911\uad6c"}}},"109000":{"mcode":"109000","name":"\uac15\uc6d0","keyword":{"109000":{"kcode":"134","tcode":"1","mcode":"109000","bcode":"109000","code":"109000","name":"\uac15\uc6d0\uc804\uccb4"},"109010":{"kcode":"135","tcode":"1","mcode":"109000","bcode":"109010","code":"109010","name":"\uac15\ub989\uc2dc"},"109020":{"kcode":"136","tcode":"1","mcode":"109000","bcode":"109020","code":"109020","name":"\uace0\uc131\uad70"},"109030":{"kcode":"137","tcode":"1","mcode":"109000","bcode":"109030","code":"109030","name":"\ub3d9\ud574\uc2dc"},"109040":{"kcode":"138","tcode":"1","mcode":"109000","bcode":"109040","code":"109040","name":"\uc0bc\ucc99\uc2dc"},"109050":{"kcode":"139","tcode":"1","mcode":"109000","bcode":"109050","code":"109050","name":"\uc18d\ucd08\uc2dc"},"109060":{"kcode":"140","tcode":"1","mcode":"109000","bcode":"109060","code":"109060","name":"\uc591\uad6c\uad70"},"109070":{"kcode":"141","tcode":"1","mcode":"109000","bcode":"109070","code":"109070","name":"\uc591\uc591\uad70"},"109080":{"kcode":"142","tcode":"1","mcode":"109000","bcode":"109080","code":"109080","name":"\uc601\uc6d4\uad70"},"109090":{"kcode":"143","tcode":"1","mcode":"109000","bcode":"109090","code":"109090","name":"\uc6d0\uc8fc\uc2dc"},"109100":{"kcode":"144","tcode":"1","mcode":"109000","bcode":"109100","code":"109100","name":"\uc778\uc81c\uad70"},"109110":{"kcode":"145","tcode":"1","mcode":"109000","bcode":"109110","code":"109110","name":"\uc815\uc120\uad70"},"109120":{"kcode":"146","tcode":"1","mcode":"109000","bcode":"109120","code":"109120","name":"\ucca0\uc6d0\uad70"},"109130":{"kcode":"147","tcode":"1","mcode":"109000","bcode":"109130","code":"109130","name":"\ucd98\ucc9c\uc2dc"},"109140":{"kcode":"148","tcode":"1","mcode":"109000","bcode":"109140","code":"109140","name":"\ud0dc\ubc31\uc2dc"},"109150":{"kcode":"149","tcode":"1","mcode":"109000","bcode":"109150","code":"109150","name":"\ud3c9\ucc3d\uad70"},"109160":{"kcode":"150","tcode":"1","mcode":"109000","bcode":"109160","code":"109160","name":"\ud64d\ucc9c\uad70"},"109170":{"kcode":"151","tcode":"1","mcode":"109000","bcode":"109170","code":"109170","name":"\ud654\ucc9c\uad70"},"109180":{"kcode":"152","tcode":"1","mcode":"109000","bcode":"109180","code":"109180","name":"\ud6a1\uc131\uad70"}}},"110000":{"mcode":"110000","name":"\uacbd\ub0a8","keyword":{"110000":{"kcode":"153","tcode":"1","mcode":"110000","bcode":"110000","code":"110000","name":"\uacbd\ub0a8\uc804\uccb4"},"110010":{"kcode":"154","tcode":"1","mcode":"110000","bcode":"110010","code":"110010","name":"\uac70\uc81c\uc2dc"},"110020":{"kcode":"155","tcode":"1","mcode":"110000","bcode":"110020","code":"110020","name":"\uac70\ucc3d\uad70"},"110030":{"kcode":"156","tcode":"1","mcode":"110000","bcode":"110030","code":"110030","name":"\uace0\uc131\uad70"},"110040":{"kcode":"157","tcode":"1","mcode":"110000","bcode":"110040","code":"110040","name":"\uae40\ud574\uc2dc"},"110050":{"kcode":"158","tcode":"1","mcode":"110000","bcode":"110050","code":"110050","name":"\ub0a8\ud574\uad70"},"110053":{"kcode":"28604","tcode":"1","mcode":"110000","bcode":"110053","code":"110053","name":"\ucc3d\uc6d0\uc2dc \ub9c8\uc0b0\ud68c\uc6d0\uad6c"},"110055":{"kcode":"28605","tcode":"1","mcode":"110000","bcode":"110055","code":"110055","name":"\ucc3d\uc6d0\uc2dc \ub9c8\uc0b0\ud569\ud3ec\uad6c"},"110057":{"kcode":"28606","tcode":"1","mcode":"110000","bcode":"110057","code":"110057","name":"\ucc3d\uc6d0\uc2dc \uc131\uc0b0\uad6c"},"110059":{"kcode":"28607","tcode":"1","mcode":"110000","bcode":"110059","code":"110059","name":"\ucc3d\uc6d0\uc2dc \uc758\ucc3d\uad6c"},"110070":{"kcode":"160","tcode":"1","mcode":"110000","bcode":"110070","code":"110070","name":"\ubc00\uc591\uc2dc"},"110080":{"kcode":"161","tcode":"1","mcode":"110000","bcode":"110080","code":"110080","name":"\uc0ac\ucc9c\uc2dc"},"110090":{"kcode":"162","tcode":"1","mcode":"110000","bcode":"110090","code":"110090","name":"\uc0b0\uccad\uad70"},"110100":{"kcode":"163","tcode":"1","mcode":"110000","bcode":"110100","code":"110100","name":"\uc591\uc0b0\uc2dc"},"110110":{"kcode":"164","tcode":"1","mcode":"110000","bcode":"110110","code":"110110","name":"\uc758\ub839\uad70"},"110120":{"kcode":"165","tcode":"1","mcode":"110000","bcode":"110120","code":"110120","name":"\uc9c4\uc8fc\uc2dc"},"110130":{"kcode":"166","tcode":"1","mcode":"110000","bcode":"110130","code":"110130","name":"\ucc3d\uc6d0\uc2dc \uc9c4\ud574\uad6c"},"110140":{"kcode":"167","tcode":"1","mcode":"110000","bcode":"110140","code":"110140","name":"\ucc3d\ub155\uad70"},"110150":{"kcode":"168","tcode":"1","mcode":"110000","bcode":"110150","code":"110150","name":"\ucc3d\uc6d0\uc2dc"},"110160":{"kcode":"169","tcode":"1","mcode":"110000","bcode":"110160","code":"110160","name":"\ud1b5\uc601\uc2dc"},"110170":{"kcode":"170","tcode":"1","mcode":"110000","bcode":"110170","code":"110170","name":"\ud558\ub3d9\uad70"},"110180":{"kcode":"171","tcode":"1","mcode":"110000","bcode":"110180","code":"110180","name":"\ud568\uc548\uad70"},"110190":{"kcode":"172","tcode":"1","mcode":"110000","bcode":"110190","code":"110190","name":"\ud568\uc591\uad70"},"110200":{"kcode":"173","tcode":"1","mcode":"110000","bcode":"110200","code":"110200","name":"\ud569\ucc9c\uad70"}}},"111000":{"mcode":"111000","name":"\uacbd\ubd81","keyword":{"111000":{"kcode":"174","tcode":"1","mcode":"111000","bcode":"111000","code":"111000","name":"\uacbd\ubd81\uc804\uccb4"},"111010":{"kcode":"175","tcode":"1","mcode":"111000","bcode":"111010","code":"111010","name":"\uacbd\uc0b0\uc2dc"},"111020":{"kcode":"176","tcode":"1","mcode":"111000","bcode":"111020","code":"111020","name":"\uacbd\uc8fc\uc2dc"},"111030":{"kcode":"177","tcode":"1","mcode":"111000","bcode":"111030","code":"111030","name":"\uace0\ub839\uad70"},"111040":{"kcode":"178","tcode":"1","mcode":"111000","bcode":"111040","code":"111040","name":"\uad6c\ubbf8\uc2dc"},"111050":{"kcode":"179","tcode":"1","mcode":"111000","bcode":"111050","code":"111050","name":"\uad70\uc704\uad70"},"111060":{"kcode":"180","tcode":"1","mcode":"111000","bcode":"111060","code":"111060","name":"\uae40\ucc9c\uc2dc"},"111070":{"kcode":"181","tcode":"1","mcode":"111000","bcode":"111070","code":"111070","name":"\ubb38\uacbd\uc2dc"},"111080":{"kcode":"182","tcode":"1","mcode":"111000","bcode":"111080","code":"111080","name":"\ubd09\ud654\uad70"},"111090":{"kcode":"183","tcode":"1","mcode":"111000","bcode":"111090","code":"111090","name":"\uc0c1\uc8fc\uc2dc"},"111100":{"kcode":"184","tcode":"1","mcode":"111000","bcode":"111100","code":"111100","name":"\uc131\uc8fc\uad70"},"111110":{"kcode":"185","tcode":"1","mcode":"111000","bcode":"111110","code":"111110","name":"\uc548\ub3d9\uc2dc"},"111120":{"kcode":"186","tcode":"1","mcode":"111000","bcode":"111120","code":"111120","name":"\uc601\ub355\uad70"},"111130":{"kcode":"187","tcode":"1","mcode":"111000","bcode":"111130","code":"111130","name":"\uc601\uc591\uad70"},"111140":{"kcode":"188","tcode":"1","mcode":"111000","bcode":"111140","code":"111140","name":"\uc601\uc8fc\uc2dc"},"111150":{"kcode":"189","tcode":"1","mcode":"111000","bcode":"111150","code":"111150","name":"\uc601\ucc9c\uc2dc"},"111160":{"kcode":"190","tcode":"1","mcode":"111000","bcode":"111160","code":"111160","name":"\uc608\ucc9c\uad70"},"111170":{"kcode":"191","tcode":"1","mcode":"111000","bcode":"111170","code":"111170","name":"\uc6b8\ub989\uad70"},"111180":{"kcode":"192","tcode":"1","mcode":"111000","bcode":"111180","code":"111180","name":"\uc6b8\uc9c4\uad70"},"111190":{"kcode":"193","tcode":"1","mcode":"111000","bcode":"111190","code":"111190","name":"\uc758\uc131\uad70"},"111200":{"kcode":"194","tcode":"1","mcode":"111000","bcode":"111200","code":"111200","name":"\uccad\ub3c4\uad70"},"111210":{"kcode":"195","tcode":"1","mcode":"111000","bcode":"111210","code":"111210","name":"\uccad\uc1a1\uad70"},"111220":{"kcode":"196","tcode":"1","mcode":"111000","bcode":"111220","code":"111220","name":"\uce60\uace1\uad70"},"111230":{"kcode":"197","tcode":"1","mcode":"111000","bcode":"111230","code":"111230","name":"\ud3ec\ud56d\uc2dc"},"111240":{"kcode":"198","tcode":"1","mcode":"111000","bcode":"111240","code":"111240","name":"\ud3ec\ud56d\uc2dc \ub0a8\uad6c"},"111250":{"kcode":"199","tcode":"1","mcode":"111000","bcode":"111250","code":"111250","name":"\ud3ec\ud56d\uc2dc \ubd81\uad6c"}}},"112000":{"mcode":"112000","name":"\uc804\ub0a8","keyword":{"112000":{"kcode":"200","tcode":"1","mcode":"112000","bcode":"112000","code":"112000","name":"\uc804\ub0a8\uc804\uccb4"},"112010":{"kcode":"201","tcode":"1","mcode":"112000","bcode":"112010","code":"112010","name":"\uac15\uc9c4\uad70"},"112020":{"kcode":"202","tcode":"1","mcode":"112000","bcode":"112020","code":"112020","name":"\uace0\ud765\uad70"},"112030":{"kcode":"203","tcode":"1","mcode":"112000","bcode":"112030","code":"112030","name":"\uace1\uc131\uad70"},"112040":{"kcode":"204","tcode":"1","mcode":"112000","bcode":"112040","code":"112040","name":"\uad11\uc591\uc2dc"},"112050":{"kcode":"205","tcode":"1","mcode":"112000","bcode":"112050","code":"112050","name":"\uad6c\ub840\uad70"},"112060":{"kcode":"206","tcode":"1","mcode":"112000","bcode":"112060","code":"112060","name":"\ub098\uc8fc\uc2dc"},"112070":{"kcode":"207","tcode":"1","mcode":"112000","bcode":"112070","code":"112070","name":"\ub2f4\uc591\uad70"},"112080":{"kcode":"208","tcode":"1","mcode":"112000","bcode":"112080","code":"112080","name":"\ubaa9\ud3ec\uc2dc"},"112090":{"kcode":"209","tcode":"1","mcode":"112000","bcode":"112090","code":"112090","name":"\ubb34\uc548\uad70"},"112100":{"kcode":"210","tcode":"1","mcode":"112000","bcode":"112100","code":"112100","name":"\ubcf4\uc131\uad70"},"112110":{"kcode":"211","tcode":"1","mcode":"112000","bcode":"112110","code":"112110","name":"\uc21c\ucc9c\uc2dc"},"112120":{"kcode":"212","tcode":"1","mcode":"112000","bcode":"112120","code":"112120","name":"\uc2e0\uc548\uad70"},"112130":{"kcode":"213","tcode":"1","mcode":"112000","bcode":"112130","code":"112130","name":"\uc5ec\uc218\uc2dc"},"112140":{"kcode":"214","tcode":"1","mcode":"112000","bcode":"112140","code":"112140","name":"\uc601\uad11\uad70"},"112150":{"kcode":"215","tcode":"1","mcode":"112000","bcode":"112150","code":"112150","name":"\uc601\uc554\uad70"},"112160":{"kcode":"216","tcode":"1","mcode":"112000","bcode":"112160","code":"112160","name":"\uc644\ub3c4\uad70"},"112170":{"kcode":"217","tcode":"1","mcode":"112000","bcode":"112170","code":"112170","name":"\uc7a5\uc131\uad70"},"112180":{"kcode":"218","tcode":"1","mcode":"112000","bcode":"112180","code":"112180","name":"\uc7a5\ud765\uad70"},"112190":{"kcode":"219","tcode":"1","mcode":"112000","bcode":"112190","code":"112190","name":"\uc9c4\ub3c4\uad70"},"112200":{"kcode":"220","tcode":"1","mcode":"112000","bcode":"112200","code":"112200","name":"\ud568\ud3c9\uad70"},"112210":{"kcode":"221","tcode":"1","mcode":"112000","bcode":"112210","code":"112210","name":"\ud574\ub0a8\uad70"},"112220":{"kcode":"222","tcode":"1","mcode":"112000","bcode":"112220","code":"112220","name":"\ud654\uc21c\uad70"}}},"113000":{"mcode":"113000","name":"\uc804\ubd81","keyword":{"113000":{"kcode":"223","tcode":"1","mcode":"113000","bcode":"113000","code":"113000","name":"\uc804\ubd81\uc804\uccb4"},"113010":{"kcode":"224","tcode":"1","mcode":"113000","bcode":"113010","code":"113010","name":"\uace0\ucc3d\uad70"},"113020":{"kcode":"225","tcode":"1","mcode":"113000","bcode":"113020","code":"113020","name":"\uad70\uc0b0\uc2dc"},"113030":{"kcode":"226","tcode":"1","mcode":"113000","bcode":"113030","code":"113030","name":"\uae40\uc81c\uc2dc"},"113040":{"kcode":"227","tcode":"1","mcode":"113000","bcode":"113040","code":"113040","name":"\ub0a8\uc6d0\uc2dc"},"113050":{"kcode":"228","tcode":"1","mcode":"113000","bcode":"113050","code":"113050","name":"\ubb34\uc8fc\uad70"},"113060":{"kcode":"229","tcode":"1","mcode":"113000","bcode":"113060","code":"113060","name":"\ubd80\uc548\uad70"},"113070":{"kcode":"230","tcode":"1","mcode":"113000","bcode":"113070","code":"113070","name":"\uc21c\ucc3d\uad70"},"113080":{"kcode":"231","tcode":"1","mcode":"113000","bcode":"113080","code":"113080","name":"\uc644\uc8fc\uad70"},"113090":{"kcode":"232","tcode":"1","mcode":"113000","bcode":"113090","code":"113090","name":"\uc775\uc0b0\uc2dc"},"113100":{"kcode":"233","tcode":"1","mcode":"113000","bcode":"113100","code":"113100","name":"\uc784\uc2e4\uad70"},"113110":{"kcode":"234","tcode":"1","mcode":"113000","bcode":"113110","code":"113110","name":"\uc7a5\uc218\uad70"},"113120":{"kcode":"235","tcode":"1","mcode":"113000","bcode":"113120","code":"113120","name":"\uc804\uc8fc\uc2dc"},"113130":{"kcode":"236","tcode":"1","mcode":"113000","bcode":"113130","code":"113130","name":"\uc804\uc8fc\uc2dc \ub355\uc9c4\uad6c"},"113140":{"kcode":"237","tcode":"1","mcode":"113000","bcode":"113140","code":"113140","name":"\uc804\uc8fc\uc2dc \uc644\uc0b0\uad6c"},"113150":{"kcode":"238","tcode":"1","mcode":"113000","bcode":"113150","code":"113150","name":"\uc815\uc74d\uc2dc"},"113160":{"kcode":"239","tcode":"1","mcode":"113000","bcode":"113160","code":"113160","name":"\uc9c4\uc548\uad70"}}},"114000":{"mcode":"114000","name":"\ucda9\ubd81","keyword":{"114000":{"kcode":"257","tcode":"1","mcode":"114000","bcode":"114000","code":"114000","name":"\ucda9\ubd81\uc804\uccb4"},"114010":{"kcode":"258","tcode":"1","mcode":"114000","bcode":"114010","code":"114010","name":"\uad34\uc0b0\uad70"},"114020":{"kcode":"259","tcode":"1","mcode":"114000","bcode":"114020","code":"114020","name":"\ub2e8\uc591\uad70"},"114030":{"kcode":"260","tcode":"1","mcode":"114000","bcode":"114030","code":"114030","name":"\ubcf4\uc740\uad70"},"114040":{"kcode":"261","tcode":"1","mcode":"114000","bcode":"114040","code":"114040","name":"\uc601\ub3d9\uad70"},"114050":{"kcode":"262","tcode":"1","mcode":"114000","bcode":"114050","code":"114050","name":"\uc625\ucc9c\uad70"},"114060":{"kcode":"263","tcode":"1","mcode":"114000","bcode":"114060","code":"114060","name":"\uc74c\uc131\uad70"},"114070":{"kcode":"264","tcode":"1","mcode":"114000","bcode":"114070","code":"114070","name":"\uc81c\ucc9c\uc2dc"},"114080":{"kcode":"265","tcode":"1","mcode":"114000","bcode":"114080","code":"114080","name":"\uc99d\ud3c9\uad70"},"114090":{"kcode":"266","tcode":"1","mcode":"114000","bcode":"114090","code":"114090","name":"\uc9c4\ucc9c\uad70"},"114100":{"kcode":"267","tcode":"1","mcode":"114000","bcode":"114100","code":"114100","name":"\uccad\uc6d0\uad70"},"114110":{"kcode":"268","tcode":"1","mcode":"114000","bcode":"114110","code":"114110","name":"\uccad\uc8fc\uc2dc"},"114120":{"kcode":"269","tcode":"1","mcode":"114000","bcode":"114120","code":"114120","name":"\uccad\uc8fc\uc2dc \uc0c1\ub2f9\uad6c"},"114130":{"kcode":"270","tcode":"1","mcode":"114000","bcode":"114130","code":"114130","name":"\uccad\uc8fc\uc2dc \ud765\ub355\uad6c"},"114140":{"kcode":"271","tcode":"1","mcode":"114000","bcode":"114140","code":"114140","name":"\ucda9\uc8fc\uc2dc"},"114150":{"kcode":"36463","tcode":"1","mcode":"114000","bcode":"114150","code":"114150","name":"\uccad\uc8fc\uc2dc \uccad\uc6d0\uad6c"},"114160":{"kcode":"36464","tcode":"1","mcode":"114000","bcode":"114160","code":"114160","name":"\uccad\uc8fc\uc2dc \uc11c\uc6d0\uad6c"}}},"115000":{"mcode":"115000","name":"\ucda9\ub0a8","keyword":{"115000":{"kcode":"240","tcode":"1","mcode":"115000","bcode":"115000","code":"115000","name":"\ucda9\ub0a8\uc804\uccb4"},"115010":{"kcode":"241","tcode":"1","mcode":"115000","bcode":"115010","code":"115010","name":"\uacc4\ub8e1\uc2dc"},"115020":{"kcode":"242","tcode":"1","mcode":"115000","bcode":"115020","code":"115020","name":"\uacf5\uc8fc\uc2dc"},"115030":{"kcode":"243","tcode":"1","mcode":"115000","bcode":"115030","code":"115030","name":"\uae08\uc0b0\uad70"},"115040":{"kcode":"244","tcode":"1","mcode":"115000","bcode":"115040","code":"115040","name":"\ub17c\uc0b0\uc2dc"},"115050":{"kcode":"245","tcode":"1","mcode":"115000","bcode":"115050","code":"115050","name":"\ub2f9\uc9c4\uc2dc"},"115060":{"kcode":"246","tcode":"1","mcode":"115000","bcode":"115060","code":"115060","name":"\ubcf4\ub839\uc2dc"},"115070":{"kcode":"247","tcode":"1","mcode":"115000","bcode":"115070","code":"115070","name":"\ubd80\uc5ec\uad70"},"115080":{"kcode":"248","tcode":"1","mcode":"115000","bcode":"115080","code":"115080","name":"\uc11c\uc0b0\uc2dc"},"115090":{"kcode":"249","tcode":"1","mcode":"115000","bcode":"115090","code":"115090","name":"\uc11c\ucc9c\uad70"},"115100":{"kcode":"250","tcode":"1","mcode":"115000","bcode":"115100","code":"115100","name":"\uc544\uc0b0\uc2dc"},"115110":{"kcode":"251","tcode":"1","mcode":"115000","bcode":"115110","code":"115110","name":"\uc5f0\uae30\uad70"},"115120":{"kcode":"252","tcode":"1","mcode":"115000","bcode":"115120","code":"115120","name":"\uc608\uc0b0\uad70"},"115130":{"kcode":"253","tcode":"1","mcode":"115000","bcode":"115130","code":"115130","name":"\ucc9c\uc548\uc2dc"},"115133":{"kcode":"28602","tcode":"1","mcode":"115000","bcode":"115133","code":"115133","name":"\ucc9c\uc548\uc2dc \ub3d9\ub0a8\uad6c"},"115135":{"kcode":"28603","tcode":"1","mcode":"115000","bcode":"115135","code":"115135","name":"\ucc9c\uc548\uc2dc \uc11c\ubd81\uad6c"},"115140":{"kcode":"254","tcode":"1","mcode":"115000","bcode":"115140","code":"115140","name":"\uccad\uc591\uad70"},"115150":{"kcode":"255","tcode":"1","mcode":"115000","bcode":"115150","code":"115150","name":"\ud0dc\uc548\uad70"},"115160":{"kcode":"256","tcode":"1","mcode":"115000","bcode":"115160","code":"115160","name":"\ud64d\uc131\uad70"}}},"116000":{"mcode":"116000","name":"\uc81c\uc8fc","keyword":{"116000":{"kcode":"272","tcode":"1","mcode":"116000","bcode":"116000","code":"116000","name":"\uc81c\uc8fc\uc804\uccb4"},"116030":{"kcode":"275","tcode":"1","mcode":"116000","bcode":"116030","code":"116030","name":"\uc11c\uadc0\ud3ec\uc2dc"},"116040":{"kcode":"276","tcode":"1","mcode":"116000","bcode":"116040","code":"116040","name":"\uc81c\uc8fc\uc2dc"}}},"118000":{"mcode":"118000","name":"\uc138\uc885","keyword":{"118000":{"kcode":"34380","tcode":"1","mcode":"118000","bcode":"118000","code":"118000","name":"\uc138\uc885\ud2b9\ubcc4\uc790\uce58\uc2dc"}}},"117000":{"mcode":"117000","name":"\uc804\uad6d","keyword":{"117000":{"kcode":"277","tcode":"1","mcode":"117000","bcode":"117000","code":"117000","name":"\uc804\uad6d"}}}}},"2":{"tcode":2,"name":"\ud574\uc678","code":{"210000":{"mcode":"210000","name":"\uc544\uc2dc\uc544\u00b7\uc911\ub3d9","keyword":{"210000":{"kcode":"278","tcode":"1","mcode":"210000","bcode":"210000","code":"210000","name":"\uc544\uc2dc\uc544\u00b7\uc911\ub3d9\uc804\uccb4"},"210100":{"kcode":"279","tcode":"1","mcode":"210000","bcode":"210100","code":"210100","name":"\ub300\ub9cc"},"210200":{"kcode":"280","tcode":"1","mcode":"210000","bcode":"210200","code":"210200","name":"\ub9d0\ub808\uc774\uc2dc\uc544"},"210300":{"kcode":"281","tcode":"1","mcode":"210000","bcode":"210300","code":"210300","name":"\ubabd\uace8"},"210400":{"kcode":"282","tcode":"1","mcode":"210000","bcode":"210400","code":"210400","name":"\ubbf8\uc580\ub9c8"},"210500":{"kcode":"283","tcode":"1","mcode":"210000","bcode":"210500","code":"210500","name":"\ubc29\uae00\ub77c\ub370\uc2dc"},"210600":{"kcode":"284","tcode":"1","mcode":"210000","bcode":"210600","code":"210600","name":"\ubca0\ud2b8\ub0a8"},"210700":{"kcode":"285","tcode":"1","mcode":"210000","bcode":"210700","code":"210700","name":"\uc0ac\uc6b0\ub514\uc544\ub77c\ube44\uc544"},"210800":{"kcode":"286","tcode":"1","mcode":"210000","bcode":"210800","code":"210800","name":"\uc2a4\ub9ac\ub791\uce74"},"210900":{"kcode":"287","tcode":"1","mcode":"210000","bcode":"210900","code":"210900","name":"\uc2f1\uac00\ud3ec\ub974"},"211000":{"kcode":"288","tcode":"1","mcode":"210000","bcode":"211000","code":"211000","name":"\uc778\ub3c4"},"211100":{"kcode":"289","tcode":"1","mcode":"210000","bcode":"211100","code":"211100","name":"\uc778\ub3c4\ub124\uc2dc\uc544"},"211200":{"kcode":"290","tcode":"1","mcode":"210000","bcode":"211200","code":"211200","name":"\uc77c\ubcf8"},"211300":{"kcode":"340","tcode":"1","mcode":"210000","bcode":"211300","code":"211300","name":"\uc911\uad6d.\ud64d\ucf69"},"211400":{"kcode":"370","tcode":"1","mcode":"210000","bcode":"211400","code":"211400","name":"\uce84\ubcf4\ub514\uc544"},"211500":{"kcode":"371","tcode":"1","mcode":"210000","bcode":"211500","code":"211500","name":"\ud0dc\uad6d"},"211600":{"kcode":"372","tcode":"1","mcode":"210000","bcode":"211600","code":"211600","name":"\ud544\ub9ac\ud540"},"211700":{"kcode":"7496","tcode":"1","mcode":"210000","bcode":"211700","code":"211700","name":"\uadf8\ub8e8\uc9c0\uc544"},"211800":{"kcode":"7497","tcode":"1","mcode":"210000","bcode":"211800","code":"211800","name":"\ub124\ud314"},"212000":{"kcode":"7499","tcode":"1","mcode":"210000","bcode":"212000","code":"212000","name":"\ub77c\uc624\uc2a4"},"212100":{"kcode":"7500","tcode":"1","mcode":"210000","bcode":"212100","code":"212100","name":"\ub808\ubc14\ub17c"},"212300":{"kcode":"7502","tcode":"1","mcode":"210000","bcode":"212300","code":"212300","name":"\ubab0\ub514\ube0c"},"212400":{"kcode":"7503","tcode":"1","mcode":"210000","bcode":"212400","code":"212400","name":"\ubc14\ub808\uc778"},"212600":{"kcode":"7505","tcode":"1","mcode":"210000","bcode":"212600","code":"212600","name":"\ubd80\ud0c4"},"212700":{"kcode":"7506","tcode":"1","mcode":"210000","bcode":"212700","code":"212700","name":"\ubd81\ud55c"},"212800":{"kcode":"7507","tcode":"1","mcode":"210000","bcode":"212800","code":"212800","name":"\ube0c\ub8e8\ub098\uc774"},"212900":{"kcode":"7508","tcode":"1","mcode":"210000","bcode":"212900","code":"212900","name":"\uc2dc\ub9ac\uc544"},"213000":{"kcode":"7509","tcode":"1","mcode":"210000","bcode":"213000","code":"213000","name":"\uc544\ub78d\uc5d0\ubbf8\ub808\uc774\ud2b8\uc5f0\ud569\uad6d"},"213100":{"kcode":"7510","tcode":"1","mcode":"210000","bcode":"213100","code":"213100","name":"\uc544\ud504\uac00\ub2c8\uc2a4\ud0c4"},"213200":{"kcode":"7511","tcode":"1","mcode":"210000","bcode":"213200","code":"213200","name":"\uc601\uad6d\ub839 \uc778\ub3c4\uc591\uc2dd\ubbfc\uc9c0"},"213300":{"kcode":"7512","tcode":"1","mcode":"210000","bcode":"213300","code":"213300","name":"\uc608\uba58"},"213400":{"kcode":"7513","tcode":"1","mcode":"210000","bcode":"213400","code":"213400","name":"\uc624\ub9cc"},"213500":{"kcode":"7514","tcode":"1","mcode":"210000","bcode":"213500","code":"213500","name":"\uc694\ub974\ub2e8"},"213600":{"kcode":"7515","tcode":"1","mcode":"210000","bcode":"213600","code":"213600","name":"\uc6b0\uc988\ubca0\ud0a4\uc2a4\ud0c4"},"213700":{"kcode":"7516","tcode":"1","mcode":"210000","bcode":"213700","code":"213700","name":"\uc774\ub77c\ud06c"},"213800":{"kcode":"7517","tcode":"1","mcode":"210000","bcode":"213800","code":"213800","name":"\uc774\ub780"},"213900":{"kcode":"7518","tcode":"1","mcode":"210000","bcode":"213900","code":"213900","name":"\uce74\uc790\ud750\uc2a4\ud0c4"},"214000":{"kcode":"7519","tcode":"1","mcode":"210000","bcode":"214000","code":"214000","name":"\uce74\ud0c0\ub974"},"214100":{"kcode":"7520","tcode":"1","mcode":"210000","bcode":"214100","code":"214100","name":"\ucfe0\uc6e8\uc774\ud2b8"},"214200":{"kcode":"7521","tcode":"1","mcode":"210000","bcode":"214200","code":"214200","name":"\ud0c0\uc9c0\ud0a4\uc2a4\ud0c4"},"214300":{"kcode":"7522","tcode":"1","mcode":"210000","bcode":"214300","code":"214300","name":"\ud22c\ub974\ud06c\uba54\ub2c8\uc2a4\ud0c4"},"214400":{"kcode":"7523","tcode":"1","mcode":"210000","bcode":"214400","code":"214400","name":"\ub3d9\ud2f0\ubaa8\ub974"},"214500":{"kcode":"7524","tcode":"1","mcode":"210000","bcode":"214500","code":"214500","name":"\ud30c\ud0a4\uc2a4\ud0c4"},"214600":{"kcode":"21861","tcode":"1","mcode":"210000","bcode":"214600","code":"214600","name":"\ud0a4\ub974\uae30\uc988\uc2a4\ud0c4"},"214700":{"kcode":"7570","tcode":"1","mcode":"210000","bcode":"214700","code":"214700","name":"\uc544\ub974\uba54\ub2c8\uc544"},"214800":{"kcode":"7573","tcode":"1","mcode":"210000","bcode":"214800","code":"214800","name":"\uc544\uc81c\ub974\ubc14\uc774\uc794"},"219900":{"kcode":"373","tcode":"1","mcode":"210000","bcode":"219900","code":"219900","name":"\uc544\uc2dc\uc544\u00b7\uc911\ub3d9\uae30\ud0c0"}}},"220000":{"mcode":"220000","name":"\ubd81\u00b7\uc911\ubbf8","keyword":{"220000":{"kcode":"374","tcode":"1","mcode":"220000","bcode":"220000","code":"220000","name":"\ubd81\u00b7\uc911\ubbf8\uc804\uccb4"},"220100":{"kcode":"375","tcode":"1","mcode":"220000","bcode":"220100","code":"220100","name":"\uba55\uc2dc\ucf54"},"220200":{"kcode":"376","tcode":"1","mcode":"220000","bcode":"220200","code":"220200","name":"\ubbf8\uad6d"},"220300":{"kcode":"434","tcode":"1","mcode":"220000","bcode":"220300","code":"220300","name":"\uce90\ub098\ub2e4"},"220400":{"kcode":"7525","tcode":"1","mcode":"220000","bcode":"220400","code":"220400","name":"\uadf8\ub9b0\ub780\ub4dc"},"220500":{"kcode":"7526","tcode":"1","mcode":"220000","bcode":"220500","code":"220500","name":"\ub3c4\ubbf8\ub2c8\uce74\uacf5\ud654\uad6d"},"220600":{"kcode":"7527","tcode":"1","mcode":"220000","bcode":"220600","code":"220600","name":"\ubc14\ubca0\uc774\ub3c4\uc2a4"},"220700":{"kcode":"7528","tcode":"1","mcode":"220000","bcode":"220700","code":"220700","name":"\ubc14\ud558\ub9c8"},"220800":{"kcode":"7529","tcode":"1","mcode":"220000","bcode":"220800","code":"220800","name":"\ubc84\ubba4\ub2e4"},"220900":{"kcode":"7530","tcode":"1","mcode":"220000","bcode":"220900","code":"220900","name":"\uc138\uc778\ud2b8\ud53c\uc5d0\ub974\ubbf8\uadf8\uc628"},"221000":{"kcode":"21510","tcode":"1","mcode":"220000","bcode":"221000","code":"221000","name":"\uc0ac\uc774\ud310"},"221100":{"kcode":"21862","tcode":"1","mcode":"220000","bcode":"221100","code":"221100","name":"\uc138\uc778\ud2b8\ud0a4\uce20\ub124\ube44\uc2a4"},"221200":{"kcode":"21863","tcode":"1","mcode":"220000","bcode":"221200","code":"221200","name":"\ub124\ub35c\ub780\ub4dc\ub839 \uc548\ud2f8\ub808\uc2a4\uc81c\ub3c4"},"221300":{"kcode":"7541","tcode":"1","mcode":"220000","bcode":"221300","code":"221300","name":"\uc138\uc778\ud2b8\ub8e8\uc2dc\uc544"},"221400":{"kcode":"7542","tcode":"1","mcode":"220000","bcode":"221400","code":"221400","name":"\uc138\uc778\ud2b8\ube48\uc13c\ud2b8\uadf8\ub808\ub098\ub518\uc988"},"221500":{"kcode":"7549","tcode":"1","mcode":"220000","bcode":"221500","code":"221500","name":"\ucf54\uc2a4\ud0c0\ub9ac\uce74"},"229900":{"kcode":"435","tcode":"1","mcode":"220000","bcode":"229900","code":"229900","name":"\ubd81\u00b7\uc911\ubbf8\uae30\ud0c0"}}},"230000":{"mcode":"230000","name":"\ub0a8\ubbf8","keyword":{"230000":{"kcode":"436","tcode":"1","mcode":"230000","bcode":"230000","code":"230000","name":"\ub0a8\ubbf8\uc804\uccb4"},"230100":{"kcode":"437","tcode":"1","mcode":"230000","bcode":"230100","code":"230100","name":"\uacfc\ud14c\ub9d0\ub77c"},"230200":{"kcode":"438","tcode":"1","mcode":"230000","bcode":"230200","code":"230200","name":"\ubca0\ub124\uc218\uc5d8\ub77c"},"230300":{"kcode":"439","tcode":"1","mcode":"230000","bcode":"230300","code":"230300","name":"\ube0c\ub77c\uc9c8"},"230400":{"kcode":"440","tcode":"1","mcode":"230000","bcode":"230400","code":"230400","name":"\uc544\ub974\ud5e8\ud2f0\ub098"},"230500":{"kcode":"441","tcode":"1","mcode":"230000","bcode":"230500","code":"230500","name":"\uc5d0\ucf70\ub3c4\ub974"},"230600":{"kcode":"442","tcode":"1","mcode":"230000","bcode":"230600","code":"230600","name":"\uc628\ub450\ub77c\uc2a4"},"230700":{"kcode":"443","tcode":"1","mcode":"230000","bcode":"230700","code":"230700","name":"\uc6b0\ub8e8\uacfc\uc774"},"230800":{"kcode":"444","tcode":"1","mcode":"230000","bcode":"230800","code":"230800","name":"\uce60\ub808"},"230900":{"kcode":"445","tcode":"1","mcode":"230000","bcode":"230900","code":"230900","name":"\ucf5c\ub86c\ube44\uc544"},"231000":{"kcode":"446","tcode":"1","mcode":"230000","bcode":"231000","code":"231000","name":"\ucfe0\ubc14"},"231100":{"kcode":"447","tcode":"1","mcode":"230000","bcode":"231100","code":"231100","name":"\ud30c\ub098\ub9c8"},"231200":{"kcode":"448","tcode":"1","mcode":"230000","bcode":"231200","code":"231200","name":"\ud398\ub8e8"},"231300":{"kcode":"7531","tcode":"1","mcode":"230000","bcode":"231300","code":"231300","name":"\uac00\uc774\uc544\ub098"},"231400":{"kcode":"7532","tcode":"1","mcode":"230000","bcode":"231400","code":"231400","name":"\uacfc\ub378\ub8e8\ud504"},"231500":{"kcode":"7533","tcode":"1","mcode":"230000","bcode":"231500","code":"231500","name":"\uae30\uc544\ub098(\ud504\ub791\uc2a4\ub839)"},"231600":{"kcode":"7534","tcode":"1","mcode":"230000","bcode":"231600","code":"231600","name":"\ub2c8\uce74\ub77c\uacfc"},"231700":{"kcode":"7535","tcode":"1","mcode":"230000","bcode":"231700","code":"231700","name":"\ub3c4\ubbf8\ub2c8\uce74\uc5f0\ubc29"},"231800":{"kcode":"7536","tcode":"1","mcode":"230000","bcode":"231800","code":"231800","name":"\ub9c8\ub974\ud2f0\ub2c8\ud06c\uc12c"},"232000":{"kcode":"7538","tcode":"1","mcode":"230000","bcode":"232000","code":"232000","name":"\ubc84\uc9c4\uc81c\ub3c4"},"232100":{"kcode":"7539","tcode":"1","mcode":"230000","bcode":"232100","code":"232100","name":"\ubca8\ub9ac\uc988"},"232200":{"kcode":"7540","tcode":"1","mcode":"230000","bcode":"232200","code":"232200","name":"\ubcfc\ub9ac\ube44\uc544"},"232500":{"kcode":"7543","tcode":"1","mcode":"230000","bcode":"232500","code":"232500","name":"\uc218\ub9ac\ub0a8"},"232600":{"kcode":"7544","tcode":"1","mcode":"230000","bcode":"232600","code":"232600","name":"\uc544\uc774\ud2f0"},"232700":{"kcode":"7545","tcode":"1","mcode":"230000","bcode":"232700","code":"232700","name":"\uc548\uae38\ub77c"},"232800":{"kcode":"7546","tcode":"1","mcode":"230000","bcode":"232800","code":"232800","name":"\uc5d4\ud2f0\uac00\ubc14\ubd80\ub2e4"},"232900":{"kcode":"7547","tcode":"1","mcode":"230000","bcode":"232900","code":"232900","name":"\uc5d8\uc0b4\ubc14\ub3c4\ub974"},"233000":{"kcode":"7548","tcode":"1","mcode":"230000","bcode":"233000","code":"233000","name":"\ucf00\uc774\ub9cc\uc81c\ub3c4"},"233200":{"kcode":"7550","tcode":"1","mcode":"230000","bcode":"233200","code":"233200","name":"\ud130\ud06c\uc2a4\uc564\uce74\uc774\ucf54\uc2a4\uc81c\ub3c4"},"233300":{"kcode":"7551","tcode":"1","mcode":"230000","bcode":"233300","code":"233300","name":"\ud2b8\ub9ac\ub2c8\ub098\ub4dc\ud1a0\ubc14\uace0"},"233400":{"kcode":"7552","tcode":"1","mcode":"230000","bcode":"233400","code":"233400","name":"\ud30c\ub77c\uacfc\uc774"},"233500":{"kcode":"7553","tcode":"1","mcode":"230000","bcode":"233500","code":"233500","name":"\ud3ec\ud074\ub79c\ub4dc\uc81c\ub3c4"},"233600":{"kcode":"7554","tcode":"1","mcode":"230000","bcode":"233600","code":"233600","name":"\ud478\uc5d0\ub974\ud1a0\ub9ac\ucf54"},"239900":{"kcode":"449","tcode":"1","mcode":"230000","bcode":"239900","code":"239900","name":"\ub0a8\ubbf8\uae30\ud0c0"}}},"240000":{"mcode":"240000","name":"\uc720\ub7fd","keyword":{"240000":{"kcode":"450","tcode":"1","mcode":"240000","bcode":"240000","code":"240000","name":"\uc720\ub7fd\uc804\uccb4"},"240100":{"kcode":"451","tcode":"1","mcode":"240000","bcode":"240100","code":"240100","name":"\uadf8\ub9ac\uc2a4"},"240200":{"kcode":"452","tcode":"1","mcode":"240000","bcode":"240200","code":"240200","name":"\ub124\ub35c\ub780\ub4dc"},"240300":{"kcode":"453","tcode":"1","mcode":"240000","bcode":"240300","code":"240300","name":"\ub178\ub974\uc6e8\uc774"},"240400":{"kcode":"454","tcode":"1","mcode":"240000","bcode":"240400","code":"240400","name":"\ub374\ub9c8\ud06c"},"240500":{"kcode":"455","tcode":"1","mcode":"240000","bcode":"240500","code":"240500","name":"\ub3c5\uc77c"},"240600":{"kcode":"456","tcode":"1","mcode":"240000","bcode":"240600","code":"240600","name":"\ub7ec\uc2dc\uc544"},"240700":{"kcode":"457","tcode":"1","mcode":"240000","bcode":"240700","code":"240700","name":"\ubca8\uae30\uc5d0"},"240800":{"kcode":"458","tcode":"1","mcode":"240000","bcode":"240800","code":"240800","name":"\uc2a4\uc6e8\ub374"},"240900":{"kcode":"459","tcode":"1","mcode":"240000","bcode":"240900","code":"240900","name":"\uc2a4\uc704\uc2a4"},"241000":{"kcode":"460","tcode":"1","mcode":"240000","bcode":"241000","code":"241000","name":"\uc2a4\ud398\uc778"},"241100":{"kcode":"461","tcode":"1","mcode":"240000","bcode":"241100","code":"241100","name":"\uc601\uad6d"},"241200":{"kcode":"462","tcode":"1","mcode":"240000","bcode":"241200","code":"241200","name":"\uc774\ud0c8\ub9ac\uc544"},"241300":{"kcode":"463","tcode":"1","mcode":"240000","bcode":"241300","code":"241300","name":"\uccb4\ucf54"},"241400":{"kcode":"464","tcode":"1","mcode":"240000","bcode":"241400","code":"241400","name":"\ud130\ud0a4"},"241500":{"kcode":"465","tcode":"1","mcode":"240000","bcode":"241500","code":"241500","name":"\ud3ec\ub974\ud22c\uac08"},"241600":{"kcode":"466","tcode":"1","mcode":"240000","bcode":"241600","code":"241600","name":"\ud3f4\ub780\ub4dc"},"241700":{"kcode":"467","tcode":"1","mcode":"240000","bcode":"241700","code":"241700","name":"\ud504\ub791\uc2a4"},"241800":{"kcode":"468","tcode":"1","mcode":"240000","bcode":"241800","code":"241800","name":"\ud540\ub780\ub4dc"},"241900":{"kcode":"469","tcode":"1","mcode":"240000","bcode":"241900","code":"241900","name":"\ud5dd\uac00\ub9ac"},"242000":{"kcode":"7555","tcode":"1","mcode":"240000","bcode":"242000","code":"242000","name":"\uadf8\ub77c\ub098\ub2e4"},"242100":{"kcode":"7556","tcode":"1","mcode":"240000","bcode":"242100","code":"242100","name":"\ub77c\ud2b8\ube44\uc544"},"242200":{"kcode":"7557","tcode":"1","mcode":"240000","bcode":"242200","code":"242200","name":"\ub8e8\ub9c8\ub2c8\uc544"},"242300":{"kcode":"7558","tcode":"1","mcode":"240000","bcode":"242300","code":"242300","name":"\ub8e9\uc148\ubd80\ub974\ud06c"},"242400":{"kcode":"7559","tcode":"1","mcode":"240000","bcode":"242400","code":"242400","name":"\ub9ac\ud22c\uc544\ub2c8\uc544"},"242500":{"kcode":"7560","tcode":"1","mcode":"240000","bcode":"242500","code":"242500","name":"\ub9c8\ucf00\ub3c4\ub2c8\uc544"},"242600":{"kcode":"7561","tcode":"1","mcode":"240000","bcode":"242600","code":"242600","name":"\ubaa8\ub098\ucf54"},"242700":{"kcode":"7562","tcode":"1","mcode":"240000","bcode":"242700","code":"242700","name":"\ubab0\ud0c0"},"242800":{"kcode":"7563","tcode":"1","mcode":"240000","bcode":"242800","code":"242800","name":"\ubabd\ud2b8\uc138\ub77c"},"242900":{"kcode":"7564","tcode":"1","mcode":"240000","bcode":"242900","code":"242900","name":"\ubca8\ub85c\ub8e8\uc2dc"},"243000":{"kcode":"7565","tcode":"1","mcode":"240000","bcode":"243000","code":"243000","name":"\ubcf4\uc2a4\ub2c8\uc544\ud5e4\ub974\uccb4\uace0\ube44\ub098"},"243100":{"kcode":"7566","tcode":"1","mcode":"240000","bcode":"243100","code":"243100","name":"\ubd88\uac00\ub9ac\uc544"},"243200":{"kcode":"7567","tcode":"1","mcode":"240000","bcode":"243200","code":"243200","name":"\uc2ac\ub85c\ubca0\ub2c8\uc544"},"243300":{"kcode":"7568","tcode":"1","mcode":"240000","bcode":"243300","code":"243300","name":"\uc2ac\ub85c\ubc14\ud0a4\uc544"},"243400":{"kcode":"7569","tcode":"1","mcode":"240000","bcode":"243400","code":"243400","name":"\uc544\ub8e8\ubc14"},"243600":{"kcode":"7571","tcode":"1","mcode":"240000","bcode":"243600","code":"243600","name":"\uc544\uc774\uc2ac\ub780\ub4dc"},"243700":{"kcode":"7572","tcode":"1","mcode":"240000","bcode":"243700","code":"243700","name":"\uc544\uc77c\ub79c\ub4dc"},"243900":{"kcode":"7574","tcode":"1","mcode":"240000","bcode":"243900","code":"243900","name":"\uc54c\ubc14\ub2c8\uc544"},"244000":{"kcode":"7575","tcode":"1","mcode":"240000","bcode":"244000","code":"244000","name":"\uc5d0\uc2a4\ud1a0\ub2c8\uc544"},"244100":{"kcode":"7576","tcode":"1","mcode":"240000","bcode":"244100","code":"244100","name":"\uc624\uc2a4\ud2b8\ub9ac\uc544"},"244200":{"kcode":"7577","tcode":"1","mcode":"240000","bcode":"244200","code":"244200","name":"\uc6b0\ud06c\ub77c\uc774\ub098"},"244300":{"kcode":"7578","tcode":"1","mcode":"240000","bcode":"244300","code":"244300","name":"\uc2e0\uc720\uace0\uc5f0\ubc29"},"244400":{"kcode":"7579","tcode":"1","mcode":"240000","bcode":"244400","code":"244400","name":"\uc774\uc2a4\ub77c\uc5d8"},"244500":{"kcode":"7580","tcode":"1","mcode":"240000","bcode":"244500","code":"244500","name":"\uc9c0\ube0c\ub864\ud130"},"244600":{"kcode":"7581","tcode":"1","mcode":"240000","bcode":"244600","code":"244600","name":"\ud06c\ub85c\uc544\ud2f0\uc544"},"244700":{"kcode":"7582","tcode":"1","mcode":"240000","bcode":"244700","code":"244700","name":"\ud0a4\ud504\ub85c\uc2a4"},"244800":{"kcode":"7583","tcode":"1","mcode":"240000","bcode":"244800","code":"244800","name":"\ud398\ub85c\uc81c\ub3c4"},"245100":{"kcode":"21864","tcode":"1","mcode":"240000","bcode":"245100","code":"245100","name":"\uc0b0\ub9c8\ub9ac\ub178"},"245200":{"kcode":"21865","tcode":"1","mcode":"240000","bcode":"245200","code":"245200","name":"\ubc14\ud2f0\uce78\uc2dc\uad6d"},"245300":{"kcode":"21866","tcode":"1","mcode":"240000","bcode":"245300","code":"245300","name":"\ubaac\ud14c\ub124\uadf8\ub85c"},"245400":{"kcode":"21867","tcode":"1","mcode":"240000","bcode":"245400","code":"245400","name":"\ubab0\ub3c4\ubc14"},"245500":{"kcode":"21868","tcode":"1","mcode":"240000","bcode":"245500","code":"245500","name":"\ub9ac\ud788\ud150\uc288\ud0c0\uc778"},"249900":{"kcode":"470","tcode":"1","mcode":"240000","bcode":"249900","code":"249900","name":"\uc720\ub7fd\uae30\ud0c0"}}},"250000":{"mcode":"250000","name":"\uc624\uc138\uc544\ub2c8\uc544","keyword":{"250000":{"kcode":"471","tcode":"1","mcode":"250000","bcode":"250000","code":"250000","name":"\uc624\uc138\uc544\ub2c8\uc544\uc804\uccb4"},"250100":{"kcode":"472","tcode":"1","mcode":"250000","bcode":"250100","code":"250100","name":"\uad0c"},"250200":{"kcode":"473","tcode":"1","mcode":"250000","bcode":"250200","code":"250200","name":"\ub274\uc9c8\ub79c\ub4dc"},"250300":{"kcode":"474","tcode":"1","mcode":"250000","bcode":"250300","code":"250300","name":"\ud30c\ud478\uc544\ub274\uae30\ub2c8"},"250400":{"kcode":"475","tcode":"1","mcode":"250000","bcode":"250400","code":"250400","name":"\ud53c\uc9c0"},"250500":{"kcode":"476","tcode":"1","mcode":"250000","bcode":"250500","code":"250500","name":"\ud638\uc8fc"},"250600":{"kcode":"7584","tcode":"1","mcode":"250000","bcode":"250600","code":"250600","name":"\ub274\uce7c\ub808\ub3c4\ub2c8\uc544\uc12c"},"250700":{"kcode":"7585","tcode":"1","mcode":"250000","bcode":"250700","code":"250700","name":"\ub9c8\uc0ec\uad70\ub3c4"},"250800":{"kcode":"7586","tcode":"1","mcode":"250000","bcode":"250800","code":"250800","name":"\ubc14\ub204\uc544\ud22c"},"250900":{"kcode":"7587","tcode":"1","mcode":"250000","bcode":"250900","code":"250900","name":"\uc0ac\ubaa8\uc544"},"251000":{"kcode":"7588","tcode":"1","mcode":"250000","bcode":"251000","code":"251000","name":"\ucfe0\ud06c \uad70\ub3c4"},"251100":{"kcode":"7589","tcode":"1","mcode":"250000","bcode":"251100","code":"251100","name":"\ud0a4\ub9ac\ubc14\uc2dc"},"251200":{"kcode":"7590","tcode":"1","mcode":"250000","bcode":"251200","code":"251200","name":"\ud1b5\uac00"},"251300":{"kcode":"7591","tcode":"1","mcode":"250000","bcode":"251300","code":"251300","name":"\ud22c\ubc1c\ub8e8"},"251500":{"kcode":"7593","tcode":"1","mcode":"250000","bcode":"251500","code":"251500","name":"\ud3f4\ub9ac\ub124\uc2dc\uc544\uc81c\ub3c4"},"251600":{"kcode":"21869","tcode":"1","mcode":"250000","bcode":"251600","code":"251600","name":"\ud314\ub77c\uc6b0"},"251700":{"kcode":"21870","tcode":"1","mcode":"250000","bcode":"251700","code":"251700","name":"\ud54f\ucf00\uc5b8\uc81c\ub3c4"},"251800":{"kcode":"21871","tcode":"1","mcode":"250000","bcode":"251800","code":"251800","name":"\ud1a0\ucf08\ub77c\uc6b0\uc81c\ub3c4"},"251900":{"kcode":"21872","tcode":"1","mcode":"250000","bcode":"251900","code":"251900","name":"\uc194\ub85c\ubaac\uc81c\ub3c4"},"252000":{"kcode":"21873","tcode":"1","mcode":"250000","bcode":"252000","code":"252000","name":"\ubbf8\ud06c\ub85c\ub124\uc2dc\uc544"},"252100":{"kcode":"21874","tcode":"1","mcode":"250000","bcode":"252100","code":"252100","name":"\ubd81\ub9c8\ub9ac\uc544\ub098\uad70\ub3c4"},"252200":{"kcode":"21875","tcode":"1","mcode":"250000","bcode":"252200","code":"252200","name":"\ub098\uc6b0\ub8e8\uacf5\ud654\uad6d"},"259900":{"kcode":"477","tcode":"1","mcode":"250000","bcode":"259900","code":"259900","name":"\uc624\uc138\uc544\ub2c8\uc544\uae30\ud0c0"}}},"260000":{"mcode":"260000","name":"\uc544\ud504\ub9ac\uce74","keyword":{"260000":{"kcode":"478","tcode":"1","mcode":"260000","bcode":"260000","code":"260000","name":"\uc544\ud504\ub9ac\uce74\uc804\uccb4"},"260100":{"kcode":"479","tcode":"1","mcode":"260000","bcode":"260100","code":"260100","name":"\uac00\ub098"},"260200":{"kcode":"480","tcode":"1","mcode":"260000","bcode":"260200","code":"260200","name":"\uac00\ubd09"},"260300":{"kcode":"481","tcode":"1","mcode":"260000","bcode":"260300","code":"260300","name":"\ub098\uc774\uc9c0\ub9ac\uc544"},"260400":{"kcode":"482","tcode":"1","mcode":"260000","bcode":"260400","code":"260400","name":"\ub0a8\uc544\ud504\ub9ac\uce74\uacf5\ud654\uad6d"},"260500":{"kcode":"483","tcode":"1","mcode":"260000","bcode":"260500","code":"260500","name":"\ub9ac\ube44\uc544"},"260600":{"kcode":"484","tcode":"1","mcode":"260000","bcode":"260600","code":"260600","name":"\ubaa8\ub85c\ucf54"},"260700":{"kcode":"485","tcode":"1","mcode":"260000","bcode":"260700","code":"260700","name":"\uc218\ub2e8"},"260900":{"kcode":"487","tcode":"1","mcode":"260000","bcode":"260900","code":"260900","name":"\uc5d0\ud2f0\uc624\ud53c\uc544"},"261000":{"kcode":"488","tcode":"1","mcode":"260000","bcode":"261000","code":"261000","name":"\uc6b0\uac04\ub2e4"},"261100":{"kcode":"489","tcode":"1","mcode":"260000","bcode":"261100","code":"261100","name":"\uc774\uc9d1\ud2b8"},"261200":{"kcode":"490","tcode":"1","mcode":"260000","bcode":"261200","code":"261200","name":"\ucf00\ub0d0"},"261300":{"kcode":"491","tcode":"1","mcode":"260000","bcode":"261300","code":"261300","name":"\ud0c4\uc790\ub2c8\uc544"},"261400":{"kcode":"492","tcode":"1","mcode":"260000","bcode":"261400","code":"261400","name":"\ud280\ub2c8\uc9c0"},"261500":{"kcode":"7594","tcode":"1","mcode":"260000","bcode":"261500","code":"261500","name":"\uac10\ube44\uc544"},"261600":{"kcode":"7595","tcode":"1","mcode":"260000","bcode":"261600","code":"261600","name":"\uae30\ub2c8"},"261700":{"kcode":"7596","tcode":"1","mcode":"260000","bcode":"261700","code":"261700","name":"\uae30\ub2c8\ube44\uc18c\uc6b0"},"261800":{"kcode":"7597","tcode":"1","mcode":"260000","bcode":"261800","code":"261800","name":"\ub098\ubbf8\ube44\uc544"},"261900":{"kcode":"7598","tcode":"1","mcode":"260000","bcode":"261900","code":"261900","name":"\ub2c8\uc81c\ub974"},"262000":{"kcode":"7599","tcode":"1","mcode":"260000","bcode":"262000","code":"262000","name":"\ub77c\uc774\ubca0\ub9ac\uc544"},"262100":{"kcode":"7600","tcode":"1","mcode":"260000","bcode":"262100","code":"262100","name":"\ub974\uc644\ub2e4"},"262200":{"kcode":"7601","tcode":"1","mcode":"260000","bcode":"262200","code":"262200","name":"\ub808\ub274\ub2c8\uc6a9"},"262300":{"kcode":"7602","tcode":"1","mcode":"260000","bcode":"262300","code":"262300","name":"\ub9c8\ub2e4\uac00\uc2a4\uce74\ub974"},"262400":{"kcode":"7603","tcode":"1","mcode":"260000","bcode":"262400","code":"262400","name":"\ub9d0\ub77c\uc704"},"262500":{"kcode":"7604","tcode":"1","mcode":"260000","bcode":"262500","code":"262500","name":"\ub9d0\ub9ac"},"262600":{"kcode":"7605","tcode":"1","mcode":"260000","bcode":"262600","code":"262600","name":"\ubaa8\ub9ac\ud0c0\ub2c8\uc544"},"262700":{"kcode":"7606","tcode":"1","mcode":"260000","bcode":"262700","code":"262700","name":"\ubaa8\uc7a0\ube44\ud06c"},"262800":{"kcode":"7607","tcode":"1","mcode":"260000","bcode":"262800","code":"262800","name":"\ubca0\ub0c9"},"262900":{"kcode":"7608","tcode":"1","mcode":"260000","bcode":"262900","code":"262900","name":"\ubcf4\uce20\uc640\ub098"},"263000":{"kcode":"7609","tcode":"1","mcode":"260000","bcode":"263000","code":"263000","name":"\ubd80\ub8ec\ub514"},"263100":{"kcode":"7610","tcode":"1","mcode":"260000","bcode":"263100","code":"263100","name":"\ubd80\ub974\ud0a4\ub098\ud30c\uc18c"},"263200":{"kcode":"7611","tcode":"1","mcode":"260000","bcode":"263200","code":"263200","name":"\uc138\ub124\uac08"},"263300":{"kcode":"7612","tcode":"1","mcode":"260000","bcode":"263300","code":"263300","name":"\uc138\uc774\uc140\uc81c\ub3c4"},"263400":{"kcode":"7613","tcode":"1","mcode":"260000","bcode":"263400","code":"263400","name":"\uc138\uc778\ud2b8\ud5ec\ub808\ub098\uc12c"},"263500":{"kcode":"7614","tcode":"1","mcode":"260000","bcode":"263500","code":"263500","name":"\uc18c\ub9d0\ub9ac\uc544"},"263600":{"kcode":"7615","tcode":"1","mcode":"260000","bcode":"263600","code":"263600","name":"\uc2a4\uc640\uc9c8\ub79c\ub4dc"},"263700":{"kcode":"7616","tcode":"1","mcode":"260000","bcode":"263700","code":"263700","name":"\uc2dc\uc5d0\ub77c\ub9ac\uc628"},"263800":{"kcode":"7617","tcode":"1","mcode":"260000","bcode":"263800","code":"263800","name":"\ucf54\ud2b8\ub514\ube0c\uc544\ub974"},"263900":{"kcode":"7618","tcode":"1","mcode":"260000","bcode":"263900","code":"263900","name":"\uc54c\uc81c\ub9ac"},"264000":{"kcode":"7619","tcode":"1","mcode":"260000","bcode":"264000","code":"264000","name":"\uc559\uace8\ub77c"},"264100":{"kcode":"7620","tcode":"1","mcode":"260000","bcode":"264100","code":"264100","name":"\uc790\ub9c8\uc774\uce74"},"264200":{"kcode":"7621","tcode":"1","mcode":"260000","bcode":"264200","code":"264200","name":"\uc790\uc774\ub974"},"264300":{"kcode":"7622","tcode":"1","mcode":"260000","bcode":"264300","code":"264300","name":"\uc7a0\ube44\uc544"},"264400":{"kcode":"7623","tcode":"1","mcode":"260000","bcode":"264400","code":"264400","name":"\uc801\ub3c4\uae30\ub2c8"},"264500":{"kcode":"7624","tcode":"1","mcode":"260000","bcode":"264500","code":"264500","name":"\uc911\uc559\uc544\ud504\ub9ac\uce74\uacf5\ud654\uad6d"},"264600":{"kcode":"7625","tcode":"1","mcode":"260000","bcode":"264600","code":"264600","name":"\uc9c0\ubd80\ud2f0"},"264700":{"kcode":"7626","tcode":"1","mcode":"260000","bcode":"264700","code":"264700","name":"\uc9d0\ubc14\ube0c\uc6e8"},"264800":{"kcode":"7627","tcode":"1","mcode":"260000","bcode":"264800","code":"264800","name":"\ucc28\ub4dc"},"264900":{"kcode":"7628","tcode":"1","mcode":"260000","bcode":"264900","code":"264900","name":"\uce74\uba54\ub8ec"},"265000":{"kcode":"7629","tcode":"1","mcode":"260000","bcode":"265000","code":"265000","name":"\ucf00\uc774\ud504\ubc84\ub4dc"},"265100":{"kcode":"7630","tcode":"1","mcode":"260000","bcode":"265100","code":"265100","name":"\ucf69\uace0"},"265200":{"kcode":"7631","tcode":"1","mcode":"260000","bcode":"265200","code":"265200","name":"\ud1a0\uace0"},"265300":{"kcode":"21876","tcode":"1","mcode":"260000","bcode":"265300","code":"265300","name":"\uc5d0\ub9ac\ud2b8\ub808\uc544"},"265400":{"kcode":"21877","tcode":"1","mcode":"260000","bcode":"265400","code":"265400","name":"\uc0c1\ud22c\uba54\ud504\ub9b0\uc2dc\ud398"},"265500":{"kcode":"21878","tcode":"1","mcode":"260000","bcode":"265500","code":"265500","name":"\ubaa8\ub9ac\uc154\uc2a4"},"265600":{"kcode":"21879","tcode":"1","mcode":"260000","bcode":"265600","code":"265600","name":"\ucf69\uace0\ubbfc\uc8fc\uacf5\ud654\uad6d"},"265700":{"kcode":"21880","tcode":"1","mcode":"260000","bcode":"265700","code":"265700","name":"\ucf54\ubaa8\ub85c"},"265800":{"kcode":"21881","tcode":"1","mcode":"260000","bcode":"265800","code":"265800","name":"\uce74\ubcf4\ubca0\ub974\ub370"},"269900":{"kcode":"493","tcode":"1","mcode":"260000","bcode":"269900","code":"269900","name":"\uc544\ud504\ub9ac\uce74\uae30\ud0c0"}}},"270000":{"mcode":"270000","name":"\ub0a8\uadf9\ub300\ub959","keyword":{"270000":{"kcode":"7632","tcode":"1","mcode":"270000","bcode":"270000","code":"270000","name":"\ub0a8\uadf9\ub300\ub959"}}},"280000":{"mcode":"280000","name":"\uae30\ud0c0\ud574\uc678","keyword":{"280000":{"kcode":"7633","tcode":"1","mcode":"280000","bcode":"280000","code":"280000","name":"\uae30\ud0c0\ud574\uc678"}}}}}},"preferential":{"computer":"\ucef4\ud4e8\ud130 \ud65c\uc6a9\ub2a5\ub825 \uc6b0\uc218\uc790","specialized":"\ud2b9\uc131\ud654\uace0\/\ub9c8\uc774\uc2a4\ud130\uace0","freshMan":"\uc0ac\ud68c\ucd08\ub144\uc0dd","expectant":"\uace0\uc878 \uc608\uc815\uc790","militaryOfficer":"\uc7a5\uad50\/\ubd80\uc0ac\uad00\/ROTC","intern":"\uc778\ud134\uacbd\ud5d8 \uc788\uc74c","military":"\ubcd1\uc5ed\ud2b9\ub840","alba":"\uc54c\ubc14\uacbd\ud5d8 \uc788\uc74c","disabled":"\uc7a5\uc560\uc778","photo":"\uc0ac\uc9c4 \uc788\uc74c","bohun":"\uad6d\uac00\ubcf4\ud6c8\ucc98","contact_open":"\uc804\ud654 \uc5f0\ub77d \uac00\ub2a5","nationalmerit":"\uad6d\uac00\uc720\uacf5\uc790","attach_file_cnt":"\ucca8\ubd80\ud30c\uc77c \uc788\uc74c","hire":"\uace0\uc6a9\uc9c0\uc6d0\uae08 \ub300\uc0c1"},"updateDate":{"all":"\uc804\uccb4","oneday":"\uc624\ub298","threeday":"3\uc77c \uc774\ub0b4","sevenday":"7\uc77c \uc774\ub0b4","onemonth":"1\uac1c\uc6d4 \uc774\ub0b4","twomonth":"2\uac1c\uc6d4 \uc774\ub0b4","threemonth":"3\uac1c\uc6d4 \uc774\ub0b4","sixmonth":"6\uac1c\uc6d4 \uc774\ub0b4"},"hasMandbService":false,"allowType":"c","languageExamCodeChk":{"7453":["Y","N","Y",990],"7798":["Y","Y","Y",200,{"1":{"key":"1","value":"1L"},"2":{"key":"2","value":"2L"},"3":{"key":"3","value":"3L"},"4":{"key":"4","value":"4L"},"5":{"key":"5","value":"5L"},"6":{"key":"6","value":"6L"},"7":{"key":"7","value":"7L"},"8":{"key":"8","value":"8L"}}],"7778":["N","Y","Y",0,{"1":{"key":"AL","value":"AL"},"2":{"key":"IH","value":"IH"},"3":{"key":"IM1","value":"IM1"},"4":{"key":"IM2","value":"IM2"},"5":{"key":"IM3","value":"IM3"},"6":{"key":"IL","value":"IL"},"7":{"key":"NH","value":"NH"},"8":{"key":"MN","value":"MN"},"9":{"key":"NL","value":"NL"}}],"7465":["N","Y","Y",0,{"1":{"key":"1","value":"1\uae09"},"2":{"key":"2","value":"2\uae09"},"3":{"key":"3","value":"3\uae09"},"4":{"key":"4","value":"4\uae09"}}],"25618":["Y","Y","Y",300,{"1":{"key":"1","value":"1\uae09"},"2":{"key":"2","value":"2\uae09"},"3":{"key":"3","value":"3\uae09"},"4":{"key":"4","value":"4\uae09"},"5":{"key":"5","value":"5\uae09"},"6":{"key":"6","value":"6\uae09"}}],"7466":["Y","N","Y",990],"7459":["N","Y","Y",0,{"1":{"key":"1","value":"1\uae09"},"2":{"key":"2","value":"2\uae09"},"3":{"key":"3","value":"3\uae09"},"4":{"key":"4","value":"4\uae09"},"5":{"key":"5","value":"5\uae09"},"6":{"key":"6","value":"6\uae09"},"7":{"key":"7","value":"7\uae09"},"8":{"key":"8","value":"8\uae09"},"9":{"key":"9","value":"9\uae09"},"10":{"key":"10","value":"10\uae09"},"11":{"key":"11","value":"11\uae09"}}],"28898":["N","Y","Y",0,{"1":{"key":"N1","value":"N1"},"2":{"key":"N2","value":"N2"},"3":{"key":"N3","value":"N3"},"4":{"key":"N4","value":"N4"},"5":{"key":"N5","value":"N5"}}],"7772":["N","Y","Y",0,{"1":{"key":"2.5","value":"2.5"},"2":{"key":"3","value":"3"},"3":{"key":"3.5","value":"3.5"},"4":{"key":"4","value":"4"},"5":{"key":"4.5","value":"4.5"},"6":{"key":"5","value":"5"},"7":{"key":"5.5","value":"5.5"},"8":{"key":"6","value":"6"},"9":{"key":"6.5","value":"6.5"},"10":{"key":"7","value":"7"},"11":{"key":"7.5","value":"7.5"},"12":{"key":"8","value":"8"},"13":{"key":"8.5","value":"8.5"},"14":{"key":"9","value":"9"}}],"7866":["N","Y","Y",0,{"1":{"key":"1","value":"1\uae09"},"2":{"key":"2","value":"2\uae09"},"3":{"key":"3","value":"3\uae09"},"4":{"key":"4","value":"4\uae09"},"5":{"key":"5","value":"5\uae09"},"6":{"key":"6","value":"6\uae09"}}],"7463":["Y","N","Y",120],"7464":["N","Y","Y",0,{"1":{"key":"1+","value":"1+"},"2":{"key":"1","value":"1"},"3":{"key":"2+","value":"2+"},"4":{"key":"2","value":"2"},"5":{"key":"3+","value":"3+"},"6":{"key":"3","value":"3"},"7":{"key":"4+","value":"4+"},"8":{"key":"4","value":"4"},"9":{"key":"5+","value":"5+"},"10":{"key":"5","value":"5"}}]},"languageExamBasicOption":[{"key":"","value":"===\uc22b\uc790\ub4f1\uae09==="},{"key":1,"value":"1"},{"key":"1+","value":"1+"},{"key":2,"value":"2"},{"key":"2-","value":"2-"},{"key":"2+","value":"2+"},{"key":"2.5","value":"2.5"},{"key":3,"value":"3"},{"key":"3-","value":"3-"},{"key":"3+","value":"3+"},{"key":"3.5","value":"3.5"},{"key":"3 II","value":"3 II"},{"key":4,"value":"4"},{"key":"4-","value":"4-"},{"key":"4+","value":"4+"},{"key":"4.5","value":"4.5"},{"key":"4 II","value":"4 II"},{"key":5,"value":"5"},{"key":"5+","value":"5+"},{"key":"5.5","value":"5.5"},{"key":"5 II","value":"5 II"},{"key":6,"value":"6"},{"key":"6.5","value":"6.5"},{"key":"6 II","value":"6 II"},{"key":7,"value":"7"},{"key":"7.5","value":"7.5"},{"key":"7 II","value":"7 II"},{"key":8,"value":"8"},{"key":"8.5","value":"8.5"},{"key":9,"value":"9"},{"key":10,"value":"10"},{"key":11,"value":"11"},{"key":12,"value":"12"},{"key":13,"value":"13"},{"key":14,"value":"14"},{"key":15,"value":"15"},{"key":"","value":"===\ud55c\uae00\ub4f1\uae09==="},{"key":"\ucd08(\u521d)","value":"\ucd08(\u521d)"},{"key":"\uc911(\u4e2d)","value":"\uc911(\u4e2d)"},{"key":"\uace0(\u9ad8)","value":"\uace0(\u9ad8)"},{"key":"\uc0c1(\u4e0a)","value":"\uc0c1(\u4e0a)"},{"key":"\ud558(\u4e0b)","value":"\ud558(\u4e0b)"},{"key":"\ud2b9","value":"\ud2b9"},{"key":"\ud2b9 II","value":"\ud2b9 II"},{"key":"\uc9001","value":"\uc9001"},{"key":"\uc9002","value":"\uc9002"},{"key":"\uc9003","value":"\uc9003"},{"key":"\uc9004","value":"\uc9004"},{"key":"\uc9005","value":"\uc9005"},{"key":"\uae30\ucd08","value":"\uae30\ucd08"},{"key":"\uae30\ubcf8","value":"\uae30\ubcf8"},{"key":"\ub300\uc0ac\ubc94","value":"\ub300\uc0ac\ubc94"},{"key":"\uc0ac\ubc94","value":"\uc0ac\ubc94"},{"key":"","value":"===\uc54c\ud30c\ubcb3\ub4f1\uae09==="},{"key":"A","value":"A"},{"key":"B","value":"B"},{"key":"C","value":"C"},{"key":"D","value":"D"},{"key":"E","value":"E"},{"key":"F","value":"F"},{"key":"A1","value":"A1"},{"key":"A2","value":"A2"},{"key":"B1","value":"B1"},{"key":"B2","value":"B2"},{"key":"C1","value":"C1"},{"key":"C2","value":"C2"},{"key":"N1","value":"N1"},{"key":"N2","value":"N2"},{"key":"N3","value":"N3"},{"key":"N4","value":"N4"},{"key":"N5","value":"N5"},{"key":"1A","value":"1A"},{"key":"1B","value":"1B"},{"key":"1C","value":"1C"},{"key":"2A","value":"2A"},{"key":"2B","value":"2B"},{"key":"2C","value":"2C"},{"key":"3A","value":"3A"},{"key":"3B","value":"3B"},{"key":"3C","value":"3C"},{"key":"Grade A","value":"Grade A"},{"key":"Grade B","value":"Grade B"},{"key":"Grade C","value":"Grade C"},{"key":"","value":"===OPIC==="},{"key":"Superior","value":"Superior"},{"key":"Advanced High","value":"Advanced High"},{"key":"Advanced Mid","value":"Advanced Mid"},{"key":"Advanced Low","value":"Advanced Low"},{"key":"intermediate High","value":"intermediate High"},{"key":"intermediate Mid","value":"intermediate Mid"},{"key":"intermediate Low","value":"intermediate Low"},{"key":"Novice High","value":"Novice High"},{"key":"Novice Mid","value":"Novice Mid"},{"key":"Novice Low","value":"Novice Low"},{"key":"intermediate Mid1","value":"intermediate Mid1"},{"key":"intermediate Mid2","value":"intermediate Mid2"},{"key":"intermediate Mid3","value":"intermediate Mid3"}],"examLangOption":{"1":{"code":1,"name":"\uc601\uc5b4","child":{"7453":{"mcode":"1","bcode":"1","code":"7453","name":"TOEIC"},"7463":{"mcode":"1","bcode":"2","code":"7463","name":"TOEFL"},"7464":{"mcode":"1","bcode":"3","code":"7464","name":"TEPS"},"7468":{"mcode":"1","bcode":"4","code":"7468","name":"G-TELP"},"7469":{"mcode":"1","bcode":"5","code":"7469","name":"G-ETAT"},"7470":{"mcode":"1","bcode":"6","code":"7470","name":"S-ETAT1\uae09"},"7454":{"mcode":"1","bcode":"7","code":"7454","name":"S-ETAT2\uae09"},"7455":{"mcode":"1","bcode":"8","code":"7455","name":"TOED"},"7456":{"mcode":"1","bcode":"9","code":"7456","name":"S-TOED"},"7457":{"mcode":"1","bcode":"10","code":"7457","name":"EPQT"},"7458":{"mcode":"1","bcode":"11","code":"7458","name":"EVQT"},"7460":{"mcode":"1","bcode":"12","code":"7460","name":"EC-TOP(TOQ)"},"7461":{"mcode":"1","bcode":"13","code":"7461","name":"CPET"},"7758":{"mcode":"1","bcode":"14","code":"7758","name":"\uacf5\ubb34\uc6d0\uc601\uc5b4"},"7759":{"mcode":"1","bcode":"15","code":"7759","name":"\uad00\uad11\ud1b5\uc5ed\uc548\ub0b4\uc0ac \uc601\uc5b4"},"7760":{"mcode":"1","bcode":"16","code":"7760","name":"\ubb34\uc5ed\uc601\uc5b4"},"7761":{"mcode":"1","bcode":"17","code":"7761","name":"\uc601\uc5b4 \uad50\uc6d0\uc790\uaca9\uc99d"},"7762":{"mcode":"1","bcode":"18","code":"7762","name":"AP"},"7763":{"mcode":"1","bcode":"19","code":"7763","name":"Cambridge Certification CAE"},"7764":{"mcode":"1","bcode":"20","code":"7764","name":"Cambridge Certification CPE"},"7765":{"mcode":"1","bcode":"21","code":"7765","name":"Cambridge Certification FCE"},"7766":{"mcode":"1","bcode":"22","code":"7766","name":"EFB"},"7767":{"mcode":"1","bcode":"23","code":"7767","name":"ESPT"},"7768":{"mcode":"1","bcode":"24","code":"7768","name":"FLEX \uc601\uc5b4"},"7769":{"mcode":"1","bcode":"25","code":"7769","name":"GMAT"},"7770":{"mcode":"1","bcode":"26","code":"7770","name":"GRE"},"7771":{"mcode":"1","bcode":"27","code":"7771","name":"iB-SET"},"7772":{"mcode":"1","bcode":"28","code":"7772","name":"IELTS"},"7773":{"mcode":"1","bcode":"29","code":"7773","name":"IET"},"7774":{"mcode":"1","bcode":"30","code":"7774","name":"JET"},"7775":{"mcode":"1","bcode":"31","code":"7775","name":"JET Speaking"},"7776":{"mcode":"1","bcode":"32","code":"7776","name":"J-TOED"},"7777":{"mcode":"1","bcode":"33","code":"7777","name":"LSAT"},"7778":{"mcode":"1","bcode":"34","code":"7778","name":"OPIC"},"7779":{"mcode":"1","bcode":"35","code":"7779","name":"PELT"},"7780":{"mcode":"1","bcode":"36","code":"7780","name":"PELT Jr"},"7781":{"mcode":"1","bcode":"37","code":"7781","name":"PELT kids"},"7782":{"mcode":"1","bcode":"38","code":"7782","name":"PELT main"},"7783":{"mcode":"1","bcode":"39","code":"7783","name":"PELT plus"},"7784":{"mcode":"1","bcode":"40","code":"7784","name":"PELT standard"},"7785":{"mcode":"1","bcode":"41","code":"7785","name":"PET(Preliminary English Test)"},"7786":{"mcode":"1","bcode":"42","code":"7786","name":"SAT"},"7787":{"mcode":"1","bcode":"43","code":"7787","name":"SEPT"},"7788":{"mcode":"1","bcode":"44","code":"7788","name":"SLEP"},"7789":{"mcode":"1","bcode":"45","code":"7789","name":"SNULT \uc601\uc5b4"},"7790":{"mcode":"1","bcode":"46","code":"7790","name":"SSAT"},"7791":{"mcode":"1","bcode":"47","code":"7791","name":"TCT \ubc88\uc5ed\ub2a5\ub825\uc778\uc815\uc2dc\ud5d8 \uc601\uc5b4"},"7792":{"mcode":"1","bcode":"48","code":"7792","name":"TESOL"},"7793":{"mcode":"1","bcode":"49","code":"7793","name":"TOEFL(CBT)"},"7794":{"mcode":"1","bcode":"50","code":"7794","name":"TOEFL(iBT)"},"7795":{"mcode":"1","bcode":"51","code":"7795","name":"TOEFL(PBT)"},"7796":{"mcode":"1","bcode":"52","code":"7796","name":"TOEIC Bridge"},"7797":{"mcode":"1","bcode":"53","code":"7797","name":"TOEIC Speaking and Writing Tests"},"7798":{"mcode":"1","bcode":"54","code":"7798","name":"TOEIC Speaking Test"},"7799":{"mcode":"1","bcode":"55","code":"7799","name":"TOP"},"7800":{"mcode":"1","bcode":"56","code":"7800","name":"TOSEL"},"7801":{"mcode":"1","bcode":"57","code":"7801","name":"TSE"},"7802":{"mcode":"1","bcode":"58","code":"7802","name":"TWP"},"7803":{"mcode":"1","bcode":"59","code":"7803","name":"Y-TOED"},"23573":{"mcode":"1","bcode":"60","code":"23573","name":"TOEIC Writing Test"},"26876":{"mcode":"1","bcode":"61","code":"26876","name":"BEC Preliminary"},"26877":{"mcode":"1","bcode":"62","code":"26877","name":"BEC Vantage"},"26878":{"mcode":"1","bcode":"63","code":"26878","name":"BEC Higher"},"28897":{"mcode":"1","bcode":"64","code":"28897","name":"Versant"},"30481":{"mcode":"1","bcode":"65","code":"30481","name":"WPT(Writing Proficiency Test)"},"36439":{"mcode":"1","bcode":"66","code":"36439","name":"SPA(Speaking Proficiency Assessment) "},"36441":{"mcode":"1","bcode":"67","code":"36441","name":"NEAT"},"36442":{"mcode":"1","bcode":"68","code":"36442","name":"TESL"},"36669":{"mcode":"1","bcode":"69","code":"36669","name":"ITT \ud2b9\ubcc4\ud1b5\uc5ed \uc790\uaca9\uc99d"},"36670":{"mcode":"1","bcode":"70","code":"36670","name":"ITT \uc804\ubb38\ud1b5\uc5ed \uc790\uaca9\uc99d"},"36671":{"mcode":"1","bcode":"71","code":"36671","name":"ITT \ube44\uc988\ub2c8\uc2a4\ud1b5\uc5ed \uc790\uaca9\uc99d"},"36672":{"mcode":"1","bcode":"72","code":"36672","name":"ITT \ud2b9\ubcc4\ubc88\uc5ed \uc790\uaca9\uc99d"},"36673":{"mcode":"1","bcode":"73","code":"36673","name":"ITT \uc804\ubb38\ubc88\uc5ed \uc790\uaca9\uc99d"},"36674":{"mcode":"1","bcode":"74","code":"36674","name":"ITT \ube44\uc988\ub2c8\uc2a4\ubc88\uc5ed \uc790\uaca9\uc99d"},"39181":{"mcode":"1","bcode":"75","code":"39181","name":"TEPS Speaking"},"39445":{"mcode":"1","bcode":"76","code":"39445","name":"OPI"},"39474":{"mcode":"1","bcode":"77","code":"39474","name":"OPic Writing"},"39488":{"mcode":"1","bcode":"78","code":"39488","name":"PTE Professional"},"39515":{"mcode":"1","bcode":"79","code":"39515","name":"NEW TEPS"}}},"2":{"code":2,"name":"\uc77c\ubcf8\uc5b4","child":{"7465":{"mcode":"2","bcode":"1","code":"7465","name":"JLPT"},"7466":{"mcode":"2","bcode":"2","code":"7466","name":"JPT"},"7467":{"mcode":"2","bcode":"3","code":"7467","name":"JTRA"},"7804":{"mcode":"2","bcode":"4","code":"7804","name":"\ubb38\ubd80\uc131 \uc7a5\ud559\uc0dd \uc120\ubc1c \uc2dc\ud5d8"},"7805":{"mcode":"2","bcode":"5","code":"7805","name":"\uc77c\ubcf8\uc5b4 \uad50\uc6d0\uc790\uaca9\uc99d"},"7806":{"mcode":"2","bcode":"6","code":"7806","name":"EJU"},"7807":{"mcode":"2","bcode":"7","code":"7807","name":"EJU \uc77c\ubcf8\uc720\ud559\uc2dc\ud5d8"},"7808":{"mcode":"2","bcode":"8","code":"7808","name":"FLEX \uc77c\ubcf8\uc5b4"},"7809":{"mcode":"2","bcode":"9","code":"7809","name":"JET \ud504\ub85c\uadf8\ub7a8"},"7810":{"mcode":"2","bcode":"10","code":"7810","name":"JLRT"},"7811":{"mcode":"2","bcode":"11","code":"7811","name":"JTPA"},"7812":{"mcode":"2","bcode":"12","code":"7812","name":"NIKKEN"},"7813":{"mcode":"2","bcode":"13","code":"7813","name":"NPT"},"7814":{"mcode":"2","bcode":"14","code":"7814","name":"SJPT"},"7815":{"mcode":"2","bcode":"15","code":"7815","name":"SNULT \uc77c\uc5b4"},"7816":{"mcode":"2","bcode":"16","code":"7816","name":"TCT \ubc88\uc5ed\ub2a5\ub825\uc778\uc815\uc2dc\ud5d8 \uc77c\uc5b4"},"23831":{"mcode":"2","bcode":"17","code":"23831","name":"J-TEST"},"28898":{"mcode":"2","bcode":"18","code":"28898","name":"(\u65b0)JLPT"},"28899":{"mcode":"2","bcode":"19","code":"28899","name":"JLT"},"31691":{"mcode":"2","bcode":"20","code":"31691","name":"BJT"},"36606":{"mcode":"2","bcode":"21","code":"36606","name":"OPIC"},"36675":{"mcode":"2","bcode":"22","code":"36675","name":"ITT \ud2b9\ubcc4\ud1b5\uc5ed \uc790\uaca9\uc99d"},"36676":{"mcode":"2","bcode":"23","code":"36676","name":"ITT \uc804\ubb38\ud1b5\uc5ed \uc790\uaca9\uc99d"},"36677":{"mcode":"2","bcode":"24","code":"36677","name":"ITT \ube44\uc988\ub2c8\uc2a4\ud1b5\uc5ed \uc790\uaca9\uc99d"},"36678":{"mcode":"2","bcode":"25","code":"36678","name":"ITT \ud2b9\ubcc4\ubc88\uc5ed \uc790\uaca9\uc99d"},"36679":{"mcode":"2","bcode":"26","code":"36679","name":"ITT \uc804\ubb38\ubc88\uc5ed \uc790\uaca9\uc99d"},"36680":{"mcode":"2","bcode":"27","code":"36680","name":"ITT \ube44\uc988\ub2c8\uc2a4\ubc88\uc5ed \uc790\uaca9\uc99d"}}},"3":{"code":3,"name":"\uc911\uad6d\uc5b4","child":{"7817":{"mcode":"3","bcode":"1","code":"7817","name":"BCT"},"7818":{"mcode":"3","bcode":"2","code":"7818","name":"C.TEST"},"7819":{"mcode":"3","bcode":"3","code":"7819","name":"CPT"},"7820":{"mcode":"3","bcode":"4","code":"7820","name":"FLEX \uc911\uad6d\uc5b4"},"7459":{"mcode":"3","bcode":"5","code":"7459","name":"HSK"},"7821":{"mcode":"3","bcode":"6","code":"7821","name":"SNULT \uc911\uad6d\uc5b4"},"7822":{"mcode":"3","bcode":"7","code":"7822","name":"TCT \ubc88\uc5ed\ub2a5\ub825\uc778\uc815\uc2dc\ud5d8 \uc911\uad6d\uc5b4"},"7823":{"mcode":"3","bcode":"8","code":"7823","name":"TSC"},"7824":{"mcode":"3","bcode":"9","code":"7824","name":"YCT"},"7825":{"mcode":"3","bcode":"10","code":"7825","name":"\uad00\uad11\ud1b5\uc5ed\uc548\ub0b4\uc0ac \uc911\uad6d\uc5b4"},"7826":{"mcode":"3","bcode":"11","code":"7826","name":"\uc911\uad6d\uc5b4 \uad50\uc6d0\uc790\uaca9\uc99d"},"25618":{"mcode":"3","bcode":"12","code":"25618","name":"(\u65b0)HSK"},"26873":{"mcode":"3","bcode":"13","code":"26873","name":"(\u65b0)HSK\ud68c\ud654"},"26874":{"mcode":"3","bcode":"14","code":"26874","name":"OPIC"},"29284":{"mcode":"3","bcode":"15","code":"29284","name":"HKC"},"36240":{"mcode":"3","bcode":"16","code":"36240","name":"\u65b0BCT(A)"},"36366":{"mcode":"3","bcode":"17","code":"36366","name":"\ub300\ub9cc\ud654\uc5b4\ubb38\ub2a5\ub825\uc2dc\ud5d8(SCTOP)"},"36368":{"mcode":"3","bcode":"18","code":"36368","name":"\ub300\ub9cc\ud654\uc5b4\ubb38\ub2a5\ub825\uc2dc\ud5d8(SCTOP)"},"36372":{"mcode":"3","bcode":"20","code":"36372","name":"\u65b0BCT(B)"},"36440":{"mcode":"3","bcode":"21","code":"36440","name":"CST"},"36443":{"mcode":"3","bcode":"22","code":"36443","name":"TOCFL"},"36681":{"mcode":"3","bcode":"23","code":"36681","name":"ITT \ud2b9\ubcc4\ud1b5\uc5ed \uc790\uaca9\uc99d"},"36682":{"mcode":"3","bcode":"24","code":"36682","name":"ITT \uc804\ubb38\ud1b5\uc5ed \uc790\uaca9\uc99d"},"36683":{"mcode":"3","bcode":"25","code":"36683","name":"ITT \ube44\uc988\ub2c8\uc2a4\ud1b5\uc5ed \uc790\uaca9\uc99d"},"36684":{"mcode":"3","bcode":"26","code":"36684","name":"ITT \ud2b9\ubcc4\ubc88\uc5ed \uc790\uaca9\uc99d"},"36685":{"mcode":"3","bcode":"27","code":"36685","name":"ITT \uc804\ubb38\ubc88\uc5ed \uc790\uaca9\uc99d"},"36686":{"mcode":"3","bcode":"28","code":"36686","name":"ITT \ube44\uc988\ub2c8\uc2a4\ubc88\uc5ed \uc790\uaca9\uc99d"},"39182":{"mcode":"3","bcode":"29","code":"39182","name":"\u65b0BCT(Speaking)"}}},"4":{"code":4,"name":"\ub3c5\uc77c\uc5b4","child":{"7827":{"mcode":"4","bcode":"1","code":"7827","name":"DSH"},"7828":{"mcode":"4","bcode":"2","code":"7828","name":"FLEX \ub3c5\uc77c\uc5b4"},"7829":{"mcode":"4","bcode":"3","code":"7829","name":"GDS"},"7830":{"mcode":"4","bcode":"4","code":"7830","name":"KDS"},"7831":{"mcode":"4","bcode":"5","code":"7831","name":"PWD"},"7832":{"mcode":"4","bcode":"6","code":"7832","name":"SD1"},"7833":{"mcode":"4","bcode":"7","code":"7833","name":"SD2"},"7834":{"mcode":"4","bcode":"8","code":"7834","name":"SNULT \ub3c5\uc77c\uc5b4"},"7835":{"mcode":"4","bcode":"9","code":"7835","name":"TCT \ubc88\uc5ed\ub2a5\ub825\uc778\uc815\uc2dc\ud5d8 \ub3c5\uc77c\uc5b4"},"7836":{"mcode":"4","bcode":"10","code":"7836","name":"TestDaF"},"7837":{"mcode":"4","bcode":"11","code":"7837","name":"ZD"},"7838":{"mcode":"4","bcode":"12","code":"7838","name":"ZDAF"},"7839":{"mcode":"4","bcode":"13","code":"7839","name":"ZMP"},"7840":{"mcode":"4","bcode":"14","code":"7840","name":"ZOP"},"7841":{"mcode":"4","bcode":"15","code":"7841","name":"\uad00\uad11\ud1b5\uc5ed\uc548\ub0b4\uc0ac \ub3c5\uc77c\uc5b4"},"36687":{"mcode":"4","bcode":"16","code":"36687","name":"ITT \ud2b9\ubcc4\ubc88\uc5ed \uc790\uaca9\uc99d"},"36688":{"mcode":"4","bcode":"17","code":"36688","name":"ITT \uc804\ubb38\ubc88\uc5ed \uc790\uaca9\uc99d"},"36689":{"mcode":"4","bcode":"18","code":"36689","name":"ITT \ube44\uc988\ub2c8\uc2a4\ubc88\uc5ed \uc790\uaca9\uc99d"}}},"5":{"code":5,"name":"\ubd88\uc5b4","child":{"7842":{"mcode":"5","bcode":"1","code":"7842","name":"DALF"},"7843":{"mcode":"5","bcode":"2","code":"7843","name":"DELF"},"7844":{"mcode":"5","bcode":"3","code":"7844","name":"DELF A1"},"7845":{"mcode":"5","bcode":"4","code":"7845","name":"DELF A2"},"7846":{"mcode":"5","bcode":"5","code":"7846","name":"DELF JUNIOR"},"7847":{"mcode":"5","bcode":"6","code":"7847","name":"FLEX \ud504\ub791\uc2a4\uc5b4"},"7848":{"mcode":"5","bcode":"7","code":"7848","name":"SNULT \ud504\ub791\uc2a4\uc5b4"},"7849":{"mcode":"5","bcode":"8","code":"7849","name":"TCF"},"7850":{"mcode":"5","bcode":"9","code":"7850","name":"TCT \ubc88\uc5ed\ub2a5\ub825\uc778\uc815\uc2dc\ud5d8 \ubd88\uc5b4"},"7851":{"mcode":"5","bcode":"10","code":"7851","name":"TEF"},"7852":{"mcode":"5","bcode":"11","code":"7852","name":"\uad00\uad11\ud1b5\uc5ed\uc548\ub0b4\uc0ac \ubd88\uc5b4"},"23477":{"mcode":"5","bcode":"12","code":"23477","name":"DELF B1"},"23478":{"mcode":"5","bcode":"13","code":"23478","name":"DELF B2"},"23479":{"mcode":"5","bcode":"14","code":"23479","name":"DALF C1"},"23480":{"mcode":"5","bcode":"15","code":"23480","name":"DALF C2"},"36690":{"mcode":"5","bcode":"16","code":"36690","name":"ITT \ud2b9\ubcc4\ubc88\uc5ed \uc790\uaca9\uc99d"},"36691":{"mcode":"5","bcode":"17","code":"36691","name":"ITT \uc804\ubb38\ubc88\uc5ed \uc790\uaca9\uc99d"},"36692":{"mcode":"5","bcode":"18","code":"36692","name":"ITT \ube44\uc988\ub2c8\uc2a4\ubc88\uc5ed \uc790\uaca9\uc99d"}}},"6":{"code":6,"name":"\uc2a4\ud398\uc778\uc5b4","child":{"7853":{"mcode":"6","bcode":"1","code":"7853","name":"DELE"},"7854":{"mcode":"6","bcode":"2","code":"7854","name":"EPLE"},"7855":{"mcode":"6","bcode":"3","code":"7855","name":"FLEX \uc2a4\ud398\uc778\uc5b4"},"7856":{"mcode":"6","bcode":"4","code":"7856","name":"SNULT \uc2a4\ud398\uc778\uc5b4"},"7857":{"mcode":"6","bcode":"5","code":"7857","name":"TCT \ubc88\uc5ed\ub2a5\ub825\uc778\uc815\uc2dc\ud5d8 \uc2a4\ud398\uc778\uc5b4"},"26881":{"mcode":"6","bcode":"6","code":"26881","name":"OPIC"},"36693":{"mcode":"6","bcode":"7","code":"36693","name":"ITT \ud2b9\ubcc4\ubc88\uc5ed \uc790\uaca9\uc99d"},"36694":{"mcode":"6","bcode":"8","code":"36694","name":"ITT \uc804\ubb38\ubc88\uc5ed \uc790\uaca9\uc99d"},"36695":{"mcode":"6","bcode":"9","code":"36695","name":"ITT \ube44\uc988\ub2c8\uc2a4\ubc88\uc5ed \uc790\uaca9\uc99d"}}},"7":{"code":7,"name":"\ub7ec\uc2dc\uc544\uc5b4","child":{"7858":{"mcode":"7","bcode":"6","code":"7858","name":"FLEX \ub7ec\uc2dc\uc544\uc5b4"},"7859":{"mcode":"7","bcode":"7","code":"7859","name":"SNULT \ub7ec\uc2dc\uc544\uc5b4"},"7860":{"mcode":"7","bcode":"8","code":"7860","name":"TCT \ubc88\uc5ed\ub2a5\ub825\uc778\uc815\uc2dc\ud5d8 \ub7ec\uc2dc\uc544\uc5b4"},"7861":{"mcode":"7","bcode":"9","code":"7861","name":"\ud1a0\ub974\ud50c"},"7862":{"mcode":"7","bcode":"10","code":"7862","name":"\uad00\uad11\ud1b5\uc5ed\uc548\ub0b4\uc0ac \ub178\uc5b4"},"26879":{"mcode":"7","bcode":"11","code":"26879","name":"OPIC"},"36696":{"mcode":"7","bcode":"12","code":"36696","name":"ITT \ud2b9\ubcc4\ubc88\uc5ed \uc790\uaca9\uc99d"},"36697":{"mcode":"7","bcode":"13","code":"36697","name":"ITT \uc804\ubb38\ubc88\uc5ed \uc790\uaca9\uc99d"},"36698":{"mcode":"7","bcode":"14","code":"36698","name":"ITT \ube44\uc988\ub2c8\uc2a4\ubc88\uc5ed \uc790\uaca9\uc99d"}}},"8":{"code":8,"name":"\uc774\ud0c8\ub9ac\uc544\uc5b4","child":{"28900":{"mcode":"8","bcode":"1","code":"28900","name":"CELI"},"28901":{"mcode":"8","bcode":"2","code":"28901","name":"CILS"},"39184":{"mcode":"8","bcode":"3","code":"39184","name":"ITT \ud2b9\ubcc4\ubc88\uc5ed \uc790\uaca9\uc99d"},"39185":{"mcode":"8","bcode":"4","code":"39185","name":"ITT \uc804\ubb38\ubc88\uc5ed \uc790\uaca9\uc99d"},"39186":{"mcode":"8","bcode":"5","code":"39186","name":"ITT \ube44\uc988\ub2c8\uc2a4\ubc88\uc5ed \uc790\uaca9\uc99d"}}},"45":{"code":45,"name":"\ud55c\uad6d\uc5b4","child":{"7863":{"mcode":"45","bcode":"1","code":"7863","name":"\uad6d\uc5b4\ub2a5\ub825\uc778\uc99d\uc2dc\ud5d8"},"7864":{"mcode":"45","bcode":"2","code":"7864","name":"\ud55c\uad6d\uc5b4 \uad50\uc6d0\uc790\uaca9\uc99d"},"7865":{"mcode":"45","bcode":"3","code":"7865","name":"KBS \ud55c\uad6d\uc5b4\ub2a5\ub825\uc2dc\ud5d8"},"7866":{"mcode":"45","bcode":"4","code":"7866","name":"TOPIK"}}},"99":{"code":99,"name":"\uae30\ud0c0","child":{"39300":{"mcode":"99","bcode":"1","code":"39300","name":"\uc778\ub3c4\ub124\uc2dc\uc544 OPI"},"7462":{"mcode":"99","bcode":"1","code":"7462","name":"\uae30\ud0c0"},"39475":{"mcode":"99","bcode":"1","code":"39475","name":"\ud558\ub178\uc774 \uad6d\ub9bd\uc678\ub300 \ubca0\ud2b8\ub0a8\uc5b4 \ub2a5\ub825\uc2dc\ud5d8"},"7867":{"mcode":"99","bcode":"2","code":"7867","name":"\ud55c\uc790\ub2a5\ub825\uac80\uc815 (\ud55c\uad6d\uc5b4\ubb38\ud559\ud68c)"},"7868":{"mcode":"99","bcode":"2","code":"7868","name":"\ud55c\uc790\uc790\uaca9\uac80\uc815 (\ud55c\uc790\uad50\uc721\uc9c4\ud765\ud68c)"},"7869":{"mcode":"99","bcode":"2","code":"7869","name":"\uc2e4\uc6a9\ud55c\uc790 (\ud55c\uad6d\uc678\uad6d\uc5b4\ud3c9\uac00\uc6d0)"},"7870":{"mcode":"99","bcode":"2","code":"7870","name":"\ud55c\uad6d\ud55c\uc790\uac80\uc815 (\ud55c\uad6d\ud3c9\uc0dd\uad50\uc721\ud3c9\uac00\uc6d0)"},"7871":{"mcode":"99","bcode":"2","code":"7871","name":"\ud55c\uc790\uae09\uc218\uc790\uaca9\uac80\uc815 (\ud55c\uc790\uae09\uc218\uc790\uaca9\uac80\uc815)"},"7872":{"mcode":"99","bcode":"2","code":"7872","name":"\ud55c\uc790\ub2a5\ub825\uc790\uaca9\uac80\uc815 (\ud55c\uad6d\ud55c\uc790\ud55c\ubb38\ub2a5\ub825\uac1c\ubc1c\uc6d0)"},"7873":{"mcode":"99","bcode":"2","code":"7873","name":"\uc0c1\uacf5\ud68c\uc758\uc18c \ud55c\uc790 (\ub300\ud55c\uc0c1\uacf5\ud68c\uc758\uc18c)"},"7874":{"mcode":"99","bcode":"2","code":"7874","name":"YBM \u5546\u52d9\u6f22\u6aa2"},"39489":{"mcode":"99","bcode":"2","code":"39489","name":"\ud55c\uc790\uc5b4\ub2a5\ub825\uac80\uc815 (\ud55c\uad6d\uc815\ubcf4\uad00\ub9ac\ud611\ud68c)"},"39179":{"mcode":"99","bcode":"3","code":"39179","name":"\ubca0\ud2b8\ub0a8\uc5b4 OPI (OPI VIETNAMESE)"},"39180":{"mcode":"99","bcode":"3","code":"39180","name":"\ud638\uce58\ubbfc \uc778\uc0ac\ub300 \ubca0\ud2b8\ub0a8\uc5b4 \ub2a5\ub825\uc2dc\ud5d8"},"39531":{"mcode":"99","bcode":"3","code":"39531","name":"\ubca0\ud2b8\ub0a8\uc5b4 OPIC"}}}},"manager_nm":"","email":"","isLogin":false,"isPersonLogin":false,"isCompanyLogin":false,"mem_gb":"","mcom_idx":""};
        storeData = {"Career":{"career_cd":["2"],"careermin":"1","careermax":"4"},"FinalEdu":{"school_mcd":[],"education_cd":["12","11","13","10"],"education_status":""},"Location":{"all_chk_area_name":{"102000":"경기","103000":"광주","105000":"대전"},"all_chk_area_code":["102000","103000","105000"],"area_code":{"104000":["104010"]},"area_name":{"104000":["대구 > 남구"]},"all_chk_live_name":{},"all_chk_live_code":[],"live_code":{},"live_name":{},"live_option":""},"Age":{"max":"1969","min":""},"JobCategory":{"all_chk_code":[],"code":{"2":{"207":[]},"8":{"807":[]}},"name":[{"2":"영업·고객상담","8":"특수계층·공공"},{"207":"광고영업","807":"중장년·고령인·실버"},{}],"jik_option":""},"SearchData":{"data":{"Career":{"career_cd":{"code":["2"],"param_nm":"career_cd","name":"경력"},"careerminmax":{"code":["1","4"],"param_nm":["careermin","careermax"],"name":"1 ~ 3년"}},"FinalEdu":{"education_cd_3":{"code":"3","param_nm":"education_cd","name":"학력 : 대학교 4년"},"education_cd_2":{"code":"2","param_nm":"education_cd","name":"학력 : 대학교 2,3년"},"education_cd_4,5":{"code":"4,5","param_nm":"education_cd","name":"학력 : 대학원 석/박사"},"education_cd_1,10,11,12,13,14":{"code":"1,10,11,12,13,14","param_nm":"education_cd","name":"학력 : 고등학교 이하"}},"Location":{"area_102000":{"code":[["102000","",""]],"param_nm":"area","name":"희망 근무지역 : 경기"},"area_103000":{"code":[["103000","",""]],"param_nm":"area","name":"희망 근무지역 : 광주"},"area_105000":{"code":[["105000","",""]],"param_nm":"area","name":"희망 근무지역 : 대전"},"area_104010":{"code":[["104000","104010"]],"param_nm":"area","name":"희망 근무지역 : 대구 > 남구"}},"Age":{"agemaxmin":{"code":["1969",""],"param_nm":["agemax","agemin"],"name":"51세 (1969년)↑"}},"JobCategory":{"jikjong_2_207":{"code":[["2","207",""]],"param_nm":"jikjong","name":"희망 직종 : 영업·고객상담 > 광고영업"},"jikjong_8_807":{"code":[["8","807",""]],"param_nm":"jikjong","name":"희망 직종 : 특수계층·공공 > 중장년·고령인·실버"}}},"list":[{"id":"career_cd","component":"Career"},{"id":"careerminmax","component":"Career"},{"id":"education_cd_3","component":"FinalEdu"},{"id":"area_102000","component":"Location"},{"id":"education_cd_2","component":"FinalEdu"},{"id":"area_103000","component":"Location"},{"id":"area_105000","component":"Location"},{"id":"agemaxmin","component":"Age"},{"id":"education_cd_4,5","component":"FinalEdu"},{"id":"jikjong_8_807","component":"JobCategory"},{"id":"area_104010","component":"Location"},{"id":"education_cd_1,10,11,12,13,14","component":"FinalEdu"},{"id":"jikjong_2_207","component":"JobCategory"}],"render":true},"List":{"page":1,"pageCount":20,"preferential":[],"updateDate":"","jobhunting_st":[],"contact_open":"","order":"last_dt","sort":"desc"}};
        defaultPanel = 'basic-search';
        defaultCate = '';
        focusPanel = '';
        is_mandb_upselling_benefits = '';
        isFirstLoad = true;
    } catch (e) {
    }
</script>
<script src="<c:url value='/resources/js/libs/require-2.3.2.min.js?v=20190718_3'/>" data-main="/js/talent/TalentStore" type="text/javascript"></script>

<div class="wrap_talent_search">
    <ul class="wrap_expand_util">
        <li class="btn_saved_condition"><button type="button" id="btn-display-save-list">저장된 검색조건</button></li>
        <li class="btn_unfold"><button type="button" id="btn-change-mode" class="">펼쳐보기</button></li>
    </ul>
    <div id="search_panel" class="">
        <ul class="tab_category">
            <li class="basic_search"><button type="button" class="tab_menu" data-panel="basic-search"><span>기본항목</span></button></li>
            <li class="job_category"><button type="button" class="tab_menu" data-panel="job-category"><span>직종</span></button></li>
            <li class="edu_level"><button type="button" class="tab_menu" data-panel="education"><span>학력</span></button></li>
            <li class="job_area">
                <button type="button" class="tab_menu" data-panel="location"><span>지역</span></button>
                <div class="wrap_tooltip_service hide">
                    <p>
                        상세 지역(구,군)을 설정하시려면, 이 곳을 클릭해 주세요.
                        <button type="button" class="btn_close_tooltip"><span class="blind">닫기</span></button>
                    </p>
                </div>
            </li>
            <li class="job_industry"><button type="button" class="tab_menu" data-panel="industry"><span>업종</span></button></li>
            <li class="job_condition"><button type="button" class="tab_menu" data-panel="job-type-salary"><span>근무조건</span></button></li>
            <li class="language_abroad"><button type="button" class="tab_menu" data-panel="language-exam"><span>어학</span></button></li>
            <li class="area_overseas"><button type="button" class="tab_menu" data-panel="overseas"><span>해외</span></button></li>
            <li class="job_position"><button type="button" class="tab_menu" data-panel="job-grade-duties"><span>직급·직책</span></button></li>
            <li class="job_license"><button type="button" class="tab_menu" data-panel="license"><span>자격증</span></button></li>
        </ul>
        <div class="wrap_category_contents">
            <div class="inner">
                <div id="basic-search" class="wrap_category basic_search expand">
    <h2 class="title_panel">경력·성별·나이</h2>
    <div class="wrap_detail_panel career_years" id="career">
        <div class="title_detail_box"><strong>경력</strong></div>
        <div class="box_detail_panel">
            <strong class="title_basic_sub">경력</strong>
            <label class="form_sp frm_chk02" for="career01"><input type="checkbox" id="career01" name="career01" title="경력" value="2"><span>경력</span></label><label class="form_sp frm_chk02" for="newbie01"><input type="checkbox" id="newbie01" name="newbie01" title="신입" value="1"><span>신입</span></label>
            <ul class="wrap_list_value column_two">
                <li><label class="frm_chkbox01" for="career-years01"><input type="checkbox" id="career-years01" name="career-years01" title="1년 미만" value=",1"><span>1년 <em class="ico_under">이하</em></span></label></li>
                <li><label class="frm_chkbox01" for="career-years02"><input type="checkbox" id="career-years02" name="career-years02" title="1~3년" value="1,4"><span>1~3년</span></label></li>
                <li><label class="frm_chkbox01" for="career-years03"><input type="checkbox" id="career-years03" name="career-years03" title="3~5년" value="3,6"><span>3~5년</span></label></li>
                <li><label class="frm_chkbox01" for="career-years04"><input type="checkbox" id="career-years04" name="career-years04" title="5~10년" value="5,11"><span>5~10년</span></label></li>
                <li><label class="frm_chkbox01" for="career-years05"><input type="checkbox" id="career-years05" name="career-years05" title="10~15년" value="10,16"><span>10~15년</span></label></li>
                <li><label class="frm_chkbox01" for="career-years06"><input type="checkbox" id="career-years06" name="career-years06" title="15년 이상" value="15,"><span>15년 <em class="ico_over">이상</em></span></label></li>
            </ul>
            <div class="wrap_interval_value">
                <strong class="title_basic_sub">최종 경력 년수</strong>
                <div class="form_sp frm_select">
                    <select name="" id="career_min" title="경력 구간 시작값">
                        <option value="">선택</option>
                    </select>
                </div>
                <span class="dash">~</span>
                <div class="form_sp frm_select">
                    <select name="" id="career_max" title="경력 구간 마지막값">
                        <option value="">선택</option>
                    </select>
                </div>
            </div>
        </div>
    </div>
    <div class="wrap_detail_panel age_interval" id="gender-age">
        <div class="title_detail_box"><strong>성별·나이</strong></div>
        <div class="box_detail_panel">
            <strong class="title_basic_sub">성별</strong>
            <label class="form_sp frm_chk02" for="male01"><input type="checkbox" id="male01" value="male"><span>남</span></label><label class="form_sp frm_chk02" for="female01"><input type="checkbox" id="female01" value="female"><span>여</span></label>
            <ul class="wrap_list_value column_two">
                <li><label class="frm_chkbox01" for="age-interval01"><input type="checkbox" id="age-interval01" value=",20"><span>20세 <em class="ico_under">이하</em></span></span></label></li>
                <li><label class="frm_chkbox01" for="age-interval02"><input type="checkbox" id="age-interval02" value="21,30"><span>21~30세</span></label></li>
                <li><label class="frm_chkbox01" for="age-interval03"><input type="checkbox" id="age-interval03" value="31,35"><span>31~35세</span></label></li>
                <li><label class="frm_chkbox01" for="age-interval04"><input type="checkbox" id="age-interval04" value="36,40"><span>36~40세</span></label></li>
                <li><label class="frm_chkbox01" for="age-interval05"><input type="checkbox" id="age-interval05" value="41,50"><span>41~50세</span></label></li>
                <li><label class="frm_chkbox01" for="age-interval06"><input type="checkbox" id="age-interval06" value="51,"><span>51세 <em class="ico_over">이상</em></span></label></li>
            </ul>
            <div class="wrap_interval_value">
                <strong class="title_basic_sub">나이</strong>
                <div class="form_sp frm_select">
                    <select name="" id="max-age" title="연령 구간 시작값">
                        <option value="">선택</option>
                    </select>
                </div>
                <span class="dash">~</span>
                <div class="form_sp frm_select">
                    <select name="" id="min-age" title="연령 구간 마지막값">
                        <option value="">선택</option>
                    </select>
                </div>
            </div>
        </div>
    </div>
    <div class="wrap_detail_panel edu_last" id="basic-search-edu-part">
        <div class="title_detail_box"><strong>최종학력</strong></div>
        <div class="box_detail_panel">
            <ul class="wrap_list_value">
                                    <li><label class="frm_chkbox01 check_on" for="basic-search-final-edu0"><input type="checkbox" id="basic-search-final-edu0" value="12" checked><span>대학교 4년 <em>(0)</em></span></label></li>
                                    <li><label class="frm_chkbox01 check_on" for="basic-search-final-edu1"><input type="checkbox" id="basic-search-final-edu1" value="11" checked><span>대학교 2,3년 <em>(6)</em></span></label></li>
                                    <li><label class="frm_chkbox01 check_on" for="basic-search-final-edu2"><input type="checkbox" id="basic-search-final-edu2" value="13" checked><span>대학원 석/박사 <em>(2)</em></span></label></li>
                                    <li><label class="frm_chkbox01 check_on" for="basic-search-final-edu3"><input type="checkbox" id="basic-search-final-edu3" value="10" checked><span>고등학교 이하 <em>(3)</em></span></label></li>
                            </ul>
            <div class="box_option_check">
                <label class="edu-part" for="basic-search-local01">
                    <input type="checkbox" id="basic-search-local01" value="1" >
                    <span>국내</span>
                </label>
                <label class="edu-part" for="basic-search-abroad01">
                    <input type="checkbox" id="basic-search-abroad01" value="2" >
                    <span>해외</span>
                </label>
                <label class="type_block" for="basic-search-edu-status">
                    <input type="checkbox" id="basic-search-edu-status" >
                    <span>재학·휴학·수료·중퇴·자퇴 제외</span>
                </label>
            </div>
        </div>
    </div>
    <div class="wrap_detail_panel area_domestic">
        <div class="title_detail_box"><strong>희망 근무지역</strong></div>
        <div class="box_detail_panel">
            <ul class="wrap_list_value" id="basic-search-location">
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-101000">
                            <input type="checkbox" id="area-domestic-101000" data-name="서울" value="101000" >
                            <span>서울 <em>(12)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01 check_on" for="area-domestic-102000">
                            <input type="checkbox" id="area-domestic-102000" data-name="경기" value="102000" checked>
                            <span>경기 <em>(9)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01 check_on" for="area-domestic-103000">
                            <input type="checkbox" id="area-domestic-103000" data-name="광주" value="103000" checked>
                            <span>광주 <em>(2)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01 check_on" for="area-domestic-104000">
                            <input type="checkbox" id="area-domestic-104000" data-name="대구" value="104000" checked>
                            <span>대구 <em>(1)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01 check_on" for="area-domestic-105000">
                            <input type="checkbox" id="area-domestic-105000" data-name="대전" value="105000" checked>
                            <span>대전 <em>(0)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-106000">
                            <input type="checkbox" id="area-domestic-106000" data-name="부산" value="106000" >
                            <span>부산 <em>(2)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-107000">
                            <input type="checkbox" id="area-domestic-107000" data-name="울산" value="107000" >
                            <span>울산 <em>(0)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-108000">
                            <input type="checkbox" id="area-domestic-108000" data-name="인천" value="108000" >
                            <span>인천 <em>(1)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-109000">
                            <input type="checkbox" id="area-domestic-109000" data-name="강원" value="109000" >
                            <span>강원 <em>(0)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-110000">
                            <input type="checkbox" id="area-domestic-110000" data-name="경남" value="110000" >
                            <span>경남 <em>(0)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-111000">
                            <input type="checkbox" id="area-domestic-111000" data-name="경북" value="111000" >
                            <span>경북 <em>(0)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-112000">
                            <input type="checkbox" id="area-domestic-112000" data-name="전남" value="112000" >
                            <span>전남 <em>(1)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-113000">
                            <input type="checkbox" id="area-domestic-113000" data-name="전북" value="113000" >
                            <span>전북 <em>(0)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-114000">
                            <input type="checkbox" id="area-domestic-114000" data-name="충북" value="114000" >
                            <span>충북 <em>(0)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-115000">
                            <input type="checkbox" id="area-domestic-115000" data-name="충남" value="115000" >
                            <span>충남 <em>(1)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-116000">
                            <input type="checkbox" id="area-domestic-116000" data-name="제주" value="116000" >
                            <span>제주 <em>(2)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-118000">
                            <input type="checkbox" id="area-domestic-118000" data-name="세종" value="118000" >
                            <span>세종 <em>(0)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-117000">
                            <input type="checkbox" id="area-domestic-117000" data-name="전국" value="117000" >
                            <span>전국 <em>(0)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-210000">
                            <input type="checkbox" id="area-domestic-210000" data-name="아시아·중동" value="210000" >
                            <span>아시아·중동 <em>(0)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-211200">
                            <input type="checkbox" id="area-domestic-211200" data-name="일본" value="211200" >
                            <span>일본 <em>(0)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-211300">
                            <input type="checkbox" id="area-domestic-211300" data-name="중국.홍콩" value="211300" >
                            <span>중국.홍콩 <em>(0)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-220000">
                            <input type="checkbox" id="area-domestic-220000" data-name="북·중미" value="220000" >
                            <span>북·중미 <em>(0)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-220200">
                            <input type="checkbox" id="area-domestic-220200" data-name="미국" value="220200" >
                            <span>미국 <em>(0)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-230000">
                            <input type="checkbox" id="area-domestic-230000" data-name="남미" value="230000" >
                            <span>남미 <em>(0)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-240000">
                            <input type="checkbox" id="area-domestic-240000" data-name="유럽" value="240000" >
                            <span>유럽 <em>(0)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-250000">
                            <input type="checkbox" id="area-domestic-250000" data-name="오세아니아" value="250000" >
                            <span>오세아니아 <em>(0)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-260000">
                            <input type="checkbox" id="area-domestic-260000" data-name="아프리카" value="260000" >
                            <span>아프리카 <em>(0)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-270000">
                            <input type="checkbox" id="area-domestic-270000" data-name="남극대륙" value="270000" >
                            <span>남극대륙 <em>(0)</em></span>
                        </label>
                    </li>
                                    <li>
                        <label class="frm_chkbox01" for="area-domestic-280000">
                            <input type="checkbox" id="area-domestic-280000" data-name="기타해외" value="280000" >
                            <span>기타해외 <em>(0)</em></span>
                        </label>
                    </li>
                            </ul>
        </div>
    </div>
    <div class="wrap_detail_panel job_division">
        <div class="title_detail_box"><strong>직종 구분</strong></div>
        <div class="box_detail_panel">
            <ul class="wrap_category_menu" id="basic-search-job-category">
                                                        <li class="">
                        <button class="btn_category_depth1" type="button" data-depth="0" data-code="1" data-name="경영·사무">
                            <strong>경영·사무</strong> <span>(38)</span>
                        </button>
                    </li>
                                                                            <li class="checked">
                        <button class="btn_category_depth1" type="button" data-depth="0" data-code="8" data-name="특수계층·공공">
                            <strong>특수계층·공공</strong> <span>(31)</span>
                        </button>
                    </li>
                                                                            <li class=" checked">
                        <button class="btn_category_depth1" type="button" data-depth="0" data-code="2" data-name="영업·고객상담">
                            <strong>영업·고객상담</strong> <span>(49)</span>
                        </button>
                    </li>
                                                                            <li class="">
                        <button class="btn_category_depth1" type="button" data-depth="0" data-code="9" data-name="건설">
                            <strong>건설</strong> <span>(99)</span>
                        </button>
                    </li>
                                                                            <li class="">
                        <button class="btn_category_depth1" type="button" data-depth="0" data-code="3" data-name="생산·제조">
                            <strong>생산·제조</strong> <span>(82)</span>
                        </button>
                    </li>
                                                                            <li class="">
                        <button class="btn_category_depth1" type="button" data-depth="0" data-code="10" data-name="유통·무역">
                            <strong>유통·무역</strong> <span>(71)</span>
                        </button>
                    </li>
                                                                            <li class="">
                        <button class="btn_category_depth1" type="button" data-depth="0" data-code="4" data-name="IT·인터넷">
                            <strong>IT·인터넷</strong> <span>(6)</span>
                        </button>
                    </li>
                                                                            <li class="">
                        <button class="btn_category_depth1" type="button" data-depth="0" data-code="11" data-name="서비스">
                            <strong>서비스</strong> <span>(131)</span>
                        </button>
                    </li>
                                                                            <li class="">
                        <button class="btn_category_depth1" type="button" data-depth="0" data-code="5" data-name="전문직">
                            <strong>전문직</strong> <span>(17)</span>
                        </button>
                    </li>
                                                                            <li class="">
                        <button class="btn_category_depth1" type="button" data-depth="0" data-code="12" data-name="디자인">
                            <strong>디자인</strong> <span>(1)</span>
                        </button>
                    </li>
                                                                            <li class="">
                        <button class="btn_category_depth1" type="button" data-depth="0" data-code="6" data-name="교육">
                            <strong>교육</strong> <span>(30)</span>
                        </button>
                    </li>
                                                                            <li class="">
                        <button class="btn_category_depth1" type="button" data-depth="0" data-code="13" data-name="의료">
                            <strong>의료</strong> <span>(71)</span>
                        </button>
                    </li>
                                                                            <li class="">
                        <button class="btn_category_depth1" type="button" data-depth="0" data-code="7" data-name="미디어">
                            <strong>미디어</strong> <span>(4)</span>
                        </button>
                    </li>
                                                                                    </ul>
        </div>
    </div>
</div>                <div id="job-category" class="wrap_category category_type_column_two job_category ">
    <h2 class="title_panel">직종</h2>
    <div class="wrap_detail_panel depth1_division">
        <div class="title_detail_box"><strong>직종 구분</strong></div>
        <div class="box_detail_panel">
            <ul class="wrap_category_menu column_two" id="job-category-depth1">
                                    <li class="">
                                                    <button class="btn_category_depth1" type="button" data-depth="0" data-code="1" data-name="경영·사무">
                                <strong>경영·사무</strong> <span>(38)</span>
                            </button>
                                            </li>
                                    <li class="checked">
                                                    <button class="btn_category_depth1" type="button" data-depth="0" data-code="8" data-name="특수계층·공공">
                                <strong>특수계층·공공</strong> <span>(31)</span>
                            </button>
                                            </li>
                                    <li class="select checked">
                                                    <button class="btn_category_depth1" type="button" data-depth="0" data-code="2" data-name="영업·고객상담">
                                <strong>영업·고객상담</strong> <span>(49)</span>
                            </button>
                                            </li>
                                    <li class="">
                                                    <button class="btn_category_depth1" type="button" data-depth="0" data-code="9" data-name="건설">
                                <strong>건설</strong> <span>(99)</span>
                            </button>
                                            </li>
                                    <li class="">
                                                    <button class="btn_category_depth1" type="button" data-depth="0" data-code="3" data-name="생산·제조">
                                <strong>생산·제조</strong> <span>(82)</span>
                            </button>
                                            </li>
                                    <li class="">
                                                    <button class="btn_category_depth1" type="button" data-depth="0" data-code="10" data-name="유통·무역">
                                <strong>유통·무역</strong> <span>(71)</span>
                            </button>
                                            </li>
                                    <li class="">
                                                    <button class="btn_category_depth1" type="button" data-depth="0" data-code="4" data-name="IT·인터넷">
                                <strong>IT·인터넷</strong> <span>(6)</span>
                            </button>
                                            </li>
                                    <li class="">
                                                    <button class="btn_category_depth1" type="button" data-depth="0" data-code="11" data-name="서비스">
                                <strong>서비스</strong> <span>(131)</span>
                            </button>
                                            </li>
                                    <li class="">
                                                    <button class="btn_category_depth1" type="button" data-depth="0" data-code="5" data-name="전문직">
                                <strong>전문직</strong> <span>(17)</span>
                            </button>
                                            </li>
                                    <li class="">
                                                    <button class="btn_category_depth1" type="button" data-depth="0" data-code="12" data-name="디자인">
                                <strong>디자인</strong> <span>(1)</span>
                            </button>
                                            </li>
                                    <li class="">
                                                    <button class="btn_category_depth1" type="button" data-depth="0" data-code="6" data-name="교육">
                                <strong>교육</strong> <span>(30)</span>
                            </button>
                                            </li>
                                    <li class="">
                                                    <button class="btn_category_depth1" type="button" data-depth="0" data-code="13" data-name="의료">
                                <strong>의료</strong> <span>(71)</span>
                            </button>
                                            </li>
                                    <li class="">
                                                    <button class="btn_category_depth1" type="button" data-depth="0" data-code="7" data-name="미디어">
                                <strong>미디어</strong> <span>(4)</span>
                            </button>
                                            </li>
                                    <li class="">
                                            </li>
                            </ul>
        </div>
    </div>
    <div class="wrap_detail_panel depth2_division">
        <div class="title_detail_box">
            <strong>희망 직종</strong>
            <span class="box_add_util">
                <label for="exp-career"><input type="checkbox" name="" id="exp-career" title="이 직종 경력자만"> <span class="txt">이 직종 경력자만</span></label>
                <div class="ico_tooltip">
                    <span class="txt_tooltip">툴팁</span>
                    <div class="lpop_tooltip_wrap">
                        인재가 희망한 직종과 근무경력 직종이<br>
                        동일한 인재만 검색합니다.
                        <button class="btn_close_lpop" type="button">닫기</button>
                    </div>
                </div>
            </span>
        </div>
        <div class="box_detail_panel">
            <ul class="list_depth2_select" id="job-category-depth2">
                                    <li>
                        <label for="job-category-depth2-all">
                            <input type="checkbox" name="" id="job-category-depth2-all" title="전체" data-depth="1"
                                   data-mcode=""
                                   data-mname=""
                                   data-bcode=""
                                   data-bname=""
                                   data-code="all"
                                   data-name="전체"
                                   value="all"
                                >
                            <span class="txt " title="전체">전체</span>
                            <span class="count all">(49)</span>
                        </label>
                    </li>
                                    <li>
                        <label for="job-category-depth2-202">
                            <input type="checkbox" name="" id="job-category-depth2-202" title="일반영업" data-depth="1"
                                   data-mcode="2"
                                   data-mname="영업·고객상담"
                                   data-bcode="202"
                                   data-bname="일반영업"
                                   data-code="202"
                                   data-name="일반영업"
                                   value="202"
                                >
                            <span class="txt " title="일반영업">일반영업</span>
                            <span class="count 202">(9)</span>
                        </label>
                    </li>
                                    <li>
                        <label for="job-category-depth2-203">
                            <input type="checkbox" name="" id="job-category-depth2-203" title="판매·매장관리" data-depth="1"
                                   data-mcode="2"
                                   data-mname="영업·고객상담"
                                   data-bcode="203"
                                   data-bname="판매·매장관리"
                                   data-code="203"
                                   data-name="판매·매장관리"
                                   value="203"
                                >
                            <span class="txt " title="판매·매장관리">판매·매장관리</span>
                            <span class="count 203">(23)</span>
                        </label>
                    </li>
                                    <li>
                        <label for="job-category-depth2-205">
                            <input type="checkbox" name="" id="job-category-depth2-205" title="IT·솔루션영업" data-depth="1"
                                   data-mcode="2"
                                   data-mname="영업·고객상담"
                                   data-bcode="205"
                                   data-bname="IT·솔루션영업"
                                   data-code="205"
                                   data-name="IT·솔루션영업"
                                   value="205"
                                >
                            <span class="txt " title="IT·솔루션영업">IT·솔루션영업</span>
                            <span class="count 205">(1)</span>
                        </label>
                    </li>
                                    <li>
                        <label for="job-category-depth2-206">
                            <input type="checkbox" name="" id="job-category-depth2-206" title="금융·보험영업" data-depth="1"
                                   data-mcode="2"
                                   data-mname="영업·고객상담"
                                   data-bcode="206"
                                   data-bname="금융·보험영업"
                                   data-code="206"
                                   data-name="금융·보험영업"
                                   value="206"
                                >
                            <span class="txt " title="금융·보험영업">금융·보험영업</span>
                            <span class="count 206">(4)</span>
                        </label>
                    </li>
                                    <li>
                        <label for="job-category-depth2-207">
                            <input type="checkbox" name="" id="job-category-depth2-207" title="광고영업" data-depth="1"
                                   data-mcode="2"
                                   data-mname="영업·고객상담"
                                   data-bcode="207"
                                   data-bname="광고영업"
                                   data-code="207"
                                   data-name="광고영업"
                                   value="207"
                                checked>
                            <span class="txt select" title="광고영업">광고영업</span>
                            <span class="count 207">(1)</span>
                        </label>
                    </li>
                                    <li>
                        <label for="job-category-depth2-208">
                            <input type="checkbox" name="" id="job-category-depth2-208" title="기술영업" data-depth="1"
                                   data-mcode="2"
                                   data-mname="영업·고객상담"
                                   data-bcode="208"
                                   data-bname="기술영업"
                                   data-code="208"
                                   data-name="기술영업"
                                   value="208"
                                >
                            <span class="txt " title="기술영업">기술영업</span>
                            <span class="count 208">(3)</span>
                        </label>
                    </li>
                                    <li>
                        <label for="job-category-depth2-209">
                            <input type="checkbox" name="" id="job-category-depth2-209" title="영업기획·관리·지원" data-depth="1"
                                   data-mcode="2"
                                   data-mname="영업·고객상담"
                                   data-bcode="209"
                                   data-bname="영업기획·관리·지원"
                                   data-code="209"
                                   data-name="영업기획·관리·지원"
                                   value="209"
                                >
                            <span class="txt " title="영업기획·관리·지원">영업기획·관리·지원</span>
                            <span class="count 209">(2)</span>
                        </label>
                    </li>
                                    <li>
                        <label for="job-category-depth2-210">
                            <input type="checkbox" name="" id="job-category-depth2-210" title="TM·아웃바운드" data-depth="1"
                                   data-mcode="2"
                                   data-mname="영업·고객상담"
                                   data-bcode="210"
                                   data-bname="TM·아웃바운드"
                                   data-code="210"
                                   data-name="TM·아웃바운드"
                                   value="210"
                                >
                            <span class="txt " title="TM·아웃바운드">TM·아웃바운드</span>
                            <span class="count 210">(7)</span>
                        </label>
                    </li>
                                    <li>
                        <label for="job-category-depth2-211">
                            <input type="checkbox" name="" id="job-category-depth2-211" title="TM·인바운드" data-depth="1"
                                   data-mcode="2"
                                   data-mname="영업·고객상담"
                                   data-bcode="211"
                                   data-bname="TM·인바운드"
                                   data-code="211"
                                   data-name="TM·인바운드"
                                   value="211"
                                >
                            <span class="txt " title="TM·인바운드">TM·인바운드</span>
                            <span class="count 211">(5)</span>
                        </label>
                    </li>
                                    <li>
                        <label for="job-category-depth2-212">
                            <input type="checkbox" name="" id="job-category-depth2-212" title="고객센터·CS" data-depth="1"
                                   data-mcode="2"
                                   data-mname="영업·고객상담"
                                   data-bcode="212"
                                   data-bname="고객센터·CS"
                                   data-code="212"
                                   data-name="고객센터·CS"
                                   value="212"
                                >
                            <span class="txt " title="고객센터·CS">고객센터·CS</span>
                            <span class="count 212">(10)</span>
                        </label>
                    </li>
                                    <li>
                        <label for="job-category-depth2-213">
                            <input type="checkbox" name="" id="job-category-depth2-213" title="QA·CS강사·수퍼바이저" data-depth="1"
                                   data-mcode="2"
                                   data-mname="영업·고객상담"
                                   data-bcode="213"
                                   data-bname="QA·CS강사·수퍼바이저"
                                   data-code="213"
                                   data-name="QA·CS강사·수퍼바이저"
                                   value="213"
                                >
                            <span class="txt " title="QA·CS강사·수퍼바이저">QA·CS강사·수퍼바이저</span>
                            <span class="count 213">(2)</span>
                        </label>
                    </li>
                            </ul>
            <button class="btn_depth3_expand"><span>상세직종</span></button>
            <ul class="list_depth3_select" id="job-category-depth3">
                                    <li>
                        <label for="job-category-depth3-20701">
                            <input type="checkbox" name="" id="job-category-depth3-20701" title="광고영업" data-depth="2"
                                   data-mcode="2"
                                   data-mname="영업·고객상담"
                                   data-bcode="207"
                                   data-bname="광고영업"
                                   data-code="20701"
                                   data-name="광고영업"
                                   value="20701"
                                >
                            <span class="txt" title="광고영업">광고영업</span>
                            <span class="count">(0)</span>
                        </label>
                    </li>
                                    <li>
                        <label for="job-category-depth3-20702">
                            <input type="checkbox" name="" id="job-category-depth3-20702" title="매체광고" data-depth="2"
                                   data-mcode="2"
                                   data-mname="영업·고객상담"
                                   data-bcode="207"
                                   data-bname="광고영업"
                                   data-code="20702"
                                   data-name="매체광고"
                                   value="20702"
                                >
                            <span class="txt" title="매체광고">매체광고</span>
                            <span class="count">(0)</span>
                        </label>
                    </li>
                                    <li>
                        <label for="job-category-depth3-20703">
                            <input type="checkbox" name="" id="job-category-depth3-20703" title="온라인광고" data-depth="2"
                                   data-mcode="2"
                                   data-mname="영업·고객상담"
                                   data-bcode="207"
                                   data-bname="광고영업"
                                   data-code="20703"
                                   data-name="온라인광고"
                                   value="20703"
                                >
                            <span class="txt" title="온라인광고">온라인광고</span>
                            <span class="count">(1)</span>
                        </label>
                    </li>
                                    <li>
                        <label for="job-category-depth3-20704">
                            <input type="checkbox" name="" id="job-category-depth3-20704" title="옥외광고" data-depth="2"
                                   data-mcode="2"
                                   data-mname="영업·고객상담"
                                   data-bcode="207"
                                   data-bname="광고영업"
                                   data-code="20704"
                                   data-name="옥외광고"
                                   value="20704"
                                >
                            <span class="txt" title="옥외광고">옥외광고</span>
                            <span class="count">(0)</span>
                        </label>
                    </li>
                                    <li>
                        <label for="job-category-depth3-20705">
                            <input type="checkbox" name="" id="job-category-depth3-20705" title="키워드광고" data-depth="2"
                                   data-mcode="2"
                                   data-mname="영업·고객상담"
                                   data-bcode="207"
                                   data-bname="광고영업"
                                   data-code="20705"
                                   data-name="키워드광고"
                                   value="20705"
                                >
                            <span class="txt" title="키워드광고">키워드광고</span>
                            <span class="count">(0)</span>
                        </label>
                    </li>
                                    <li>
                        <label for="job-category-depth3-20706">
                            <input type="checkbox" name="" id="job-category-depth3-20706" title="지역광고" data-depth="2"
                                   data-mcode="2"
                                   data-mname="영업·고객상담"
                                   data-bcode="207"
                                   data-bname="광고영업"
                                   data-code="20706"
                                   data-name="지역광고"
                                   value="20706"
                                >
                            <span class="txt" title="지역광고">지역광고</span>
                            <span class="count">(0)</span>
                        </label>
                    </li>
                                    <li>
                        <label for="job-category-depth3-20707">
                            <input type="checkbox" name="" id="job-category-depth3-20707" title="지하철광고" data-depth="2"
                                   data-mcode="2"
                                   data-mname="영업·고객상담"
                                   data-bcode="207"
                                   data-bname="광고영업"
                                   data-code="20707"
                                   data-name="지하철광고"
                                   value="20707"
                                >
                            <span class="txt" title="지하철광고">지하철광고</span>
                            <span class="count">(0)</span>
                        </label>
                    </li>
                                    <li>
                        <label for="job-category-depth3-20708">
                            <input type="checkbox" name="" id="job-category-depth3-20708" title="버스광고" data-depth="2"
                                   data-mcode="2"
                                   data-mname="영업·고객상담"
                                   data-bcode="207"
                                   data-bname="광고영업"
                                   data-code="20708"
                                   data-name="버스광고"
                                   value="20708"
                                >
                            <span class="txt" title="버스광고">버스광고</span>
                            <span class="count">(0)</span>
                        </label>
                    </li>
                                    <li>
                        <label for="job-category-depth3-20710">
                            <input type="checkbox" name="" id="job-category-depth3-20710" title="DM·타겟메일" data-depth="2"
                                   data-mcode="2"
                                   data-mname="영업·고객상담"
                                   data-bcode="207"
                                   data-bname="광고영업"
                                   data-code="20710"
                                   data-name="DM·타겟메일"
                                   value="20710"
                                >
                            <span class="txt" title="DM·타겟메일">DM·타겟메일</span>
                            <span class="count">(0)</span>
                        </label>
                    </li>
                            </ul>
        </div>
    </div>
</div>                <div id="education" class="wrap_category edu_level ">
    <h2 class="title_panel">학력</h2>
    <div class="wrap_detail_panel box_tabmenu">
        <ul class="wrap_category_menu">
            <li class="select">
                <button class="btn_category_depth1" type="button"><strong>최종학력/학교</strong></button>
            </li>
            <li class="">
                <button class="btn_category_depth1" type="button"><strong>전공계열/학과</strong></button>
            </li>
        </ul>
    </div>
    <div class="wrap_detail_panel edu_last expand">
        <div class="box_detail_panel" id="final-edu">
            <strong class="title_sub">최종학력/학교</strong>
            <ul class="wrap_list_value">
                                    <li><label class="frm_chkbox01 check_on" for="final-edu0"><input type="checkbox" id="final-edu0" value="12" checked><span>대학교 4년 <em>(0)</em></span></label></li>
                                    <li><label class="frm_chkbox01 check_on" for="final-edu1"><input type="checkbox" id="final-edu1" value="11" checked><span>대학교 2,3년 <em>(6)</em></span></label></li>
                                    <li><label class="frm_chkbox01 check_on" for="final-edu2"><input type="checkbox" id="final-edu2" value="13" checked><span>대학원 석/박사 <em>(2)</em></span></label></li>
                                    <li><label class="frm_chkbox01 check_on" for="final-edu3"><input type="checkbox" id="final-edu3" value="10" checked><span>고등학교 이하 <em>(3)</em></span></label></li>
                            </ul>
            <div class="box_option_check">
                <label class="edu-part" for="local01">
                    <input type="checkbox" id="local01" value="1" >
                    <span>국내</span>
                </label>
                <label class="edu-part" for="abroad01">
                    <input type="checkbox" id="abroad01" value="2" >
                    <span>해외</span>
                </label>
                <label class="type_block" for="edu-status">
                    <input type="checkbox" id="edu-status" >
                    <span>재학·휴학·수료·중퇴·자퇴 제외</span>
                </label>
            </div>
        </div>
        <div class="box_detail_panel edu_last_school" id="school">
            <div class="entry_item">
                <div class="entry_tit">
                    <strong>학교명</strong>
                    <div class="ico_tooltip">
                        <span class="txt_tooltip">툴팁</span>
                        <div class="lpop_tooltip_wrap">
                            <strong>학교명 검색 방법</strong>
                            <ol>
                                <li>
                                    <strong>1. 학교 구분을 선택해주세요.</strong>
                                    <p>대학교 or 고등학교를 선택해주세요. 선택하지 않을 경우, 전체에서 검색됩니다.</p>
                                </li>
                                <li>
                                    <strong>2. 사람인에 등록된 대학교명은 현재 통용되는 대학교명입니다.</strong>
                                    <p>변경되기 전 대학교명이나, 줄임말, 소재 불명확한 대학교명은 검색이 안되오니<br>정확한 대학교명을 확인하시고, 검색해주시기 바랍니다.</p>
                                    <ul class="example">
                                        <li>
                                            <p>- 국내대학의 경우, 줄임말이 아닌 정식명칭으로 검색해주세요.</p>
                                            <p>예) 고대 (X) 고려대학교 (O) 숙대 (X) 숙명여자대학교 (O)</p>
                                        </li>
                                        <li>
                                            <p>- 해외대학은 영문명(알파벳)으로 검색해주세요(중국대학 예외)</p>
                                            <p>예) 하버드대학 (X) Harvard University (O) 동경대 (X) Tokyo University (O)</p>
                                        </li>
                                        <li>
                                            <p>- 중국대학은 한문의 음을 딴 한글명으로 검색해주세요.</p>
                                            <p>예) 北京大 (X) 북경대학 (O)</p>
                                        </li>
                                    </ul>

                                </li>
                            </ol>
                            <button class="btn_close_lpop" type="button">닫기</button>
                        </div>
                    </div>
                </div>
                <div class="entry_form">
                    <div class="form_sp frm_select">
                        <select name="school_select" class="school_select">
                            <option value="university">대학교(4년)</option>
                            <option value="college">대학교(2,3년)</option>
                            <option value="master">대학원(석/박사)</option>
                            <option value="high">고등학교</option>
                            <option value="all">전체</option>
                        </select>
                    </div>
                    <div class="form_nm">
                        <input type="text" class="frm_input01 university" value="" placeholder="학교명을 입력해주세요.">
                        <button type="button" class="btn_typ_c3">추가</button>
                        <div class="search_keyword" style="display: none;">
                            <ul></ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="entry_item second">
                <div class="entry_tit">
                    <strong>자주 찾는 학교</strong>
                </div>
                <div class="entry_form">
                    <ul class="wrap_list_value column_three">
                                            </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="wrap_detail_panel specialism" id="edu-major-dept-name">
        <div class="box_detail_panel">
            <strong class="title_sub">전공계열/학과</strong>
            <ul class="list_depth2_select" id="edu-major">
                            </ul>
        </div>
        <div class="edu_dept_grade">
            <div class="entry_item" id="edu-dept-name">
                <div class="entry_tit">
                    <strong>학과</strong>
                </div>
                <div class="entry_form">
                    <input type="text" class="frm_input01" value="" placeholder="학과명 입력">
                    <button type="button" class="btn_typ_c3">추가</button>
                </div>
            </div>
            <div class="entry_item edu_grade" id="edu-grade">
                <div class="entry_tit">
                    <strong>학점</strong>
                </div>
                <div class="entry_form">
                    <div class="form_nm">
                        <input type="number" class="frm_input01" step="0.1" min="1.0" max="4.5" maxlength="5" value="" placeholder="학점"><span class="txt_unit">/만점</span>
                    </div>
                    <div class="form_sp frm_select">
                        <select name="" id="edu_grade_score_sel" title="학점 만점선택">
                            <option value="4.3">4.3 만점</option>
                            <option value="4.5" selected>4.5 만점</option>
                            <option value="4.0">4.0 만점</option>
                            <option value="100">100 만점</option>
                        </select>
                    </div>
                    <button type="button" class="btn_typ_c3">추가</button>
                </div>
            </div>
        </div>
    </div>
    <button type="button" class='btn_more_view type_edu'>학력조건 <span>더보기</span></button>
</div>                <div id="location" class="wrap_category category_type_column_two job_area ">
    <h2 class="title_panel">지역</h2>
    <div class="wrap_detail_panel depth1_division">
        <div class="title_detail_box"><strong>희망 근무지역</strong></div>
        <div class="box_detail_panel">
            <ul class="wrap_category_menu column_two">
                                    <li class="">
                        <button class="btn_category_depth1" type="button" data-code="101000" data-name="서울">
                            <strong>서울</strong> <span>(12)</span>
                        </button>
                    </li>
                                    <li class="checked">
                        <button class="btn_category_depth1" type="button" data-code="102000" data-name="경기">
                            <strong>경기</strong> <span>(9)</span>
                        </button>
                    </li>
                                    <li class="checked">
                        <button class="btn_category_depth1" type="button" data-code="103000" data-name="광주">
                            <strong>광주</strong> <span>(2)</span>
                        </button>
                    </li>
                                    <li class="select checked">
                        <button class="btn_category_depth1" type="button" data-code="104000" data-name="대구">
                            <strong>대구</strong> <span>(1)</span>
                        </button>
                    </li>
                                    <li class="checked">
                        <button class="btn_category_depth1" type="button" data-code="105000" data-name="대전">
                            <strong>대전</strong> <span>(0)</span>
                        </button>
                    </li>
                                    <li class="">
                        <button class="btn_category_depth1" type="button" data-code="106000" data-name="부산">
                            <strong>부산</strong> <span>(2)</span>
                        </button>
                    </li>
                                    <li class="">
                        <button class="btn_category_depth1" type="button" data-code="107000" data-name="울산">
                            <strong>울산</strong> <span>(0)</span>
                        </button>
                    </li>
                                    <li class="">
                        <button class="btn_category_depth1" type="button" data-code="108000" data-name="인천">
                            <strong>인천</strong> <span>(1)</span>
                        </button>
                    </li>
                                    <li class="">
                        <button class="btn_category_depth1" type="button" data-code="109000" data-name="강원">
                            <strong>강원</strong> <span>(0)</span>
                        </button>
                    </li>
                                    <li class="">
                        <button class="btn_category_depth1" type="button" data-code="110000" data-name="경남">
                            <strong>경남</strong> <span>(0)</span>
                        </button>
                    </li>
                                    <li class="">
                        <button class="btn_category_depth1" type="button" data-code="111000" data-name="경북">
                            <strong>경북</strong> <span>(0)</span>
                        </button>
                    </li>
                                    <li class="">
                        <button class="btn_category_depth1" type="button" data-code="112000" data-name="전남">
                            <strong>전남</strong> <span>(1)</span>
                        </button>
                    </li>
                                    <li class="">
                        <button class="btn_category_depth1" type="button" data-code="113000" data-name="전북">
                            <strong>전북</strong> <span>(0)</span>
                        </button>
                    </li>
                                    <li class="">
                        <button class="btn_category_depth1" type="button" data-code="114000" data-name="충북">
                            <strong>충북</strong> <span>(0)</span>
                        </button>
                    </li>
                                    <li class="">
                        <button class="btn_category_depth1" type="button" data-code="115000" data-name="충남">
                            <strong>충남</strong> <span>(1)</span>
                        </button>
                    </li>
                                    <li class="">
                        <button class="btn_category_depth1" type="button" data-code="116000" data-name="제주">
                            <strong>제주</strong> <span>(2)</span>
                        </button>
                    </li>
                                    <li class="">
                        <button class="btn_category_depth1" type="button" data-code="118000" data-name="세종">
                            <strong>세종</strong> <span>(0)</span>
                        </button>
                    </li>
                                    <li class="">
                        <button class="btn_category_depth1" type="button" data-code="117000" data-name="전국">
                            <strong>전국</strong> <span>(0)</span>
                        </button>
                    </li>
                                    <li class="">
                        <button class="btn_category_depth1" type="button" data-code="210000" data-name="아시아·중동">
                            <strong>아시아·중동</strong> <span>(0)</span>
                        </button>
                    </li>
                                    <li class="">
                        <button class="btn_category_depth1" type="button" data-code="211200" data-name="일본">
                            <strong>일본</strong> <span>(0)</span>
                        </button>
                    </li>
                                    <li class="">
                        <button class="btn_category_depth1" type="button" data-code="211300" data-name="중국.홍콩">
                            <strong>중국.홍콩</strong> <span>(0)</span>
                        </button>
                    </li>
                                    <li class="">
                        <button class="btn_category_depth1" type="button" data-code="220000" data-name="북·중미">
                            <strong>북·중미</strong> <span>(0)</span>
                        </button>
                    </li>
                                    <li class="">
                        <button class="btn_category_depth1" type="button" data-code="220200" data-name="미국">
                            <strong>미국</strong> <span>(0)</span>
                        </button>
                    </li>
                                    <li class="">
                        <button class="btn_category_depth1" type="button" data-code="230000" data-name="남미">
                            <strong>남미</strong> <span>(0)</span>
                        </button>
                    </li>
                                    <li class="">
                        <button class="btn_category_depth1" type="button" data-code="240000" data-name="유럽">
                            <strong>유럽</strong> <span>(0)</span>
                        </button>
                    </li>
                                    <li class="">
                        <button class="btn_category_depth1" type="button" data-code="250000" data-name="오세아니아">
                            <strong>오세아니아</strong> <span>(0)</span>
                        </button>
                    </li>
                                    <li class="">
                        <button class="btn_category_depth1" type="button" data-code="260000" data-name="아프리카">
                            <strong>아프리카</strong> <span>(0)</span>
                        </button>
                    </li>
                                    <li class="">
                        <button class="btn_category_depth1" type="button" data-code="270000" data-name="남극대륙">
                            <strong>남극대륙</strong> <span>(0)</span>
                        </button>
                    </li>
                                    <li class="">
                        <button class="btn_category_depth1" type="button" data-code="280000" data-name="기타해외">
                            <strong>기타해외</strong> <span>(0)</span>
                        </button>
                    </li>
                            </ul>
        </div>
    </div>
    <div class="wrap_detail_panel depth2_division">
        <div class="title_detail_box">
            <button type="button" class="btn_small_typ_b1">거주지역 선택</button>
            <span class="box_add_util">
                <label for="location-live"><input type="checkbox" name="" id="location-live" title="이 지역 거주자만"> <span class="txt">이 지역 거주자만</span></label>
                <div class="ico_tooltip">
                    <span class="txt_tooltip">툴팁</span>
                    <div class="lpop_tooltip_wrap">
                        인재가 희망한 근무지역과 거주지역이<br>
                        동일한 인재만 검색합니다.
                        <button class="btn_close_lpop" type="button">닫기</button>
                    </div>
                </div>
            </span>
        </div>
        <div class="box_detail_panel">
            <ul class="list_depth2_select">
                                    <li>
                        <label for="location-depth2-all">
                            <input type="checkbox" name="" id="location-depth2-all" title="전체" data-depth="1" data-mcode="" data-mname=""
                                   data-bcode="" data-code="all" data-name="전체" value="all" >
                            <span class="txt" title="전체">전체</span>
                            <span class="count all">(1)</span>
                        </label>
                    </li>
                                    <li>
                        <label for="location-depth2-104010">
                            <input type="checkbox" name="" id="location-depth2-104010" title="남구" data-depth="1" data-mcode="104000" data-mname="대구"
                                   data-bcode="104010" data-code="104010" data-name="남구" value="104010" checked>
                            <span class="txt" title="남구">남구</span>
                            <span class="count 104010">(0)</span>
                        </label>
                    </li>
                                    <li>
                        <label for="location-depth2-104020">
                            <input type="checkbox" name="" id="location-depth2-104020" title="달서구" data-depth="1" data-mcode="104000" data-mname="대구"
                                   data-bcode="104020" data-code="104020" data-name="달서구" value="104020" >
                            <span class="txt" title="달서구">달서구</span>
                            <span class="count 104020">(0)</span>
                        </label>
                    </li>
                                    <li>
                        <label for="location-depth2-104030">
                            <input type="checkbox" name="" id="location-depth2-104030" title="달성군" data-depth="1" data-mcode="104000" data-mname="대구"
                                   data-bcode="104030" data-code="104030" data-name="달성군" value="104030" >
                            <span class="txt" title="달성군">달성군</span>
                            <span class="count 104030">(0)</span>
                        </label>
                    </li>
                                    <li>
                        <label for="location-depth2-104040">
                            <input type="checkbox" name="" id="location-depth2-104040" title="동구" data-depth="1" data-mcode="104000" data-mname="대구"
                                   data-bcode="104040" data-code="104040" data-name="동구" value="104040" >
                            <span class="txt" title="동구">동구</span>
                            <span class="count 104040">(0)</span>
                        </label>
                    </li>
                                    <li>
                        <label for="location-depth2-104050">
                            <input type="checkbox" name="" id="location-depth2-104050" title="북구" data-depth="1" data-mcode="104000" data-mname="대구"
                                   data-bcode="104050" data-code="104050" data-name="북구" value="104050" >
                            <span class="txt" title="북구">북구</span>
                            <span class="count 104050">(0)</span>
                        </label>
                    </li>
                                    <li>
                        <label for="location-depth2-104060">
                            <input type="checkbox" name="" id="location-depth2-104060" title="서구" data-depth="1" data-mcode="104000" data-mname="대구"
                                   data-bcode="104060" data-code="104060" data-name="서구" value="104060" >
                            <span class="txt" title="서구">서구</span>
                            <span class="count 104060">(0)</span>
                        </label>
                    </li>
                                    <li>
                        <label for="location-depth2-104070">
                            <input type="checkbox" name="" id="location-depth2-104070" title="수성구" data-depth="1" data-mcode="104000" data-mname="대구"
                                   data-bcode="104070" data-code="104070" data-name="수성구" value="104070" >
                            <span class="txt" title="수성구">수성구</span>
                            <span class="count 104070">(0)</span>
                        </label>
                    </li>
                                    <li>
                        <label for="location-depth2-104080">
                            <input type="checkbox" name="" id="location-depth2-104080" title="중구" data-depth="1" data-mcode="104000" data-mname="대구"
                                   data-bcode="104080" data-code="104080" data-name="중구" value="104080" >
                            <span class="txt" title="중구">중구</span>
                            <span class="count 104080">(0)</span>
                        </label>
                    </li>
                            </ul>
        </div>
    </div>
</div>                <div class="more_category">
                    <div id="industry" class="wrap_category category_type_column_two job_category ">
    <h2 class="title_panel">업종</h2>
    <div class="wrap_detail_panel depth1_division">
        <div class="title_detail_box"><strong>업종 구분</strong></div>
        <div class="box_detail_panel">
            <ul class="wrap_category_menu column_two">
                            </ul>
        </div>
    </div>
    <div class="wrap_detail_panel depth2_division">
        <div class="title_detail_box">
            <strong>희망 업종</strong>
        </div>
        <div class="box_detail_panel">
            <ul class="list_depth2_select">
                            </ul>
            <button class="btn_depth3_expand"><span>상세업종</span></button>
            <ul class="list_depth3_select">
                            </ul>
        </div>
    </div>
</div>                    <div id="job-type-salary" class="wrap_category job_condition ">
    <h2 class="title_panel">근무조건</h2>
    <div class="wrap_detail_panel">
        <div class="title_detail_box"><strong>근무 형태</strong></div>
        <div class="box_detail_panel">
            <strong class="title_sub">근무 형태</strong>
            <ul class="wrap_list_value column_three" id="job-type">
                            </ul>
            <button type="button" class="btn_more_view type_job" id="job-type-btn-more-view">근무형태 <span>더보기</span></button>
        </div>
    </div>
    <div class="wrap_detail_panel">
        <div class="title_detail_box"><strong>희망 급여</strong></div>
        <div class="box_detail_panel" id="salary">
            <strong class="title_sub">희망 급여</strong>
            <ul class="wrap_list_value column_three">
                <li><label class="frm_chkbox01" for="salary-checkbox-01"><input type="checkbox" id="salary-checkbox-01" name="" title="1,800만원 이하" value=",5"><span>1,800만원 <em class="ico_under">이하</em></span></label></li>
                <li><label class="frm_chkbox01" for="salary-checkbox-02"><input type="checkbox" id="salary-checkbox-02" name="" title="2,000~2,400만원" value="6,8"><span>2,000~2,400만원</span></label></li>
                <li><label class="frm_chkbox01" for="salary-checkbox-03"><input type="checkbox" id="salary-checkbox-03" name="" title="2,400~2,800만원" value="8,10"><span>2,400~2,800만원</span></label></li>
                <li><label class="frm_chkbox01" for="salary-checkbox-04"><input type="checkbox" id="salary-checkbox-04" name="" title="2,800~3,200만원" value="10,12"><span>2,800~3,200만원</span></label></li>
                <li><label class="frm_chkbox01" for="salary-checkbox-05"><input type="checkbox" id="salary-checkbox-05" name="" title="3,200~3,600만원" value="12,14"><span>3,200~3,600만원</span></label></li>
                <li><label class="frm_chkbox01" for="salary-checkbox-06"><input type="checkbox" id="salary-checkbox-06" name="" title="3,600~4,000만원" value="14,16"><span>3,600~4,000만원</span></label></li>
                <li><label class="frm_chkbox01" for="salary-checkbox-07"><input type="checkbox" id="salary-checkbox-07" name="" title="4,000~5,000만원" value="16,17"><span>4,000~5,000만원</span></label></li>
                <li><label class="frm_chkbox01" for="salary-checkbox-08"><input type="checkbox" id="salary-checkbox-08" name="" title="5,000~6,000만원" value="17,18"><span>5,000~6,000만원</span></label></li>
                <li><label class="frm_chkbox01" for="salary-checkbox-09"><input type="checkbox" id="salary-checkbox-09" name="" title="6,000만원 이상" value="18,"><span>6,000만원 <em class="ico_over">이상</em></span></label></li>
                <li><label class="frm_chkbox01" for="salary-checkbox-10"><input type="checkbox" id="salary-checkbox-10" name="" title="1억원 이상" value="22,"><span>1억원 <em class="ico_over">이상</em></span></label></li>
            </ul>
            <div class="wrap_interval_value">
                <div class="form_sp frm_select">
                    <select name="" id="salarymin" title="연봉 구간 시작값">
                        <option value="">전체</option>
                    </select>
                </div>
                <span class="dash">~</span>
                <div class="form_sp frm_select">
                    <select name="" id="salarymax" title="연봉 구간 마지막값">
                        <option value="">전체</option>
                    </select>
                </div>
                <div class="box_option_check">
                    <label for="salary_rule_99">
                        <input type="checkbox" id="salary_rule_99" value="99">
                        <span>면접 후 결정</span>
                    </label>
                    <label for="salary_rule_0">
                        <input type="checkbox" id="salary_rule_0" value="0">
                        <span>회사 내규에 따름</span>
                    </label>
                </div>
            </div>
        </div>
    </div>
</div>                    <div id="language-exam" class="wrap_category language_abroad ">
    <h2 class="title_panel">어학</h2>
    <div class="wrap_detail_panel depth1_division">
        <div class="title_detail_box"><strong>어학 시험</strong></div>
        <div class="box_detail_panel">
            <ul class="wrap_category_menu" id="language-exam-lang">
                                    <li class=" select">
                        <button class="btn_category_depth1" type="button" id="language-exam-lang-1" data-code="1">
                            <strong>영어</strong>
                        </button>
                    </li>
                                        <li class="">
                        <button class="btn_category_depth1" type="button" id="language-exam-lang-2" data-code="2">
                            <strong>일본어</strong>
                        </button>
                    </li>
                                        <li class="">
                        <button class="btn_category_depth1" type="button" id="language-exam-lang-3" data-code="3">
                            <strong>중국어</strong>
                        </button>
                    </li>
                                        <li class="">
                        <button class="btn_category_depth1" type="button" id="language-exam-lang-4" data-code="4">
                            <strong>독일어</strong>
                        </button>
                    </li>
                                        <li class="">
                        <button class="btn_category_depth1" type="button" id="language-exam-lang-5" data-code="5">
                            <strong>불어</strong>
                        </button>
                    </li>
                                        <li class="">
                        <button class="btn_category_depth1" type="button" id="language-exam-lang-6" data-code="6">
                            <strong>스페인어</strong>
                        </button>
                    </li>
                                        <li class="">
                        <button class="btn_category_depth1" type="button" id="language-exam-lang-7" data-code="7">
                            <strong>러시아어</strong>
                        </button>
                    </li>
                                        <li class="">
                        <button class="btn_category_depth1" type="button" id="language-exam-lang-8" data-code="8">
                            <strong>이탈리아어</strong>
                        </button>
                    </li>
                                        <li class="">
                        <button class="btn_category_depth1" type="button" id="language-exam-lang-45" data-code="45">
                            <strong>한국어</strong>
                        </button>
                    </li>
                                        <li class="">
                        <button class="btn_category_depth1" type="button" id="language-exam-lang-99" data-code="99">
                            <strong>기타</strong>
                        </button>
                    </li>
                                </ul>
        </div>
    </div>
    <div class="wrap_detail_panel depth2_division">
        <div class="title_detail_box">
            <span class="box_add_util">
                <label class="ico_notice_new">
                    <input type="checkbox" name="" id="language-exam-all" title="스피드 검색">
                    <span class="txt" id="language-exam-all-name">영어 가능자 스피드 검색</span>
                </label>
                <span class="txt_desc">(이력서에 선택한 언어의 어학 시험이 하나라도 포함되어 있을 경우 검색)</span>
            </span>
        </div>
        <div class="box_detail_panel expand">
            <ul class="list_depth2_select" id="language-exam-option">
                            </ul>
        </div>
        <div class="box_detail_panel value_grade" id="language-exam-input" style="display:none;">
            <div class="entry_tit">
                <b id="current-lang-exam"></b>
            </div>
            <div class="entry_form">
                <div class="form_nm">
                    <input type="number" class="frm_input03" value="" placeholder="점수" id="language-exam-score">
                </div>
                <span class="txt_unit">점 이상</span>
                <div class="form_sp frm_select_small">
                    <select name="" id="language-exam-grade" title="어학 등급 선택">
                        <option value="">선택</option>
                    </select>
                </div>
                <span class="txt_unit">급 이상</span>
            </div>
            <div class="entry_check">
                <button type="button" class="btn_typ_c1">추가</button>
                <div class="ico_tooltip">
                    <span class="txt_tooltip">툴팁</span>
                    <div class="lpop_tooltip_wrap">
                        <strong>점수/급수/취득</strong>
                        최종으로 선택한 어학자격증에 추가조건으로 설정됩니다.<br>
                        추가버튼을 누르셔야 설정됩니다!
                        <button class="btn_close_lpop" type="button">닫기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>                    <div id="overseas" class="wrap_category area_overseas ">
    <h2 class="title_panel">해외</h2>
    <div class="wrap_detail_panel">
        <div class="wrap_box">
            <div class="title_detail_box">경력, 연수 &gt; 지역 &gt; 상세 지역 순으로 선택해주세요!</div>
                        <div class="area_abroad inactive">
                <ul class="wrap_list_value type_radio">
                    <li>
                        <label class="frm_radio01"><input type="radio" data-idx="0" name="abroad0" value="career_abroad" disabled><span>해외경력</span></label>
                    </li>
                    <li>
                        <label class="frm_radio01"><input type="radio" data-idx="0" name="abroad0" value="edu_abroad" disabled><span>해외연수</span></label>
                    </li>
                </ul>
                <span class="ico_next">&gt;</span>
                <div class="form_sp frm_select">
                    <select data-idx="0" class="oc-area-select" title="지역" disabled>
                        <option value="">지역</option>
                    </select>
                </div>
                <span class="ico_next">&gt;</span>
                <div class="form_sp frm_select">
                    <select class="oc-nation-select" data-idx="0" title="상세지역" disabled>
                        <option value="">상세지역</option>
                    </select>
                </div>
            </div>
                        <div class="area_abroad inactive">
                <ul class="wrap_list_value type_radio">
                    <li>
                        <label class="frm_radio01"><input type="radio" data-idx="1" name="abroad1" value="career_abroad" disabled><span>해외경력</span></label>
                    </li>
                    <li>
                        <label class="frm_radio01"><input type="radio" data-idx="1" name="abroad1" value="edu_abroad" disabled><span>해외연수</span></label>
                    </li>
                </ul>
                <span class="ico_next">&gt;</span>
                <div class="form_sp frm_select">
                    <select data-idx="1" class="oc-area-select" title="지역" disabled>
                        <option value="">지역</option>
                    </select>
                </div>
                <span class="ico_next">&gt;</span>
                <div class="form_sp frm_select">
                    <select class="oc-nation-select" data-idx="1" title="상세지역" disabled>
                        <option value="">상세지역</option>
                    </select>
                </div>
            </div>
                        <div class="area_abroad inactive">
                <ul class="wrap_list_value type_radio">
                    <li>
                        <label class="frm_radio01"><input type="radio" data-idx="2" name="abroad2" value="career_abroad" disabled><span>해외경력</span></label>
                    </li>
                    <li>
                        <label class="frm_radio01"><input type="radio" data-idx="2" name="abroad2" value="edu_abroad" disabled><span>해외연수</span></label>
                    </li>
                </ul>
                <span class="ico_next">&gt;</span>
                <div class="form_sp frm_select">
                    <select data-idx="2" class="oc-area-select" title="지역" disabled>
                        <option value="">지역</option>
                    </select>
                </div>
                <span class="ico_next">&gt;</span>
                <div class="form_sp frm_select">
                    <select class="oc-nation-select" data-idx="2" title="상세지역" disabled>
                        <option value="">상세지역</option>
                    </select>
                </div>
            </div>
                    </div>
    </div>
</div>                    <div id="job-grade-duties" class="wrap_category job_position ">
    <h2 class="title_panel">직급·직책</h2>
    <div class="wrap_detail_panel">
        <div class="title_detail_box">
            <strong>직급·직책</strong>
        </div>
        <div class="wrap_box">
            <div class="box_detail_panel" id="job-grade">
                <ul class="wrap_list_value column_four">
                                    </ul>
                <button type="button" class="btn_more_view"><span>더보기</span></button>
                <ul class="wrap_list_value column_four">
                                    </ul>
            </div>
            <hr>
            <div class="box_detail_panel" id="job-duties">
                <ul class="wrap_list_value column_four">
                                    </ul>
                <button type="button" class="btn_more_view"><span>더보기</span></button>
                <ul class="wrap_list_value column_four">
                                    </ul>
            </div>
        </div>
    </div>
</div>                    <div id="license" class="wrap_category job_license ">
    <h2 class="title_panel">자격증</h2>
    <div class="wrap_detail_panel">
        <div class="title_detail_box">
            <strong>자격증·면허증 검색</strong>
            <div class="ico_tooltip">
                <span class="txt_tooltip">툴팁</span>
                <div class="lpop_tooltip_wrap">
                    <strong>찾으시는 자격증/면허증을 입력해주세요!</strong>
                    자격증/면허증에 포함된 대표적인 단어만<br>
                    입력해도 검색하실 수 있습니다.<br>
                    예)1종보통운전면허 → 운전
                    <button class="btn_close_lpop" type="button">닫기</button>
                </div>
            </div>
            <div id="license-autocomplete" class="form_nm">
                <input type="text" class="frm_input01" id="licenseSearchWord" name="licenseSearchWord" value="" tabindex="1" accesskey="s" autocomplete="off" placeholder="자격증/면허증명을 입력해주세요. (EX. 운전면허, 교사, 한자, 컴퓨터, MOS)">
                <button type="button" class="btn_typ_c3">검색</button>
                <div class="search_box hide">
                    <div class="chk_tit">
                        <span class="chk_l">자격증/면허증</span>
                    </div>
                    <ul class="chk_list"></ul>
                    <div class="btn_box">
                        <button type="button" class="btn_typ_b4">선택완료</button>
                    </div>
                </div>
            </div>
            <p class="add_license">찾으시는 결과가 없을 시, 추가요청을 해주세요!
                <button class="btn_add_license">자격증·면허증 추가요청</button>
            </p>
        </div>
        <button type="button" class="btn_more_view type_license">자격증 <span>더보기</span></button>
        <div class="box_detail_panel">
            <ul class="wrap_category_menu column_two" id="license-depth1">
                            </ul>
        </div>
        <div class="box_detail_panel last_dom">
            <ul class="list_depth2_select" id="license-depth2">
                            </ul>
        </div>
    </div>
</div>                </div>
                <div class="btn_more_option">
                    <button type="button" class=""><span>검색조건 열기</span></button>
                </div>
            </div>
        </div>
        <div class="wrap_keyword_search" id="search_keyword_area">
    <h2>키워드</h2>
    <div class="box_check_condition">
        <label>
            <input type="checkbox" name="search_and" id="search_and" title="그리고(And) 검색하기" value="and">
            <span>그리고(And) 검색</span>
        </label>
        <label>
            <input type="checkbox" name="search_or" id="search_or" title="또는(Or) 검색하기" value="or">
            <span>또는(Or) 검색</span>
        </label>
        <label>
            <input type="checkbox" name="search_exclude" id="search_exclude" title="제외하여 검색하기" value="exclude">
            <span>제외하여 검색</span>
        </label>
        <div class="form_sp frm_select_small">
            <select title="키워드 검색 분류값">
                <option value="18">전체</option>
                <option value="13">회사명</option>
                <option value="14">직종</option>
                <option value="15">업종</option>
                <option value="16">학교명</option>
                <option value="17">전공계열/학과</option>
                <option value="19">이력서 내용</option>
                <option value="20">이력서 번호</option>
            </select>
        </div>
        <div class="form_nm">
            <input type="text" id="input002" class="frm_input01 keyword" value="" placeholder="회사명, 학과명, 직무 등 키워드를 입력해주세요."><button type="button" class="btn_typ_b4" id="select_button">추가</button>
            <div class="search_keyword" style="display:none;">
                <ul class="chk_list"></ul>
            </div>
        </div>
        <div class="ico_tooltip">
            <span class="txt_tooltip">툴팁</span>
            <div class="lpop_tooltip_wrap">
                <strong>검색 TIP! 이렇게 검색하세요!</strong>
                <table class="option_notice">
                    <colgroup>
                        <col width="139">
                        <col>
                    </colgroup>
                    <tbody>
                    <tr>
                        <th><label><input type="checkbox" onclick="return false;" title="그리고(And)검색하기"> 그리고(And)검색</label></th>
                        <td>
                            이전에 입력한 키워드와 <b>'And'조건</b>으로<br>키워드가 <b>모두 포함된 이력서</b>를 검색합니다.<br><span class="txt">(A대학교 <em class="underline">이면서</em> B학과 인 이력서를 보고 싶을 때!)</span>
                            <div class="notice_more">
                                <p>띄어쓰기로 단어 추가 시, 단어 간 근접성을 따져 정확도가 높아져요!</p>
                                <a href="#" class="open_layer" title="키워드 띄어쓰기 안내 팝업">자세한 내용은 여기를 클릭해 주세요&gt;</a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th><label><input type="checkbox" onclick="return false;" title="또는(or)검색하기"> 또는(or)검색</label></th>
                        <td>
                            이전에 입력한 키워드와 <b>'OR'조건</b>으로 추가되어<br><b>서로 다른 두 단어의 결과</b>를 함께 보실 수 있습니다.<br><span class="txt">(A회사 <em class="underline">이거나</em> B회사 가 경력인 이력서를 보고 싶을 때!)</span>
                        </td>
                    </tr>
                    <tr>
                        <th><label><input type="checkbox" onclick="return false;" title="제외하여 검색하기"> 제외하여 검색</label></th>
                        <td>키워드가 포함된 이력서를 보고 싶지 않을 때<br>사용하는 기능입니다.</td>
                    </tr>
                    </tbody>
                </table>
                <em class="reference">참고사항</em>
                <ul class="reference_list">
                    <li>- 근무 기업명 검색 시 (주)등의 표기는 인식하지 않음</li>
                    <li>- 영어는 대소문자를 구분하지 않음</li>
                </ul>
                <button class="btn_close_lpop" type="button">닫기</button>
            </div>
        </div>
    </div>
</div>        <div id="panel-search-data" style="display:none;" class="">
    <div id="search-data" class="search_option">
        <div id="talentNumber" class="talent_number">
            <p class="all">전체 <strong id="resumeCnt"></strong> 건</p>
            <p class="today">오늘 업데이트<strong id="todayCnt"></strong> 건</p>
        </div>
        <div class="keyword_box">
            <p class="txt">※ 검색조건을 설정하지 않으시면 "전체"로 검색됩니다.</p>
            <div class="has_option">
                <ul class="option_area"></ul>
                <div class="btns_area">
                    <button type="button" class="btn_show" style="display: none;"><span>더보기</span></button>
                    <button type="button" class="btn_reset btn_reset_cancel">초기화</button>
                    <button type="button" class="btn_save btn_reg" style="display: inline-block;">조건저장</button>
                    <div class="wrap_tooltip_service hide">
                        <p>
                            검색한 조건을 저장하고,<br>
                            메일로도 받아보세요
                            <button type="button" class="btn_close_tooltip"><span class="blind">닫기</span></button>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <button type="button" class="btn_option_open"><em>검색조건 접기</em><span class="icon"></span></button>
</div>        <div class="wrap_save_option" style="display:none;">
    <div class="lpop_wrap" style="display:block;">
        <div class="save_option_area" id="save_option_area" style="display:block;" xmlns="http://www.w3.org/1999/html">
            <h3>저장된 검색 조건</h3>
            <div class="tbl_count_wrap">
                <button type="button" class="btn_save_option btn_delete">삭제 <span class="count">0</span></button>
                <div class="form_sp frm_select_small sort01">
                    <select name="searchItem" id="searchItem">
                        <option value="title" selected="">조건제목</option>
                        <option value="manager_nm">담당자명</option>
                        <option value="email">메일주소</option>
                    </select>
                </div>
                <input type="text" id="searchText" class="frm_input01" value=""><button type="button" id="searchSubmit" class="btn_typ_c1">검색</button>
                <div class="form_sp frm_select_small sort01">
                    <select name="save_order" id="save_order">
                        <option value="edit_dt">수정일순</option>
                        <option value="reg_dt">등록일순</option>
                    </select>
                </div>
                <div class="form_sp frm_select_small sort02">
                    <select name="save_page_count" id="save_page_count">
                        <option value="3">3</option>
                        <option value="5">5</option>
                        <option value="10">10</option>
                        <option value="50">50</option>
                        <option value="100">100</option>
                    </select>
                </div>
            </div>
            <div class="talent_list">
                <input type="hidden" id="saveListCount" name="saveListCount" value="">
                <table>
                    <caption>저장된 검색 조건</caption>
                    <colgroup>
                        <col style="width:52px">
                        <col style="width:656px">
                        <col style="width:262px">
                        <col style="width:101px">
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col" class="delete"><label for="all-chk-conditions"><input type="checkbox" id="all-chk-conditions"/> <span class="blind">선택삭제</span></label></th>
                        <th scope="col">요약정보</th>
                        <th scope="col">수정</th>
                        <th scope="col">검색</th>
                    </tr>
                    </thead>
                    <tbody>
                                        </tbody>
                </table>
                <p class="noti"><span>* 메일수신</span>을 체크하시면, 조건에 매칭되는 인재가 있을 때 <span>알림메일</span>이 수신됩니다.</p>
            </div>
                        <button type="button" class="btn_close_lpop01" id="btn-hide-save-list">닫기</button>
        </div>
    </div>
</div>    </div>
    <!-- 이키워드로 찾은 인기 이력서 -->
    <div class="search_keyword_resume" style="display:none;">
        <div class="wrap_tit">
            <h2>이 키워드로 찾은 인기 이력서</h2>
            <div class="tit_recommend">
                <strong class="tit">추천인재</strong>
                <div class="ico_tooltip">
                    <span class="txt_tooltip">툴팁</span>
                    <div class="lpop_tooltip_wrap">
                        <strong class="tit_tooltip_contents">추천인재란?</strong>
                        <div class="desc">사람인을 이용하는 모든 인사담당자의 인재 검색 패턴을 실시간으로 분석하여,<br>맞춤형 인재를 추천해드리는 고도화된 추천 솔루션입니다.</div>
                        <button class="btn_close_lpop" type="button">닫기</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="wrap_slide_resume">
            <button type="button" id="" class="btn_prev"><span class="blind">이전</span></button>
            <div class="resume_talent"></div>
            <button type="button" id="" class="btn_next"><span class="blind">다음</span></button>
        </div>
    </div>
</div>


    <div class="talent_list_wrap">
        <div class="list_area" id="list_area">
    <!-- 인재정보 리스트 -->
    <div class="filter_box">
    <ul class="filter">
        <li class="special" id="special">
            <a href="javascript:void">우대조건</a>
            <div class="ico_tooltip child">
                <div class="lpop_tooltip_wrap">
                    <ul class="preferential_select">
                                                    <li>
                                <input type="checkbox" value="computer" name="preferential" id="i_preferential_computer">
                                <label for="i_preferential_computer">컴퓨터 활용능력 우수자</label>
                                                            </li>
                                                    <li>
                                <input type="checkbox" value="specialized" name="preferential" id="i_preferential_specialized">
                                <label for="i_preferential_specialized">특성화고/마이스터고</label>
                                                            </li>
                                                    <li>
                                <input type="checkbox" value="freshMan" name="preferential" id="i_preferential_freshMan">
                                <label for="i_preferential_freshMan">사회초년생</label>
                                                            </li>
                                                    <li>
                                <input type="checkbox" value="expectant" name="preferential" id="i_preferential_expectant">
                                <label for="i_preferential_expectant">고졸 예정자</label>
                                                            </li>
                                                    <li>
                                <input type="checkbox" value="militaryOfficer" name="preferential" id="i_preferential_militaryOfficer">
                                <label for="i_preferential_militaryOfficer">장교/부사관/ROTC</label>
                                                            </li>
                                                    <li>
                                <input type="checkbox" value="intern" name="preferential" id="i_preferential_intern">
                                <label for="i_preferential_intern">인턴경험 있음</label>
                                                            </li>
                                                    <li>
                                <input type="checkbox" value="military" name="preferential" id="i_preferential_military">
                                <label for="i_preferential_military">병역특례</label>
                                                            </li>
                                                    <li>
                                <input type="checkbox" value="alba" name="preferential" id="i_preferential_alba">
                                <label for="i_preferential_alba">알바경험 있음</label>
                                                            </li>
                                                    <li>
                                <input type="checkbox" value="disabled" name="preferential" id="i_preferential_disabled">
                                <label for="i_preferential_disabled">장애인</label>
                                                            </li>
                                                    <li>
                                <input type="checkbox" value="photo" name="preferential" id="i_preferential_photo">
                                <label for="i_preferential_photo">사진 있음</label>
                                                            </li>
                                                    <li>
                                <input type="checkbox" value="bohun" name="preferential" id="i_preferential_bohun">
                                <label for="i_preferential_bohun">국가보훈처</label>
                                                            </li>
                                                    <li>
                                <input type="checkbox" value="contact_open" name="preferential" id="i_preferential_contact_open">
                                <label for="i_preferential_contact_open">전화 연락 가능</label>
                                                                    <div class="ico_tooltip">
                                        <span class="txt_tooltip">툴팁</span>
                                        <div class="lpop_tooltip_wrap">
                                            휴대폰 또는 전화번호를 공개한<br>
                                            인재만 검색합니다.
                                            <button class="btn_close_lpop" type="button">닫기</button>
                                        </div>
                                    </div>
                                                            </li>
                                                    <li>
                                <input type="checkbox" value="nationalmerit" name="preferential" id="i_preferential_nationalmerit">
                                <label for="i_preferential_nationalmerit">국가유공자</label>
                                                            </li>
                                                    <li>
                                <input type="checkbox" value="attach_file_cnt" name="preferential" id="i_preferential_attach_file_cnt">
                                <label for="i_preferential_attach_file_cnt">첨부파일 있음</label>
                                                            </li>
                                                    <li>
                                <input type="checkbox" value="hire" name="preferential" id="i_preferential_hire">
                                <label for="i_preferential_hire">고용지원금 대상</label>
                                                            </li>
                                            </ul>
                    <div class="btn_center">
                        <button type="button" class="btn_typ_c1 all_checked">전체선택</button>
                        <button type="button" class="btn_typ_c1 all_unchecked">전체해제</button>
                    </div>
                    <button class="btn_close_lpop" type="button">닫기</button>
                </div>
            </div>
        </li>

        <li class="update">
            <a href="#">업데이트일</a>
            <div class="ico_tooltip child">
                <div class="lpop_tooltip_wrap">
                    <ul class="updateDate_select">
                                                    <li>
                                <input type="radio" value="all" name="updateDate" id="i_updateDate_all" checked>
                                <label for="i_updateDate_all">전체</label>
                            </li>
                                                    <li>
                                <input type="radio" value="oneday" name="updateDate" id="i_updateDate_oneday" >
                                <label for="i_updateDate_oneday">오늘</label>
                            </li>
                                                    <li>
                                <input type="radio" value="threeday" name="updateDate" id="i_updateDate_threeday" >
                                <label for="i_updateDate_threeday">3일 이내</label>
                            </li>
                                                    <li>
                                <input type="radio" value="sevenday" name="updateDate" id="i_updateDate_sevenday" >
                                <label for="i_updateDate_sevenday">7일 이내</label>
                            </li>
                                                    <li>
                                <input type="radio" value="onemonth" name="updateDate" id="i_updateDate_onemonth" >
                                <label for="i_updateDate_onemonth">1개월 이내</label>
                            </li>
                                                    <li>
                                <input type="radio" value="twomonth" name="updateDate" id="i_updateDate_twomonth" >
                                <label for="i_updateDate_twomonth">2개월 이내</label>
                            </li>
                                                    <li>
                                <input type="radio" value="threemonth" name="updateDate" id="i_updateDate_threemonth" >
                                <label for="i_updateDate_threemonth">3개월 이내</label>
                            </li>
                                                    <li>
                                <input type="radio" value="sixmonth" name="updateDate" id="i_updateDate_sixmonth" >
                                <label for="i_updateDate_sixmonth">6개월 이내</label>
                            </li>
                                            </ul>
                    <button class="btn_close_lpop" type="button">닫기</button>
                </div>
            </div>
        </li>

        <li class="state">
            <a href="#">구직 상태</a>
            <div class="ico_tooltip child">
                <div class="lpop_tooltip_wrap">
                    <ul class="status_select">
                                                    <li><input type="checkbox" value="1" name="status" id="i_status_1"> <label for="i_status_1">구직 준비중</label></li>
                                                    <li><input type="checkbox" value="2" name="status" id="i_status_2"> <label for="i_status_2">구직중</label></li>
                                                    <li><input type="checkbox" value="5" name="status" id="i_status_5"> <label for="i_status_5">재직중</label></li>
                                            </ul>
                    <button class="btn_close_lpop" type="button">닫기</button>
                </div>
            </div>
        </li>

        <li class="phone contact_open">
            <a href="#">연락처 확인</a>
            <div class="ico_tooltip child">
                <div class="lpop_tooltip_wrap">
                    <ul class="contact_open_select">
                        <li><input type="radio" value="" name="contact_open" id="i_contact_open" checked="checked"> <label for="i_contact_open">전체 보기</label></li>
                        <li><input type="radio" value="notin" name="contact_open" id="i_contact_open_noopen"> <label for="i_contact_open_noopen">연락처 확인한 인재만 <em class="point01">제외</em></label></li>
                        <li><input type="radio" value="in" name="contact_open" id="i_contact_open_open"> <label for="i_contact_open_open">연락처 확인한 인재만 <em class="point02">보기</em></label></li>
                    </ul>
                    <p>
                        인재정보 열람상품으로 연락처 확인한 인재<br/>
                        (위 기능은 조건 저장에 포함되지 않습니다.)
                    </p>
                    <button class="btn_close_lpop" type="button">닫기</button>
                </div>
            </div>
            <div class="ico_tooltip child02">
                <span class="txt_tooltip">툴팁</span>
                <div class="lpop_tooltip_wrap">
                    이미 봤던 인재 보기 싫으실 때?<br>
                    연락처 확인한 인재 제외하여 보기를 이용하세요.
                    <button class="btn_close_lpop" type="button">닫기</button>
                </div>
            </div>
        </li>
    </ul>

    <div class="right">
        <div class="form_sp frm_select">
            <select id="order_select" class="on">
                <option value="last_dt" data-sort="desc">최신순↓</option>
                <option value="reg_dt" data-sort="desc">등록일순</option>
                <option value="edit_dt" data-sort="desc">수정일순</option>
                <option value="education_cd" data-sort="desc">학력순</option>
                <option value="career_period" data-sort="desc">경력순</option>
            </select>
        </div>
        <button type="button" id="sort" class="btn_sort" value="desc" title="오름차순/내림차순">오름차순/내림차순</button>
        <div class="form_sp frm_select list_num">
            <select id="pageCount" class="pageCount">
                <option value="10">10개</option>
                <option value="20" selected>20개</option>
                <option value="30">30개</option>
                <option value="50">50개</option>
                <option value="70">70개</option>
                <option value="100">100개</option>
            </select>
        </div>
        <div class="list_option">
                        <div class="lpop_tooltip_wrap">
                <div class="check_list_option">
                    <strong>확인한 이력서 목록</strong>
                    <ul>
                        <li>
                            <input type="radio" name="check_list" id="type1" value="list_type1" title="기본 보기 시 클릭" checked="checked" data-option-label="list-default">
                            <label for="type1">기본</label>
                        </li>
                        <li class="view_sharp">
                            <input type="radio" name="check_list" id="type2" value="list_type2" title="선명한 구분 보기 시 클릭" data-option-label="list-sharp">
                            <label for="type2">선명한 구분</label>
                        </li>
                        <li class="view_smudge">
                            <input type="radio" name="check_list" id="type3" value="list_type3" title="흐릿한 구분 보기 시 클릭" data-option-label="list-blur">
                            <label for="type3">흐릿한 구분</label>
                        </li>
                        <li class="view_shadow">
                            <input type="radio" name="check_list" id="type4" value="list_type4" title="음영 구분 보기 시 클릭" data-option-label="list-background">
                            <label for="type4">음영 구분</label>
                        </li>
                    </ul>
                </div>
                <div class="resume_option">
                    <strong>이력서 보기 방식</strong>
                    <ul>
                        <li class="view_new">
                            <input type="radio" name="show_resume" id="view_new" value="view_new" title="새 탭으로 띄우기 시 클릭" checked="checked" data-option-label="view-newtab">
                            <label for="view_new">새 탭으로 띄우기</label>
                        </li>
                        <li class="view_this">
                            <input type="radio" name="show_resume" id="view_this" value="view_this" title="현재 창에서 보기 시 클릭" data-option-label="view-self">
                            <label for="view_this">현재 창에서 보기</label>
                        </li>
                        <li class="view_popup">
                            <input type="radio" name="show_resume" id="view_popup" value="view_popup" title="새로운 창(팝업) 띄우기 시 클릭" data-option-label="view-popup">
                            <label for="view_popup">새로운 창(팝업) 띄우기</label>
                        </li>
                    </ul>
                </div>
                <div class="keyword_option">
                    <strong>키워드 검색 결과 설정</strong>
                    <ul>
                        <li>
                            <input type="radio" name="keyword_search_option" id="keyword_search_option_expand" value="expand" title="확장검색" checked="checked">
                            <label for="keyword_search_option_expand">확장검색</label>
                            <div class="ico_tooltip">
                                <span class="txt_tooltip">툴팁</span>
                                <div class="lpop_tooltip_wrap">
                                    <span class="title">관련성이 높은 단어를 함께 검색되도록 하는 검색 방식</span>
                                    <span class="txt01">'다이아몬드 반지'에 대해 '다이야몬드 반지'라고 잘못 입력해도 올바른 검색이 가능하도록 하는 것.</span>
                                    <button class="btn_close_lpop" type="button">닫기</button>
                                </div>
                            </div>
                        </li>
                        <li>
                            <input type="radio" name="keyword_search_option" id="keyword_search_option_match" value="match" title="일치검색">
                            <label for="keyword_search_option_match">일치검색</label>
                            <div class="ico_tooltip">
                                <span class="txt_tooltip">툴팁</span>
                                <div class="lpop_tooltip_wrap">
                                    <span class="title">정확하게 일치하는 경우에만 검색되도록 하는 검색 방식</span>
                                    <button class="btn_close_lpop" type="button">닫기</button>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="btn_center">
                    <button type="button" class="btn_typ_c1" id="btn_apply_list_option">적용</button>
                    <button type="button" class="btn_typ_c1" id="btn_cancel_list_option">취소</button>
                    <div class="ico_tooltip">
                        <span class="txt_tooltip">툴팁</span>
                        <div class="lpop_tooltip_wrap">
                            위 내용은 브라우저 기준으로 적용됩니다.<br>
                            <p>(ID 기준이 아니며, 브라우저 설정 초기화 시 <br>
                                기본으로 변경됩니다.)</p>
                            <button class="btn_close_lpop" type="button">닫기</button>
                        </div>
                    </div>
                </div>
                <button class="btn_close_lpop" type="button">닫기</button>
            </div>
        </div>
    </div>
</div>
<!-- //filter_box -->    <div class="talent_list">
    <table>
        <caption>인재검색 리스트</caption>
        <colgroup>
            <col width="46">
            <col width="218">
            <col width="549">
            <col width="147">
        </colgroup>
        <thead>
        <tr>
            <th scope="col" class="scrap"><span class="blind">관심인재</span></th>
            <th scope="col" class="name">이름</th>
            <th scope="col" class="contents">이력서 요약</th>
            <th scope="col" class="update" id="date_type">업데이트일</th>
        </tr>
        </thead>
        <tbody id="resumeList">
        <tr class="search_no">
            <td colspan="4">불러오는 중입니다.</td>
        </tr>
        </tbody>
    </table>
    <div class="copy_url">
        <input type="text" id="copy-url-target" class="input_copy_url" value="">
        <a href="/zf_user/help/inquery?category=23" id="btn-copy-url" class="btn_copy_url" target="_blank">URL복사</a>
        <div class="alert_copy_url copy_complete">
            <strong>URL(주소)이 복사되었습니다.</strong>
            <p>원하는 곳에 붙여넣어(Ctrl+V) 사용해 보세요.</p>
            <button class="btn_close_alert" type="button">닫기</button>
        </div>
    </div>
</div>    <div id="pagingArea"></div>
    <div id="bannerArea"></div>
</div>

<div class="right_wing_wrap">
    <a href="/zf_user/service/company/order?part_id=package&category=amplification&inner_medium=banner&inner_source=ecommerce_amplification&inner_campaign=wing_banner&inner_term=amplification" class="banner" target="_blank">
    <img src="http://www.saraminimage.co.kr/sri/company/product/nudge_wing_talent_pkg1.png" alt="사람인이 드리는 파격혜택! 인재채용 효과증푹 자세히보기">
</a>    <div class="right_wing_banner">
        <div class="banner">
            <div id="div-gpt-ad-1553056822382-0-wrapper" style="width:120px; height:240px;">
                <div class="google-standby-banner">
                                                                        <img src="http://www.saraminbanner.co.kr/adserver/default/2019/03/popjnu_q2r1-1meg1s3_bannerad120x240.png" alt="인공지능 취업플랫폼 사람인">
                                                            </div>
                <div id="div-gpt-ad-1553056822382-0-inner" style="display:none">
                    <div id="div-gpt-ad-1553056822382-0">
                        <script type="text/javascript">
                            googletag.cmd.push(function () {
                                googletag.display('div-gpt-ad-1553056822382-0');
                            });
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <div id="rightWingUtil" class="right_wing_util type01">
        <div>
            <ul>
    <li>
        <p>최근 본 공고</p>
        <a href="/zf_user/jobs/read-jobs" target="_blank"><strong id="recently-recruit-count">0</strong> 건</a>
    </li>
</ul>
<p class="notice">
    로그인 하시면,<br>
    편리하게 검색조건을<br>
    저장/활용하고 알림메일을<br>
    신청할 수 있습니다.
</p>
<a class="btn_login" href="/zf_user/auth?ut=c&url=%2Fzf_user%2Ftalent%2Fsearch">기업회원 로그인</a>            <a class="btn_guide" href="##" target="_blank">인재 검색 가이드!</a>

            
            <a class="btn_back" href="javascript:void(0);">이전 페이지로</a>
        </div>

        <div class="btn_top">
            <a href="#header" class="go_top_area">
                <img src="//www.saraminimage.co.kr/ui/public_recruit/btn_quick_top.png" alt="화면상단으로 바로가기">
            </a>
        </div>
    </div>
    </div>

<script type="text/javascript">
    </script>
<!-- 관심인재등록 레이어-->
<div class="lpop_wrap lpop_interest_check">
    <div class="desc">
        <strong>선택한 인재가 관심인재로 등록되었습니다.</strong>
        <p>관심인재 페이지로 이동하시겠습니까?</p>
    </div>
    <div class="btn_wrap">
        <button type="button" class="btn_typ_c3 _close_layer">인재정보 계속보기</button>
        <a href="/zf_user/memcom/talent-manage/scrap-talent">
            <button type="button" class="btn_typ_b1">관심인재 확인하기</button>
        </a>
    </div>
    <button type="button" class="btn_close_lpop01 _close_layer">닫기</button>
</div>

    </div>
</div>

<!--[if lte IE 8]>
<link href="/css/talent_search_ie8.css" media="all" rel="stylesheet" type="text/css" >
<script type='text/javascript' src="/js/ui-component-company-ie8.js"></script>
<![endif]-->

            </div>
        </div>
                <footer id="sri_footer" class="sri_footer">
    <div class="wrap_footer">
        <div class="links">
    <strong class="blind">바로가기</strong>
    <ul>
        <li class="first"><a href="http://www.saraminhr.co.kr/" target="_blank" rel="noopener" title="회사소개 새창열기" >회사소개</a></li>
        <li><a href="http://www.saraminhr.co.kr/open_content/pr/press_release.php" target="_blank" rel="noopener" title="보도기사 새창열기" >보도기사</a></li>
        <li><a href="http://www.saraminhr.co.kr/open_content/hr/location.php" target="_blank" rel="noopener" title="찾아오시는길 새창열기" >찾아오시는길</a></li>
        <li><a href="/zf_user/help/terms-of-service" title="회원약관 바로가기" >회원약관</a></li>
        <li class="bold"><a href="/zf_user/help/privacy" title="개인정보처리방침 바로가기" >개인정보처리방침</a></li>
        <li><a href="http://www.saramin.co.kr/zf_user/popup/email-refuse" onclick="window.open(this.href, '이메일무단수집거부', 'width=380,height=200,left=0,top=0'); return false;" rel="noopener" title="이메일무단수집거부 바로가기" >이메일무단수집거부</a></li>
        <li><a href="http://api.saramin.co.kr/" target="_blank" rel="noopener" title="오픈API 새창열기" >오픈API</a></li>
        <li><a href="/zf_user/help/inquery/partnership-inquiry-write" target="_self" rel="noopener" title="제휴문의" >제휴문의</a></li>
        <li><a href="http://www.saramin.co.kr/zf_user/help" title="고객센터 바로가기" >고객센터</a></li>
    </ul>
</div>        <div class="copyright">
    <p>(주)사람인HR, 우 : 08378, 서울특별시 구로구 디지털로34길 43, 201호(구로동), 대표 : 김용환, 개인정보 관리책임자 : 강봉관<br>사업자등록 : 113-86-00917, 직업정보제공사업 : 서울 관악 제 2005-6호, 통신판매업 : 제 2339호, Copyright (c) (주)사람인HR. All rights reserved.</p>
</div>    </div>
</footer>
    </div>

<div id="dimmed"></div>
<!-- 자격증/면허 추가 레이어 -->
<div class="lpop_wrap lpop_license_add">
    <h3>자격증/면허 추가</h3>
    <p class="explain">찾으시는 자격증이 검색이 안되셨다면, 지금 사람인에 추가 요청해주세요.</p>
    <form action="" id="addLicenseForm">
        <div class="tbl_typ_reg01">
            <table class="tbl_common">
                <colgroup>
                    <col style="width:98px">
                    <col style="">
                </colgroup>
                <tbody>
                <tr>
                    <th>자격증명</th>
                    <td><input type="text" name="license_nm" id="license_nm" class="frm_input01" value=""></td>
                </tr>
                <tr>
                    <th>발행기관</th>
                    <td><input type="text" name="publisher" id="publisher" class="frm_input01" value=""></td>
                </tr>
                <tr>
                    <th class="tit_txt">기타요청</th>
                    <td><textarea cols="25" rows="5" name="contents" id="contents" class="frm_textarea"></textarea></td>
                </tr>
                </tbody>
            </table>
        </div>
    </form>
    <div class="notice">
        <p>※ 주의 사항</p>
        <ol>
            <li>1) 발행기관을 입력해주시면 더 빠르게 처리됩니다!</li>
            <li>2) 아래의 경우 요청사항이 처리되지 않을 수 있습니다!
                <ul>
                    <li>- 통용되지 않은 자격증명을 기입하신 경우</li><br>
                    <li>- 줄임말, 소재 불명확, 잘못된 철자, 부정확한 표현으로 요청한 경우</li>
                </ul>
            </li>
            <li>3) 추가가 완료된 자격증에 한해서만 회원님께 개별적으로 연락을 드립니다.</li>
        </ol>
    </div>
    <div class="btn_wrap">
        <button type="button" class="btn_typ_a1">추가 요청 하기</button>
        <button type="button" class="btn_typ_a2">취소</button>
    </div>
    <button type="button" class="btn_close_lpop01">닫기</button>
</div>
<!-- //자격증/면허 추가 레이어 -->

<!-- 검색조건 저장하기 레이어 -->
<div class="lpop_wrap lpop_search_type_save edit_box">
    <h3>검색조건 저장하기</h3>
    <form id="saveForm" name="saveForm" action="">
        <div class="tbl_typ_reg01">
            <table class="tbl_common">
                <colgroup>
                    <col style="width:127px">
                    <col style="">
                </colgroup>
                <tbody>
                <tr>
                    <th>검색조건 제목 <em class="require">*</em></th>
                    <td><input type="text" id="title" class="frm_input01" maxlength="40"> (<span id="titleStringCount" class="word">0</span>자/최대 40자)</td>
                </tr>
                <tr>
                    <th>담당자 <em class="require">*</em></th>
                    <td><input type="text" id="manager_nm" class="frm_input01" value="" maxlength="10"> (한글, 영문 10자 이내)</td>
                </tr>
                <tr>
                    <th>이메일 <em class="require">*</em></th>
                    <td>
                        <input type="text" id="email" class="frm_input01" value="" maxlength="100">
                        <label class="form_sp frm_chk02" for="mail_receive"><input type="checkbox" id="mail_receive"><span>알림메일 수신</span></label>
                        <div class="ico_tooltip">
                            <span class="txt_tooltip">툴팁</span>
                            <div class="lpop_tooltip_wrap">
                                조건에 매칭되는 인재가<br>
                                있을 때 알림메일 수신
                                <button class="btn_close_lpop" type="button">닫기</button>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>검색조건 요약</th>
                    <td><p class="only_line"></p></td>
                </tr>
                </tbody>
            </table>
        </div>
    </form>
    <div class="btn_wrap">
        <button type="button" class="btn_typ_a1">저장</button>
        <button type="button" class="btn_typ_a2">취소</button>
    </div>
    <button type="button" class="btn_close_lpop01">닫기</button>
</div>
<!-- //검색조건 저장하기 레이어 -->

<!-- 띄어쓰기 안내 레이어 -->
<div id="layer_notice_spacebar" class="layer_notice_spacebar" style="display:none">
    <div class="box_tit">
        <h3><img src="//www.saraminimage.co.kr/sri/company/talent/layer_spacebar_tit.png" width="342" height="79" alt="띄어쓰기(스페이스 바)를 입력하셨네요!"></h3>
        <img src="//www.saraminimage.co.kr/sri/company/talent/layer_spacebar_txt.png" width="348" height="39" alt="띄어쓰기로 검색했을 때와, 그리고(And)검색을 선택했을 시는 같은 And조건 검색이지만, 이렇게 달라요!">
    </div>
    <div class="desc">
        <dl>
            <dt class="sub_tit"><img src="//www.saraminimage.co.kr/sri/company/talent/layer_spacebar_result_tit.png" width="162" height="19" alt="띄어쓰기 검색 결과는!"></dt>
            <dd><img src="//www.saraminimage.co.kr/sri/company/talent/layer_spacebar_result_desc.png" width="225" height="53" alt="두 단어가  하나의 항목에 함께 포함되어 있을 때 불러옴 (근접도를 따져서 정확도가 더 높아요!)"></dd>
        </dl>
        <dl>
            <dt class="sub_tit"><img src="//www.saraminimage.co.kr/sri/company/talent/layer_spacebar_result_and.png" width="188" height="21" alt="그리고(And)검색 결과는!"></dt>
            <dd><img src="//www.saraminimage.co.kr/sri/company/talent/layer_spacebar_result_and_desc.png" width="212" height="53" alt="두 단어가 각 각 이력서의 어느 항목에나 속하기만 하면 불러옴 (검색 결과가 띄어쓰기 보다 많아요!)"></dd>
        </dl>
    </div>
    <button type="button"><img src="//www.saraminimage.co.kr/sri/company/talent/layer_spacebar_btn.png" width="258" height="59" alt="이해했어요!"></button>
    <button type="button" class="btn_close">보이지않기</button>
</div>
<!-- //띄어쓰기 안내 레이어 -->



<script type="text/javascript">
var isPersonLogin = false;
var isCompanyLogin = false;
</script>

<script type="text/javascript">
var wwwBaseUrl = '';
var isNullRealNameVerified = '1';

//상세 입사지원 팝업
var isIE = function() {
    var ua = window.navigator.userAgent;
    var msie = ua.indexOf('MSIE ');
    if (msie > 0) {
        return true;
    }
    var trident = ua.indexOf('Trident/');
    if (trident > 0) {
        return true;
    }
    var edge = ua.indexOf('Edge/');
    if (edge > 0) {
        return false;
    }
    return false;
}
var closeAppSetupLayer = function(s) {
    if ( s == 'balloon-layer' ) {
        $(s).hide();
    } else {
        var layerEl = $('app-setup-layer');
        layerEl.setStyle({'display':'none'});
    }
};
var isQuirksIE = isIE() && document.compatMode!=='CSS1Compat' ? true : false;

var loadingLayer = false;
// 즉시지원 1Form
var quickApplyForm = function(rec_idx, company_nm, track_url, search_url, category) {
    if (loadingLayer) {
        alert('즉시지원 프로세스가 실행중입니다. 잠시만 기다려 주세요.');
        return false;
    }

    var category = category || '';
    var rec_idx  = rec_idx || '';
    var quick_apply_frame = $('quick_apply_frame');

    if (isCompanyLogin) {
        if ( !confirm('기업회원으로 로그인되어 있어 이용하실 수 없습니다.\n\n개인회원으로 로그인하시겠습니까?') ) {
            return;
        }
    }

    var spec = 'apply_status=y&reg_source_type=pc';

    if (category != 'scrap' && category != 'favor' && category != 'quick_login' && category != 'ask_manager') {
        Saramin.readJob(rec_idx, spec);
    }
    if (!isPersonLogin) {
        if (!!category && category == 'quick_login') {
            category = 'scrap';
        }

        quick_apply_frame.setAttribute('showLayer', 'y');
        var loginUrl = '/zf_user/member/apply/login-form?rec_idx=' + rec_idx + '&category=' + category;
        if (track_url) {
            loginUrl += '&' + track_url;
        }
        if (search_url) {
            loginUrl += '&' + search_url;
        }
        quick_apply_frame.hide();
        quick_apply_frame.contentWindow.location.replace(loginUrl);
        showQuickApplyLayer();
        return;
    }

    if (isPersonLogin && isNullRealNameVerified) {
        alert('휴대폰 또는 이메일 인증을 완료하신 후에 입사지원이 가능합니다.');
        return false;
    }

    quick_apply_frame.hide();
    showQuickApplyLayer();

    var quickApplyUrl = '/zf_user/member/apply?rec_idx=' + rec_idx;
    if ( track_url ) {
        quickApplyUrl += '&' + track_url;
    }
    if (search_url) {
        quickApplyUrl += '&' + search_url;
    }
    quick_apply_frame.setAttribute('showLayer', 'y');
    loadingLayer = true;
    quick_apply_frame.contentWindow.location.replace(quickApplyUrl);
};

var showQuickApplyLayer = function() {
    if(!!$('pop_login_layer')){
        $('pop_login_layer').hide();
    }

    document.getElementsByTagName('html')[0].style.overflow = 'hidden';
    document.getElementsByTagName('html')[0].style.height = '100%';
    if(isQuirksIE) document.getElementsByTagName('body')[0].style.overflow = 'hidden';
    document.getElementsByTagName('body')[0].style.height = '100%';

    setQuickApplyLayerPosition();

    $('iframe_layer').show();
};

var setQuickApplyLayerPosition = function() {
    var layerEl = $('iframe_layer');

    var sheight = document.body.scrollTop;
    if (sheight == 0) {
        sheight = document.documentElement.scrollTop;
    }

    var sLeft = document.body.scrollLeft == 0 ? document.documentElement.scrollLeft : document.body.scrollLeft,
        window_w = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;

    layerEl.style.top = sheight + 'px';
    layerEl.style.width = (window_w + sLeft) + 'px';

    var layerWidth = function(evt){
        sLeft = document.body.scrollLeft == 0 ? document.documentElement.scrollLeft : document.body.scrollLeft;
        window_w = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
        layerEl.style.width = (window_w + sLeft) + 'px';
    };
    function addEvent(obj, evType, fn) {
        if(obj.addEventListener) {
            obj.addEventListener(evType, fn, true);
            return true;
        } else if(obj.attachEvent) {
            var r = obj.attachEvent("on" + evType, fn);  return r;
        } else {
            return false;
        }
    }
    addEvent(window, 'resize', layerWidth, true);
};

var closeQuickApplyLayer = function(onlayer) {
    if (loadingLayer && onlayer != 'y') {
        alert('입사지원 프로세스가 실행중입니다. 잠시만 기다려주세요.');
        return false;
    }

    var quick_apply_frame = $('quick_apply_frame'),
        iframeLayerEl = $('iframe_layer'),
        reloadFl = $('quick_apply_layer').getAttribute('reload');

    quick_apply_frame.setAttribute('showLayer', 'n');

    iframeLayerEl.hide();

    document.getElementsByTagName('html')[0].style.overflow = '';
    if(isQuirksIE) document.getElementsByTagName('body')[0].style.overflow = '';
    quick_apply_frame.contentWindow.location.replace('about:blank');

    try {
        if (reloadFl == 'y' && global_rec_idx) {
            location.reload();
        }

        var statisticEl = window.parent.document.getElementById('goStatistic');

        if (typeof(statisticEl) != 'undefined' && statisticEl.value == 'go') {
            var d = new Date();
            d.setTime(d.getTime() + 60000);
            var expires = "expires="+d.toUTCString();
            document.cookie = "relay_view_to=statistics;" + expires + ";path=/;"
            location.reload();
        }
    } catch (e) {}
};

var showRecommendRecruitLayer = function (rec_idx, recruitapply_idx) {
    $('iframe_layer').hide();

    showQuickApplyLayer();

    //loadingLayer = true;

    var quick_apply_frame = $('quick_apply_frame');
    quick_apply_frame.hide();
    quick_apply_frame.setAttribute('showLayer', 'y');
    quick_apply_frame.contentWindow.location.replace('/zf_user/member/apply/recommend-recruit-list?rec_idx=' + rec_idx + '&recruitapply_idx=' + recruitapply_idx + '&apply_type=applyStatus');
};

var goResumeManage = function () {
    if (confirm('이력서가 등록되지 않았습니다.\n지금 등록하시겠습니까?')) {
        location.href = wwwBaseUrl + '/zf_user/member/resume-manage/select-template';
    }
};

var setReload = function(flag) {
    $('quick_apply_layer').setAttribute('reload', flag);
};

</script>

<div id="iframe_layer" class="iframe_layer" style="display: none;">
    <div id="quick_apply_layer" class="once_layer" reload="n">
        <div id="quick_apply_layer_loading" class="layer_loading" style="display:none"><img src="//www.saraminimage.co.kr/js/libs/images/loading.gif"></div>
        <iframe id="quick_apply_frame" name="quick_apply_frame" src="about:blank" width="540" height="0" scrolling="no" frameborder="0" allowtransparency="true" title="입사지원" showlayer="n" style=""></iframe>
        <a href="#close" onclick="closeQuickApplyLayer(); return false;" class="once_ly_close">
            <img src="http://www.saraminimage.co.kr/sri/common/btn/btn_layer_close.png" alt="닫기">
        </a>
    </div>
</div><div id="pop_login_layer_dimmed" style="display:none;position:fixed;top:0;left:0;width:100%;height:100%;background:url(//www.saraminimage.co.kr/event_2014/0708_rank1/bg_dimmed.png) repeat 0 0;z-index:9998;"></div>
<div id="pop_login_layer" class="pop_login_layer pop_login_layer_local" style="display: none; position: absolute; top: 280px;">
    <div class="outer">
        <form name="loginFrm" id="loginFrm" action="https://www.saramin.co.kr/zf_user/auth/login" method="post" onsubmit="return loginCheckMainLayer(this);">
            <input type="hidden" name="page_url" id="page_url" value="L3pmX3VzZXIvdGFsZW50L3NlYXJjaA==">
            <input type="hidden" name="url" value="">
            <input type="hidden" name="allowType" value="c">
            <input type="hidden" name="ut" value="c">
            <input type="hidden" name="layerScrapIdx" value="">
            <input type="hidden" name="layerFavorIdx" value="">
            <input type="hidden" name="rec_apply_fl" value="n">
            <fieldset class="inner">
                <legend><strong>기업회원로그인</strong>이 필요한 서비스입니다.</legend>
                <div class="setting">
                    <input id="ly_autologin" name="autologin" type="checkbox">
                    <label for="ly_autologin"> 로그인 유지 </label>
                    <div class="dsc_ly" id="tooltip_autologin" style="display: none;">
                        <button class="btn_ly_close" id="auto_login_close" type="button">닫기</button>
                        <span class="dsc_arr"></span>
                        <p class="dsc_txt">
                            <strong>[개인회원 전용]</strong><br>
                            개인정보 보호를 위해 개인 PC에서만 이용해 주세요.
                        </p>
                    </div>
                    <input id="ly_id_save" name="id_save" class="ly_id_save" type="checkbox" >
                    <label for="ly_id_save">아이디 저장</label>
                </div>
                <div id="login_form" class="login-form">
                    <div id="id_input_form" class="id-input-box focus">
                        <label id="ly-id-label" for="ly_id"><span>아이디</span></label>
                        <input type="text" name="id" id="ly_id" value="">
                    </div>
                    <div id="pw_input_form" class="pw-input-box">
                        <label id="ly-password-label" for="ly_password"><span>비밀번호</span></label>
                        <input type="password" name="password" id="ly_password" value="">
                    </div>
                    <button type="submit" class="btn-login"><span>로그인</span></button>
                </div>
                <p class="signup-forgotten">
                                        <a href="/zf_user/member/registration/join?ut=c" target="_blank" class="sign-up">회원가입</a>
                    <span></span>
                    <a href="/zf_user/helpdesk/idpw-find" target="_blank" class="forgotten">아이디/비밀번호 찾기</a>
                </p>
                            </fieldset>
        </form>
                    <p class="txt_mail">※ 아이디/ 비밀번호 찾기가 어려우시다면 이메일 문의를 이용해주세요.<br>사람인 고객센터에서 친절하고 빠르게 도와드리겠습니다. <a
                        href="http://www.saramin.co.kr/zf_user/help/inquery" target="_blank" class="btn_mail">이메일 문의</a></p>
                <button class="pop_login_layer_close" id="pop_login_layer_close">닫기</button>
    </div>
    <script type="text/javascript">

        var getId = (function () {
            var elCache = {};
            return function (id) {
                if (!elCache[id]) {
                    elCache[id] = document.getElementById(id);
                }
                return elCache[id];
            }
        })();

        var page_url = 'L3pmX3VzZXIvdGFsZW50L3NlYXJjaA==';
        var autoLoginCheck = getId('pop_login_layer').querySelector('form').ly_autologin;

        function addEvent(ele, eventType, func) {
            var obj = typeof ele === 'string' ? getId(ele) : ele;
            if (obj.addEventListener) {
                obj.addEventListener(eventType, func, false);
            } else if (obj.attachEvent) {//IE
                obj.attachEvent('on' + eventType, func);
            }
        }

        //아이디
        addEvent("ly_id", "focus", function () {
            getId('ly-id-label').style.display = 'none';
        });
        addEvent("ly_id", "blur", function () {
            if (getId('ly_id').value === '') {
                getId('ly-id-label').style.display = 'block';
            }
        });

        //패스워드
        addEvent("ly_password", "focus", function () {
            getId('ly-password-label').style.display = 'none';
        });
        addEvent("ly_password", "blur", function () {
            if (getId('ly_password').value === '') {
                getId('ly-password-label').style.display = 'block';
            }
        });

        //창닫기
        addEvent("pop_login_layer_close", "click", function () {
            getId('page_url').value = page_url;
            getId('pop_login_layer').style.display = 'none';
            getId('pop_login_layer_dimmed').style.display = 'none';
        });

        //로그인 유지 창닫기
        addEvent("auto_login_close", "click", function () {
            getId('tooltip_autologin').style.display = 'none';
        });


        //로그인 유지 안내 팝업
        addEvent(autoLoginCheck, 'click', function () {
            getId('tooltip_autologin').style.display = autoLoginCheck.checked ? 'block' : 'none';
        });

        //폼  체크
        function loginCheckMainLayer(form) {
            if (form.id.value === "") {
                alert("아이디를 입력하세요.");
                form.id.focus();
                return false;
            }
            if (form.id.value.indexOf(" ") > 0) {
                alert("아이디에 공백에 있습니다. 공백을 제거해주세요");
                form.id.focus();
                return false;
            }
            if (form.id.value.length < 4) {
                alert("아이디는 4자이상이어야 합니다");
                form.id.focus();
                return false;
            }
            if (form.password.value === "") {
                alert("비밀번호를 입력하세요");
                form.password.focus();
                return false;
            }
            if (form.password.value.length < 4 || form.password.value.length > 32) {
                alert("비밀번호는 영문,숫자,특수문자 조합 6~32자 입니다.");
                form.password.focus();
                return false;
            }
            return true;
        }

        //페이지 로딩시 초기화 시켜 준다.
        setTimeout(function () {
            var idInPut = getId('ly_id');
            var pwInput = getId('ly_password');
            if (!getId('ly_id').value) {
                idInPut.value = '';
                idInPut.blur();
            }
            pwInput.value = '';
            pwInput.blur();
        }, 50);
    </script>
</div>
<script type="text/javascript" src="/js/libs/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/js/libs/saramin/dataStore/polyfill.js?v=20190718_3"></script>
<script type="text/javascript">
    //<!--
    jQuery.noConflict();    //-->
</script>
<script type="text/javascript">
    //<!--
    
    var gnbNotifToggleCompany = function () {
        return;        if (window.jQuery) {
            jQuery('#alarm-center-layer').toggle();
        } else {
            $('alarm-center-layer').toggle();
        }
    };

    (function ($) {
        // $('.btn_modify_ci, .corp_ci > .btn_ci').on('click', function() {
        //     var mcom_idx = $(this).data('mcom_idx');
        //     window.open('/zf_user/company-photo/logo-insert-pop?mcom_idx=' + mcom_idx,'upload_logo','top=20,left=20,width=502,height=328,scrollbars=yes,resizable=no');
        //     return false;
        // });

        // gnb on 처리
        var $gnbItems = $('.sri_gnb_wrap_menu').find('li.depth'),
            pathname = location.pathname || '';
        if (!!pathname) {
            if (pathname === '/zf_user/mandb/view') {
                pathname = '/zf_user/talent/search';
            } else if (pathname === '/zf_user/memcom/talent-manage/send-sms-email-history'
                && location.search.indexOf('top_menu_cd=recruit-manage') !== -1) {
                pathname = '/zf_user/memcom/talent-manage/send-sms-email-history?top_menu_cd=recruit-manage';
            } else if (pathname === '/zf_user/service/company/order'
                && location.search.indexOf('part_id=talent_search') !== -1) {
                pathname = "/zf_user/service/company/order?part_id=talent_search";
            } else if ( pathname ==='/zf_user/memcom/service-guide/siat') {
                pathname = "/zf_user/memcom/siat/exam-list";
            }
        }
        $gnbItems.each(function(idx, item) {
            $(item).find('a').not('._skip').each(function (i, el) {
                if ($(el).attr('href') === pathname) {
                    $(item).addClass('on');
                    return false;
                }
            });

        });
    })(jQuery);

        //-->
</script><script type="text/javascript">
(function() {
  var pszProto = (("https:" == document.location.protocol) ? "https://www.saramin.co.kr/js/" : "//www.saraminimage.co.kr/js/");
  document.write(unescape("%3Cscript src='" + pszProto + "wl6.js' type='text/javascript'%3E%3C/script%3E"));
})();
</script>

<script type="text/javascript">
_n_sid = "saramin";
_n_uid_cookie = "UID";
_n_info1_cookie = "Mtype";
n_logging();
</script>

<script defer src="/js/analy_log/facebook-pixel.js?v=20190718_3"></script>

<script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
<script type="text/javascript">
    var kakaoPixelTrackId = '8734097409955314210';

    kakaoPixelEvent('pageView', '구인사');

    function kakaoPixelEvent(event, tag)
    {
        if (typeof kakaoPixel === 'undefined') {
            return;
        }

        event = event.toLowerCase();
        tag = tag || null;

        switch (event) {
            case 'pageview': // 방문
                kakaoPixel(kakaoPixelTrackId).pageView(tag);
                break;
            case 'completeregistration': // 가입완료
                kakaoPixel(kakaoPixelTrackId).completeRegistration(tag);
                break;
            case 'search': // 검색
                kakaoPixel(kakaoPixelTrackId).search(tag);
                break;
            case 'viewcontent': // 콘텐츠/상품 조회
                kakaoPixel(kakaoPixelTrackId).viewContent(tag);
                break;
            case 'viewcart': // 장바구니 보기
                kakaoPixel(kakaoPixelTrackId).viewCart(tag);
                break;
            case 'purchase': // 구매
                kakaoPixel(kakaoPixelTrackId).purchase(tag);
                break;
        }
    }

    // event binding
    (function($) {
        // PC 공고 등록 완료 버튼
        $('#btnBottomComplete').on('click', function() {
            kakaoPixelEvent('completeRegistration', '공고등록완료');
        });

        // MW 공고 등록 완료 버튼
        $('.divStep').find('#btnSave').on('click', function() {
            kakaoPixelEvent('completeRegistration', '공고등록완료');
        });

        // PC 채용공고 상품 > 결제 버튼
        // PC 인재열람 상품 > 결제 버튼
        // SIAT도 마크업을 동일하지만 URL 패턴으로 해당 페이지 로드 자체를 안함
        $('.wrap_final_payment').find('#payment_btn, #oneclick_payment_btn').on('click', function() {
            kakaoPixelEvent('purchase', '결제완료');
        });

        // PC 채용광고 신청문의 > 신청문의 버튼
        $('.btn_typ_a3.btn_contact_us').on('click', function() {
            kakaoPixelEvent('purchase', '결제완료');
        })
    })(jQuery);
</script><script type="text/javascript">

	function n_trackEvent(category, action, opt_label, opt_value, opt_noninteraction) {
	    var l = document.location;
	    var url = l.protocol + '//' + l.host + '/trackEvent?category=' + category + '&action=' + action;
	    var label = opt_label || '';
	    var value = opt_value || '';
	    url = url + '&opt_label=' + label + '&opt_value=' + value;
	    n_click_logging(url, l.href);
	    try {
	        _gaq.push(['_trackEvent', category, action, opt_label, opt_value, opt_noninteraction]);
	        ga('send', 'event', category, action, opt_label, opt_value, opt_noninteraction);
	    } catch (_e) {}
	}

	function n_trackBanner(url, category, action, opt_label, opt_value, opt_noninteraction) {
		var redirectUrl = 'http://ads.saramin.co.kr/checkpage.php?url=' + encodeURIComponent(url);
	    n_trackEvent(category, action, opt_label, opt_value, opt_noninteraction);
	    window.open(redirectUrl);
	}

	function _hwaClick(cc) {
		n_trackEvent('ADs', 'Click-' + cc);
	}

    // 플래시 배너 클릭수 체크를 위한 함수 - @deprecated Since 2013-1-01-10
    function adsClick(cc, url) {
        var redirectUrl = 'http://ads.saramin.co.kr/checkpage.php?url=' + encodeURIComponent(url);
	    _hwaClick(cc);
	    window.open(redirectUrl);
    }

    function applyTrackEvent(el, opt_category, opt_content, opt_ref, opt_ref_content) {

        try {
            var url         = el.href;
            var category    = opt_category || '';
            var content     = opt_content || '';
            var ref         = opt_ref || '';
            var ref_content = opt_ref_content || '';
            var anchor      = '';

            if ( url.indexOf('#') != -1 ) {
                var splitUrl = url.split('#');
                url = splitUrl[0];
                anchor = splitUrl[1];
            }

            if( url.indexOf('?') < 0 ) {
                url = url + '?t_category=' + category + '&t_content=' + content + '&t_ref=' + ref + '&t_ref_content=' + ref_content;
            } else {
                url = url + '&t_category=' + category + '&t_content=' + content + '&t_ref=' + ref + '&t_ref_content=' + ref_content;
            }

            if ( anchor != '' ) {
                url += '#' + anchor;
            }

            el.href = url;
        } catch (e) {
        }
    }

    function s_trackApply(el, opt_ref, opt_ref_content, opt_ref_scnid, opt_ref_area, opt_etc) {

        try {
            var url         = el.href;
            var ref         = opt_ref || '';
            var ref_content = opt_ref_content || '';
            var ref_scnid   = opt_ref_scnid || '';
            var ref_area   = opt_ref_area || '';
            var anchor      = '';

            var opt = opt_etc || {};

            if( url.indexOf('t_ref') > 0 ) return;

            if ( url.indexOf('#') != -1 ) {
                var splitUrl = url.split('#');
                url = splitUrl[0];
                anchor = splitUrl[1];
            }

            if( url.indexOf('?') < 0 ) {
                url = url + '?t_ref=' + ref + '&t_ref_content=' + ref_content;
            } else {
                url = url + '&t_ref=' + ref + '&t_ref_content=' + ref_content;
            }

            if (!!ref_scnid) {
				url += '&t_ref_scnid=' + ref_scnid;
            }

            if (!!ref_area) {
				url += '&t_ref_area=' + ref_area;
            }

            if ( anchor != '' ) {
                url += '#' + anchor;
            }

            if (opt.constructor === Object) {
                for (k in opt) {
                    if (opt.hasOwnProperty(k)) {
                        url += '&' + k + '=' + opt[k];
                    }
                }
            }

            el.href = url;

        } catch (e) {
        }
    }
</script>


<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
 
<script type="text/javascript"> 
if (!wcs_add) var wcs_add={};
wcs_add["wa"] = "s_1d3a45fb0bfe";
if (!_nasa) var _nasa={};
wcs.inflow();
wcs_do(_nasa);
</script> 
<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
        new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
        j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
        'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
    })(window,document,'script','dataLayer','GTM-MK2GBBH');</script>
<!-- End Google Tag Manager -->
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-MK2GBBH"
                  height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->


<script>
if(!window.n_trackEvent) {
    window.n_trackEvent = function(){};
}
</script>
<script type="text/javascript">window.NREUM||(NREUM={});NREUM.info={"beacon":"bam.nr-data.net","licenseKey":"b228c47339","applicationID":"3121540","transactionName":"YQAHYBRUV0pWARANWVhKJFcSXFZXGBYFCFNYEUpHA1RLWl9NDQpSUx0=","queueTime":0,"applicationTime":713,"atts":"TUcEFlxOREQ=","errorBeacon":"bam.nr-data.net","agent":""}</script></body>
</html>