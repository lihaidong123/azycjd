<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
	<form name="alipayment" action="<%=request.getContextPath() %>/index/alipayapi.jsp" method="post" target="_blank">
            <div id="body" style="clear:left">
                <dl class="content">
					<dt>商户订单号：</dt>
					<dd>
						<span class="null-star">*</span>
						<input size="30" name="WIDout_trade_no" />
						<span>商户网站订单系统中唯一订单号，必填
</span>
					</dd>
					<dt>订单名称：</dt>
					<dd>
						<span class="null-star">*</span>
						<input size="30" name="WIDsubject" />
						<span>必填
</span>
					</dd>
					<dt>付款金额：</dt>
					<dd>
						<span class="null-star">*</span>
						<input size="30" name="WIDtotal_fee" />
						<span>必填
</span>
					</dd>
					<dt>订单描述
：</dt>
					<dd>
						<span class="null-star">*</span>
						<input size="30" name="WIDbody" />
						<span></span>
					</dd>
					<dt>默认网银：</dt>
					<dd>
						<span class="null-star">*</span>
						<input size="30" name="WIDdefaultbank" />
						<span>必填，银行简码请参考接口技术文档
</span>
					</dd>
					<dt>商品展示地址：</dt>
					<dd>
						<span class="null-star">*</span>
						<input size="30" name="WIDshow_url" />
						<span>需以http://开头的完整路径，例如：http://www.商户网址.com/myorder.html
</span>
					</dd>
                    <dt></dt>
                    <dd>
                        <span class="new-btn-login-sp">
                            <button class="new-btn-login" type="submit" style="text-align:center;">确 认</button>
                        </span>
                    </dd>
                </dl>
            </div>
		</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>