<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../resource/css/style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="/Js/jquery-1.6.2.min.js"></script>
<script language="Javascript" src="/Js/jquery-ui-1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet" media="all" type="text/css" href="/Js/jquery-ui-1.11.4/jquery-ui.min.css" />

<script type="text/javascript">
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
</script>

<title>Insert title here</title>
</head>
<body>

<br>

<!--펜션정보시작 -------------------------------------------------------------------->
			<SCRIPT LANGUAGE="JavaScript">
			<!--
			function goHelf()
			{
				//alert(opener.parent);
				opener.location.href='/community/tobe_help_list.asp';
				self.close();
			}
			function ViewPension(val)
			{
				var f = document.Pension;
				if(val=="After")
				{
					f.pKind.value=val;
					f.target="_self";
					f.action="p_board.asp";
					f.submit();
				}else{
					if (f.pageName.value=="woori_m.asp")
					{
						parr = val.split("/");
						window-location('#'+parr[1]);
						switch (parr[0])
						{
							case "Info" : changeDiv(1,1); break;
							case "Room" : changeIframe(2,''); break;
							case "Budae" : changeDiv(1,2); break;
							case "Rule" : changeDiv(1,5); break;
							case "Jido" : changeDiv(1,3); break;
						}
					}else{
						parr = val.split("/");
						f.pKind.value=parr[1];
						switch (parr[0])
						{
							case "Info" : f.pKind2.value="1"; break;
							case "Room" : f.pKind2.value="2"; break;
							case "Budae" : f.pKind2.value="2"; break;
							case "Rule" : f.pKind2.value="5"; break;
							case "Jido" : f.pKind2.value="3"; break;
						}
						f.room_code.value="";
						f.target="_self";
						f.action="woori_m.asp#"+parr[1];
						f.submit();
					}
				}
			}

			function changeIframe(val,rcode)
			{
				var f = document.Pension;
				if (Browser.ie || Browser.ie6 || Browser.ie7 || Browser.ie8)
				{
					window-location('#1');
				}
				for (i=1;i<=4;i++)
				{
					if (document.getElementById("IframeTitle"+i).src.indexOf("new_tit4_2.gif")==-1)
					{
						document.getElementById("IframeTitle"+i).src="images/new_tit"+i+".gif";
					}
				}
				f.pKind.value=val;
				document.getElementById("IframeTitle"+val).src="images/new_tit"+val+"_1.gif";
				f.target = "PensionPhoto";
				if(val==2)
					f.action="./inc/room.asp?room_code="+rcode;
				else if(val==4)
					f.action="./inc/layout.asp";
				else
					f.action="./inc/pension.asp";
				f.submit();
			}

			function changeDiv(val1,val2)
			{
				if(val1=="1")
				{
					document.getElementById("tableTitle").src="images/into_title"+val2+".gif";
					for(i=1;i<=5;i++)
					{
						document.getElementById("tbl"+i).style.display="none";
					}
					document.getElementById("tbl"+val2).style.display="";
					if (val2==4)
					{
						if(document.getElementById("TourPhoto") != undefined)
							iframeSize('TourPhoto');
					}
				}else{
					document.getElementById("boardTitle1").src="images/bd_title"+val2+".gif";
					for(i=1;i<=4;i++)
					{
						document.getElementById("btbl"+i).style.display="none";
					}
					document.getElementById("btbl"+val2).style.display="";
				}
			}

			function ReservePension(room_code){
				var f = document.Pension;
				f.room_code.value=room_code;
				f.target="_self";
				f.action="reserve_step2.asp";
				f.submit();
			}

			function ViewPrint() {
				var f = document.Pension;
				OpenWin(580,700,"Print","/pension/photo_list_view.asp?pension_code="+f.pension_code.value,"YES",0,0);
			}

			function ViewPCalendar()
			{
				var f = document.Pension;
				OpenWin(520,200,"Calendar","all_calendar.asp?pension_code="+f.pension_code.value+"&goMonth="+f.goMonth.value+"#focus_taget","YES",0,0);
			}

			function ViewResort(idx) {
				OpenWin(567,300,"Resort","/pension/travel_view.asp?idx="+idx+"","YES",0,0);
			}

			function ViewPPicture(pcode,rcode,ptype)
			{
				OpenWin(820 ,680 ,"Picture","/pension/pop.asp?pension_code="+pcode+"&room_code="+rcode+"&p_type="+ptype,"YES",0,0);
			}
			function goUrgency2(){
				opener.location.href="/urgency2/tobe_woori_m.asp?pension_code=w0101183&u_seq=0&sidoCode=01&gugun_code=01";
				self.close();
			}
			//-->
			</SCRIPT>
			<form name="Pension" method="post">
			<input type="hidden" name="pension_code" value="w0101183">
			<input type="hidden" name="goMonth" value="">
			<input type="hidden" name="rsrm_date" value="">
			<input type="hidden" name="room_code" value="R07">
			<input type="hidden" name="pKind" value="">
			<input type="hidden" name="pKind2" value="">
			<input type="hidden" name="pageName" value="tobe_reserve_step2.asp">
			</form>


