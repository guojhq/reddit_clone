tinymce.PluginManager.add("contextmenu",function(a){var b,c=a.settings.contextmenu_never_use_native;a.on("contextmenu",function(d){var e,f=a.getDoc();if(!d.ctrlKey||c){if(d.preventDefault(),tinymce.Env.mac&&tinymce.Env.webkit&&2==d.button&&f.caretRangeFromPoint&&a.selection.setRng(f.caretRangeFromPoint(d.x,d.y)),e=a.settings.contextmenu||"link image inserttable | cell row column deletetable",b)b.show();else{var g=[];tinymce.each(e.split(/[ ,]/),function(b){var c=a.menuItems[b];"|"==b&&(c={text:b}),c&&(c.shortcut="",g.push(c))});for(var h=0;h<g.length;h++)"|"==g[h].text&&(0===h||h==g.length-1)&&g.splice(h,1);b=new tinymce.ui.Menu({items:g,context:"contextmenu"}).addClass("contextmenu").renderTo(),a.on("remove",function(){b.remove(),b=null})}var i={x:d.pageX,y:d.pageY};a.inline||(i=tinymce.DOM.getPos(a.getContentAreaContainer()),i.x+=d.clientX,i.y+=d.clientY),b.moveTo(i.x,i.y)}})});
