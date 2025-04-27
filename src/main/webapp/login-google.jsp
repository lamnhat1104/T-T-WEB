<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/27/2025
  Time: 4:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập bằng Google</title>
    <script src="https://accounts.google.com/gsi/client" async defer></script>
    <script>
        function handleCredentialResponse(response) {
            console.log("ID Token: " + response.credential);

            // Gửi ID Token về server để xác thực (ví dụ dùng fetch POST)
            fetch('verify-token', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: 'id_token=' + response.credential
            }).then(res => res.text())
                .then(data => {
                    alert('Đăng nhập thành công: ' + data);
                    // Có thể redirect hoặc xử lý tùy ý
                });
        }
    </script>
</head>
<body>

<div id="g_id_onload"
     data-client_id="YOUR_CLIENT_ID.apps.googleusercontent.com"
     data-callback="handleCredentialResponse"
     data-auto_prompt="false">
</div>

<div class="g_id_signin"
     data-type="standard"
     data-size="large"
     data-theme="outline"
     data-text="sign_in_with"
     data-shape="rectangular"
     data-logo_alignment="left">
</div>

</body>
</html>
