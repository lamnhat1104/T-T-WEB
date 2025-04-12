<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/8/2025
  Time: 11:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="vn.edu.hcmuaf.fit.doancuoiki.model.UserInfo" %>
<%@ page import="vn.edu.hcmuaf.fit.doancuoiki.model.User" %>
<script>
    window.fbAsyncInit = function () {
        FB.init({
            appId: '1222492126105891',
            cookie: true,
            xfbml: true,
            version: 'v22.0'
        });
        FB.AppEvents.logPageView();
    };

    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s);
        js.id = id;
        js.src = "https://connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    function loginWithFacebook() {
        FB.login(function (response) {
            if (response.status === 'connected') {
                getUserInfo(response.authResponse.accessToken);
            } else {
                alert("❌ Đăng nhập không thành công hoặc người dùng đã từ chối.");
            }
        }, { scope: 'public_profile,email' });
    }

    function getUserInfo(accessToken) {
        FB.api('/me', { fields: 'id,name,email' }, function (response) {
            if (response && !response.error) {
                document.getElementById('user-info').innerHTML = `
                    <div class="auth-form__welcome">
                        <p>👋 Chào, <strong>${response.name}</strong></p>
                        <p>Email: ${response.email}</p>
                    </div>
                `;
                sendDataToServer(response.id, response.name, response.email, accessToken);
            } else {
                alert("Không thể lấy thông tin người dùng.");
            }
        });
    }

    function sendDataToServer(id, name, email, accessToken, avatar) {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "saveUser.jsp", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // Sau khi saveUser.jsp xử lý xong, chuyển hướng về trang chủ
                window.location.href = 'index.jsp';
            }
        };
        var data = "id=" + encodeURIComponent(id)
            + "&name=" + encodeURIComponent(name)
            + "&email=" + encodeURIComponent(email)
            + "&accessToken=" + encodeURIComponent(accessToken)
            + "&avatar=" + encodeURIComponent(avatar);
        xhr.send(data);
    }
</script>

<a href="javascript:void(0);" onclick="loginWithFacebook()" class="auth-form__socials--facebook btn btn__size-s btn--with-icon">
    <i class="auth-form__socials-icon fa-brands fa-square-facebook"></i>
    <span class="auth-form__socials-title">
        Đăng nhập với Facebook
    </span>
</a>

<div id="user-info"></div>

