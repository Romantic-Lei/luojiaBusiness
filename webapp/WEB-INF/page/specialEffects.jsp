<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Insert title here</title>
</head>

<script type="text/javascript">
	onload = function() {
    var click_cnt = 0;
    var $html = document.getElementsByTagName("html")[0];
    var $body = document.getElementsByTagName("body")[0];
    $html.onclick = function(e) {
        var $elem = document.createElement("b");
        $elem.style.color = "#E94F06";
        $elem.style.zIndex = 9999;
        $elem.style.position = "absolute";
        $elem.style.select = "none";
        var x = e.pageX;
        var y = e.pageY;
        $elem.style.left = (x - 10) + "px";
        $elem.style.top = (y - 20) + "px";
        clearInterval(anim);
        switch (++click_cnt) {
            case 1:
                $elem.innerText = "富强";
				$elem.style.color = "green";
                break;
            case 2:
                $elem.innerText = "民主";
                break;
            case 3:
                $elem.innerText = "文明";
				$elem.style.color = "orange";
                break;
            case 4:
                $elem.innerText = "和谐";
				$elem.style.color = "blue";
                break;
            case 5:
                $elem.innerText = "爱国";
                $elem.style.color = '#'+Math.floor(Math.random()*0xffffff).toString(16);
                break;
            case 6:
                $elem.innerText = "敬业";
                $elem.style.color = '#'+Math.floor(Math.random()*0xffffff).toString(16);
                break;
            case 7:
                $elem.innerText = "诚信";
                $elem.style.color = '#'+Math.floor(Math.random()*0xffffff).toString(16);
                break;
            case 8:
                $elem.innerText = "友善";
                $elem.style.color = '#'+Math.floor(Math.random()*0xffffff).toString(16);
                break;
            case 9:
                $elem.innerText = "自由";
                $elem.style.color = '#'+Math.floor(Math.random()*0xffffff).toString(16);
                break;
            case 10:
                $elem.innerText = "平等";
                $elem.style.color = '#'+Math.floor(Math.random()*0xffffff).toString(16);
                break;
            case 11:
                $elem.innerText = "公正";
                $elem.style.color = '#'+Math.floor(Math.random()*0xffffff).toString(16);
                break;
            default:
				$elem.innerText = "法治";
                $elem.style.color = '#'+Math.floor(Math.random()*0xffffff).toString(16);
				click_cnt = 0;
                break;
        }
        $elem.style.fontSize = Math.random() * 10 + 8 + "px";
        var increase = 0;
        var anim;
        setTimeout(function() {
            anim = setInterval(function() {
                if (++increase == 150) {
                    clearInterval(anim);
                    $body.removeChild($elem);
                }
                $elem.style.top = y - 20 - increase + "px";
                $elem.style.opacity = (150 - increase) / 120;
            }, 8);
        }, 70);
        $body.appendChild($elem);
    };
};

</script>

<body>

</body>
</html>