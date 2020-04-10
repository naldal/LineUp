!function (t, e) { "object" == typeof exports && "object" == typeof module ? module.exports = e() : "function" == typeof define && define.amd ? define([], e) : "object" == typeof exports ? exports.bulmaSteps = e() : t.bulmaSteps = e() }("undefined" != typeof self ? self : this, function () { return function (n) { var s = {}; function i(t) { if (s[t]) return s[t].exports; var e = s[t] = { i: t, l: !1, exports: {} }; return n[t].call(e.exports, e, e.exports, i), e.l = !0, e.exports } return i.m = n, i.c = s, i.d = function (t, e, n) { i.o(t, e) || Object.defineProperty(t, e, { configurable: !1, enumerable: !0, get: n }) }, i.n = function (t) { var e = t && t.__esModule ? function () { return t.default } : function () { return t }; return i.d(e, "a", e), e }, i.o = function (t, e) { return Object.prototype.hasOwnProperty.call(t, e) }, i.p = "", i(i.s = 0) }([function (t, e, n) { "use strict"; Object.defineProperty(e, "__esModule", { value: !0 }); var s = n(1), o = n(2), r = Object.assign || function (t) { for (var e = 1; e < arguments.length; e++) { var n = arguments[e]; for (var s in n) Object.prototype.hasOwnProperty.call(n, s) && (t[s] = n[s]) } return t }, l = function () { function s(t, e) { for (var n = 0; n < e.length; n++) { var s = e[n]; s.enumerable = s.enumerable || !1, s.configurable = !0, "value" in s && (s.writable = !0), Object.defineProperty(t, s.key, s) } } return function (t, e, n) { return e && s(t.prototype, e), n && s(t, n), t } }(); var a = Symbol("onStepsPrevious"), u = Symbol("onStepsNext"), i = function (t) { function i(t) { var e = 1 < arguments.length && void 0 !== arguments[1] ? arguments[1] : {}; !function (t, e) { if (!(t instanceof e)) throw new TypeError("Cannot call a class as a function") }(this, i); var n = function (t, e) { if (!t) throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); return !e || "object" != typeof e && "function" != typeof e ? t : e }(this, (i.__proto__ || Object.getPrototypeOf(i)).call(this)); if (n.element = "string" == typeof t ? document.querySelector(t) : t, !n.element) throw new Error("An invalid selector or non-DOM node has been provided."); return n._clickEvents = ["click"], n.options = r({}, o.a, e), n[a] = n[a].bind(n), n[u] = n[u].bind(n), n.init(), n } return function (t, e) { if ("function" != typeof e && null !== e) throw new TypeError("Super expression must either be null or a function, not " + typeof e); t.prototype = Object.create(e && e.prototype, { constructor: { value: t, enumerable: !1, writable: !0, configurable: !0 } }), e && (Object.setPrototypeOf ? Object.setPrototypeOf(t, e) : t.__proto__ = e) }(i, s["a"]), l(i, [{ key: "init", value: function () { this._id = "bulmaSteps" + (new Date).getTime() + Math.floor(Math.random() * Math.floor(9999)), this.steps = this.element.querySelectorAll(this.options.selector), this.contents = this.element.querySelectorAll(this.options.selector_content), this.previous_btn = this.element.querySelector(this.options.previous_selector), this.next_btn = this.element.querySelector(this.options.next_selector), [].forEach.call(this.steps, function (t, e) { t.setAttribute("data-step-id", e) }), this.steps && this.steps.length && (this.activate_step(0), this.updateActions(this.steps[0])), this._bindEvents(), this.emit("bulmasteps:ready", this.element.value) } }, { key: "_bindEvents", value: function () { var n = this; null != this.previous_btn && this._clickEvents.forEach(function (t) { n.previous_btn.addEventListener(t, n[a], !1) }), null != this.next_btn && this._clickEvents.forEach(function (t) { n.next_btn.addEventListener(t, n[u], !1) }), this.options.stepClickable && [].forEach.call(this.steps, function (t, e) { n._clickEvents.forEach(function (t) { for (; e > n.current_id;)n[u](t); for (; e < n.current_id;)n[a](t) }) }) } }, { key: a, value: function (t) { t.preventDefault(), t.target.getAttribute("disabled") || this.previous_step() } }, { key: u, value: function (t) { t.preventDefault(), t.target.getAttribute("disabled") || this.next_step() } }, { key: "get_current_step_id", value: function () { for (var t = 0; t < this.steps.length; t++) { var e = this.steps[t]; if (e.classList.contains(this.options.active_class)) return parseInt(e.getAttribute("data-step-id")) } return null } }, { key: "updateActions", value: function (t) { var e = parseInt(t.getAttribute("data-step-id")); 0 == e ? (null != this.previous_btn && this.previous_btn.setAttribute("disabled", "disabled"), null != this.next_btn && this.next_btn.removeAttribute("disabled", "disabled")) : e == this.steps.length - 1 ? (null != this.previous_btn && this.previous_btn.removeAttribute("disabled", "disabled"), null != this.next_btn && this.next_btn.setAttribute("disabled", "disabled")) : (null != this.previous_btn && this.previous_btn.removeAttribute("disabled", "disabled"), null != this.next_btn && this.next_btn.removeAttribute("disabled", "disabled")) } }, { key: "next_step", value: function () { var t = this.get_current_step_id(); if (null != t) { var e = t + 1, n = []; if (void 0 !== this.options.beforeNext && null != this.options.beforeNext && this.options.beforeNext && (n = this.options.beforeNext(t)), this.emit("bulmasteps:before:next", t), void 0 === n && (n = []), 0 < n.length) { this.emit("bulmasteps:errors", n); for (var s = 0; s < n.length; s++)void 0 !== this.options.onError && null != this.options.onError && this.options.onError && this.options.onError(n[s]) } else e >= this.steps.length - 1 && (void 0 !== this.options.onFinish && null != this.options.onFinish && this.options.onFinish && this.options.onFinish(t), this.emit("bulmasteps:finish", t)), e < this.steps.length && (this.complete_step(t), this.activate_step(e)) } } }, { key: "previous_step", value: function () { var t = this.get_current_step_id(); null != t && (this.uncomplete_step(t - 1), this.activate_step(t - 1)) } }, { key: "activate_step", value: function (t) { this.updateActions(this.steps[t]); for (var e = 0; e < this.steps.length; e++) { this.steps[e] != this.steps[t] && this.deactivate_step(e) } this.steps[t].classList.add(this.options.active_class), void 0 !== this.contents[t] && this.contents[t].classList.add(this.options.active_class), void 0 !== this.options.onShow && null != this.options.onShow && this.options.onShow && this.options.onShow(t), this.emit("bulmasteps:step:show", t) } }, { key: "complete_step", value: function (t) { this.steps[t].classList.add(this.options.completed_class), this.emit("bulmasteps:step:completed", t) } }, { key: "uncomplete_step", value: function (t) { this.steps[t].classList.remove(this.options.completed_class), this.emit("bulmasteps:step:uncompleted", t) } }, { key: "deactivate_step", value: function (t) { this.steps[t].classList.remove(this.options.active_class), void 0 !== this.contents[t] && this.contents[t].classList.remove(this.options.active_class) } }], [{ key: "attach", value: function () { var t = 0 < arguments.length && void 0 !== arguments[0] ? arguments[0] : ".steps", e = 1 < arguments.length && void 0 !== arguments[1] ? arguments[1] : {}, n = new Array, s = document.querySelectorAll(t); return [].forEach.call(s, function (t) { setTimeout(function () { n.push(new i(t, e)) }, 100) }), n } }]), i }(); e.default = i }, function (t, e, n) { "use strict"; var s = function () { function s(t, e) { for (var n = 0; n < e.length; n++) { var s = e[n]; s.enumerable = s.enumerable || !1, s.configurable = !0, "value" in s && (s.writable = !0), Object.defineProperty(t, s.key, s) } } return function (t, e, n) { return e && s(t.prototype, e), n && s(t, n), t } }(); var i = function () { function e() { var t = 0 < arguments.length && void 0 !== arguments[0] ? arguments[0] : []; !function (t, e) { if (!(t instanceof e)) throw new TypeError("Cannot call a class as a function") }(this, e), this._listeners = new Map(t), this._middlewares = new Map } return s(e, [{ key: "listenerCount", value: function (t) { return this._listeners.has(t) ? this._listeners.get(t).length : 0 } }, { key: "removeListeners", value: function () { var e = this, t = 0 < arguments.length && void 0 !== arguments[0] ? arguments[0] : null, n = 1 < arguments.length && void 0 !== arguments[1] && arguments[1]; null !== t ? Array.isArray(t) ? name.forEach(function (t) { return e.removeListeners(t, n) }) : (this._listeners.delete(t), n && this.removeMiddleware(t)) : this._listeners = new Map } }, { key: "middleware", value: function (t, e) { var n = this; Array.isArray(t) ? name.forEach(function (t) { return n.middleware(t, e) }) : (Array.isArray(this._middlewares.get(t)) || this._middlewares.set(t, []), this._middlewares.get(t).push(e)) } }, { key: "removeMiddleware", value: function () { var e = this, t = 0 < arguments.length && void 0 !== arguments[0] ? arguments[0] : null; null !== t ? Array.isArray(t) ? name.forEach(function (t) { return e.removeMiddleware(t) }) : this._middlewares.delete(t) : this._middlewares = new Map } }, { key: "on", value: function (t, e) { var n = this, s = 2 < arguments.length && void 0 !== arguments[2] && arguments[2]; if (Array.isArray(t)) t.forEach(function (t) { return n.on(t, e) }); else { var i = (t = t.toString()).split(/,|, | /); 1 < i.length ? i.forEach(function (t) { return n.on(t, e) }) : (Array.isArray(this._listeners.get(t)) || this._listeners.set(t, []), this._listeners.get(t).push({ once: s, callback: e })) } } }, { key: "once", value: function (t, e) { this.on(t, e, !0) } }, { key: "emit", value: function (n, s) { var i = this, o = 2 < arguments.length && void 0 !== arguments[2] && arguments[2]; n = n.toString(); var r = this._listeners.get(n), l = null, a = 0, u = o; if (Array.isArray(r)) for (r.forEach(function (t, e) { o || (l = i._middlewares.get(n), Array.isArray(l) ? (l.forEach(function (t) { t(s, function () { var t = 0 < arguments.length && void 0 !== arguments[0] ? arguments[0] : null; null !== t && (s = t), a++ }, n) }), a >= l.length && (u = !0)) : u = !0), u && (t.once && (r[e] = null), t.callback(s)) }); -1 !== r.indexOf(null);)r.splice(r.indexOf(null), 1) } }]), e }(); e.a = i }, function (t, e, n) { "use strict"; e.a = { selector: ".step-item", selector_content: ".step-content", previous_selector: '[data-nav="previous"]', next_selector: '[data-nav="next"]', active_class: "is-active", completed_class: "is-completed", stepClickable: !1, beforeNext: null, onShow: null, onFinish: null, onError: null } }]).default });


