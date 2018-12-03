/*
create by None(2016-12-1)
on('next')  		//此事件绑定在按钮上，在表单验证通过之后才会触发的。
data-page			页面切换用，与下面的goto以及onhashchange有关，值用于标记页面
data-captcha		验证码，值任意
data-submit			提交按钮，值为对应表单的selector
data-valid			验证，在表单中，值为valids中定义好的或自定义的。
data-countdown		倒计时，值是时长

//页面切换：		goto(page)

暴露全局变量smallPage
*/
smallPage_mode="production";
~ function (win, $) {
	var tap = $.fn.tap ? 'tap' : 'click';
	var valids = {
		normal: {
			required: function ($ipt) {
				return !!$.trim($ipt.val())
			},
			length: function ($ipt, l) {
				return ($ipt.val() || '').length === l
			},
			minLength: function ($ipt, l) {
				return ($ipt.val() || '').length >= l
			},
			maxLength: function ($ipt, l) {
				return ($ipt.val() || '').length <= l
			},
			isNumeric: function ($ipt) {
				return !isNaN($ipt.val())
			},
			checked: function ($ipt) {
				return $ipt[0].checked
			}
		},
		tel: [{
			required: true,
			msg: '手机号不能为空！'
		}, {
			rule: /^1([38]\d|4[567]|5(?!4)\d|7[01678])\d{8}$/,
			msg: '请输入正确的手机号！'
		}],
		verifyCode: [{
			required: true,
			msg: '请输入手机验证码！'
		}],
		captcha: [{
			required: true,
			msg: '请输入验证码！'
		}, {
			length: 4,
			msg: '请输入四位验证码！'
		}],
		agree: [{
			checked: true,
			msg: '协议'
		}],
		realname: [{
			required: true,
			msg: '请填写真实姓名！'
		}, {
			minLength: 2,
			msg: '请填写您的真实姓名！'
		}, {
			maxLength: 6,
			msg: '请填写您的真实姓名！'
		}],
		idcard: [{
			required: true,
			msg: '请填写身份证号码！'
		}, {
			rule: /^[1-9]\d{5}[1-9]\d{3}((0[1-9])|(1[0-2]))((0[1-9])|([1-2]\d)|(3[0-1]))((\d{4})|(\d{3}[Xx]))$/,
			msg: '身份证号码有误！'
		}],
		bankcard: [{
			required: true,
			msg: '请填写银行卡号'
		}, {
			rule: /^(\d{16}|\d{19})$/,
			msg: '请填写正确的银行卡号！'
		}]
	}
	var $form_selector = $($('[data-submit]').attr('data-submit'));
	var formname = $form_selector.attr('data-formname') || location.hash.replace('#', '') || location.href.replace(/\.html$/, '').replace(/^.+\/([^\/]*)$/, '$1');
	win.smallPage = {
		//模式,当为dev时,表单可自动保存和还原.推荐设置唯一的表单属性值  data-formname
		mode: '',  //dev,production
		//自动运行的项
		auto: ['captchaEvent', 'valids', 'hashEvent', 'showInput'],
		//倒计时容器
		timers: {},
		init: function (opt) {
			//opt:{auto,mode}  mode可手动设置为dev或 production 模式,auto也可手动配置为['xx','xx'];
			opt = opt || {};
			var getMode = function () {
				if(smallPage_mode)return smallPage_mode;
				if (location && location.hostname) {
					var hostname = location.hostname.replace(/\.\d*\.\d*$/, '');
					if (hostname === '192.168' || hostname === '127.0' || hostname === 'localhost') {
						return 'dev';
					}
				}
				return 'production';
			}

			if (this.getType(opt) === 'string') {
				opt = { mode: opt };
			}
			this.mode = opt.mode || getMode();
			this.auto = opt.auto || this.auto;
			//自动绑定countdown事件
			//if ($('[data-countdown]').length) this.auto.push('countdown');
			//dev模式下做的事.
			if (this.mode === 'dev') {
				$form_selector.fillForm(formname);
			}
			this.autoRun();
		},
		//打开调试模式-基于eruda
		debug: function (eng) {
			if (!eng) {
				window.addEventListener('error', function (e) {
					alert(e.filename + '\n' + e.lineno + '\n' + e.message);
				}, false);
			} else if (eng != '') {
				var tool = '//cdn.jsdelivr.net/eruda/1.0.5/eruda.min.js';
				$.loadScript(tool, function () {
					eruda && eruda.init();
				});
			}
		},
		//获取对象类型
		getType: function (obj) {
			return Object.prototype.toString.call(obj).slice(8, -1).toLowerCase();
		},
		//简单倒计时
		countdown: function (name, ticker) {
			/*
			当data-countdown属性值为数字,则使用最初的方式运行,当为配置json时,将采用新的方式执行,此时页面初始化完后需要执行smallPage.countdown()
			或 smallPage.init({auto:[xxx,xx,'countdown']}) 时在auto里配置'countdown'
			//带*号的为必填项
			//*gn 为多项必填一项
			data-countdown :{
				initial:'初始文本值',
				sending:'发送中的文本(rest替换部分用*rest*)',
				resend:'重新发送的文本',
				*timeout:倒计时长,
				*g1:send:'发送的函数', //回调返回true为正常发送,为false为发送失败
				*g1:url:'发送的地址'//有url就不需要send 两者必须有其中一个存在
				*telSelector:'要发送的手机号元素css选择器'
			}
			*/
			name = name || 'timer';
			var me = this;
			var timer;
			var $countdown = $('[data-countdown]');
			var optStr = $countdown.attr('data-countdown');
			var opt = {
				type: 0,   //0:早期类型, 1:只需配置型
				$el: $countdown
			}
			if (isNaN(optStr - 0)) {
				eval('opt=' + optStr);
				opt.$el = $countdown;
				opt.type = 1;
			} else {
				opt.timeout = optStr - 0;
			}
			var val = opt.$el.prop('tagName') === 'INPUT' ? 'val' : 'text';
			opt.initial = opt.initial || opt.$el[val]() || '发送验证码';
			opt.sending = opt.sending || '重新发送(*rest*)';
			opt.resend = opt.resend || '重新发送';
			opt.send = opt.send || function (cb) {
				var r = me.valid($(opt.telSelector));
				if (!r.pass) return me.popup(r.msg);
				if (!opt.url) {
					cb && cb(false);
					return false;
				}
				var data=$(opt.telSelector).getFormJson();
				opt.$el.disabled();
				$.ajax({
					url: opt.url,
					type: 'get',
					data: data,
					dataType: 'json',
					success: function (res) {
						cb(true);
					},
					error: function (e) {
						me.popup('验证码发送失败!');
						opt.$el.enabled();
					},
					complete: function () {
						opt.$el.enabled();
					}
				})
			}
			if (this.timers[name]) {
				timer = this.timers[name];
			} else {
				function Timer(name, opt) {
					this.tid = null;
					this.name = name;
					this.timeout = this._timeout = opt.timeout;
					(opt.type == 1) && this.init(opt);
				}
				Timer.prototype = {
					init: function (opt) {
						var me = this;
						opt.$el[val](opt.initial);
						opt.$el.on(tap, function () {
							opt.send(function (result) {
								if (!result) {
									console.warn('smallPage-countdown:未配置验证码请求地址');
								}
								me.tick(function (rest) {
									var txt = rest ? opt.sending.replace('*rest*', rest) : opt.resend;
									if (rest) {
										opt.$el.disabled();
									} else {
										opt.$el.enabled();
									}
									opt.$el[val](txt);
								});
							});
						});
					},
					reset: function () {
						this.timeout = this._timeout;
					},
					tick: function (fun) {
						var me = this;
						var tick = function () {
							me.timeout -= 1;
							fun && fun(me.timeout);
							if (me.timeout <= 0) {
								me.clearInterval();
								me.reset();
							}
						}
						this.tid && clearInterval(this.tid);
						this.tid = setInterval(tick, 1000);
						tick();
					},
					clearInterval: function () {
						clearInterval(this.tid);
					}
				}
				timer = new Timer(name, opt);
				this.timers[name] = timer;
			}
			!opt.type &&
				timer.tick(function (rest) {
					ticker && ticker(rest);
				});
		},
		//自动验证码事件
		captchaEvent: function () {
			$(document).on(tap, '[data-captcha]', function () {
				this.src += Math.random();
			})
		},
		ajax: function (obj) {
			//todo
		},
		//自定义对话框，待改善
		customAlert: function (opt) {
			/*
				opt:{
					modal:'<dom>'||'#modal',
					body:'<dom>'||'#modal .alert',
					btns:[{
						el:'<dom>',
						tap:function(){}||this.close,
					}],
					render:function(){//渲染对话框}
				}
			*/
			var config = win.smallPage.customAlert.config || null;
			var Alert = function (opt) {
				var me = this;
				opt.modal = opt.modal ? $(opt.modal) : $('#modal');
				opt.body = opt.body ? $(opt.body) : $('#modal .alert');
				opt.content = opt.content ? $(opt.content) : $('#modal .alert-msg');
				opt.btns = opt.btns || (opt.name ? config[opt.name].btns : opt.btns);
				opt.btns = opt.btns ? !opt.btns instanceof Array ? [opt.btns] : opt.btns : [{
					el: $('.btn', opt.modal),
					tap: function () {
						return me.close();
					}
				}];
				opt.render = opt.render ? opt.render : (opt.name ? function () {
					config[opt.name].render(opt)
				} : function () { });
				this.opt = opt;
				this.bindEvent();
			}
			Alert.prototype = {
				show: function () {
					this.opt.modal.show();
					this.opt.body.show();
					opt.content.text(this.opt.msg || '');
					typeof this.opt.render === 'function' && this.opt.render();
					return this;
				},
				bindEvent: function () {
					var me = this;
					$.each(this.opt.btns, function (i, item) {
						item.el = item.el ? $(item.el) : $('.btn', me.opt.modal);
						item.tap = item.tap || me.close;
						item.el.on(tap, function () {
							item.tap(me);
						});
					});
				},
				close: function () {
					this.opt.modal.hide();
					this.opt.body.hide();
					return false;
				},
			}
			return (new Alert(opt)).show();
		},
		//弹窗
		popup: function (v) {
			if (typeof v !== 'string') v = JSON.stringify(v);
			var $pop = $('.popup').length ? $('.popup') : $('\
			<div class="popup">\
				<style>.popup{position:fixed;left:0;top:0;display:none;width:100%;height:100%;background-color:rgba(0,0,0,0.65);z-index:1000}.popup-con{position:absolute;left:0;right:0;top:28%;overflow:hidden;width:70%;margin:0 auto;background-color:#fff;border-radius:.2rem}.popup-con p{padding:.6rem .3rem;border-bottom:1px solid #ccc;color:#333;font:bold .4rem/.7rem "Microsoft YaHei";text-align:center;word-break:break-all}.popup-con div{color:#319aff;font:normal .4rem/1.3rem "Microsoft YaHei";text-align:center}</style>\
				<div class="popup-con">\
					<p>提示信息</p>\
					<div>确定</div>\
				</div>\
			</div>');
			$('div', $pop).on(tap, function () {
				$pop.hide();
			});
			$('p', $pop).text(v);
			$(document.body).append($pop);
			$pop.show();
		},
		//loading
		loading: function (show, timeout) {
			show = show !== false;
			//10秒自动消失
			timeout = timeout || 10000;
			var me = this;
			var $loading = $('#smallPage-loading');
			if (!$loading.length) {
				$loading = $('\
					<div class="loading" id="smallPage-loading">\
					<style>.loading{position:fixed;display:none;left:0;top:0;width:100%;height:100%;background-color:rgba(0,0,0,0.7);z-index:900}.loading div{position:absolute;left:0;right:0;top:0;bottom:0;width:.8rem;height:.8rem;margin:auto;background:url("data:image/gif;base64,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") no-repeat center center;-ms-background-size:100% 100%;background-size:100% 100%}</style>\
					<div></div>\
				</div>');
				$(document.body).append($loading);
			}
			show ? $loading.show() : $loading.hide();
			this.loadingTid && clearTimeout(this.loadingTid);
			this.loadingTid = setTimeout(function () {
				me.loading(false);
			}, timeout);
		},
		//验证
		valids: function () {
			$(document).on(tap, '[data-submit]', function (e) {
				var $form_selector = $($(e.target).attr('data-submit'));
				var pass = this.validForm($form_selector);
				if (pass) {
					var data = $form_selector.getFormJson();
					if (smallPage.mode === 'dev') {
						$form_selector.saveForm(formname);
					}
					$(e.target).triggerHandler('next', data);
				} else {
					return false;
				}
			}.bind(this));
		},
		validForm: function ($form) {
			var msgs = [];
			var self = this;
			$('[data-valid]', $form).each(function (i, item) {
				var result = self.valid($(item));
				if (!result.pass) {
					msgs.push(result.msg);
				}
			});
			if (msgs.length) {
				self.popup(msgs[0]);
				return false;
			}
			return true;
		},
		valid: function ($ipt) {
			var valid = $ipt.attr('data-valid');
			var value = $ipt.val();
			var result = {
				pass: true,
				msg: ''
			};
			if (!valids[valid]) {
				throw Error('验证[' + valid + ']未实现！');
			}
			for (var i = 0; i < valids[valid].length; i++) {
				var item = valids[valid][i];
				result.msg = item.msg;
				var fun = null;
				for (var o in item) {
					if (o === 'msg') continue;
					fun = o;
				}
				switch (fun) {
					case 'rule':
						result.pass = item.rule.test(value);
						break;
					case 'fun':
						result.pass = item.fun(value);
						break;
					default:
						result.pass = valids.normal[fun]($ipt, item[fun]);
				}
				if (!result.pass) {
					return result;
				}
			}
			return result;
		},
		addValids: function (obj) {
			for (var o in obj) {
				valids[o] = obj[o];
			}
		},
		hashEvent: function () {
			if (!window.onhashchange) window.onhashchange = function (e) {
				var page = location.hash.replace('#', '');
				page = page || '_';
				var $page = $('[data-page=' + page + ']');
				if (!$page.length) return false;
				$('[data-page]').hide();
				$page.show();
			}
			window.onhashchange();
		},
		goPage: function (page) {
			var hash = location.hash.replace('#', '');
			if (hash == page) return false;
			location.hash = "#" + page;
		},
		getParamJson: function (search) {
			//可接受两个参数
			//无参数时默认返回window.location.search 转换成JSON后的对象
			//1个参数时把此参数当成search看待
			//对多个同名的key不能用.
			var obj = {};
			search = search ? search.replace(/^([^\?]*)\?/, '?') : window.location.search;
			search = search.replace(/^\?/g, '');
			if (!search) return {};
			var arr = search.replace(/^\?/g, '').replace(/\#.*/g, '').split('&');
			for (var i = 0; i < arr.length; i++) {
				var tmp = arr[i].split('=');
				obj[tmp[0]] = obj[tmp[0]] ? (obj[tmp[0]] instanceof Array) ? obj[tmp[0]].concat(tmp[1]) : [obj[tmp[0]], tmp[1]] : tmp[1];
				obj[tmp[0]] = decodeURIComponent(obj[tmp[0]]);
			}
			return obj;
		},
		autoRun: function () {
			var auto = this.auto;
			for (var i = 0; i < auto.length; i++) {
				this[auto[i]] && this[auto[i]]();
			}
		},
		autoError: function () {
			var result = $('input[name=result]').val();
			var msg = $('input[name=msg]').val();
			if ((result === 'error' || result === 'false') && $.trim(msg)) {
				this.popup(msg);
			}
		},
		//以下功能处于测试阶段，大部分将是可有可无的功能
		//输入框不被键盘遮挡
		showInput: function () {
			$('[data-showInput]').on('focus', function () {
				var top = $(this).position().top - window.scrollY;
				$(document.documentElement).css({
					transition: '0.3s',
					transform: 'translateY(' + -top + 'px)'
				});
			}).on('blur', function () {
				$(document.documentElement).css({
					transform: 'translateY(0)'
				});
			});
		},
		//将图片或图片URL转为Base64编码
		//@image可以是img 元素或图片的URL,
		//@callback 是回调 ，返回一个图片的base64编码，当传入图片时可直接返回base64编码
		//@outputFormat 是图片的格式，默认‘image/png’
		convertImgToBase64: function (image, callback, outputFormat) {
			var canvas = document.createElement('CANVAS'),
				ctx = canvas.getContext('2d'),
				img = image instanceof HTMLImageElement ? image : new Image;
			if (typeof image === 'string') {
				var url = image;
				img.crossOrigin = 'Anonymous';
				img.onload = getDataURL;
				img.src = url;
			} else {
				return getDataURL();
			}
			function getDataURL() {
				canvas.height = img.height;
				canvas.width = img.width;
				ctx.drawImage(img, 0, 0);
				var dataURL = canvas.toDataURL(outputFormat || 'image/png');
				callback && callback(dataURL);
				canvas = null;
				return dataURL;
			}
		}
	}
	$.extend($.fn, {
		addIpts: function (opt, opt2) {
			if (smallPage.getType(opt) === 'string') opt = [{
				name: opt,
				value: opt2
			}];
			if (smallPage.getType(opt) === 'object') opt = [opt];
			var $ipts = $();
			$.each(opt, function (i, item) {
				$ipts = $ipts.add($('<input type="hidden" name="' + item.name + '" value="' + item.value + '">'));
			});
			$(this).append($ipts);
		},
		getFormJson: function (opts) {
			/*
			 //此方法需要前端严格按照表单元素name或id属性赋值
			 //当name中有[]时采用数组形式,无[]无时用字符串方式
			 //opts:额外的另类的设置,如下
			 //opts:{checkbox:{boolean:true}}   boolean:指checked用1记录,其余用0表示,全记录.
			 */
			opts = opts || {
				checkbox: {
					boolean: false
				}
			};
			var $this=$(this);
			var dom=$this[0];
			var tmp = {};
			var data = {};
			var $forms=$('select,textarea,input:not([type=checkbox])',this);
			var $checkboxes = opts.checkbox.boolean ? $("[type=checkbox]", this) : $("[type=checkbox]:checked", this);
			if (dom.tagName === 'INPUT' || dom.tagName === 'SELECT' || dom.tagName === 'TEXTAREA'){
				if(dom.type==='checkbox'){
					$checkboxes=$this;
				}else{
					$forms=$this;
				}
			}
			function setValue(name, value) {
				if (tmp[name] === "array") {
					data[name].push(value);
				} else if (tmp[name] === "string") {
					data[name] += ("," + value);
				} else {
					var isArray = /\[\]$/.test(name);
					tmp[name] = isArray ? "array" : "string";
					data[name] = isArray ? [value] : value;
				}
			}
			$forms.each(function () {
				var name = (this.name || this.id);
				var value = $(this).val();
				setValue(name, value);
			});
			$checkboxes.each(function () {
				var name = (this.name || this.id);
				var value = opts.checkbox.boolean ? this.checked ? 1 : 0 : this.value;
				setValue(name, value);
			});
			return data;
		},
		//测试阶段,并未完善
		saveForm: function (name) {
			var data = $(this).getFormJson();
			sessionStorage.setItem(name || 'form', JSON.stringify(data));
		},
		//填写表单
		fillForm: function (name, data) {
			if (typeof name === 'object') data = name;
			data = data || sessionStorage.getItem(name || 'form');
			data = JSON.parse(data);
			var $this = $(this);
			for (var name in data) {
				$ipt = $('[name=' + name + ']', $this);
				if (!$ipt.length) $ipt = $('#' + name, $this);
				$ipt.val() || $ipt.val(data[name]);
			}
		},
		//使用时需要加入样式 .disabled{pointer-events:none}
		disabled: function () {
			$(this).addClass('disabled');
			$(this).css('pointerEvents', 'none');
		},
		enabled: function () {
			$(this).removeClass('disabled');
			$(this).css('pointerEvents', 'initial');
		},
		//提交表单
		//url: 要提交的位置，不传url时获取当前元素的action属性或有action属性的祖宗的属性值
		//data:要传入的数据，当页面数据不全时建议传入此参数
		submitForm: function (url, data) {
			var $this = $(this);
			var $form = $this.is('[action]') ? $this : $this.closest('[action]');
			if (typeof url !== 'string') {
				data = url;
				url = null;
			}
			data = data || $form.getFormJson();
			url = url || $form.attr('action');
			var obj = (function () {
				var obj = [];
				for (var name in data) {
					if (smallPage.getType(data[name]) === 'array') {
						for (var i = 0; i < data[name].length; i++) {
							obj.push({ name: name, value: data[name][i] });
						}
					} else {
						obj.push({ name: name, value: data[name] });
					}
				}
				return obj;
			})()
			var $nform = $('<form method="post" action="' + url + '">');
			$nform.addIpts(obj);
			$nform.submit();
		}
	});
	$.extend($, {
		loadScript: $.getScript || function (url, callback) {
			var script = document.createElement("script");
			script.type = "text/javascript";
			if (script.readyState) {
				script.onreadystatechange = function () {
					if (script.readyState == "loaded" || script.readyState == "complete") {
						script.onreadystatechange = null;
						callback();
					}
				}
			} else {
				script.onload = function () {
					callback();
				}
			}
			script.src = url;
			document.getElementsByTagName("head")[0].appendChild(script);
		}
	});
}(window, Zepto || jQuery);

if (typeof define === "function" && define.amd) {
	define("smallPage", [$], function ($) {
		return smallPage;
	});
}