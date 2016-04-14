package mobile.com.alipay.config;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *版本：3.3
 *日期：2012-08-10
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
	
 *提示：如何获取安全校验码和合作身份者ID
 *1.用您的签约支付宝账号登录支付宝网站(www.alipay.com)
 *2.点击“商家服务”(https://b.alipay.com/order/myOrder.htm)
 *3.点击“查询合作者身份(PID)”、“查询安全校验码(Key)”

 *安全校验码查看时，输入支付密码后，页面呈灰色的现象，怎么办？
 *解决方法：
 *1、检查浏览器配置，不让浏览器做弹框屏蔽设置
 *2、更换浏览器或电脑，重新登录查询。
 */

public class AlipayConfig {

	//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
	// 合作身份者ID，以2088开头由16位纯数字组成的字符串
	public static String partner = "2088901869861594";
	
	// 收款支付宝账号，以2088开头由16位纯数字组成的字符串，一般情况下收款账号就是签约账号
	public static String seller_id = partner;
	// 商户的私钥
	//public static String private_key = "MIICXQIBAAKBgQDEDBpwGGzddrfjXTB/CLZIn+Eeer5gL4sLbDW7TU9KyizvEEXYpMpw+Z+aeTf6xPPNu05OSYI5sooAD/WRCCNUoAPLhJjXebRW/eUW8tQWChCJgANplN/Q0af27J66ZJT/gRN2+HeE+eGrXb/Esq/g+9Vz+dqUHv+F0XFOiu2KCQIDAQABAoGAEGei3rZshaulf5UQtdCY0ELwp4hF3e6ch/wqEt5JQEzira6C6boAZqu8u0Rhds58SD7gMpTcHM/f1FmBhv1TV1/5WA+vt+4HVrJ9iPa/qPP5cpi+4kNXgiYoNoB3lH8/SpaI4TB9au9zakcOksZ/D9Ccff3rKLhsnzxvOhw4wnECQQDnVPGNhXvgOW/2AcVt+GGI0c5x0NEz0CVEd5AcqbNLUZ7jLBLEsBDnHxHfQeGsUwnVll4GPA68O2N/A4RD9HAHAkEA2PPwIycrJ/xE3jzJAn663t5ygPbjtk/VfKWiWIrsQ9ir9+4gW24J+RGwuCZp+iPICjks/jV1WM6bRT4+QluRbwJBAMe1W3uz20euDmwxB0JzBbDagAFeJt02OpYrKiy0jGbfpe205NcMsOr2tbUp6Sud3IWZ9L4pJwd1teW3IX6RDg0CQQCnbst7NbVWrJgxs1OmO0vYyHAyG1ft0Xr/MY0zLDPewI8nTn1mUmwb7o0l8W+EfqzZRvr0TSl9GiY2sCy4ZZa9AkBqQDIFN8G7S5cHN+1U8KZdO7459SmqBzDOiypqHGyAveVroWqepZ1ErWNOeU8Tz4pqLBP+5e7JvQ59ySeC40nX";
	public static String private_key = "MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAMQMGnAYbN12t+NdMH8Itkif4R56vmAviwtsNbtNT0rKLO8QRdikynD5n5p5N/rE8827Tk5JgjmyigAP9ZEII1SgA8uEmNd5tFb95Rby1BYKEImAA2mU39DRp/bsnrpklP+BE3b4d4T54atdv8Syr+D71XP52pQe/4XRcU6K7YoJAgMBAAECgYAQZ6LetmyFq6V/lRC10JjQQvCniEXd7pyH/CoS3klATOKtroLpugBmq7y7RGF2znxIPuAylNwcz9/UWYGG/VNXX/lYD6+37gdWsn2I9r+o8/lymL7iQ1eCJig2gHeUfz9KlojhMH1q73NqRw6Sxn8P0Jx9/esouGyfPG86HDjCcQJBAOdU8Y2Fe+A5b/YBxW34YYjRznHQ0TPQJUR3kByps0tRnuMsEsSwEOcfEd9B4axTCdWWXgY8Drw7Y38DhEP0cAcCQQDY8/AjJysn/ETePMkCfrre3nKA9uO2T9V8paJYiuxD2Kv37iBbbgn5EbC4Jmn6I8gKOSz+NXVYzptFPj5CW5FvAkEAx7Vbe7PbR64ObDEHQnMFsNqAAV4m3TY6lisqLLSMZt+l7bTk1wyw6va1tSnpK53chZn0viknB3W15bchfpEODQJBAKduy3s1tVasmDGzU6Y7S9jIcDIbV+3Rev8xjTMsM97AjydOfWZSbBvujSXxb4R+rNlG+vRNKX0aJjawLLhllr0CQGpAMgU3wbtLlwc37VTwpl07vjn1KaoHMM6LKmocbIC95Wuhap6lnUStY055TxPPimosE/7l7sm9Dn3JJ4LjSdc=";
	//pksc8   MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAMQMGnAYbN12t+NdMH8Itkif4R56vmAviwtsNbtNT0rKLO8QRdikynD5n5p5N/rE8827Tk5JgjmyigAP9ZEII1SgA8uEmNd5tFb95Rby1BYKEImAA2mU39DRp/bsnrpklP+BE3b4d4T54atdv8Syr+D71XP52pQe/4XRcU6K7YoJAgMBAAECgYAQZ6LetmyFq6V/lRC10JjQQvCniEXd7pyH/CoS3klATOKtroLpugBmq7y7RGF2znxIPuAylNwcz9/UWYGG/VNXX/lYD6+37gdWsn2I9r+o8/lymL7iQ1eCJig2gHeUfz9KlojhMH1q73NqRw6Sxn8P0Jx9/esouGyfPG86HDjCcQJBAOdU8Y2Fe+A5b/YBxW34YYjRznHQ0TPQJUR3kByps0tRnuMsEsSwEOcfEd9B4axTCdWWXgY8Drw7Y38DhEP0cAcCQQDY8/AjJysn/ETePMkCfrre3nKA9uO2T9V8paJYiuxD2Kv37iBbbgn5EbC4Jmn6I8gKOSz+NXVYzptFPj5CW5FvAkEAx7Vbe7PbR64ObDEHQnMFsNqAAV4m3TY6lisqLLSMZt+l7bTk1wyw6va1tSnpK53chZn0viknB3W15bchfpEODQJBAKduy3s1tVasmDGzU6Y7S9jIcDIbV+3Rev8xjTMsM97AjydOfWZSbBvujSXxb4R+rNlG+vRNKX0aJjawLLhllr0CQGpAMgU3wbtLlwc37VTwpl07vjn1KaoHMM6LKmocbIC95Wuhap6lnUStY055TxPPimosE/7l7sm9Dn3JJ4LjSdc=
	//si      MIICXQIBAAKBgQDEDBpwGGzddrfjXTB/CLZIn+Eeer5gL4sLbDW7TU9KyizvEEXYpMpw+Z+aeTf6xPPNu05OSYI5sooAD/WRCCNUoAPLhJjXebRW/eUW8tQWChCJgANplN/Q0af27J66ZJT/gRN2+HeE+eGrXb/Esq/g+9Vz+dqUHv+F0XFOiu2KCQIDAQABAoGAEGei3rZshaulf5UQtdCY0ELwp4hF3e6ch/wqEt5JQEzira6C6boAZqu8u0Rhds58SD7gMpTcHM/f1FmBhv1TV1/5WA+vt+4HVrJ9iPa/qPP5cpi+4kNXgiYoNoB3lH8/SpaI4TB9au9zakcOksZ/D9Ccff3rKLhsnzxvOhw4wnECQQDnVPGNhXvgOW/2AcVt+GGI0c5x0NEz0CVEd5AcqbNLUZ7jLBLEsBDnHxHfQeGsUwnVll4GPA68O2N/A4RD9HAHAkEA2PPwIycrJ/xE3jzJAn663t5ygPbjtk/VfKWiWIrsQ9ir9+4gW24J+RGwuCZp+iPICjks/jV1WM6bRT4+QluRbwJBAMe1W3uz20euDmwxB0JzBbDagAFeJt02OpYrKiy0jGbfpe205NcMsOr2tbUp6Sud3IWZ9L4pJwd1teW3IX6RDg0CQQCnbst7NbVWrJgxs1OmO0vYyHAyG1ft0Xr/MY0zLDPewI8nTn1mUmwb7o0l8W+EfqzZRvr0TSl9GiY2sCy4ZZa9AkBqQDIFN8G7S5cHN+1U8KZdO7459SmqBzDOiypqHGyAveVroWqepZ1ErWNOeU8Tz4pqLBP+5e7JvQ59ySeC40nX
	
	// 支付宝的公钥，无需修改该值				MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnxj/9qwVfgoUh/y2W89L6BkRAFljhNhgPdyPuBV64bfQNN1PjbCzkIM6qRdKBoLPXmKKMiFYnkd6rAoprih3/PrQEB/VsW8OoM8fxn67UDYuyBTqA23MML9q1+ilIZwBC2AQ2UBVOrFXfFl75p6/B5KsiNG9zpgmLCUYuLkxpLQIDAQAB
	public static String ali_public_key  = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnxj/9qwVfgoUh/y2W89L6BkRAFljhNhgPdyPuBV64bfQNN1PjbCzkIM6qRdKBoLPXmKKMiFYnkd6rAoprih3/PrQEB/VsW8OoM8fxn67UDYuyBTqA23MML9q1+ilIZwBC2AQ2UBVOrFXfFl75p6/B5KsiNG9zpgmLCUYuLkxpLQIDAQAB";

	//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑



	// 调试用，创建TXT日志文件夹路径
	public static String log_path = "D:\\";

	// 字符编码格式 目前支持 gbk 或 utf-8
	public static String input_charset = "utf-8";
	
	// 签名方式 不需修改
	public static String sign_type = "RSA";

}