$("#chkall").click(function () {
	if ($("#chkall").prop("checked")) {
		$("input[name=chk]").prop("checked", true);
	} else {
		$("input[name=chk]").prop("checked", false);
	}
});

$('#nickNameDiv').text('닉네임은 4글자 이상 입력해주세요.');
$('#nickNameDiv').css('color', '#d35400');
$('#nickNameDiv').css('font-size', '10pt');
$('#nickNameDiv').css('margin-top', '-9px');
$('#nickNameDiv').css('margin-bottom', '9px');
$('#nickNameDiv').css('margin-left', '150px');
$('#nickNameDiv').css('width', '300px');

let check = 0;
$('#nickname').focusout(function () {
	// alert("indi");
	$('#nickNameDiv').empty();
	if ($('#nickname').val() == "") {
		$('#nickNameDiv').text('필수 정보입니다.');
		$('#nickNameDiv').css('color', '#d35400');
		$('#nickNameDiv').css('font-size', '10pt');
		$('#nickNameDiv').css('margin-top', '-9px');
		$('#nickNameDiv').css('margin-bottom', '9px');
		$('#nickNameDiv').css('margin-left', '100px');
		$('#nickNameDiv').css('width', '300px');
	} else if ($('#nickname').val().length<4) {
		$('#nickNameDiv').text('닉네임은 4글자 이상 입력해주세요.');
		$('#nickNameDiv').css('color', '#d35400');
		$('#nickNameDiv').css('font-size', '10pt');
		$('#nickNameDiv').css('font-weight', 'bold');
		$('#nickNameDiv').css('margin-top', '-9px');
		$('#nickNameDiv').css('margin-bottom', '9px');
		$('#nickNameDiv').css('margin-left', '150px');
		$('#nickNameDiv').css('width', '300px');
	} else {
		$.ajax({
			type: 'POST',
			url: '/LineUp/member/loginCheckIndi',
			data: 'nickname=' + $('#nickname').val(),
			dataType: 'text',
			success: function (data) {
				if (data == 'exist') {
					check = 0;
					$('#nickNameDiv').text('중복된 닉네임 입니다.')
					$('#nickNameDiv').css('color', '#d35400');
					$('#nickNameDiv').css('font-size', '10pt')
					$('#nickNameDiv').css('margin-top', '-9px');
					$('#nickNameDiv').css('margin-bottom', '9px');
					$('#nickNameDiv').css('margin-left', '100px');
					$('#nickNameDiv').css('width', '300px');
				} else if (data == 'non_exist') {
					check = 1;
					$('#nickNameDiv').text("사용 가능한 닉네임 입니다.");
					$('#nickNameDiv').css('color', '#2980b9');
					$('#nickNameDiv').css('font-size', '10pt')
					$('#nickNameDiv').css('margin-top', '-9px');
					$('#nickNameDiv').css('margin-bottom', '9px');
					$('#nickNameDiv').css('margin-left', '100px');
					$('#nickNameDiv').css('width', '360px');
				}
			}
		});
	}
});


