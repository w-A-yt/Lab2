<!DOCTYPE HTML>
<html>
<head>
<title>笃行天下 - 调试页面</title>
<meta name="Author" content="Sigma">
<meta name="Description" content="http://www.g8up.cn">
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
<style type="text/css">
#expandMore {
	cursor: pointer;
}

#briefInfo {
	height: 20px;
	overflow: hidden;
}
</style>
</head>
<body>
	<%
		int i = 0;
		while (i < 4) {
	%>
	<p hidden>This is a paragraph.</p>
	<button>Toggle</button>
	<%
		i++;
		}
	%>
	<%
		int j = 0;
		while (j != i) {
	%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("button:eq(<%=j%>)").click(function() {
				$("p:eq(<%=j%>)").toggle(1000);
			});
		});
	</script>
	<%
		j++;
		}
	%>
</body>
</html>