<script type="text/javascript">
    /*
    * Title   :
    * Comment :
    */
    function changeCheckbox(e) {
        $(e).parent().parent().find('td:first-child input:checkbox').prop('checked','checked');
    }

    /*
    * Title   : 인원 변경 시
    * Comment :
    */
    function chkUser(val, obj, pr_count, addFee, defaultPersonCount){
        // console.log('추가요금 : '+addFee);
        var f = document.reserve;
        var maxuser = 0;
        var cntuser = 0;
        // f val번째 selectbox.options[] 번째 이름안에 옵션[i번째이름].
        if(pr_count > 1){
            maxuser = f.rsrm_suse[val].options[f.rsrm_suse[val].options.length-1].value;
            cntuser = parseInt(f.rsrm_suse[val].value)+parseInt(f.rsrm_cuse[val].value)+parseInt(f.rsrm_buse[val].value);
        }else{
            maxuser = f.rsrm_suse.options[f.rsrm_suse.options.length-1].value;
            cntuser = parseInt(f.rsrm_suse.value)+parseInt(f.rsrm_cuse.value)+parseInt(f.rsrm_buse.value);
        }
        if (maxuser < cntuser){
            alert("예약가능한 최대인원을 초과하였습니다.\n\n(최대인원 : "+maxuser+"명)");
            obj.options.selectedIndex=0;
            //obj.reInitializeSelectBox();
        }else{
            if(addFee==0 && cntuser > defaultPersonCount && obj.value!=0) {
                alert("인원추가 요금은 펜션에서 직접 결제하시기 바랍니다.");
            }
            // 박수 변경 시
            GetRoomFee(val, pr_count, obj);
        }
    }

    /*
    * Title   : 예약버튼 클릭 시
    * Comment :
    */
    function reserve(pr_count){
        var f = document.reserve;
        var count = 0;
        var rsrm_term = 0;
        str = "--------------회원예약일 경우의 이점---------------\n"
            + "회원가입 후 이용하시면 우리펜션에서 사용하실 수 있는\n사이버머니 2%를 적립해 드립니다.\n"
            + "또한 우리펜션에서 제공되는 펜션정보나 기타 유요한\n정보를 받으실 수 있습니다.\n\n"
            + "    확인 : 비회원 예약하기, 취소 : 회원가입하러가기\n"
            + "--------------------------------------------------";
        if(f.pers_kind.value == "NON"){
            if(confirm(str) == false){
                go_join.target = opener.name;
                document.go_join.submit();
                this.close();
                return;
            }
        }
        for(var i = 0; i < pr_count; i++){
            if(pr_count > 1){
                if(f.rsrm_term[i].value == 0){rsrm_term = rsrm_term +1; }
            }else{
                if(f.rsrm_term.value == 0){
                    rsrm_term = rsrm_term +1;
                }
            }
        }
        if(rsrm_term == pr_count){
            alert('예약하실 방이 없습니다.');
            return;
        }
        for(var i=0;i<pr_count;i++){
            if(pr_count > 1){
                if(f.room_code[i].checked == true){
                    count = count +1;
                    maxuser = f.rsrm_suse[i].options[f.rsrm_suse[i].options.length-1].value;
                    cntuser = parseInt(f.rsrm_suse[i].value)+parseInt(f.rsrm_cuse[i].value)+parseInt(f.rsrm_buse[i].value);
                    if(cntuser==0){
                        alert('예약하실 인원을 선택해 주세요.');
                        return;
                    }
                    if (maxuser < cntuser){
                        alert("예약가능한 최대인원을 초과하였습니다.\n\n(최대인원 : "+maxuser+"명)");
                        return;
                    }
                }
            }else{
                if(f.room_code.checked == true){
                    count = count +1;
                    maxuser = f.rsrm_suse.options[f.rsrm_suse.options.length-1].value;
                    cntuser = parseInt(f.rsrm_suse.value)+parseInt(f.rsrm_cuse.value)+parseInt(f.rsrm_buse.value);
                    if(cntuser==0){
                        alert('예약하실 인원을 선택해 주세요.');
                        return;
                    }
                    if(maxuser < cntuser){
                        alert("예약가능한 최대인원을 초과하였습니다.\n\n(최대인원 : "+maxuser+"명)");
                        return;
                    }
                }
            }
        }
        if(count == 0){
            alert('예약하실 방이름을 골라주세요.');
            return;
        }
        f.action="/Pension/tobe_reserve_step2_save.asp";
        f.submit();
    }

    /*
    * Title   : 회원예약 버튼 클릭 시
    * Comment :
    */
    function log_check(){
        if(confirm("로그인 페이지로 이동하시겠습니까?")){
            var url = $(opener.window.location).attr("pathname");
            var params = window.location.search.substring(1);
            var retURL = url+"?"+params;

            $(opener.window.location).attr("href","/member/tobe_login.asp?gotourl="+retURL);
            self.close();
            return;
        };
        alert("로그인후에 사용하실 수 있는 메뉴입니다.");
        return;
    }

    /*
    * Title   : 방 체크버튼 클릭 시
    * Comment :
    */
    function chkRoom(val1, val2, pr_count){
        var f = document.reserve;
        if(val2){
            //
            GetRoomFee(val1, pr_count);
        }else{
            if(pr_count > 1){
                document.all.rmFeeStr[val1].innerHTML = "<b>-</b>";
                f.rsrm_tfee[val1].value = 0;
            }else{
                document.all.rmFeeStr.innerHTML = '-';
                f.rsrm_tfee.value = 0;
            }
            //
            chkFeeSum(pr_count);
        }
    }

    /*
    * Title   : 박수 변경 시
    * Comment :
    */
    function GetRoomFee(val, pr_count, obj){
        var f = document.reserve;
        if(pr_count>1){
            var rt = f.rsrm_tfee[val];
            var rts = document.all.rmFeeStr[val];

                r_code = f.room_code[val].value.split("/")[0];
                r_term = f.rsrm_term[val].value;
                r_suse = f.rsrm_suse[val].value;
                r_cuse = f.rsrm_cuse[val].value;
                r_buse = f.rsrm_buse[val].value;
        }else{
            var rt = f.rsrm_tfee;
            var rts = document.all.rmFeeStr;

                r_code = f.room_code.value.split("/")[0];
                r_term = f.rsrm_term.value;
                r_suse = f.rsrm_suse.value;
                r_cuse = f.rsrm_cuse.value;
                r_buse = f.rsrm_buse.value;
        }
        var URL     = "/Pension/roomfee.asp";
        var Parms   = "pension_code=" + f.pension_code.value
                    + "&room_code=" + escape(r_code)
                    + "&rsrm_date=" + f.rsrm_date.value
                    + "&rsrm_term=" + escape(r_term)
                    + "&rsrm_suse=" + escape(r_suse)
                    + "&rsrm_cuse=" + escape(r_cuse)
                    + "&rsrm_buse=" + escape(r_buse);
        URL += "?" + Parms;
        var message;
        var xmlHttp	= MakeHttpObject();
        xmlHttp.open("get", URL, false)
        xmlHttp.setRequestHeader('Content-Type','application/x-www-form-urlencoded; charset=UTF-8;')
        xmlHttp.onreadystatechange = function(){
            if(xmlHttp.readyState == 4){
                message = xmlHttp.responseText;
            }
        }
        xmlHttp.send();
        if(message.indexOf('>err') != -1){
            alert('오류가 발생했습니다. 개발자에게 문의해 주세요.');
            return;
        }
        rt.value = message;
        rts.innerHTML = "<b><font color='#000'>" + FormatComma(message) + "원</font></b>";
        // 금액 계산
        chkFeeSum(pr_count);
        //
        changeCheckbox(obj);
    }

    /*
    * Title   : 금액 계산
    * Comment :
    */
    function chkFeeSum(pr_count){
        var rfSum = 0;
        var f = document.reserve;
        if(pr_count > 1){
            for (i = 0; i  < pr_count; i++){
                rfSum += parseInt(f.rsrm_tfee[i].value);
            }
        }else{
            rfSum = parseInt(f.rsrm_tfee.value);
        }
        f.rese_tfee.value=rfSum;
        document.all.rvFeeStr.innerHTML = FormatComma(rfSum)+'원';
        rfSum += parseInt(f.rssv_rfee.value);
        document.all.FeeStr.innerHTML = FormatComma(rfSum)+'원';
    }

    /*
    * Title   : 체크박스 선택 시
    * Comment :
    */
    function chkSFeeSum(pr_count){
        var srfSum = 0;
        var spfSum = 0;
        var f = document.reserve;
        if(f.scnt.value == "1"){
            if(f.serv_idex.checked){
                f.rssv_tfee.value=parseInt(f.rssv_sfee.value)*parseInt(f.rssv_cunt.value);
                document.all.sFeeStr.innerHTML = FormatComma(f.rssv_tfee.value)+'원';
                if(f.rssv_atyp.value=="0"){
                    spfSum = parseInt(f.rssv_tfee.value);
                }else{
                    srfSum = parseInt(f.rssv_tfee.value);
                }
            }else{
                f.rssv_cunt.selectedIndex=0;
                f.rssv_tfee.value=0;
                document.all.sFeeStr.innerHTML = '0원';
            }
        }else{
            for(i=0;i<f.scnt.value;i++){
                if(f.serv_idex[i].checked){
                    f.rssv_tfee[i].value=parseInt(f.rssv_sfee[i].value)*parseInt(f.rssv_cunt[i].value);
                    document.all.sFeeStr[i].innerHTML = "<b><font color='#ff6633'>"+FormatComma(f.rssv_tfee[i].value)+"원</font></b>";
                    if(f.rssv_atyp[i].value=="0"){
                        spfSum += parseInt(f.rssv_tfee[i].value);
                    }else{
                        srfSum += parseInt(f.rssv_tfee[i].value);
                    }
                }else{
                    f.rssv_cunt[i].selectedIndex=0;
                    f.rssv_tfee[i].value=0;
                    document.all.sFeeStr[i].innerHTML = "0원";
                }
            }
        }
        f.rssv_rfee.value=srfSum;
        f.rssv_pfee.value=spfSum;
        //예약시 결제금액과 현장결제 금액이 있을 경우
        if(srfSum != 0 && spfSum != 0){
            document.all.svFeeStr.innerHTML = "<font color=#fd5401>온라인결제 "+FormatComma(srfSum)+"원</font>, <font color=#3399ff>현장결제 "+FormatComma(spfSum)+"원</font>";
        //현장결제 금액만 있을 경우
        }else if(srfSum == 0){
            document.all.svFeeStr.innerHTML = "<font color=#3399ff>현장결제 "+FormatComma(spfSum)+"원</font>";
        //예약시 결제금액만 있을 경우
        }else if(spfSum == 0){
            document.all.svFeeStr.innerHTML = "<font color=#fd5401>"+FormatComma(srfSum)+"원</font>";
        }
        chkFeeSum(pr_count)
    }