let num = 0;

$('#ppwdDiv').text('영문, 숫자 혼합하여 6~20자리 이내로 작성하십시오');
$('#ppwdDiv').css('color', '#d35400');
$('#ppwdDiv').css('font-size', '14px');
$('#ppwdDiv').css('margin-top', '-12px');
$('#ppwdDiv').css('margin-bottom', '3px');
$('#ppwdDiv').css('margin-left', '200px');
$('#ppwdDiv').css('width', '300px');
 
$('#pwd').focusout(function(){
   var reg_pwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
   if(!reg_pwd.test($('#pwd').val())){
      $('#ppwdDiv').text('영문, 숫자 혼합하여 6~20자리 이내로 작성하십시오');
      $('#ppwdDiv').css('color', '#d35400');
      $('#ppwdDiv').css('font-size', '14px');
      $('#ppwdDiv').css('margin-top', '-12px');
      $('#ppwdDiv').css('margin-bottom', '3px');
      $('#ppwdDiv').css('margin-left', '200px');
      $('#ppwdDiv').css('width', '300px');
   } else {
      $('#ppwdDiv').empty();
   }          
});


$('#repwd').focusout(function(){
	$('#pwdDiv').empty();
	if ($('#pwd').val() == "" || $('#repwd').val() == "") {
		$('#pwdDiv').text('비밀번호를 확인해주세요.');
		$('#pwdDiv').css('color', '#d35400');
		$('#pwdDiv').css('font-size', '10pt');
		$('#pwdDiv').css('margin-top', '-9px');
		$('#pwdDiv').css('margin-bottom', '9px');
		$('#pwdDiv').css('margin-left', '100px');
		$('#pwdDiv').css('width', '360px');
		
	} else if($('#pwd').val()!=$('#repwd').val()) {
		$('#pwdDiv').text('비밀번호가 일치하지 않습니다.');
		$('#pwdDiv').css('color', '#d35400');
		$('#pwdDiv').css('font-size', '10pt')
		$('#pwdDiv').css('margin-top', '-9px');
		$('#pwdDiv').css('margin-bottom', '9px');
		$('#pwdDiv').css('margin-left', '140px');
		$('#pwdDiv').css('width', '300px');
	}
});

