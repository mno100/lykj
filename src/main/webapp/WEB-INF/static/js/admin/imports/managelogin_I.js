requirejs(['/'+contextName+'/static/js/admin/config.js?v='+ (new Date()).getTime()], function() {
	'use strict';
	require(['/'+contextName+'/static/js/admin/modules/managelogin.js?v='+ (new Date()).getTime()], function(logindata) {
		new logindata();
	});
})