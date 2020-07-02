<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,com.patientinfo.HealthcareBean"%>
<%!@SuppressWarnings("unchecked")%>

<div class="app-main__inner">
	<div class="app-page-title">
		<div class="page-title-wrapper">
			<div class="page-title-heading">
				<div class="page-title-icon">
					<i class="pe-7s-culture icon-gradient bg-mean-fruit"> </i>
				</div>
				<div>
					HomePage
					<div class="page-title-subheading">Today's detection.</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 首頁三個重要指標 -->
<jsp:useBean id="acB" scope="request"
	class="com.patientinfo.HealthcareBean" />
<div class="row">
	<div class="col-md-6 col-xl-4">
		<div class="card mb-3 widget-content bg-midnight-bloom">
			<div class="widget-content-wrapper text-white">
				<div class="widget-content-left">
					<div class="widget-heading">Pulse Rate</div>
					<div class="widget-subheading">Abnormal number</div>
				</div>
				<div class="widget-content-right">
					<!-- 回傳檢測值 -->
					<div class="widget-numbers text-white">
						<span><%=acB.getPRc()%></span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-6 col-xl-4">
		<div class="card mb-3 widget-content bg-arielle-smile">
			<div class="widget-content-wrapper text-white">
				<div class="widget-content-left">
					<div class="widget-heading">SBP/DBP</div>
					<div class="widget-subheading">Abnormal number</div>
				</div>
				<div class="widget-content-right">
					<!-- 回傳檢測值 -->
					<div class="widget-numbers text-white">
						<span><%=acB.getSBP_DBP_C()%></span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-6 col-xl-4">
		<div class="card mb-3 widget-content bg-grow-early">
			<div class="widget-content-wrapper text-white">
				<div class="widget-content-left">
					<div class="widget-heading">Glucose</div>
					<div class="widget-subheading">Abnormal number</div>
				</div>
				<div class="widget-content-right">
					<!-- 回傳檢測值 -->
					<div class="widget-numbers text-white">
						<span><%=acB.getGlc()%></span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- RWD 出現的標籤 -->
	<%-- <div class="d-xl-none d-lg-block col-md-6 col-xl-4">
                       <div class="card mb-3 widget-content bg-premium-dark">
                           <div class="widget-content-wrapper text-white">
                               <div class="widget-content-left">
                                   <div class="widget-heading">Products Sold</div>
                                   <div class="widget-subheading">Revenue streams</div>
                               </div>
                               <div class="widget-content-right">
                                   <div class="widget-numbers text-warning"><span>$14M</span></div>
                               </div>
                           </div>
                       </div>
                   </div>--%>
</div>
<!-- 小方塊置放區 -->
<div class="allmember">
	<%
		List<HealthcareBean> adBs = (ArrayList<HealthcareBean>) request.getAttribute("adBs");
		for (HealthcareBean adBs_ : adBs) {
			if (Integer.parseInt(adBs_.getGlucose()) < 100 && Integer.parseInt(adBs_.getPulse_Rate()) < 100 && Integer.parseInt(adBs_.getPulse_Rate()) > 60 && Integer.parseInt(adBs_.getSBP()) <= 140 && Integer.parseInt(adBs_.getDBP()) <= 90) {
				continue;
			}else{
	%>

	<form class="member" id="member01" method="post"	action="./PatientsDetails">
		<p class="alltext name"><%=adBs_.getpName()%></p>
		<div class="glucose">
			<img src="./assets/images/glucose.png" alt="glucose">
			<%String g = "";
				if (Integer.parseInt(adBs_.getGlucose()) > 100) {g = "prcss";}
				else {g = "alltext";}
			%>

			<p id="Gluid" class=<%=g%>><%=adBs_.getGlucose()%></p>
		</div>
		<div class="pic">
			
			<bottom type="submit"> <input class="mebimg"
				type="image" src="./assets/images/NHMan.png" />

			<input type="text" value=<%=adBs_.getPatno()%> name=patno
				style="display: none;"> </bottom>
		</div>
		<div class="hart">
			<img src="./assets/images/hart.png" alt="hart">
			<%String p = "";
				if (Integer.parseInt(adBs_.getPulse_Rate()) > 100 || Integer.parseInt(adBs_.getPulse_Rate()) < 60) {
					p = "prcss";
				} else {
					p = "alltext";}%>
			<p id="Prid" class=<%=p%>><%=adBs_.getPulse_Rate()%></p>
		</div>
		<div class="bdpresseure">
			<img src="./assets/images/bdpressure.png" alt="bdpresseure">
			<%String s = "";
				if (Integer.parseInt(adBs_.getSBP()) >= 140 || Integer.parseInt(adBs_.getDBP()) >= 90) {
					s = "prcss";
				} else {
					s = "alltext";
				}%>
			<p id="SDBPid" class=<%=s%>><%=adBs_.getSBP()%>/<%=adBs_.getDBP()%></p>
		</div>
	</form>						
	<%}}%>
	</div>
</div>

	<script type="text/javascript" src="./assets/scripts/main.js"></script>	
</body>
</html>