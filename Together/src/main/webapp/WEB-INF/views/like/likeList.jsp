<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title> 관심 친구 목록</title>
<script src="https://kit.fontawesome.com/f685a04a4f.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/wishlist_default.css" type="text/css"> 
<link href="/resources/css/common.css" rel="stylesheet" type="text/css" />
<!-- js -->
<script src="http://bigstore.zak.kr/theme/bigstore/js/jquery-1.11.1.min.js"></script>
<!-- //js -->

<style>
@font-face {
  font-family: 'FontAwesome';
  src: url('http://bigstore.zak.kr/theme/bigstore/fonts/fontawesome-webfont.eot?v=4.5.0');
  src: url('http://bigstore.zak.kr/theme/bigstore/fonts/fontawesome-webfont.eot?#iefix&v=4.5.0') format('embedded-opentype'), url('http://bigstore.zak.kr/theme/bigstore/fonts/fontawesome-webfont.woff2?v=4.5.0') format('woff2'), url('http://bigstore.zak.kr/theme/bigstore/fonts/fontawesome-webfont.woff?v=4.5.0') format('woff'), url('http://bigstore.zak.kr/theme/bigstore/fonts/fontawesome-webfont.ttf?v=4.5.0') format('truetype'), url('http://bigstore.zak.kr/theme/bigstore/fonts/fontawesome-webfont.svg?v=4.5.0#fontawesomeregular') format('svg');
  font-weight: normal;
  font-style: normal;
}
</style>
<link rel="stylesheet" href="/resources/css/font-awesome.css" type="text/css"> 

<!--  
<link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Noto+Sans:400,700' rel='stylesheet' type='text/css'>-->

<!--[if lte IE 8]>
<script src="http://bigstore.zak.kr/js/html5.js"></script>
<![endif]-->

<!-- 
<script>
// 자바스크립트에서 사용하는 전역변수 선언
var g5_url       = "http://bigstore.zak.kr";
var g5_bbs_url   = "http://bigstore.zak.kr/bbs";
var g5_is_member = "1";
var g5_is_admin  = "";
var g5_is_mobile = "";
var g5_bo_table  = "";
var g5_sca       = "";
var g5_editor    = "";
var g5_cookie_domain = "";
var g5_theme_shop_url = "http://bigstore.zak.kr/theme/bigstore/shop";
var g5_shop_url = "http://bigstore.zak.kr/shop";
</script>
-->

<!-- 
<script src="http://bigstore.zak.kr/js/common.js"></script>
<script src="http://bigstore.zak.kr/js/wrest.js"></script>
<script src="http://bigstore.zak.kr/js/order.etc.js"></script>
</head> 
-->

<body>

  <div class="account-in">
    <div class="container">

<!-- 위시리스트 시작 { -->
<div class="wrapper_title">관심 친구 목록</div>
<div id="sod_ws">
  <form name="fwishlist" method="post" action="<%=request.getContextPath()%>/like/likeList">
    <input type="hidden" name="act" value="multi">
    <input type="hidden" name="sw_direct" value="">
    <input type="hidden" name="prog" value="wish">
  </form>
  <div class="list_02">
    <ul>
    	  <li>
	    <div class="sod_ws_img">
		  <a href="./item.php?it_id=1557893437"><img src="/resources/seo/glasses.jpg" alt="안경이" width="230" height="230" title=""></a>
		</div>
		<div class="wish_info">
		  <div class="wish_chk">
            <label for="chk_it_id_0" class="sound_only">안경이</label>
            <input type="checkbox" name="chk_it_id[0]" value="1" id="chk_it_id_0" onclick="out_cd_check(this, 'no');">
            <input type="hidden" name="it_id[0]" value="1557893437">
            <input type="hidden" name="io_type[1557893437][0]" value="0">
            <input type="hidden" name="io_id[1557893437][0]" value="">
            <input type="hidden" name="io_value[1557893437][0]" value="샘플상품5">
            <input type="hidden" name="ct_qty[1557893437][0]" value="1">
          </div>
  		  <a href="./item.php?it_id=1557893437" class="info_link">안경이</a>
		  <div class="info_date">2019-06-26 15:16:58</div>
		  <a href="./wishupdate.php?w=d&amp;wi_id=5" class="wish_del"><i class="fas fa-times"></i><span class="sound_only">삭제</span></a>
		</div>
	  </li>
    	  <li>
	    <div class="sod_ws_img">
		  <a href="./item.php?it_id=1557893437"><img src="/resources/pumpkin.jpg" alt="호박" width="230" height="230" title=""></a>
		</div>
		<div class="wish_info">
		  <div class="wish_chk">
            <label for="chk_it_id_0" class="sound_only">호박이</label>
            <input type="checkbox" name="chk_it_id[0]" value="1" id="chk_it_id_0" onclick="out_cd_check(this, 'no');">
            <input type="hidden" name="it_id[0]" value="1557893437">
            <input type="hidden" name="io_type[1557893437][0]" value="0">
            <input type="hidden" name="io_id[1557893437][0]" value="">
            <input type="hidden" name="io_value[1557893437][0]" value="샘플상품5">
            <input type="hidden" name="ct_qty[1557893437][0]" value="1">
          </div>
  		  <a href="./item.php?it_id=1557893437" class="info_link">호박이</a>
		  <div class="info_date">2019-06-26 15:16:58</div>
		  <a href="./wishupdate.php?w=d&amp;wi_id=5" class="wish_del"><i class="fas fa-times" aria-hidden="true"></i><span class="sound_only">삭제</span></a>
		</div>
	  </li>
    	  
	</ul>
  </div>

  <div id="sod_ws_act">
    <button type="submit" class="btn02" onclick="return fwishlist_check(document.fwishlist,'direct_buy');"><i class="fas fa-dog" aria-hidden="true"></i> 입양신청</button>
  </div>


</div><!--id="sod_ws"-->
<!-- } 위시리스트 끝 -->
</div>
</div>
</body>
</html>
