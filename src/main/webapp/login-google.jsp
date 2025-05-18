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
                            // Tạo form và gửi về saveUserGoogle.jsp
                            const form = document.createElement("form");
                            form.method = "POST";
                            form.action = "saveUserGoogle.jsp";

                            const emailInput = document.createElement("input");
                            emailInput.type = "hidden";
                            emailInput.name = "email";
                            emailInput.value = user.email;

                            const nameInput = document.createElement("input");
                            nameInput.type = "hidden";
                            nameInput.name = "fullName";
                            nameInput.value = user.name;

                            form.appendChild(emailInput);
                            form.appendChild(nameInput);
                            document.body.appendChild(form);
                            form.submit();
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
