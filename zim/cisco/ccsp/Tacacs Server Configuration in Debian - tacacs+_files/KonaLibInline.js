window.KONA_VERSION||(window.KONA_VERSION="2015_09_07");if(window.parent!==window&&!window.dc_Frames)try{window.parent.location.href!==window.location.href&&(window.konaBeenHere=!0)}catch(e$$8){window.konaBeenHere=!0}
if(!0!==window.konaBeenHere){window.konaBeenHere=!0;var konaGetTime=function(){return(new Date).getTime()},konaStartTime=konaGetTime(),KONTERA_INTERFACE={};(function(){function b(){if(!e){if(!document.body)return setTimeout(b,13);e=true;for(var a=0;a<f.length;a=a+1)f[a].call(document)}}function a(){if(!e){try{document.documentElement.doScroll("left")}catch(c){setTimeout(a,1);return}b()}}var c=false,d,e=false,f=[];document.addEventListener?d=function(){document.removeEventListener("DOMContentLoaded",
d,false);b()}:document.attachEvent&&(d=function(){if(document.readyState==="complete"){document.detachEvent("onreadystatechange",d);b()}});KONTERA_INTERFACE.ready=function(g){if(!c){c=true;if(document.readyState==="complete")b();else if(document.addEventListener){document.addEventListener("DOMContentLoaded",d,false);window.addEventListener("load",b,false)}else if(document.attachEvent){document.attachEvent("onreadystatechange",d);window.attachEvent("onload",b);var h=false;try{h=window.frameElement===
null}catch(k){}document.documentElement.doScroll&&h&&a()}}e?g.call(document):f&&f.push(g)}})();KONTERA_INTERFACE.getReporterUrl=function(){return function(b){return b.indexOf("?")>0?b:b+"?"}(function(){var b=KONTERA_INTERFACE.reactionResponse?KONTERA_INTERFACE.reactionResponse.reporterUrl:void 0;return b?b:"http://kona33.kontera.com/KonaReport.js?rId=dummy&p="+window.dc_PublisherID}())};KONTERA_INTERFACE.getReporterParams=function(){return KONTERA_INTERFACE.urlToJson(KONTERA_INTERFACE.getReporterUrl())};
var isWindows=function(){return navigator.userAgent.indexOf("Windows")!==-1?true:false},isMac=function(){return navigator.userAgent.indexOf("Mac")!==-1?true:false},getQueryVariable=function(b){for(var a="",c=null,d=window.location.search.substring(1).split("&"),e=0;e<d.length;e=e+1){c=d[e].split("=");c[0]===b&&(a=c[1])}return a},kona$=function(b){return document.getElementById(b)},exploreDomainName=function(){var b=konaThisURL.toLowerCase(),a="";if(b.indexOf("http://www")===0||b.indexOf("https://www")===
0){a=b.indexOf("http://www")+11;a=b.substring(a,b.length);a.indexOf("/")>-1&&(a=a.substring(0,a.indexOf("/")))}else if(b.indexOf("http://")===0||b.indexOf("https://")===0){for(var a=b.indexOf("http://")+7,a=b.substring(a,b.length),c=0,d=0;d<a.length;d=d+1)a.charAt(d)==="."&&(c=c+1);c>1&&(a=a.substring(a.indexOf(".")+1,a.length));a.indexOf("/")>-1&&(a=a.substring(0,a.indexOf("/")))}else if(b.indexOf("/")>-1){a=b.indexOf("/");a=b.substring(0,a)}a.length<=4&&(a=b);return a},isInArray=function(b,a){for(var c=
0;c<b.length;c=c+1)if(b[c]===a)return true;return false},KonaHash=function(){this.length=0;this.items=[];for(var b=0;b<arguments.length;b=b+2)if(typeof arguments[b+1]!=="undefined"){this.items[arguments[b]]=arguments[b+1];this.length=this.length+1}this.removeItem=function(a){var b;if(typeof this.items[a]!=="undefined"){this.length=this.length-1;b=this.items[a];delete this.items[a]}return b};this.getItem=function(a){return this.items[a]};this.setItem=function(a,b){if(typeof b!=="undefined"){if(typeof this.items[a]===
"undefined")this.length=this.length+1;this.items[a]=b}return b};this.hasItem=function(a){return typeof this.items[a]!=="undefined"}},readCookie=function(b){for(var a=document.cookie.split("; "),c=0;c<a.length;c=c+1){var d=a[c].split("=");if(b===d[0])return unescape(d[1])}return null},createKonaCookie=function(b,a,c){var d="";if(c){d=new Date;d.setTime(d.getTime()+c*864E5);d="; expires="+d.toGMTString()}document.cookie=b+"="+a+d+"; path=/"},eraseKonaCookie=function(b){createKonaCookie(b,"",-1)},getFlashFullVersion=
function(){var b="?";if(navigator.plugins&&navigator.mimeTypes.length){var a=navigator.plugins["Shockwave Flash"];if(a&&a.description)return a.description}else{try{a=new ActiveXObject("ShockwaveFlash.ShockwaveFlash.7")}catch(c){try{a=new ActiveXObject("ShockwaveFlash.ShockwaveFlash.6");b=[6,0,21];a.AllowScriptAccess="always"}catch(d){if(b[0]===6)return b}try{a=new ActiveXObject("ShockwaveFlash.ShockwaveFlash")}catch(e){}}if(a&&a.GetVariable("$version"))return a.GetVariable("$version")}return b},getFlashVersion=
function(){var b=[0,0,0];if(navigator.plugins&&navigator.mimeTypes.length){var a=navigator.plugins["Shockwave Flash"];a&&a.description&&(b=a.description.replace(/([a-zA-Z]|\s)+/,"").replace(/(\s+r|\s+b[0-9]+)/,".").split("."))}else{try{a=new ActiveXObject("ShockwaveFlash.ShockwaveFlash.7")}catch(c){try{a=new ActiveXObject("ShockwaveFlash.ShockwaveFlash.6");b=[6,0,21];a.AllowScriptAccess="always"}catch(d){if(b[0]===6)return b}try{a=new ActiveXObject("ShockwaveFlash.ShockwaveFlash")}catch(e){}}a&&(b=
a.GetVariable("$version").split(" ")[1].split(","))}return b},checkFlashSupport=function(){if(getFlashVersion()[0]>=8&&!KONTERA_INTERFACE.isMobile)window.hasRMFlashSupport=true},checkFlashSupportForHybrid=function(){return getFlashVersion()[0]>=9?true:false},konaStartTime=(new Date).getTime(),konaPageLoadMeasureReport={};KONTERA_INTERFACE.ready(function(){konaPageLoadMeasureReport.pr=(new Date).getTime()-konaStartTime});var TWEAK_MODE_DEFAULT=0,konaTweakMode=TWEAK_MODE_DEFAULT;KONTERA_INTERFACE.replaceStringWith=
function(b,a,c){return b.replace(RegExp(a,"gi"),c)};KONTERA_INTERFACE.trace=function(){typeof window.console!=="undefined"&&typeof window.console.log==="function"&&window.console.log.apply(window.console,arguments)};var konalogMode=!1,isKonaFirst=!1;"undefined"===typeof window.konaSuffix&&(window.konaSuffix="?00000000482",isKonaFirst=!0);KONTERA_INTERFACE.isMobile=navigator.userAgent.match(/Windows Phone|Android|iPhone|iPad|J2ME|Symbian|BlackBerry|sonyericsson|nokia|Windows CE|Opera Mini/i)||document.location.search.match(/(kona_iphone|kona_android)=1/)||
document.location.search.match(/kona_platform=(ios|android)/);(function(){if(window.KONA_PREV_VERSION){var b=KONTERA_INTERFACE.isMobile?50:90;window.konaAB_JSVersion=window.konaAB_JSVersion||b;Math.random()*100<window.konaAB_JSVersion?KONA_VERSION=KONA_PREV_VERSION:konaTweakMode=konaTweakMode|4}getQueryVariable("konadir")&&(KONA_VERSION=getQueryVariable("konadir"))})();var konaDate="24_03_2010",bOpera=-1!==navigator.userAgent.toLowerCase().indexOf("opera"),bAvant=-1!==navigator.userAgent.toLowerCase().indexOf("avant"),
bIE=!bOpera&&-1!==navigator.appName.indexOf("Microsoft"),bIE6=bIE&&6===navigator.userAgent.charAt(30),bIE8=bIE&&-1!==navigator.userAgent.indexOf("MSIE 8"),bIE9=bIE&&-1!==navigator.userAgent.indexOf("MSIE 9"),bIE10=bIE&&-1!==navigator.userAgent.indexOf("MSIE 10"),bIE11,bChrome=-1!==navigator.userAgent.toLowerCase().indexOf("chrome"),bFlock=-1!==navigator.userAgent.toLowerCase().indexOf("flock"),bSafari=-1!==navigator.userAgent.toLowerCase().indexOf("safari"),bMozilla=!bOpera&&!bIE&&!bSafari&&!bFlock,
bFireFox2=bMozilla&&-1!==navigator.userAgent.indexOf("Firefox/2"),bFireFox3=bMozilla&&-1!==navigator.userAgent.indexOf("Firefox/3"),bUnknown=!bMozilla&&!bFireFox2&&!bFireFox3,isIE11=function(){bIE||(bIE11=bIE=navigator.appName==="Netscape"&&/Trident\/.*rv:([0-9]{1,}[\.0-9]{0,})/.exec(navigator.userAgent)!==null)};isIE11();"undefined"===typeof window.HTTP_KONA&&(window.HTTP_KONA="http://kona.kontera.com");if("undefined"===typeof window.HTTP_KONAC||window.HTTP_KONAC)window.HTTP_KONAC="http://kona.kontera.com";
var HTTP_KONAX="http://konax.kontera.com",HTTP_IMAGES="http://images.kontera.com";"https:"===window.location.protocol&&(HTTP_IMAGES=HTTP_KONAC=HTTP_KONA="https://secure-js.kontera.com");getQueryVariable("konaip")&&(HTTP_KONA="http://"+getQueryVariable("konaip"),HTTP_KONAC="http://"+getQueryVariable("konaip"));var HTTP_KONTERA_BASE=HTTP_KONA,konaUserID="",konaSessionID="",konaBaseHere=!1,konaRetry=300,delayJSFlowBY=-1,isNewLayer=!1,isBritannicaFF3=bFireFox3,problematicAdverisers=[];KONTERA_INTERFACE.write||
(KONTERA_INTERFACE.write=function(b){document.write(b)});"undefined"===typeof window.dc_flowMode&&(window.dc_flowMode=0);window.location.search.match("konaflow")&&(window.dc_flowMode=parseInt(getQueryVariable("konaflow"),10));"undefined"===typeof window.dc_flowByCommand&&(dc_flowByCommand=!1);if(1===window.dc_flowMode||3===window.dc_flowMode)"undefined"===typeof window.dc_startInterval?window.dc_startInterval=0:window.delayJSFlowBY=window.dc_startInterval;var isDynamicContent;if(2===window.dc_flowMode||
4===window.dc_flowMode)isDynamicContent=!0;3===window.dc_flowMode&&(dc_flowByCommand=!0);var konaHCdemo=-1,konaThisURL=window.location.toString(),isRestrictedUrl=!1,konaHCdemoUrls=new KonaHash("http://www.mensfitness.com/nutrition/vitamins/194",0,"http://www.mensfitness.com/sports_and_recreation/outdoor_recreation/55",1,"http://www.mensfitness.com/Tshirt_Workout/fitness/ab_exercises/136?cid=RSS",2,"http://www.shape.com/workouts/articles/workout_schedule.html",3,"http://www.shape.com/workouts/articles/blood_sugar.html",
4,"http://www.huffingtonpost.com/2008/11/16/paul-mccartney-hopes-to-r_n_144138.html",5);konaHCdemoUrls.hasItem(konaThisURL)&&(konaHCdemo=konaHCdemoUrls.getItem(konaThisURL));var konaHCdemoUrls=null,hybridGroup=new KonaHash(7792,1,10747,1,47839,1,52730,1,32100,1,38144,1,64727,1,70447,1,70448,1,73310,1);hybridGroup.hasItem(dc_PublisherID)&&32100!==dc_PublisherID&&(7792!==dc_PublisherID&&10747!==dc_PublisherID)&&(konaTweakMode|=32768);var dynamicContentPubs=[50635,50201,50629,50630];isDynamicContent|=
isInArray(dynamicContentPubs,dc_PublisherID);var isForcedDynamicContent=!1,forcedDynamicContentPubs=new KonaHash(104880,bIE);forcedDynamicContentPubs.hasItem(dc_PublisherID)&&(isForcedDynamicContent=forcedDynamicContentPubs.getItem(dc_PublisherID));if(48817===dc_PublisherID)for(var restrictedUrlGroup="http://it.toolbox.com/blogs/ppmtoday http://it.toolbox.com/blogs/db2luw http://it.toolbox.com/blogs/db2zos http://it.toolbox.com/blogs/elsua http://it.toolbox.com/blogs/database-talk http://it.toolbox.com/blogs/penguinista-databasiensis http://it.toolbox.com/blogs/juice-analytics http://it.toolbox.com/blogs/minimalit http://it.toolbox.com/blogs/database-soup http://blogs.ittoolbox.com/pm/ppm".split(" "),
j=0;j<restrictedUrlGroup.length;j+=1)if(-1!==konaThisURL.toLowerCase().indexOf(restrictedUrlGroup[j].toLowerCase())){isRestrictedUrl=!0;break}var konaHCdelayPagesUrls=["http://autospies.com/","http://autospies.com/news/recent.aspx"],adPreviewMode=!1;if("undefined"!==typeof window.dc_adPreview||"undefined"!==typeof window.dc_standAloneMode)adPreviewMode=!0;var nladPreviewMode=!1;"undefined"!==typeof window.dc_nladPreview&&(nladPreviewMode=!0);var delayPageKeyPubs=[50517,73384,58050,85192,14429,23724,
4130,14541,32528,7611,6682,8192,35725,8079,5278,4566,52987,12854,4213,40109,61456,76947,38115,52417,21401,48820,35061,7834,52993,50537,7795,73386,64532,29104,35267,50538,47547,36981,7283,15304,7121,72598,50375,6912,73395,32101,58816,64381,92562,144527,141351,141350,155821,58109,161007,161008,161009,161010,161011,161012,161013,161014,161015,161016,159088,167686,186783,187350,192506,195798,196319,191434,191137,187350,188147,188075,209905],handlePageKey=function(){return isInArray(delayPageKeyPubs,dc_PublisherID)||
isInArray(konaHCdelayPagesUrls,konaThisURL)||window.dc_flowMode===3?true:false},isDelayPageKey=handlePageKey(),sName="KonaBase.js";KONTERA_INTERFACE.isKonaFlashBaseNeeded="1"===getQueryVariable("kona_flash");KONTERA_INTERFACE.isHtml5Needed=("1"===getQueryVariable("kona_html5")||!bIE8&&!bIE9)&&!KONTERA_INTERFACE.isKonaFlashBaseNeeded&&!window.konaForceNewLayer&&!KONTERA_INTERFACE.isMobile;var userInteractionBaseJs;userInteractionBaseJs=KONTERA_INTERFACE.isMobile?"KonaMobile.js":"KonaFlashBase.js";
KONTERA_INTERFACE.isHtml5Needed&&(sName=userInteractionBaseJs="KonaHtml5.js");var newLayerGroupTailoring=!1,newLayerPublishersArray=[50198,70028,71869,71881,96216,74998,48414,100478,100480],konaNonSupportedPlatform=!1;if(140070===dc_PublisherID||140073===dc_PublisherID)konaNonSupportedPlatform=!0;!KONTERA_INTERFACE.isMobile&&!0===window.dc_MobileOnly&&(konaNonSupportedPlatform=!0);KONTERA_INTERFACE.isRelatedDemo="1"===getQueryVariable("kona_related");if(isInArray(newLayerPublishersArray,dc_PublisherID))var basePublisherPath=
HTTP_KONA+"/javascript/lib/"+KONA_VERSION+"/flash/publishers_design/"+dc_PublisherID+"/",isNewLayer=newLayerGroupTailoring=!0,sName="KonaInfra.js";else{var isUserInteractionLayer;window.konaForceNewLayer?isUserInteractionLayer=!0:getQueryVariable("konanl")?isUserInteractionLayer="1"===getQueryVariable("konanl"):!checkFlashSupportForHybrid()&&!KONTERA_INTERFACE.isMobile?(isUserInteractionLayer=!1,window.hasRMFlashSupport=!1):isUserInteractionLayer=!0}isUserInteractionLayer&&(newLayerGroupTailoring=
isNewLayer=!1,sName=userInteractionBaseJs,konaTweakMode|=Math.pow(2,16));var isHybridForLinuxFlag=!1;if(hybridGroup.hasItem(dc_PublisherID)&&(0<(konaTweakMode&18432)||0<(konaTweakMode&32768))&&checkFlashSupportForHybrid())isHybridForLinuxFlag=!0,sName="FlashKonaLibBaseRM.js";adPreviewMode&&(sName="KonaBase.js");var isCalledKonaBase=!1;String.format=function(){if(arguments.length===0)return null;for(var b=arguments[0],a=1;a<arguments.length;a=a+1)b=b.replace(RegExp("\\{"+(a-1)+"\\}","gm"),arguments[a]);
return b};var tryToTraceRounds=5,trace=function(b){if(typeof jsTrace!=="undefined")jsTrace.send(b);else{tryToTraceRounds=tryToTraceRounds-1;tryToTraceRounds>0?setTimeout("trace('"+b+"')",500):tryToTraceRounds=null}},logit=function(b){trace(b)},KonaJSfiles=[],scriptTagId=function(){var b="";dc_PublisherID===503&&bIE6&&(b="ID='catfish-wrap'");return b},startDynamicContentFlow=function(b){if(!(window.dc_flowMode===0||window.dc_flowMode===1)){if(window.dc_flowMode!==3){delayJSFlowBY=3E3;isDynamicContent=
true;if(!isCalledKonaBase){isCalledKonaBase=true;for(var a,c=0;c<KonaJSfiles.length;c=c+1){a=document.createElement("script");a.type="text/javascript";a.src=KonaJSfiles[c];document.getElementsByTagName("head")[0].appendChild(a)}}}if(typeof konaBaseHere!=="undefined")if(konaBaseHere){checkDoRunOnPage();if(window.dc_flowMode===2){$JK.isReady=true;$JK(function(){})}dcInit(b)}else{konaRetry=konaRetry-1;konaRetry>0&&setTimeout(function(){startDynamicContentFlow()},75)}}};if(!konaNonSupportedPlatform&&
(isNewLayer&&(KonaJSfiles[KonaJSfiles.length]=basePublisherPath+"designParams.js"+konaSuffix),KonaJSfiles[KonaJSfiles.length]=HTTP_KONTERA_BASE+"/javascript/lib/"+KONA_VERSION+"/"+sName,"undefined"!==typeof dc_PublisherID)){var scriptTags="",disableKontera=readCookie("KonteraContentLink"),disableInfra=readCookie("disable_kontera"),tagID=scriptTagId();if(!isRestrictedUrl&&!(isHybridForLinuxFlag&&!isWindows()&&!isMac()||!checkFlashSupportForHybrid()&&hybridGroup.hasItem(dc_PublisherID)||disableKontera||
disableInfra||73310===dc_PublisherID||isDynamicContent||!isKonaFirst)){if(!window.document||!window.document.body)KonaJSfiles=[KONTERA_INTERFACE.getReporterUrl()+'&MQKey=Errors&ReportData={"JSVersion":"'+KONA_VERSION+'","url":"'+escape(window.location)+'","errorType":"badtag"}&r='+Math.floor(1001*Math.random())];for(var i=0;i<KonaJSfiles.length;i+=1)scriptTags="<SCRIPT LANGUAGE='JavaScript' "+tagID+" SRC='"+KonaJSfiles[i]+"'><\/SCRIPT>",KONTERA_INTERFACE.write(scriptTags)}hybridGroup=null;4===window.dc_flowMode&&
KONTERA_INTERFACE.ready(startDynamicContentFlow)}};
