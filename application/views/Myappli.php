<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Shinerweb.come web push notification</title>
</head>
<body>
<h2>Firebase Web Push Notification by </h2>
<p id="token"></p>
<script src="https://www.gstatic.com/firebasejs/7.14.6/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/7.14.6/firebase-messaging.js"></script>
<script>
    var firebaseConfig = {
        apiKey: "AIzaSyCB1lCFYUt3bqjpYJ-XIXXxl6WmjVIsq7s",
        authDomain: "byloapp-7ddab.firebaseapp.com",
        projectId: "byloapp-7ddab",
        storageBucket: "byloapp-7ddab.appspot.com",
        messagingSenderId: "356426750460",
        appId: "1:356426750460:web:d4ff6976ef714f05c6fa79",
        measurementId: "G-BJ4052R85E"
    };
    firebase.initializeApp(firebaseConfig);
    const messaging=firebase.messaging();
    function IntitalizeFireBaseMessaging() {
        messaging
            .requestPermission()
            .then(function () {
                console.log("Notification Permission");
                return messaging.getToken();
            })
            .then(function (token) {
                console.log("Token : "+token);
                document.getElementById("token").innerHTML=token;
            })
            .catch(function (reason) {
                console.log(reason);
            });
    }
    messaging.onMessage(function (payload) {
        console.log(payload);
        const notificationOption={
            body:payload.notification.body,
            icon:payload.notification.icon
        };
        if(Notification.permission==="granted"){
            var notification=new Notification(payload.notification.title,notificationOption);
            notification.onclick=function (ev) {
                ev.preventDefault();
                window.open(payload.notification.click_action,'_blank');
                notification.close();
            }
        }
    });
    messaging.onTokenRefresh(function () {
        messaging.getToken()
            .then(function (newtoken) {
                console.log("New Token : "+ newtoken);
            })
            .catch(function (reason) {
                console.log(reason);
                //alert(reason);
            })
    })
    IntitalizeFireBaseMessaging();
</script>
</body>
</html>

<?php echo $layout['js']?>