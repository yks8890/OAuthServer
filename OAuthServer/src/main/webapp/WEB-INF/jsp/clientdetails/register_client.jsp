<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fun" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE HTML>
<html>
<head>
<title>client 등록</title>
<script src="<c:url value='/js/angular.min.js'/>"></script>

</head>
<body>
	<a href="<c:url value='/'/>">Home</a>

	<h2>注册client</h2>

	<div ng-app>
		<p class="help-block">
			한 쌍의 경우Oauth의
			<code>client_details</code>
			속성 및 불분명 한 역할, 난 당신이 첫 번째 프로젝트를 참조 제안
			<code>db_table_description.html</code>
			표에 (others 디렉토리에 위치) 파일
			<code>oauth_client_details</code>
			설명, 또는 온라인 액세스<a
				href="http://andaily.com/spring-oauth-server/db_table_description.html"
				target="_blank">db_table_description.html</a>; client가 실제로 테이블에 등록되어
			있기 때문에 서로 다른 조건에서 데이터를 추가합니다
		</p>

		<div ng-controller="RegisterClientCtrl">
			<form:form commandName="formDto" cssClass="form-horizontal">
				<div class="form-group">
					<label for="clientId" class="col-sm-2 control-label">client_id<em
						class="text-danger">*</em></label>

					<div class="col-sm-10">
						<form:input path="clientId" cssClass="form-control" id="clientId"
							placeholder="client_id" required="required" />

						<p class="help-block">client_id는 필수입력(최소 5자 이상 입력); 라는 실용적인 응용
							프로그램의 또 다른 이름 appKey와 client_id이 같은 개념이다.</p>
					</div>
				</div>
				<div class="form-group">
					<label for="clientSecret" class="col-sm-2 control-label">client_secret<em
						class="text-danger">*</em></label>

					<div class="col-sm-10">
						<form:input path="clientSecret" cssClass="form-control"
							id="clientSecret" placeholder="client_secret" required="required" />

						<p class="help-block">client_secret는 필수입력(최소 5자 이상 입력); 라는
							실용적인 응용 프로그램의 또 다른 이appSecret와 client_secret이 같은 개념이다.</p>
					</div>
				</div>
				<div class="form-group">
					<label for="resourceIds" class="col-sm-2 control-label">resource_ids<em
						class="text-danger">*</em></label>

					<div class="col-sm-10">
						<form:select path="resourceIds" cssClass="form-control"
							id="resourceIds">
							<form:option value="unity-resource">unity-resource</form:option>
							<form:option value="mobile-resource">mobile-resource</form:option>
							<form:option value="unity-resource,mobile-resource">unity-resource,mobile-resource</form:option>
						</form:select>

						<p class="help-block">
							resourceIds 당신은 선택해야합니다; 옵션 값은에서 파생되어야합니다
							<code>security.xml</code>
							라벨
							<code>&lsaquo;oauth2:resource-server</code>
							재산
							<code>resource-id</code>
							값
						</p>
					</div>
				</div>

				<div class="form-group">
					<label for="scope" class="col-sm-2 control-label">scope<em
						class="text-danger">*</em></label>

					<div class="col-sm-10">
						<form:select path="scope" id="scope" cssClass="form-control">
							<form:option value="read">read</form:option>
							<form:option value="write">write</form:option>
							<form:option value="read,write">read write</form:option>
						</form:select>

						<p class="help-block">scope 당신은 선택해야합니다</p>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">grant_type(s)<em
						class="text-danger">*</em></label>

					<div class="col-sm-10">
						<label class="checkbox-inline"> <input type="checkbox"
							name="authorizedGrantTypes" value="authorization_code"
							${fun:containsIgnoreCase(formDto.authorizedGrantTypes, 'authorization_code') ?'checked':''} />
							authorization_code
						</label> <label class="checkbox-inline"> <input type="checkbox"
							name="authorizedGrantTypes" value="password"
							${fun:containsIgnoreCase(formDto.authorizedGrantTypes, 'authorization_code') ?'checked':''} />
							password
						</label> <label class="checkbox-inline"> <input type="checkbox"
							name="authorizedGrantTypes" value="implicit"
							${fun:containsIgnoreCase(formDto.authorizedGrantTypes, 'implicit') ?'checked':''} />
							implicit
						</label> <label class="checkbox-inline"> <input type="checkbox"
							name="authorizedGrantTypes" value="client_credentials"
							${fun:containsIgnoreCase(formDto.authorizedGrantTypes, 'client_credentials') ?'checked':''} />
							client_credentials
						</label> <label class="checkbox-inline"> <input type="checkbox"
							name="authorizedGrantTypes" value="refresh_token"
							${fun:containsIgnoreCase(formDto.authorizedGrantTypes, 'refresh_token') ?'checked':''} />
							refresh_token
						</label>

						<p class="help-block">
							적어도 하나를 선택 grant_type(s),그리고
							<code>refresh_token</code>
							, 더 많은 도움이 방문을 위해<a href="https://andaily.com/blog/?p=103"
								target="_blank">https://andaily.com/blog/?p=103</a>
						</p>
					</div>
				</div>

				<div class="form-group">
					<label for="webServerRedirectUri" class="col-sm-2 control-label">redirect_uri</label>

					<div class="col-sm-10">
						<form:input path="webServerRedirectUri" id="webServerRedirectUri"
							placeholder="redirect_uri" cssClass="form-control" />

						<p class="help-block">
							경우
							<code>grant_type</code>
							그것은 포함<em>authorization_code</em>또는<em>implicit</em>,
							필수입력사항입니다.redirect_uri
						</p>
					</div>
				</div>

				<div class="form-group">
					<label for="authorities" class="col-sm-2 control-label">authorities</label>

					<div class="col-sm-10">
						<form:select path="authorities" id="authorities"
							cssClass="form-control">
							<form:option value="">아니오</form:option>
							<form:option value="ROLE_USER,ROLE_UNITY">ROLE_UNITY</form:option>
							<form:option value="ROLE_USER,ROLE_MOBILE">ROLE_MOBILE</form:option>
							<form:option value="ROLE_USER,ROLE_UNITY,ROLE_MOBILE">ROLE_UNITY,ROLE_MOBILE</form:option>
						</form:select>

						<p class="help-block">

							클라이언트 소유를 지정합니다 Spring Security 권위 값, 옵션, 경우
							<code>grant_type</code>
							인가<em>implicit</em>또는<em>client_credentials</em>당신은
							선택해야합니다authorities, 권한 필드 값에 따른 서버는 대응하는 접속 여부를 결정하기 때문에API
						</p>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-2"></div>
					<div class="col-sm-10">
						<a href="javascript:void(0);" ng-click="showMore()">추가 옵션</a>
					</div>
				</div>

				<div ng-show="visible">
					<div class="form-group">
						<label for="accessTokenValidity" class="col-sm-2 control-label">access_token_validity</label>

						<div class="col-sm-10">
							<input type="number" class="form-control"
								name="accessTokenValidity" id="accessTokenValidity"
								placeholder="access_token_validity" />

							<p class="help-block">설정 클라이언트access_token유효 시간 (단위 : 초), 임의로
								유효 시간 설정 값의 기본값을 사용하는 경우(60 * 60 * 12, 12시간); 설정 값이 0보다 큰
								정수이어야합니다,</p>
						</div>
					</div>

					<div class="form-group">
						<label for="refreshTokenValidity" class="col-sm-2 control-label">refresh_token_validity</label>

						<div class="col-sm-10">
							<input type="number" class="form-control"
								name="refreshTokenValidity" id="refreshTokenValidity"
								placeholder="refresh_token_validity" />

							<p class="help-block">설정 클라이언트refresh_token 유효 시간 (단위 : 초),
								임의로 유효 시간 설정 값의 기본값을 사용하는 경우(60 * 60 * 24 * 30, 30 일); 설정 값이 0보다
								큰 정수이어야합니다,</p>
						</div>
					</div>

					<div class="form-group">
						<label for="additionalInformation" class="col-sm-2 control-label">additional_information</label>

						<div class="col-sm-10">
							<input type="text" class="form-control"
								name="additionalInformation" id="additionalInformation"
								placeholder="additional_information" />

							<p class="help-block">

								아래의 필드는 Oauth에 내장된 옵션필드지만, 설정하는 것을 권장 .설정 값의 경우,JSON 데이터 포맷으로 전송
								예시:
								<code>{"country":"CN","country_code":"086"}</code>
							</p>
						</div>
					</div>


					<div class="form-group">
						<label class="col-sm-2 control-label">trusted</label>

						<div class="col-sm-10">
							<label class="radio-inline"> <input type="radio"
								name="trusted" value="true" /> Yes
							</label> <label class="radio-inline"> <input type="radio"
								name="trusted" value="false" checked="checked" /> No
							</label>

							<p class="help-block">
								이 건물은 확장에만 적용입니다grant_type(s)그것은 포함
								<code>authorization_code</code>
								경우, 사용자가 성공적으로 로그인, 만약 선거No,그것은 사용자가로 이동 할 수 있습니다Approve이 페이지에는
								사용자의 동의를 할 수 있습니다 선거의 경우Yes, 우리는 로그인 후 사용자를 할 필요가 없습니다Approve동의
								(이 신뢰할 수 있기 때문에)
							</p>
						</div>
					</div>
				</div>


				<div class="form-group">
					<div class="col-sm-2"></div>
					<div class="col-sm-10">
						<form:errors path="*" cssClass="text-danger" />
					</div>
				</div>


				<div class="form-group">
					<div class="col-sm-2"></div>
					<div class="col-sm-10">
						<button type="submit" class="btn btn-success">注册</button>
						<a href="client_details">取消</a>
					</div>
				</div>
			</form:form>
		</div>
	</div>

	<script>
		var RegisterClientCtrl = [ "$scope", function($scope) {
			$scope.visible = false;

			$scope.showMore = function() {
				$scope.visible = !$scope.visible;
			};
		} ];
	</script>
</body>
</html>