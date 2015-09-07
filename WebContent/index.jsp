<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>Florisuga</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="./css/bootstrap.min.css" rel="stylesheet">
		<link href="./css/style.css" rel="stylesheet">
		<script src="./js/jquery-1.11.1.min.js"></script>
		<script src="./js/bootstrap.min.js"></script>
		<script src="./js/florisuga.js" style="text/javascript"></script>
	</head>
<body>
<div class="container" style="margin-top:20px;">

<div class="row">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		<form role="form" action="RegisterServlet" method="post">
			<h2>Sign Up <small>It's free and always will be.</small></h2>
			<hr class="colorgraph">
			
			<!-- User name -->
			<div class="form-group has-error" id="user_error" style="display:none;">
				<label class="control-label" for="inputError">用户名需在6-20个字符之间</label>
			</div>
			<div id="name_form" class="form-group">
				<input type="text" name="username" id="username" onblur="validate(validateUsername('username'), 'user_error', 'name_form');" class="form-control input-lg" placeholder="用户名" tabindex="3">
			</div>
			
			<!-- Email -->
			<div class="form-group has-error" id="email_error" style="display:none;">
				<label class="control-label" for="inputError">邮箱地址不正确</label>
			</div>
			<div id="email_form" class="form-group">
				<input type="email" name="email" id="email" onblur="validate(validateEmail('email'), 'email_error', 'email_form');" class="form-control input-lg" placeholder="邮箱" tabindex="4">
			</div>
			
			<!-- Password -->
			<div class="form-group has-error" id="password_error" style="display:none;">
				<label class="control-label" for="inputError">请输入6-128位的密码, 两次密码需一致</label>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
					<div id="password_form" class="form-group">
						<input type="password" name="password" id="password" onblur="validate(validatePass('password'), 'password_error', 'password_form');" class="form-control input-lg" placeholder="密码(密码不少于6位)" tabindex="5">
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
					<div id="password_confirmation_form" class="form-group">
						<input type="password" name="password_confirmation" id="password_confirmation" onblur="validate(validateConfirmPass('password', 'password_confirmation'), 'password_error', 'password_confirmation_form');" class="form-control input-lg" placeholder="确认密码" tabindex="6">
					</div>
				</div>
			</div>
			
			<!-- Agree Terms and Conditions -->
			<div class="form-group has-error" id="terms_error" style="display:none;">
				<label class="control-label" for="inputError">需要同意服务条款与隐私协议</label>
			</div>
			<div class="row">
				<div class="col-xs-4 col-sm-3 col-md-3 col-lg-3">
					<span class="button-checkbox">
						<button type="button" class="btn" data-color="info" tabindex="7">我同意</button>
						<input type="checkbox" name="terms" id="terms" class="hidden" value="1">
					</span>
				</div>
				<div class="col-xs-8 col-sm-9 col-md-9 col-lg-9">
					 点击 <strong class="label label-primary">注册</strong>，您将会同意网站的 <a href="#" data-toggle="modal" data-target="#t_and_c_m">服务条款</a> 和 <a href="#" data-toggle="modal" data-target="#t_and_c_m">隐私协议</a>。
				</div>
			</div>
			
			<hr class="colorgraph">
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
					<input type="submit" value="注册" onclick="return validateSubmit();" class="btn btn-primary btn-block btn-lg" tabindex="7">
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
					<a href="#" class="btn btn-success btn-block btn-lg">登录</a>
				</div>
			</div>
		</form>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="t_and_c_m" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">Terms and Conditions</h4>
			</div>
			<div class="modal-body">
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">I Agree</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</div>
<script type="text/javascript">
$(function () {
    $('.button-checkbox').each(function () {

        // Settings
        var $widget = $(this),
            $button = $widget.find('button'),
            $checkbox = $widget.find('input:checkbox'),
            color = $button.data('color'),
            settings = {
                on: {
                    icon: 'glyphicon glyphicon-check'
                },
                off: {
                    icon: 'glyphicon glyphicon-unchecked'
                }
            };

        // Event Handlers
        $button.on('click', function () {
            $checkbox.prop('checked', !$checkbox.is(':checked'));
            $checkbox.triggerHandler('change');
            updateDisplay();
        });
        $checkbox.on('change', function () {
            updateDisplay();
        });

        // Actions
        function updateDisplay() {
            var isChecked = $checkbox.is(':checked');

            // Set the button's state
            $button.data('state', (isChecked) ? "on" : "off");

            // Set the button's icon
            $button.find('.state-icon')
                .removeClass()
                .addClass('state-icon ' + settings[$button.data('state')].icon);

            // Update the button's color
            if (isChecked) {
                $button
                    .removeClass('btn-default')
                    .addClass('btn-' + color + ' active');
            }
            else {
                $button
                    .removeClass('btn-' + color + ' active')
                    .addClass('btn-default');
            }
        }

        // Initialization
        function init() {

            updateDisplay();

            // Inject the icon if applicable
            if ($button.find('.state-icon').length == 0) {
                $button.prepend('<i class="state-icon ' + settings[$button.data('state')].icon + '"></i>');
            }
        }
        init();
    });
});
</script>
</body>
</html>