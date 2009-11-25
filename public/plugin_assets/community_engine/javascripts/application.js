// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var CommunityEngine = {	
	resize_image: function(img, options ) {
		this.options = options || {};

		var img_width = img.offsetWidth;
		var img_height = img.offsetHeight;
		var img_aspect_ratio = Math.round((img_width / img_height) * 100) / 100;

		var max_width = this.options['max_width'] || 120;
		var max_height = this.options['max_height'] || 90;
		var max_aspect_ratio = Math.round((max_width / max_height) * 100) / 100;

	//	alert("orig image size is " + img_width + "x" + img_height + "\n" + "aspect ratio is " + img_aspect_ratio + "\n\n" + "max image size is " + max_width + "x" + max_height + "\n" + "max aspect ratio is " + max_aspect_ratio);

		var new_img_width = 0;
		var new_img_height = 0;
		var new_aspect_ratio = 0;

		// if no resize needed
    if (img_width < 120 && img_height < 90) {
            new_img_width = img_width;
            new_img_height = img_height; 

		// if wider
		} else if (img_aspect_ratio > max_aspect_ratio) {
			new_img_width = max_width;
			new_img_height = Math.round(new_img_width / img_aspect_ratio);

		// if taller
		} else if (img_aspect_ratio < max_aspect_ratio) {
			new_img_height = max_height;
			new_img_width = Math.round(new_img_height * img_aspect_ratio);

		// equal
		} else {
			new_img_width = max_width;
			new_img_height = max_height;
		}

		img.style.width = new_img_width + "px";
		img.style.height = new_img_height + "px";
		new_aspect_ratio = Math.round((new_img_width / new_img_height) * 100) / 100;
	}
}

var Cookie = {
	set: function(name,value,days) {
		if (days) {
			var date = new Date();
			date.setTime(date.getTime()+(days*24*60*60*1000));
			var expires = "; expires="+date.toGMTString();
		}
		else var expires = "";
		document.cookie = name+"="+value+expires+"; path=/";
	},

	get: function(name) {
		var nameEQ = name + "=";
		var ca = document.cookie.split(';');
		for(var i=0;i < ca.length;i++) {
			var c = ca[i];
			while (c.charAt(0)==' ') c = c.substring(1,c.length);
			if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
		}
		return null;
	},

	destroy: function(name) {
		createCookie(name,"",-1);
	}	
}

// Clear text in forms

//Feature rotator