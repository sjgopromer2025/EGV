$(document).ready(function() {
	// 옵션 사용하지 않을 경우 $('.single-item').slick();
	// 옵션 사용할 경우 
	$('.multiple-items0').slick({
	       slide: 'div',    
		infinite : true,
		slidesToShow : 5,
		slidesToScroll : 3,
		speed : 500,
		arrows : false,
		draggable : false,
		autoplaySpeed: 3000
	});
	
	$('.multiple-items1').slick({
	       slide: 'div',    
		infinite : true,
		slidesToShow : 5,
		slidesToScroll : 3,
		speed : 500,
		arrows : false,
		draggable : false,
		autoplaySpeed: 3000
	});
	
	$('.multiple-items2').slick({
	       slide: 'div',    
		infinite : true,
		slidesToShow : 5,
		slidesToScroll : 3,
		speed : 500,
		arrows : false,
		draggable : false,
		autoplaySpeed: 3000
	});
});


function DoAction(pMode,no)
{
	
	if(pMode == "prev")
	{
		$(".multiple-items"+no).slick('slickPrev');
		
	}
	if(pMode == "next")
	{
		$(".multiple-items"+no).slick('slickNext');
		
	}		
}
