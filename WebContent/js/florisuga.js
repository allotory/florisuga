
// 组件显示隐藏
function showItem(id) {
	var item = document.getElementById(id);
	item.style.display = "block";
}
function hiddenItem(id) {
	var item = document.getElementById(id);
	item.style.display = "none";
}

// 修改属性
function modAttribute(id, attrib) {
	var item = document.getElementById(id);
	item.setAttribute("class", attrib);
}

// 校验
function validate(func, error, pid) {
	if(func) {
		hiddenItem(error);
		modAttribute(pid, "form-group has-success");
	}else {
		showItem(error);
		modAttribute(pid, "form-group has-error");
	}
}

// 校验用户姓名
function validateUsername(id) {
	var username = document.getElementById(id).value.trim();
	var reg = /^[a-zA-Z]{1}([a-zA-Z0-9]|[._]){5,19}$/;
	if (!reg.test(username)) {
		alert(false);
		return false;
	} else {
		alert(true);
		return true;
	}
}

// 校验邮箱
function validateEmail(id) {
	var email = document.getElementById(id).value.trim();
	var reg = /^[A-Za-zd]+([-_.][A-Za-zd]+)*@([A-Za-zd]+[-.])+[A-Za-zd]{2,5}$/;
	if (!reg.test(email)) {
		return false;
	} else {
		return true;
	}
}

// 校验密码
function validatePass(id) {
	var password = document.getElementById(id).value.trim();
	var reg = /^[a-zA-Z][a-zA-Z0-9_]{5,127}$/;
	if (!reg.test(password)) {
		return false;
	} else {
		return true;
	}
}

// 校验密码一致性
function validateConfirmPass(id, cid) {
	var password = document.getElementById(id).value.trim();
	var confirmPassword = document.getElementById(cid).value.trim();
	if ((password == "") | (confirmPassword == "")
			| (password != confirmPassword)) {
		return false;
	} else {
		return true;
	}
}

// 同意条款
function validateTerms(id) {
	var terms = document.getElementById(id);
	return terms.checked;
}