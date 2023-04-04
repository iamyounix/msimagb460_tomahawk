var $xb=$xb||jQuery.noConflict();
// Event handling
function on(el, evt, fn, bubble) {	
	var evts = evt.split(" "),
		i = 0,
		l = evts.length;
	// Loop through the events and check for standards or IE based even handling	
	for(i; i < l; i++) {
		evt = evts[i];
		if("addEventListener" in el) {
			try {
				el.addEventListener(evt, fn, bubble);
			} catch(e) {}
		} else if("attachEvent" in el) {
			el.attachEvent("on" + evt, fn);
		}
	}
}

function removeEvt(el, evt, fn, bubble) {	
	var evts = evt.split(" "),
		i = 0,
		l = evts.length;
	for(i; i < l; i++) {
		evt = evts[i];
		if("removeEventListener" in el) {
			try {
				el.removeEventListener(evt, fn, bubble);
			} catch(e) {}
		} 
		else if("detachEvent" in el)
			el.detachEvent("on" + evt, fn);
	}
}
function naturalDimensions(image) {
	// Modern browsers
	if("naturalWidth" in image)
		return {
			width: image.naturalWidth,
			height: image.naturalHeight
		};

	// Add a temporary image
	var temp = document.createElement("img"),
		dimensions = {};
	
	temp.style.visibility = "hidden";
	temp.src = image.src;
	(document.body || document.documentElement).appendChild(temp);

	dimensions.width = temp.clientWidth;
	dimensions.height = temp.clientHeight;
			
	(document.body || document.documentElement).removeChild(temp);
	temp = null;
	
	return dimensions;
}
(function($) {
	$.fn.xbShowtime = function(options) {
			
	    if(this.length > 1) {
	        this.each(function() { 
	        	$(this).xbShowtime(options);
	        });
	        return this;
	    }
	    
	    // private variables
	    var el = {},
	    	$this = $(this),
	    	_this = this,
			id = $this.attr("id"),
			expr = $this.find(":not(.xb-showtime_cloned, .xb-showtime_empty)"),
			settings = $.extend({
				retina: 1,
				openLinksInNewWindow: options.openLinksInNewWindow || false,
				thumbs: 1,
				dir: 0,
				duration: 5,
				fade: 250,
				overlayBg: "",
				overlayOp: 0.5,
				galleryBg: "",
				galleryTxtColor: "#000",
				borderColor: "",
				borderWidth: 0,
				padding: 0,
				spacing: 20,
				startW: 100,
				startH: 100,
				showCaptions: true,
				captionHeight: 0,
				roll: "",
				showControls: true,
				showThumbs: options.thumbs || true,
				showInfo: true,
				autohideControls: false,
				autohideInfo: false,
				galleryCss: {},
				imageCss: {},
				playing: false,
				prevTxt: "Previous",
				nextTxt: "Next",
				playTxt: "Play",
				closeTxt: "Close",
				slideshow: 1
			}, options);
		el[id] = {
			"curImage": null,
			"curPage": 1,
			"total": $this.find("li").length,
			"s": settings
		};
		
		var $thumbs = $this.find(".xb-showtime_slidereel");
		$thumbs.hide();
		
		// private methods
	    var initialize = function() {
	
			window[id + "index"] = window.stIndex = 0;
	
			var $slideshow = $this.find(".xb-showtime_slideshow");
			
			el[id].indexOffset = 0;
			el[id].itemHeightWhenLoaded = parseInt(getComputedStyle($this[0]).height);
			
			$thumbs.show();
	
			_this.buildThumbs(true);
 
			$slideshow.show();
	
			windowResized(_this.adjustGallery);
	
			// Reset the breakpoint when changing orientation (to force the thumbs to be recalculated)
			on(window, "orientationchange", function(){_this.breakpoint = $(window).width;}, true);
			
			$slideshow.append("<div class=\"xb-showtime_info xb-showtime_ui xb-showtime_ui_small " + id + "-showtime_ui " + id + "-showtime_info\"><\/div>" +
						"<div class=\"xb-showtime_caption xb-showtime_ui " + id + "-showtime_ui " + id + "-showtime_caption\"><\/div>" +
						"<div class=\"xb-showtime_controls xb-showtime_ui " + id + "-showtime_ui " + id + "-showtime_controls\">" +
							"<div class=\"xb-showtime_prev\"><p class=\"xb-showtime_ui_small\" title=\""+el[id].s.prevTxt+"\">&laquo;<\/p><\/div>" +
							"<div class=\"xb-showtime_play\"><p class=\"xb-showtime_ui_small\" title=\""+el[id].s.playTxt+"\">&gt;<\/p><\/div>" +
							"<div class=\"xb-showtime_next\"><p class=\"xb-showtime_ui_small\" title=\""+el[id].s.nextTxt+"\">&raquo;<\/p><\/div>" +
						"<\/div>");
			
			el[id].$ui = $this.find(".xb-showtime_ui");
			el[id].$info = $this.find(".xb-showtime_info");
			el[id].$controls = $this.find(".xb-showtime_controls");
			el[id].$prev = el[id].$controls.find(".xb-showtime_prev > p");
			el[id].$next = el[id].$controls.find(".xb-showtime_next > p");
			el[id].$play = el[id].$controls.find(".xb-showtime_play > p");
			el[id].$close = $this.find(".xb-showtime_close > p");
			el[id].$title = $this.find(".xb-showtime_title");
			el[id].$caption = $this.find(".xb-showtime_caption");
			el[id].$list = $this.find("ul");
			el[id].$items = el[id].$list.find("li");
			el[id].$usableItems = el[id].$list.find("li:not(.xb-showtime_empty, .xb-showtime_cloned)");
			el[id].$images = el[id].$items.find("> a");
			el[id].$originalImages = el[id].$usableItems.find("> a");
			el[id].$viewer = $this.find(".xb-showtime_main");
			el[id].$imageContainer = el[id].$viewer.find(".xb-showtime_image");
			el[id].$image = el[id].$imageContainer.find("img");
			
			if(el[id].itemHeightWhenLoaded > 0)
				el[id].$imageContainer.addClass("xb-showtime_fixed-height");	
 
			if(!el[id].$image[0].complete) {
				el[id].$image.load(function() {
					el[id].curImage = el[id].$usableItems.first();
					showCaptions();
				});
			}
			else {
				el[id].curImage = el[id].$usableItems.first();
				showCaptions();
			}
	
			// Add the customization classes
			el[id].$viewer.addClass(id + "-showtime_main");
			el[id].$imageContainer.addClass(id + "-showtime_image");
			el[id].$ui.addClass(id + "-showtime_ui");
			el[id].$info.addClass(id + "-showtime_info");
			el[id].$caption.addClass(id + "-showtime_caption");

			var temp = (document.body || document.documentElement).appendChild(document.createElement("div")),
				tempImg = temp.appendChild(document.createElement("img"));
			temp.style.visibility = "hidden";
			temp.className = "exibid-showtime_image";
			
			el[id].s.borderWidth = $(tempImg).outerHeight();
			
			temp.parentNode.removeChild(temp);
			temp = null;

			$(window).load(function() {
				if(el[id].s.playing)
					_this.playPause();
			});
			addListeners();
			loadImages();
			
			// Add the control and info positioning based on the padding used
			if(!el[id].s.showControls || el[id].s.autohideControls)
				el[id].$controls.hide();
			
			$(el[id].$title).add(el[id].$caption).css({"text-overflow":"ellipsis"});
			
			if(el[id].s.showInfo)
			{
				el[id].$info.text("1 / "+el[id].total);
				if(el[id].s.autohideInfo)
					el[id].$info.hide();
			}
			else
				el[id].$info.hide();
			
			// When an image is clicked on:
			el[id].$images.click(function() {
					swapImage($(this).parent());
				// Prevent the default behaviour
				return false;
			});
	        return _this;
	    },
		
		autohideOut = function() {
			if(el[id].s.autohideInfo)
				el[id].$info.add(el[id].s.autohideControls ? el[id].$controls : null).hide();
			else if(el[id].s.autohideControls)
				el[id].$controls.hide();
		},
		
		/*****************************************************************
        * The following three methods are based on Brad Birdsall's excellent Swipe
        *
        * Swipe 1.0
        *
        * Brad Birdsall, Prime
        * Copyright 2011, Licensed GPL & MIT
        * http://swipejs.com
        *****************************************************************/
 
		touchStart = function(e) {
			// Get the touch start points
			this.touch = {
				startX: e.touches[0].pageX,
				startY: e.touches[0].pageY,
				// set initial timestamp of touch sequence
				time: Number( new Date() )	
			};
			
			// used for testing first onTouchMove event
			this.touch.isScrolling = undefined;
			
			// reset deltaX
			this.touch.deltaX = 0;
			
		},
		
		touchMove = function(e) {
			// If we detect more than one finger or a pinch, don't do anything
			if(e.touches.length > 1 || e.scale && e.scale !== 1) {
				return;
			}
			this.touch.deltaX = e.touches[0].pageX - this.touch.startX;
			
			// determine if scrolling test has run - one time test
			if ( typeof this.touch.isScrolling == "undefined") {
				this.touch.isScrolling = !!( this.touch.isScrolling || Math.abs(this.touch.deltaX) < Math.abs(e.touches[0].pageY - this.touch.startY) );
			}
			
			// if user is not trying to scroll vertically
			if (!this.touch.isScrolling) {
								
				// prevent native scrolling 
				e.preventDefault ? e.preventDefault() : e.returnValue = false;
			}
		},
		
		touchEnd = function(e) {
			
            // If we detect more than one finger or a pinch, don't do anything
            if(e.touches.length > 1 || e.scale && e.scale !== 1) {
                return;
            }
 
			// determine if slide attempt triggers next/prev slide
			var isValidSlide = 
				  Number(new Date()) - this.touch.time < 250      	// if slide duration is less than 250ms
				  && Math.abs(this.touch.deltaX) > 20               // and if slide amt is greater than 20px
				  || Math.abs(this.touch.deltaX) > windowWidth()/2, // or if slide amt is greater than half the width
		
			// determine if slide attempt is past start and end
				isPastBounds = 
				  !this.index && this.touch.deltaX > 0                          // if first slide and slide amt is greater than 0
				  || this.index == this.length - 1 && this.touch.deltaX < 0;    // or if last slide and slide amt is less than 0
			
			// if not scrolling vertically
			if (!this.touch.isScrolling) {
				// call slide function with slide end value based on isValidSlide and isPastBounds tests
				if(isValidSlide) {
					(this.touch.deltaX > 0 ? _this.prevImage() : _this.nextImage());
				 }
		
			}
			this.touch = undefined;
		},
		
		windowResized = function(cb) {
		    var width = $(window).width(),
		        height = $(window).height();
		
		    $(window).resize(function() {
		        var newWidth = $(window).width(),
		            newHeight = $(window).height();
		
		        if (newWidth !== width || newHeight !== height) {
		            width = newWidth;
		            height = newHeight;
		            cb();
		        }
		    });
		},
		
		addListeners = function() {
			
			// Touch listeners (not supported in jQuery)
			on(window, "touchstart", touchStart, false);
			on(window, "touchmove", touchMove, false);
			on(window, "touchend", touchEnd, false);
			
			// Display the next image when clicking the previous image link or the left side of the image
			el[id].$prev.click(_this.prevImage);
			
			// Display the next image when clicking the next image link or the right side of the image
			el[id].$next.click(_this.nextImage);
				
			// Play/pause the slideshow when the play/pause buttons are clicked
			el[id].$play.click(_this.playPause);
			
			// Autohide the controls and info when hovering over the viewer
			if(el[id].s.autohideControls || el[id].s.autohideInfo)
				el[id].$viewer.hover(autohideIn, autohideOut);
			
			// track key presses
			$(document).keydown(function(e){
					// Play/pause the slideshow when the spacebar is pressed
					if(e.which == 32) // Spacebar
					{
						if(!$( document.activeElement ).is("input, textarea, select"))
							return _this.playPause();
					}
					// Go to the prev/next image when the left/right arrows are pressed
					else if(e.which == 37) // Left arrow
						return _this.prevImage();
					else if(e.which == 39) // Right arrow
						return _this.nextImage();
				});
		},
		
		removeEventListeners = function() {
			// Unbind the overlay, close button, prev/next and play buttons
			el[id].$overlay
				.add(el[id].$close)
				.add(el[id].$prev)
				.add(el[id].$next)
				.add(el[id].$play)
				.unbind("click");
			// Unbind the autohide
			el[id].$viewer.unbind();
			// Unbind the key presses
			$(document).unbind("keydown");
			
			removeEvt(window, "touchstart", touchStart, false);
			removeEvt(window, "touchmove", touchMove, false);
			removeEvt(window, "touchend", touchEnd, false);
		},
		
		resetDuration = function() {
			if(el[id].s.playing) {
				el[id].$play.text("\\");
				clearInterval(el[id].duration);
				el[id].duration = setInterval(_this.nextImage, el[id].s.duration * 1000);
			}
		},
		
		loadImages = function() {
			if(!el[id].$usableItems.index(el[id].curImage)) {
				$('<img />').attr('src', $(el[id].curImage).next(expr).find("> a").attr("href"));
				$('<img />').attr('src', el[id].$usableItems.last().find("> a").attr("href"));
			} else if(el[id].$usableItems.index(el[id].curImage) == (el[id].total-1)) {
				$('<img />').attr('src', el[id].$usableItems.first().find("> a").attr("href"));
				$('<img />').attr('src', $(el[id].curImage).prev(expr).find("> a").attr("href"));
			} else {
				$('<img />').attr('src', $(el[id].curImage).next(expr).find("> a").attr("href"));
				$('<img />').attr('src', $(el[id].curImage).prev(expr).find("> a").attr("href"));
			}
		},
		
		showCaptions = function() {
			if(el[id].s.showCaptions) {
				el[id].$caption.hide().empty().css({opacity:0});
				var img = $(el[id].curImage).find("img"),
					title = img.attr("title"),
					desc = img.attr("alt");
				if(title)
					el[id].$caption.append("<h1>" + title + "</h1>");
				if(desc)
					el[id].$caption.append("<p>" + desc + "</p>");
				if(title || desc)
					el[id].$caption.show().animate({opacity:1}, el[id].s.fade, function(){});
			}
		},
		
		hideCaptions = function() {
			if(el[id].s.showCaptions) {
				el[id].$caption.animate({opacity:0}, el[id].s.fade, function(){el[id].$caption.hide()});
			}
		},
	
		swapImage = function(input) {
			var index = el[id].$items.index(input);
 
			if (index == -1)
				throw "swapImage error: Incorrect element passed";
 
			var indexHash = index < el[id].indexOffset ?
								index + el[id].$usableItems.length - el[id].indexOffset :
								index < el[id].$usableItems.length + el[id].indexOffset ?
									index - el[id].indexOffset :
									index - el[id].$usableItems.length - el[id].indexOffset;
		
			if(window[id + "index"] == indexHash)
				return;

			loadImages();
			
			window.stIndex = window[id + "index"] = indexHash;
			el[id].curImage = $(el[id].$usableItems[indexHash]);
			
			$(el[id].$list).find(".hover").removeClass("hover");
			el[id].curImage.addClass("hover");
						
			// Get the anchor element, the path to the main image and create a new Image
			var anchor = $(el[id].curImage).find("> a"),
				path = anchor.attr("href"),
				image = new Image(),
				$thumb = $(anchor).find("> img"),
				$link,
				
				// Find the currently displaying image
				$viewer = el[id].$viewer,
				$imageDiv = el[id].$imageContainer;
			
			$viewer.stop();
			clearInterval(el[id].duration);
			
			// Load the new image
			$(image).load(function() {
				$image = $(this);
				var dims = naturalDimensions(image);
				
				hideCaptions();
				
				// Fade out the existing Image
				$imageDiv.animate({opacity:0}, el[id].s.fade, function(){
					$imageDiv.empty();
					// Add a link if one has been set
					if($thumb.attr("data-url")) {
						$imageDiv.append("<a class=\"xb-showtime_image-link\" "+(el[id].s.openLinksInNewWindow ? "target=\"_blank\" " : "")+"href=\""+$thumb.attr("data-url")+"\">");
						$link = $imageDiv.find("> a");
					}
					// Once the image has faded and been removed, append the new image
					($link || $imageDiv).append(image);
					
					// Make sure the placeholder is the right size
					$viewer.animate({
					}, el[id].s.fade, function(){
						$imageDiv.animate({
							opacity:1
						}, el[id].s.fade, function() {
							// Add the gallery specific event handler
							$(window).unbind("keydown").keydown(function(e){ 
								if(e.which == 37) // Left arrow
									prevImage();
								else if(e.which == 39) // Right arrow
									nextImage();
							});
							resetDuration();
						});
					});
					showCaptions();
					if(el[id].s.showInfo) {
						var listItems = el[id].$list.find("li:not(.xb-showtime_empty, .xb-showtime_cloned)");
						el[id].$info.text(($(listItems).index(el[id].curImage)+1)+" / "+el[id].total);
					}
				});
				
			}).attr("src", path);
		}
	
	    // public methods

		this.buildThumbs = function(force) {
	
			// Need to get sizes of things
			var $slideshow = $this.find(".xb-showtime_slideshow"), 
				$wrap = $this.find(".xb-showtime_slidereel"),
				$outer = $this.find(".xb-showtime_outer"),
				$inner = $this.find(".xb-showtime_inner"),
				$list = $inner.find(".xb-showtime_thumbs"),
				$items = $list.find("li:not(.xb-showtime_empty, .xb-showtime_cloned)"),
				$clones = $list.find(".xb-showtime_empty, .xb-showtime_cloned"),
				body = (document.body || document.documentElement),
				tempPara,
				buttonSize,
				itemWidth,
				itemHeight,
				totalWidth,
				totalHeight,
				visible,
				pages,
				pageWidth,
				pageHeight;
	
			if(!el[id].s.showThumbs) {
				$wrap.hide();
				return;
			}
			else {
				$wrap.show();
			}
	
			itemWidth = $items.outerWidth(),
			itemHeight = $items.outerHeight(),
			totalWidth = $wrap.outerWidth(),
			totalHeight = $wrap.outerHeight(),
			visible = Math.min(Math.floor((el[id].s.dir ? totalHeight / itemHeight : totalWidth / itemWidth)), $items.length),
			pages = Math.ceil($items.length / visible),
			pageWidth = itemWidth * visible,
			pageHeight = itemHeight * visible;
			
			if(this.tiny && $(window).width() > this.breakpoint) {
				$this.removeClass("xb-showtime_small");
				$list.removeClass("xb-showtime_thumbs-small");
				this.tiny = 0;
				this.buildThumbs(true);
				return;
			}
 
 			if(el[id].itemHeightWhenLoaded !== 0) {
				$slideshow.css("height", (( $(this).height() - itemHeight) + "px"));
			}	
				
			$outer.css({height:itemHeight});
			
			if(pages > 1) {
				tempPara = document.createElement("p");
				tempPara.style.visibility = "hidden";
				tempPara.className = "xb-showtime_thumbs_prev " + id + "-showtime_ui";
				tempPara.appendChild(document.createTextNode("&nbsp;"));
				body.appendChild(tempPara);
				buttonSize = !el[id].s.dir ? $(tempPara).outerWidth() : $(tempPara).outerHeight();
				body.removeChild(tempPara);
				tempPara = null;
				
				// Recalculate and take the buttons into account
				totalWidth = $wrap.outerWidth() - buttonSize * 2,
				totalHeight = $wrap.outerHeight() - buttonSize * 2,
				visible = Math.min(Math.floor((el[id].s.dir ? totalHeight / itemHeight : totalWidth / itemWidth)), $items.length),
				numClones = (visible * 2) - 1,
				totalItemsIncludingClones = $items.length + (numClones * 2),
				pages = Math.ceil($items.length / visible),
				pageWidth = itemWidth * visible,
				pageHeight = itemHeight * visible;
				
				// Don't run this code if the number of visible items hasn't changed
				if(visible == el[id].visible && !force)
					return;
					
				// Set the current index
				el[id].curIndex = el[id].curIndex || 0;
				el[id].indexOffset = numClones;
				
				// If we're down to one visible thumb then make the thumbs smaller
				if(visible < 2 && !this.tiny) {
					$this.addClass("xb-showtime_small");
					$list.addClass("xb-showtime_thumbs-small");
					this.tiny = 1;
					this.breakpoint = $(window).width();
					if(el[id].itemHeightWhenLoaded !== 0)
						$(".xb-showtime_slideshow").css("height", $(this).height() + "px");
 
					this.buildThumbs(true);
					return;
				}
				
				// Remove the clones so we can recreate the right number of them
				$clones.remove();
				
				// If there are no nav buttons, add some
				if(!$wrap.find(".xb-showtime_thumbs_prev").length) {
					$outer.css({overflow:"hidden"})
						  .before("<p class=\"xb-showtime_thumbs_prev " + id + "-showtime_ui \">«</p>")
						  .after("<p class=\"xb-showtime_thumbs_next\ " + id + "-showtime_ui \">»</p><div class=\"xb-showtime_thumbs_clearer\"></div>");
				}
				
				if(!el[id].s.dir) { // Horizontal
					// Set the total width of the inner thumbnail container (total width of all items + extra space for cloned items)
					$outer.css({width: itemWidth * visible});
					$inner.css({width: totalWidth * Math.ceil(totalItemsIncludingClones / visible) });
				}
				else { // Vertical
					// Set the total height of the inner thumbnail container (total width of all items + extra space for cloned items)
					$inner.css({height: totalHeight * Math.ceil(totalItemsIncludingClones / visible) });
				}
				
				// Set the listeners on the nav buttons
				$this.find(".xb-showtime_thumbs_prev").unbind("click").click(function(){
					gotoIndex(el[id].curIndex-visible, $items);
					return false;
				});
				
				$this.find(".xb-showtime_thumbs_next").unbind("click").click(function(){
					gotoIndex(el[id].curIndex+visible, $items);
					return false;
				});
				
				// Add the cloned items to get the infinite carousel
				var completeCloneSets = Math.floor(numClones/$items.length);
				var itemsInPartialCloneSet = numClones % $items.length;
 
				// Add partial set of cloned items
				if (itemsInPartialCloneSet > 0)
				{
					$items.filter(":first").before($items.slice(-itemsInPartialCloneSet).clone(true).addClass("xb-showtime_cloned"));
					$items.filter(":last").after($items.slice(0, itemsInPartialCloneSet).clone(true).addClass("xb-showtime_cloned"));
				}
 
				// Add complete sets of cloned items
				for (var i = 0; i < completeCloneSets; i++)
				{
					$items.filter(":first").before($items.clone(true).addClass("xb-showtime_cloned"));
					$items.filter(":last").after($items.clone(true).addClass("xb-showtime_cloned"));
				}
				
				el[id].$items = $list.find("li");
				el[id].$images = el[id].$items.find("> a");
				
				$(".xb-showtime_cloned").find("a, img").attr("id", "");
 
				function unconstrainedIndexToHashedIndex(unconstrainedIndex) {
					var unconstrainedIndexOfFirstClone = -numClones;
					var indexOfUnconstrainedIndexFromFirstClone = unconstrainedIndex - unconstrainedIndexOfFirstClone;
					return indexOfUnconstrainedIndexFromFirstClone;
				}
 
				function unconstrainedIndexToItemIndex(unconstrainedIndex) {
					// Assumes unconstrainedIndex is within the bounds of -numClones to ($items.length - 1 + numClones), the range of
					// all unconstrained indexes for our clones and real items
					var itemIndexOfFirstClone = $items.length - itemsInPartialCloneSet;
					var hashedIndexOfUnconstrainedIndex = unconstrainedIndexToHashedIndex(unconstrainedIndex);
					var itemIndexOfUnconstrainedIndex = (itemIndexOfFirstClone + hashedIndexOfUnconstrainedIndex) % $items.length;
					return itemIndexOfUnconstrainedIndex;
				}
 
				function itemIndexToHashedIndex(itemIndex) {
					return itemIndex + numClones;
				}
 
				function hashedIndexToItemIndex(hashedIndex) {
					return hashedIndex - numClones;
				}
 
				function scrollOuterToItemIndex(itemIndex) {
					var gotoIndexHash = itemIndexToHashedIndex(itemIndex);
					
					el[id].curIndex = itemIndex;
					
					if(!el[id].s.dir)
						$outer.scrollLeft(itemWidth * gotoIndexHash);
					else
						$outer.scrollTop(itemHeight * gotoIndexHash);
				}
				
				function scrollThumbs() {
					scrollOuterToItemIndex(el[id].curIndex);
				}
				
				// Scroll the thumbs into place (when made visible if initially hidden) 
				if(!$($this).is(":visible"))
					$($this).bind("visible", scrollThumbs);
				else
					scrollThumbs();
				
				// Navigate to a specic page
				function gotoIndex(unconstrainedIndex, items) {
					var itemIndex = unconstrainedIndexToItemIndex(unconstrainedIndex);
					if(itemIndex == el[id].curIndex)
						return;
					
					var nextIndexHash = unconstrainedIndexToHashedIndex(unconstrainedIndex);
						
					$this.find(".xb-showtime_outer:not(:animated)").animate({
						scrollLeft: (!el[id].s.dir ? itemWidth * (nextIndexHash) : 0),
						scrollTop: "+=" + (!el[id].s.dir ? 0 : scroll)
					}, 500, function() {
						scrollOuterToItemIndex(itemIndex);
					});
				}
			}
			else {
				if(visible == el[id].visible && !force)
					return;
				
				// Remove the clones so we can recreate the right number of them
				$clones.remove();
				el[id].indexOffset = 0;
 
				$inner.add($outer).css({width: pageWidth});
				$(".xb-showtime_thumbs_prev").remove();
				$(".xb-showtime_thumbs_next").remove();
			}
			
			// Cache the number of visible items so we don't run this code again unecessarily
			el[id].visible = visible;
		}
	
	    this.playPause = function() {
			if(!el[id].s.playing) {
				el[id].duration = setInterval(_this.nextImage, el[id].s.duration * 1000);
				el[id].$play.text("\\");
			}
			else {
				clearInterval(el[id].duration);
				el[id].$play.text(">");
			}
			el[id].s.playing = !el[id].s.playing;
			return false;
		}
							
		this.prevImage = function() {
			try {
				swapImage($(el[id].curImage).prev());
			} catch (e) {
				swapImage(el[id].$usableItems.last());
			}
			return false;
		}
		
		this.nextImage = function() {
			try {
				swapImage($(el[id].curImage).next());
			} catch (e) {
				swapImage(el[id].$usableItems.first());
			}
			return false;
		}
			
		this.adjustGallery = function() {
			_this.buildThumbs();
		}
		
		this.showImageAtIndex = function(index) {
			if(!el[id].$images[index])
				return;
			swapImage(el[id].$usableItems.get(index));
		}
		
		this.editSettings = function(settings) {
			el[id].s = $.extend(el[id].s, settings);
			try {
				this.refresh();
			} catch (e) {};
		}
		
		this.refresh = function() {
			swapImage(el[id].$usableItems[el[id].$usableItems.index(el[id].curImage)]);
		}
					
		return initialize();
	    
	}
 
    if(!window.xb_showtime)
        return;
 
    // Store args from window.xb_showtime before changing its function
    var args = window.xb_showtime.a;

    // Change the function of window.xb_showtime to create new instances instead of loading arguments
    window.xb_showtime = function(id, options) {
        window[id + "Showtime"] = $("#" + id).xbShowtime(options);
    }

    if(!args)
        return;

    // Load instances that were initiated before script loaded
    for(var i = 0; i < args.length; i++)
    {
        var id = args[i][0];
        var options = args[i][1];
        window[id + "Showtime"] = $("#" + id).xbShowtime(options);
    }
})(jQuery);