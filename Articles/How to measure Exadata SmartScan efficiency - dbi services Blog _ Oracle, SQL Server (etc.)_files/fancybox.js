function ariFancyBoxInit($, options) 
{
	options = options || {};
	options.onComplete = function() {
		if (this.type != 'iframe')
			return ;

		if (this.href && this.href.match(/#/)) {
			setTimeout(function() {
				$.fancybox.center();
			}, 100);

			$("#fancybox-frame").load(function() {
				setTimeout(function() {
					$.fancybox.center();
				}, 1);
			});
		}
	};
	
	if (typeof($.metadata) == "undefined") 
		$("a.arifancybox,area.arifancybox").fancybox(options);
	else
	{
		$("a.arifancybox,area.arifancybox").each(function(i, el) 
		{
			$(this).fancybox($.extend({}, options, $.metadata.get(this)));
		});
	}
}