<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<c:url var="readUrl" value="/goods/list"/>
<c:url var="createUrl" value="/goods/create"/>
<c:url var="updateUrl" value="/goods/update"/>
<c:url var="deleteUrl" value="/goods/delete"/>

<kendo:grid title="그리드" name="goods" pageable="true" sortable="true" scrollable="true" height="450">
	<kendo:grid-editable mode="incell"/>
	<kendo:grid-toolbar>
		<kendo:grid-toolbarItem name="create" text="생성"/>
		<kendo:grid-toolbarItem name="save" text="저장"/>
	</kendo:grid-toolbar>
	<kendo:grid-columns>
		<kendo:grid-column title="제품번호" field="giNum" editable="false"/>
		<kendo:grid-column title="제품이름" field="giName"/>
		<kendo:grid-column title="제품설명" field="giDesc"/>
		<kendo:grid-column title="회사번호" field="viNum">
		</kendo:grid-column>
		<kendo:grid-column title="생산일자" field="giCredat"/>
		<kendo:grid-column title="생산시간" field="giCretim"/>
		<kendo:grid-column command="destroy" title="삭제" />
	</kendo:grid-columns>
	
	<kendo:dataSource pageSize="20" batch="true">
		<kendo:dataSource-transport>
			<kendo:dataSource-transport-read url="${readUrl}" dataType="json" type="POST" contentType="application/json"/>
			<kendo:dataSource-transport-create url="${createUrl}" dataType="json" type="POST" contentType="application/json"/>
			<kendo:dataSource-transport-update url="${updateUrl}" dataType="json" type="POST" contentType="application/json"/>
			<kendo:dataSource-transport-destroy url="${deleteUrl}" dataType="json" type="POST" contentType="application/json" />
			<kendo:dataSource-transport-parameterMap>
				<script>
				function parameterMap(options, type)
				{
					if(type === "read")
					{
						return JSON.stringify(options);
					}
					else
					{
						var str = JSON.stringify(options.models);
						return str;
					}
				}
				</script>
			</kendo:dataSource-transport-parameterMap>
		</kendo:dataSource-transport> 
		
		<kendo:dataSource-schema>
			<kendo:dataSource-schema-model id="giNum">
				<kendo:dataSource-schema-model-fields>
					<kendo:dataSource-schema-model-field name="giName" type="string">
						<kendo:dataSource-schema-model-field-validation required="true"/>
					</kendo:dataSource-schema-model-field>
					<kendo:dataSource-schema-model-field name="viNum" defaultValue="1" >
							<kendo:dataSource-schema-model-field-validation required="true" min="1"/>
					</kendo:dataSource-schema-model-field>
				</kendo:dataSource-schema-model-fields>
			</kendo:dataSource-schema-model>
		</kendo:dataSource-schema>
	</kendo:dataSource>
</kendo:grid>