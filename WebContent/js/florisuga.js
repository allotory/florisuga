
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
		return false;
	} else {
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

// 提交校验
function validateSubmit() {
	var isUsernameChecked = validateUsername("username");
	var isEmailChecked = validateEmail("email");
	var isPasswordChecked = validatePass("password");
	var isConfirmPassChecked = validateConfirmPass("password", "password_confirmation");
	var isTermsChecked = validateTerms("terms");
	
	if(!(isUsernameChecked && isEmailChecked && isPasswordChecked && isConfirmPassChecked)) {
		if(isUsernameChecked) {
			hiddenItem("user_error");
			modAttribute("name_form", "form-group has-success");
		}else {
			showItem("user_error");
			modAttribute("name_form", "form-group has-error");
		}
		
		if(isEmailChecked) {
			hiddenItem("email_error");
			modAttribute("email_form", "form-group has-success");
		}else {
			showItem("email_error");
			modAttribute("email_form", "form-group has-error");
		}
		
		if(isPasswordChecked) {
			hiddenItem("password_error");
			modAttribute("password_form", "form-group has-success");
		}else {
			showItem("password_error");
			modAttribute("password_form", "form-group has-error");
		}
		
		if(isConfirmPassChecked) {
			hiddenItem("password_error");
			modAttribute("password_confirmation_form", "form-group has-success");
		}else {
			showItem("password_error");
			modAttribute("password_confirmation_form", "form-group has-error");
		}
		
		if(isTermsChecked) {
			hiddenItem("terms_error");
		}else {
			showItem("terms_error");
		}
		
		return false;
	}
	
	return true;
}