// 이메일 중복 체크 시작
let checkId = 0;
$('#id').focusout(function(){
	$('#idDiv').empty();
	if ($('#id').val() == "") {
	    $('#idDiv').text('필수 정보입니다.')
	    $('#idDiv').css('font-size', '10pt')
	    $('#idDiv').css('color', 'red');
	    $('#idDiv').css('margin-top', '-9px');
	    $('#idDiv').css('margin-bottom', '9px');
	    $('#idDiv').css('margin-left', '150px');
	    $('#idDiv').css('width', '198px');
	} else {
	    $.ajax({
	        type: 'POST',
	        url: '/LineUp/member/loginCheck',
	        data: 'id=' + $('#id').val(),
	        dataType: 'text',
	        success: function (data) {
	            if (data == 'exist') {
	            	checkId = 0;
	                $('#idDiv').text('중복된 이메일(아이디) 입니다.')
	                $('#idDiv').css('font-size', '10pt')
	                $('#idDiv').css('color', 'red');
	                $('#idDiv').css('margin-top', '-9px');
	                $('#idDiv').css('margin-bottom', '9px');
	                $('#idDiv').css('margin-left', '184px');
	                $('#idDiv').css('width', '198px');

	            } else if (data == 'non_exist') {
	               var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	                if(!reg_email.test($('#id').val())) {
	                	checkId = 0;
	              $('#idDiv').text("이메일 양식에 맞지 않습니다.");
	              $('#idDiv').css('font-size', '10pt')
	              $('#idDiv').css('color', 'red');
	              $('#idDiv').css('margin-top', '-9px');
	              $('#idDiv').css('margin-bottom', '9px');
	              $('#idDiv').css('margin-left', '198px');
	              $('#idDiv').css('width', '170px');
	              } else {                       
	                	checkId = 1;
	                     $('#idDiv').text("사용 가능한 이메일(아이디) 입니다.");
	                     $('#idDiv').css('font-size', '10pt')
	                     $('#idDiv').css('color', 'blue');
	                     $('#idDiv').css('margin-top', '-9px');
	                     $('#idDiv').css('margin-bottom', '9px');
	                     $('#idDiv').css('margin-left', '198px');
	                     $('#idDiv').css('width', '219px');
	                }
	        }
	        }
	    });
	}
	
});

