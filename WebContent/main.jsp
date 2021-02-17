<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
      <%@page import="back.UserDTO"%>
<!DOCTYPE HTML>
<!--
	TXT by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Healthy Drugger</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		
		
	</head>
	<body class="homepage is-preload">
	
	<%
			UserDTO info = (UserDTO)session.getAttribute("info");
	%>
		
		<div id="page-wrapper">

			<!-- Ȩ������ ��ܿ� ���� ��Ʈ : Header -->
				<header id="header">
					<div class="logo container">
						<div>
						<%if(info != null){ %> <!-- �α��� ���� -->
								<%if(info.getId().equals("admin")) {%> <!-- admin -->
									<button type="button" class="button" onclick="location='login-join/admin.jsp'">ȸ������ ����</button>
									<button type="button" class="button alt" onclick="location='login-join/update.jsp'">�������� ����</button>
									<button type="button" class="button alt" onclick="location='login-join/logout.jsp'">�α׾ƿ�</button>
								<%}else{%>
									<button type="button" class="button alt" onclick="location='login-join/update.jsp'">�������� ����</button>
									<a href="logout" >�α׾ƿ�</a>
									<button type="button" class="button alt" onclick="location='logout'">�α׾ƿ�</button>
								<%} %>
							<%}else{%> <!-- �α��� ���н�  : �α���, ȸ������ ��ư ���-->
								<!-- <a href="#menu">�α���</a> -->
								<button type="button" class="button" onclick="location='login-join/login.jsp'">�α���</button>
								<button type="button" class="button alt" onclick="location='login-join/join.jsp'">ȸ������</button>
							<%} %>
							<br>
							<h1><a href="main.jsp" id="logo">�ǰ��� �����̿�</a></h1>
							<p>�Բ� ����� �ǰ��� ����!</p>
						</div>
					</div>
				</header>

			<!-- ī�װ��� �� �����ϴ� �ڵ� : Nav -->
				<nav id="nav">
					<ul>
						<li class="current"><a href="main.jsp">Home</a></li>
						<li>
							<a href="#">Ŀ�´�Ƽ</a>
							<ul>
								<li><a href="#">Lorem ipsum dolor</a></li>
								<li><a href="#">Magna phasellus</a></li>
								<li>
									<a href="#">Phasellus consequat</a>
									<ul>
										<li><a href="#">Lorem ipsum dolor</a></li>
										<li><a href="#">Phasellus consequat</a></li>
										<li><a href="#">Magna phasellus</a></li>
										<li><a href="#">Etiam dolore nisl</a></li>
									</ul>
								</li>
								<li><a href="#">Veroeros feugiat</a></li>
							</ul>
						</li>
						<li><a href="left-sidebar.html">������ �˻�</a></li>
						<li><a href="right-sidebar.html">�ǰ� �̽�</a></li>
						<li><a href="issue.jsp">�ǰ� �̽�</a></li>
					</ul>
				</nav>

			<!-- ������ ��õ(�˻�)������ �̵��ϴ� Banner -->
				<section id="banner">
					<div class="content">
						<h2>������ �� �´� �������� �����ϱ�?</h2>
						<p>�Ʒ� ��ư�� Ŭ���ؼ� ������ ��õ�� �޾ƺ�����</p>
						<a href="#main" class="button scrolly">GO</a>
					</div>
				</section>

			<!-- Main -->
				<section id="main">
					<div class="container">
						<div class="row gtr-200">

							<div class="col-12">

								<!-- �ǰ��ҽ� ������ �̵� : Features -->
									<section class="box features">
										<h2 class="major"><span>������ �ǰ� �ҽ�</span></h2>
										<div>
											<div class="row">
												<div class="col-3 col-6-medium col-12-small">

													<!-- �ǰ��ҽ� �ϴ��� 1��° �ڽ� : Feature -->
														<section class="box feature">
															<a href="#" class="image featured"><img src="images/pic01.jpg" alt="" /></a>
															<h3><a href="#">�̽�1</a></h3>
															<p>
																Phasellus quam turpis, feugiat sit amet ornare in, a hendrerit in
																lectus dolore. Praesent semper mod quis eget sed etiam eu ante risus.
															</p>
														</section>

												</div>
												<div class="col-3 col-6-medium col-12-small">

													<!-- �ǰ��ҽ� �ϴ��� 2��° �ڽ� : Feature -->
														<section class="box feature">
															<a href="#" class="image featured"><img src="images/pic02.jpg" alt="" /></a>
															<h3><a href="#">Another Subheading</a></h3>
															<p>
																Phasellus quam turpis, feugiat sit amet ornare in, a hendrerit in
																lectus dolore. Praesent semper mod quis eget sed etiam eu ante risus.
															</p>
														</section>

												</div>
												<div class="col-3 col-6-medium col-12-small">

													<!-- �ǰ��ҽ� �ϴ��� 3��° �ڽ� :Feature -->
														<section class="box feature">
															<a href="#" class="image featured"><img src="images/pic03.jpg" alt="" /></a>
															<h3><a href="#">And Another</a></h3>
															<p>
																Phasellus quam turpis, feugiat sit amet ornare in, a hendrerit in
																lectus dolore. Praesent semper mod quis eget sed etiam eu ante risus.
															</p>
														</section>

												</div>
												<div class="col-3 col-6-medium col-12-small">

													<!-- �ǰ��ҽ� �ϴ��� 4��° �ڽ� :Feature -->
														<section class="box feature">
															<a href="#" class="image featured"><img src="images/pic04.jpg" alt="" /></a>
															<h3><a href="#">And One More</a></h3>
															<p>
																Phasellus quam turpis, feugiat sit amet ornare in, a hendrerit in
																lectus dolore. Praesent semper mod quis eget sed etiam eu ante risus.
															</p>
														</section>

												</div>
												
												<div class="col-12">
													<ul class="actions">
														<li><button type="button" class="button large" onclick="location.href='no-sidebar.html' ">�� ���� �ҽĺ���</button></li>
														<li><a href="#" class="button alt large">�������������</a></li>
													</ul>
												</div>
												
											</div>
										</div>
									</section>

							</div>
							
							<!-- ������ ��õ ��...... -->
							<div class="wrapper flex-wrapper row3">
  								<section id="latest" class="hoc flexslider"> 
									 <div class="center btmspace-50">
									      <h2 class="major"><span>������ �α� ������</span></h2>
									 </div>
									<ul class="carousel-items">
									      <li><a href="#">
									        <figure><img src="images/vitamin.jpg" alt="" width=200px height=300px>
									          <figcaption>
									            <h2 class="heading">������1</h2>
									            <p>#���ǰ� #���� #���ο��� #1��3ȸ #����30��</p>
									          </figcaption>
									        </figure>
									        </a></li>
									      <li><a href="#">
									        <figure><img src="images/vitamin2.jpg" alt="" width=200px height=300px>
									          <figcaption>
									            <h2 class="heading">������2</h2>
									            <p>#��ǰ� #���� #������� #1��2ȸ #����30��</p>
									          </figcaption>
									        </figure>
									        </a></li>
									      <li><a href="#">
									        <figure><img src="images/vitamin3.jpg" alt="" width=200px height=300px>
									          <figcaption>
									            <h2 class="heading">������3</h2>
									            <p>#����� #��� #1��3ȸ #����30��</p>
									          </figcaption>
									        </figure>
									        </a></li>
									      <li><a href="#">
									        <figure><img src="images/vitamin4.jpg" alt="" width=200px height=300px>
									          <figcaption>
									            <h2 class="heading">������4</h2>
									            <p>#���� #���ο��� #����� #1��3ȸ #����30��</p>
									          </figcaption>
									        </figure>
									        </a></li>
									      <li><a href="#">
									        <figure><img src="images/vitamin5.png" alt="" width=200px height=300px>
									          <figcaption>
									            <h2 class="heading">������5</h2>
									            <p>#���̾�Ʈ #���� #ü�߰��� #Į�θ�ĿƮ #�������⹰</p>
									          </figcaption>
									        </figure>
									        </a></li>
								    </ul>
								    </section>
							</div>
							
							
							
							<div class="col-12">
								<!-- Ŀ�´�Ƽ ��(�����Խ���, Q&A)���� �̵� : Blog -->
									<section class="box blog">
										<h2 class="major"><span>�����̵��� �ǰ��� ����</span></h2>
										<div>
											<div class="row">
												<div class="col-9 col-12-medium">
													<div class="content">

														<!-- �����Խ��ǿ��� ��� ���� �����ֱ� : Featured Post -->
															<article class="box post">
																<header>
																	<h3><a href="#">Here's a really big heading</a></h3>
																	<p>With a smaller subtitle that attempts to elaborate</p>
																	<ul class="meta">
																		<li class="icon fa-clock">15 minutes ago</li>
																		<li class="icon fa-comments"><a href="#">8</a></li>
																	</ul>
																</header>
																<a href="#" class="image featured"><img src="images/pic05.jpg" alt="" /></a>
																<p>
																	Phasellus quam turpis, feugiat sit amet ornare in, a hendrerit in lectus. Praesent
																	semper mod quis eget mi. Etiam sed ante risus aliquam erat et volutpat. Praesent a
																	dapibus velit. Curabitur sed nisi nunc, accumsan vestibulum lectus. Lorem ipsum
																	dolor sit non aliquet sed, tempor et dolor. Praesent a dapibus velit. Curabitur
																	accumsan.
																</p>
																<button type="button" class="button" onclick="location='community/Write.jsp'">�۾��� ����</button>
																<!-- <input type = button value = "�۾���" onclick = "location='Write.jsp'">
																  <a href="#" class="button">�۾��� ����</a>
																-->
																<button type="button" class="button" onclick="location.href='no-sidebar.html' ">�Խ������� �̵�</button>
															</article>

													</div>
												</div>
												<div class="col-3 col-12-medium">
													<div class="sidebar">

														<!-- Ŀ�´�Ƽ ���� �������� Q&A �� : Archives -->
															<ul class="divided">
																<li>
																	<article class="box post-summary">
																		<h3><a href="#">Q.���� �ʹ� �����Ҷ� � ���� �Ծ�� �ϳ���?</a></h3>
																		<ul class="meta">
																			<li class="icon fa-clock">6 hours ago</li>
																			<li class="icon fa-comments"><a href="#">34</a></li>
																		</ul>
																	</article>
																</li>
																<li>
																	<article class="box post-summary">
																		<h3><a href="#">Q.���� ���� �������� �����ΰ���?</a></h3>
																		<ul class="meta">
																			<li class="icon fa-clock">9 hours ago</li>
																			<li class="icon fa-comments"><a href="#">27</a></li>
																		</ul>
																	</article>
																</li>
																<li>
																	<article class="box post-summary">
																		<h3><a href="#">Q.ȫ���� ������ �ٳ����� �Ծ �ǳ���?</a></h3>
																		<ul class="meta">
																			<li class="icon fa-clock">Yesterday</li>
																			<li class="icon fa-comments"><a href="#">184</a></li>
																		</ul>
																	</article>
																</li>
																<li>
																	<article class="box post-summary">
																		<h3><a href="#">Q.���� �ø��� ��õ�ϴ� ������ ������ �ֳ���?</a></h3>
																		<ul class="meta">
																			<li class="icon fa-clock">2 days ago</li>
																			<li class="icon fa-comments"><a href="#">286</a></li>
																		</ul>
																	</article>
																</li>
																<li>
																	<article class="box post-summary">
																		<h3><a href="#">Q.���� ���� ������ ȫ���� �Ծ �ǳ���?</a></h3>
																		<ul class="meta">
																			<li class="icon fa-clock">3 days ago</li>
																			<li class="icon fa-comments"><a href="#">8,086</a></li>
																		</ul>
																	</article>
																</li>
															</ul>
															
															<a href="#" class="button alt">�����Ϸ�����</a>

													</div>
												</div>
											</div>
										</div>
									</section> <!-- Ŀ����  ���� ���� -->

							</div>
						</div>
					</div>
				</section> <!-- main section �� -->

			<!-- �ϴ��� �� : Footer -->
				<footer id="footer">
					<div class="container">
						<div class="row gtr-200">
							<div class="col-12">

								<!-- About -->
									<section>
										<h2 class="major"><span>�ǰ��� �����̶�?</span></h2>
										<p>
											This is <strong>TXT</strong>, yet another free responsive site template designed by
											<a href="http://twitter.com/ajlkn">AJ</a> for <a href="http://html5up.net">HTML5 UP</a>. It's released under the
											<a href="http://html5up.net/license/">Creative Commons Attribution</a> license so feel free to use it for
											whatever you're working on (personal or commercial), just be sure to give us credit for the design.
											That's basically it :)
										</p>
									</section>

							</div>
							<div class="col-12">

								<!-- Contact -->
									<section>
										<h2 class="major"><span>Get in touch</span></h2>
										<ul class="contact">
											<li><a class="icon brands fa-facebook-f" href="#"><span class="label">Facebook</span></a></li>
											<li><a class="icon brands fa-twitter" href="#"><span class="label">Twitter</span></a></li>
											<li><a class="icon brands fa-instagram" href="#"><span class="label">Instagram</span></a></li>
											<li><a class="icon brands fa-dribbble" href="#"><span class="label">Dribbble</span></a></li>
											<li><a class="icon brands fa-linkedin-in" href="#"><span class="label">LinkedIn</span></a></li>
										</ul>
									</section>

							</div>
						</div>

						<!-- Copyright -->
							<div id="copyright">
								<ul class="menu">
									<li>&copy; Untitled. All rights reserved</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
								</ul>
							</div>

					</div>
				</footer>

		</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			
<!-- JAVASCRIPTS -->
<script src="mainLayout/scripts/jquery.min.js"></script>
<script src="mainLayout/scripts/jquery.backtotop.js"></script>
<script src="mainLayout/scripts/jquery.mobilemenu.js"></script>

<!-- IE9 Placeholder Support -->
<script src="mainLayout/scripts/jquery.placeholder.min.js"></script>


<!-- / IE9 Placeholder Support -->
<!-- Homepage specific -->
<script src="mainLayout/scripts/jquery.flexslider-min.js"></script>

</body>
</html>