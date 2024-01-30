let yScrollLocation = window.scrollY;
let tr2Height = '';
let menuTitleHeight = '';

$(function() {
	let menuhover = true;
	let submenuhover = true;

	$(".header-td-menu-title > a").hover(function() {
		if (menuhover) {
			$(".header-br-logo > a").css("color", "#ffffff");
			$(".header-td-menu-title > a").css("font-size", "400%").css("color", "#ffffff");
			$(".header-opmenu-back").css("top", "0");
			$(".header-opmenu-td").css("visibility", "visible");
			$(".header-opmenu").css("zIndex", "1");
			$(this).css("color", "#FFDF6C");
			$(this).find(".header-td-menu-under").css("visibility", "visible").css("transform", "scaleX(1)");

		} else {
			$(this).find(".header-td-menu-under").css("visibility", "hidden").css("transform", "scaleX(0)");
			$(this).css("color", "#FFFFFF");
		}

		$(".header-tbl").hover(function() {
			$(".header-br-logo > a").css("color", "#546137");
			$(".header-td-menu-title > a").css("font-size", "350%").css("color", "rgb(83, 97, 56)");
			$(".header-opmenu-back").css("top", "-50vh");
			$(".header-opmenu-td").css("visibility", "hidden");
			$(".header-opmenu").css("zIndex", "-1");
		});

		menuhover = !menuhover;
	});

	$(".header-opmenu-a").hover(function() {
		if (submenuhover) {
			$(this).css("color", "#FFDF6C");
			//			$(this).closest(".header-td-menu").find(".header-td-menu-title").find(".header-td-menu-under").css("visibility", "visible").css("transform", "scaleX(1)");
		} else {
			$(this).css("color", "white");
			//			$(this).closest(".header-td-menu").find(".header-td-menu-title").find(".header-td-menu-under").css("visibility", "hidden").css("transform", "scaleX(0)");
		}
		submenuhover = !submenuhover;
	});

});

window.addEventListener('scroll', function() {

	// 현재 스크롤 위치 가져오기
	if (yScrollLocation < window.scrollY) {
		document.querySelector('.header-td-menu-title').getBoundingClientRect().height;
		document.querySelector('.header-tr-2').style.top = '-10%';
		document.querySelector('.header-tr-2').style.zIndex = '';
		document.querySelector('.header-opmenu-back').style.zIndex = '';
		$(".header-br-logo > a").css("color", "#546137");
		$(".header-td-menu-title > a").css("font-size", "350%").css("color", "rgb(83, 97, 56)");
		$(".header-opmenu-back").css("top", "-50vh");
		$(".header-opmenu-td").css("visibility", "hidden");
		$(".header-opmenu").css("zIndex", "-1");
	} else {
		document.querySelector('.header-tr-2').style.display = 'flex';
		document.querySelector('.header-tr-2').style.zIndex = '1';
		document.querySelector('.header-opmenu-back').style.zIndex = '1';
		document.querySelector('.header-tr-2').style.top = '10%';
	}

	yScrollLocation = window.scrollY;
});