</script>
<div id="cash_help" style="position:absolute; left:717px;top:728px; width:121px;height:97px; z-index:2; visibility: hidden">
            <table width="200" border="0" cellpadding="5" cellspacing="5" bgcolor="BBBBBB">
            <tr>
                <td bgcolor="#F7F7F7">
                <table width="100%" border="0" cellspacing="0" cellpadding="4">
                    <tr>
                        <td bgcolor="#B7E46A" class="cn_4"><strong>적립금사용안내</strong></td>
                    </tr>
                    <tr>
                        <td class="cn_1">펜션을 이용할 때마다 이용금액의 <font color="#FF6600">2%가 마일리지</font>로
                        적립됩니다. 적립된 마일리지 <font color="#FF6600">1,000woori</font><br>
                        (1woori=1원)부터 펜션예약시 사용가능합니다.</td>
                    </tr>
                </table>
                </td>
            </tr>
        </table>
    </div>
    <div id="icon_help" style="position:absolute; z-index:2; visibility: hidden">
        <table width="190" border="0" cellpadding="3" cellspacing="2" bgcolor="#B3CB94">
            <tr>
                <td align="center" bgcolor="#FFFFFF">
                <table width="98%" border="0" cellpadding="2" cellspacing="0" class="cn_1">
                    <tr>
                        <td class="cn_16"><img src="/images/new2_main36.gif" width="177" height="192"></td>
                    </tr>
                </table>
                </td>
            </tr>
        </table>
    </div>
    <div id="style" style="position:absolute; left:0px;top:0px; width:121px;height:97px; z-index:2; visibility: hidden">
        <table width="200" border="0" cellpadding="5" cellspacing="5" bgcolor="BBBBBB">
            <tr>
                <td bgcolor="#F7F7F7">
                <table width="100%" border="0" cellspacing="0" cellpadding="4">
                    <tr>
                        <td bgcolor="#B7E46A" class="cn_4"><strong>객실구조</strong></td>
                    </tr>
                    <tr>
                        <td class="cn_1"><span id="style_html">&nbsp;</span></td>
                    </tr>
                </table>
                </td>
            </tr>
        </table>
    </div>
    <div id="coupon" style="position:absolute; left:0px;top:0px; width:121px;height:97px; z-index:2; visibility: hidden">
        <table width="100" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td><img src="images/p_r8.gif" width="262" height="3"></td>
            </tr>
            <tr>
                <td align="center" background="images/p_r10.gif">
                <table width="224" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="20" valign="bottom" bgcolor="f7f7f8" class="cn_18"><img src="images/0608.gif" width="22" height="14" align="absmiddle">할인쿠폰안내 </td>
                    </tr>
                    <tr>
                        <td><img src="images/p_r9.gif" width="253" height="7"></td>
                    </tr>
                    <tr>
                        <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="5">
                            <tr>
                                <td class="cn_2">우리펜션 회원께 할인해 드립니다.쿠폰을 다운받고 결제시 적용하시면 할인이 적용됩니다. 쿠폰할인은 무통장예약에만 가능합니다.</td>
                            </tr>
                        </table>
                        </td>
                    </tr>
                </table>
                </td>
            </tr>
            <tr>
                <td><img src="images/p_r11.gif" width="262" height="4"></td>
            </tr>
        </table>
    </div>
    
    <!-- 펜션 이름 -->
	<h1 class="reserve_header">
        가평 청암산장 펜션<br>
        <span class="reserve_subTit">날짜,객실 선택</span>
    </h1>



</body>
</html>