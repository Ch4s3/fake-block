var ready;
ready = function() {

  $("td[data-link]").click(function() {
		window.location = this.dataset.link
	});

  
 //  $(".nav.nav-pills li").on("click",function(){
 //  	$(".nav.nav-pills li").removeClass("active");
 //  	$(this).addClass("active");
	// });

 
 
};

// var nav;
// nav = function() {
// $('ul.nav.nav-pills.message-nav li a').click(function() {           
//     	$(this).parent().addClass('active').siblings().removeClass('active');

// });
// };

$(document).ready(ready);
$(document).on('page:load', ready);

// $(document).ready(nav);
// $(document).on('page:load', nav);