// 이메일 중복 체크 끝


$('#prev').click(function (e) {
	num = num + 1;
	if (num == 1) {
		if ($('#chk1').prop('checked') == false || $('#chk2').prop('checked') == false) {
//			alert("필수약관에 동의하셔야 합니다.");
			Swal.fire({
				  icon: 'error',
				  title: '필수약관에 동의하셔야 합니다'
			});

			num = num - 1;
			e.stopImmediatePropagation();
		}
	} else if (num == 2) {
		$('#pwdDiv').empty();
		$('#telDiv').empty();
		$('#idDiv').empty();
		$('#nickNameDiv').empty();
		
		if ($('#pwd').val() != $('#repwd').val()) {
			$('#pwdDiv').text('비밀번호가 일치하지 않습니다.');
			$('#pwdDiv').css('color', '#d35400');
			$('#pwdDiv').css('font-size', '10pt')
			$('#pwdDiv').css('margin-top', '-9px');
			$('#pwdDiv').css('margin-bottom', '9px');
			$('#pwdDiv').css('margin-left', '140px');
			$('#pwdDiv').css('width', '300px');
			num = num - 1;
			e.stopImmediatePropagation();
		} else if (check == 0) {
			$('#nickNameDiv').text('닉네임 중복확인을 해주세요.')
			$('#nickNameDiv').css('color', '#d35400');
			$('#nickNameDiv').css('font-size', '10pt')
			$('#nickNameDiv').css('margin-top', '-9px');
			$('#nickNameDiv').css('margin-bottom', '9px');
			$('#nickNameDiv').css('margin-left', '100px');
			$('#nickNameDiv').css('width', '360px');
			num = num - 1;
			e.stopImmediatePropagation();
		} else if (checkId == 0) {
			$('#idDiv').text('중복된 이메일이거나, 사용할 수 없는 이메일 형식입니다.')
			$('#idDiv').css('color', '#d35400');
			$('#idDiv').css('font-size', '10pt')
			$('#idDiv').css('margin-top', '-9px');
			$('#idDiv').css('margin-bottom', '9px');
			$('#idDiv').css('margin-left', '170px');
			$('#idDiv').css('width', '360px');
			num = num - 1;
			e.stopImmediatePropagation();
			
			
		} else if ($('#id').val() == "") {
			$('#idDiv').text('필수 정보입니다.');
			$('#idDiv').css('color', '#d35400');
			$('#idDiv').css('font-size', '10pt')
			$('#idDiv').css('margin-top', '-9px');
			$('#idDiv').css('margin-bottom', '9px');
			$('#idDiv').css('margin-left', '100px');
			$('#idDiv').css('width', '300px');
			num = num - 1;
			e.stopImmediatePropagation();
		} else if ($('#pwd').val() == "" || $('#repwd').val() == "") {
			$('#pwdDiv').text('비밀번호를 확인해주세요.');
			$('#pwdDiv').css('color', '#d35400');
			$('#pwdDiv').css('font-size', '10pt');
			$('#pwdDiv').css('margin-top', '-9px');
			$('#pwdDiv').css('margin-bottom', '9px');
			$('#pwdDiv').css('margin-left', '100px');
			$('#pwdDiv').css('width', '360px');
			num = num - 1;
			e.stopImmediatePropagation();
		} else if ($('#tel').val() == "") {
			$('#telDiv').text('필수 정보입니다.');
			$('#telDiv').css('color', '#d35400');
			$('#telDiv').css('font-size', '10pt')
			$('#telDiv').css('margin-top', '-9px');
			$('#telDiv').css('margin-bottom', '9px');
			$('#telDiv').css('margin-left', '100px');
			$('#telDiv').css('width', '300px');
			num = num - 1;
			e.stopImmediatePropagation();
		} else {
			Swal.fire({
	      		  position: 'top-end',
	      		  icon: 'success',
	      		  title: '이메일이 발송되었습니다!',
	      		  showConfirmButton: false,
	      		  timer: 1500
	        	});
			$.ajax({
				type: 'POST',
				url: '/LineUp/member/individual_register',
				data: $('#individual_form').serialize(),
				success: function () {
//					alert('회원가입을 축하합니다.');
					Swal.fire({
						  position: 'top-end',
						  icon: 'success',
						  title: '회원가입을 축하합니다',
						  showConfirmButton: false,
						  timer: 1500
					});
				},
				error: function (e) {
				}

			});
		}
	}
});

$('#load_Rst').load("Restaurant_register_copy.html");
