<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập bằng Google</title>
    <script src="https://accounts.google.com/gsi/client" async defer></script>
    <link rel="stylesheet" href="../assets/fonts/fontawesome-free-6.6.0-web/fontawesome-free-6.6.0-web/css/all.css">

    <style>
        .google-login-btn {
            display: inline-block;
            padding: 10px 159px;
            background-color: white;
            color: black;
            text-decoration: none;
            border-radius: 4px;
            font-size: 12px;
            border: none;
            cursor: pointer;

        }

    </style>


    <script>
        let googleClient;

        window.onload = function () {
            googleClient = google.accounts.oauth2.initTokenClient({
                client_id: '187639617393-vnhadjbb0kqashuqki000k1dphrtn4au.apps.googleusercontent.com',
                scope: 'profile email',
                callback: (tokenResponse) => {
                    fetch('https://www.googleapis.com/oauth2/v3/userinfo', {
                        headers: {
                            'Authorization': 'Bearer ' + tokenResponse.access_token
                        }
                    })
                        .then(res => res.json())
                        .then(user => {
                            console.log("Thông tin người dùng từ Google:", user);

                            window.location.href = 'index.jsp';
                        });
                }
            });
        };

        function loginWithGoogle() {
            googleClient.requestAccessToken();
        }
    </script>
</head>
<body>

<!-- Nút đăng nhập Google -->
<a href="javascript:void(0);" class="google-login-btn" onclick="loginWithGoogle()">
    Đăng nhập với Google
</a>

</body>
</html>
