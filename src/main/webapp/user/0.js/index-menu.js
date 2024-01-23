let yScrollLocation = window.scrollY;
let tr2Height = '';
let menuTitleHeight = '';

$(function() {
	let menuhover = true;
	let submenuhover = true;

	$(".header-td-menu-title > a, .header-td-menu-img > img").hover(function() {
		if (menuhover) {
			$(".header-br-logo > a").css("color", "#ffffff");
			$(".header-td-menu-title > a").css("font-size", "400%").css("color", "#ffffff");
			$(".header-opmenu-back").css("top", "0");
			$(".header-opmenu-td").css("visibility", "visible");
			$(".header-td-menu-img > img").css("filter", "brightness(0) invert(1)")
			$(this).css("color", "#FFDF6C");
			$(this).find(".header-td-menu-under").css("visibility", "visible").css("transform", "scaleX(1)");
			$('.header-tr-2').css("height", menuTitleHeight + "px");
//			document.querySelector('.header-tr-2').style.height = menuTitleHeight + 'px';
			//			$(this).(".header-tr-2").css("height", );
			// 마우스 벗어날때 판정
			$(".header-td").hover(function() {
				$(".header-br-logo > a").css("color", "#546137");
				$(".header-td-menu-title > a").css("font-size", "350%").css("color", "rgb(83, 97, 56)");
				$(".header-opmenu-back").css("top", "-50vh");
				$(".header-opmenu-td").css("visibility", "hidden");
				$(".header-td-menu-img > img").css("filter", "brightness(1) invert(0)")
				$('.header-tr-2').css("height", tr2Height + "px");

			});
		} else {
			$(this).find(".header-td-menu-under").css("visibility", "hidden").css("transform", "scaleX(0)");
			$(this).css("color", "#FFFFFF");
		}
		menuhover = !menuhover;

	});

	$(".header-opmenu-a").hover(function() {
		if (submenuhover) {
			$(this).css("color", "#FFDF6C");
			$(this).closest(".header-td-menu").find(".header-td-menu-title").find(".header-td-menu-under").css("visibility", "visible").css("transform", "scaleX(1)");
		} else {
			$(this).css("color", "white");
			$(this).closest(".header-td-menu").find(".header-td-menu-title").find(".header-td-menu-under").css("visibility", "hidden").css("transform", "scaleX(0)");
		}
		submenuhover = !submenuhover;
	});

});

window.addEventListener('scroll', function() {
	if (tr2Height == '' && menuTitleHeight == '') {
		tr2Height = document.querySelector('.header-tr-2').getBoundingClientRect().height;
		menuTitleHeight = document.querySelector('.header-td-menu-title').getBoundingClientRect().height;
	} 
	
	console.log(menuTitleHeight);
	

	// 현재 스크롤 위치 가져오기
	if (yScrollLocation < window.scrollY) {
		//		document.querySelector('.header-tr-2').style.display = 'none';
		document.querySelector('.header-td-menu-title').getBoundingClientRect().height;
		document.querySelector('.header-tr-2').style.top = '-' + document.querySelector('.header-tr-1').getBoundingClientRect().height + 'px';
		document.querySelector('.header-tr-2').style.zIndex = '';
		document.querySelector('.header-opmenu-back').style.zIndex = '';
//		document.querySelector('.header-tr-2').style.height = tr2Height + 'px';
	} else {
		document.querySelector('.header-tr-2').style.display = 'flex';
		document.querySelector('.header-tr-2').style.zIndex = '1';
		document.querySelector('.header-opmenu-back').style.zIndex = '1';
		document.querySelector('.header-tr-2').style.top = document.querySelector('.header-tr-1').getBoundingClientRect().height + 'px';
//				document.querySelector('.header-tr-2').style.height = menuTitleHeight + 'px';
	}

	yScrollLocation = window.scrollY;
});

