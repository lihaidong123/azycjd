package com.anzhi.web.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UtilData {
	public String projectName="";
	public String[] duzhedengji = new String[] { "1,1", "3,2", "5,3", "6,4",
			"9,5", "10,7", "12,8", "15,10", "18,11", "20,13", "21,14",
			"24,15", "25,16", "27,17", "30,19", "33,20", "35,21", "36,22",
			"39,23", "40,25", "42,26", "45,27", "48,28", "50,30" };

	public String[] duzhejingyan = new String[] { "100", "200", "500", "800",
			"1000", "1500", "2000", "2700", "3600", "4500", "5500", "6600",
			"7800", "9000", "12000", "15000", "18000", "20000", "24000",
			"28000", "36000", "45000", "54000", "65000", "75000", "85000",
			"100000", "110000", "120000", "130000", "140000", "150000",
			"160000", "170000", "180000", "190000", "200000", "220000",
			"240000", "260000", "280000", "300000", "320000", "340000",
			"360000", "380000", "400000", "430000", "460000", "500000" };

	public String[] jingyandengji = new String[] { "500", "2000", "5000", "10000",
			"20000", "30000", "40000", "50000", "80000", "100000",
			"200000", "300000", "500000", "800000", "1000000", "2000000",
			"3000000", "5000000", };

	public String[] fensijifen = new String[] { "0,不堪一击 ", "500,微不足道",
			"800,初来乍到", "1000,初窥门径", "2000,渐入佳境", "5000,略有小成",
			"8000,架轻就熟 ", "10000,融会贯通", "20000,炉火纯青", "30000,登峰造极",
			"50000,傲视群雄", "80000,一代宗师", "100000,震古烁今", "120000,超凡入圣",
			"150000,化圣成神", "180000,神临尘世", "200000,神威浩荡", "240000,诸神之王",

	};
	
	//道具：数组格式：名称，最低安之币
	public String[] daoJuArr=new String[]{"鲜花,200","仕女扇,588","手镯,1888","玉佩,5000","凤冠,10000","M9军刺,200","葵花宝典,588","星际母舰,1888","鲲鹏,5000","麒麟,10000","直接打赏,0"};
	
	//数组格式：消费最低安之币,经验记录表类型,增加的经验
	public String[] daShangJingYanarray=new String[]{"100,9,5","1000,10,20","2500,11,60","5000,12,100","10000,13,300"};
	
	//数组格式：消费最低安之币,经验记录表类型,增加的经验
	public String[] chongZhiJingYanarray=new String[]{"1,14,5","5,15,10","20,16,50","50,17,100"};
	
	//小说类型
	public String[] novelBigTypeData=new String[]{"玄幻奇幻","武侠仙侠","都市异能","历史军事","游戏竞技","科幻灵异","现代言情","古代言情"};
	
	//推荐位类型
	public String[] recommendPositionTypeData=new String[]{"01,玄幻奇幻幻灯片区","02,奇幻玄幻单本小说推荐区","03,奇幻玄幻换批推荐区","11,武侠仙侠幻灯片区","12,武侠仙侠单本小说推荐区","13,武侠仙侠换批推荐区","21,都市异能幻灯片区","22,都市异能单本小说推荐区","23,都市异能换批推荐区","31,历史军事幻灯片区","32,历史军事单本小说推荐区","33,历史军事换批推荐区","41,游戏竞技幻灯片区","42,游戏竞技单本小说推荐区","43,游戏竞技换批推荐区","51,科幻灵异幻灯片区","52,科幻灵异单本小说推荐区","53,科幻灵异换批推荐区","61,现代言情幻灯片区","62,现代言情单本小说推荐区","63,现代言情换批推荐区","71,古代言情幻灯片区","72,古代言情单本小说推荐区","73,古代言情换批推荐区","81,首页书库推荐","82,首页大神推荐","91,优惠书坊本周免费推荐区","92,优惠书坊限时免费推荐区","93,优惠书坊完本优惠推荐区","94,优惠书坊红文折扣区","101,完结推荐","111,大神推荐的作家的最热门作品","121,大神推荐的作家作品","131,手机编辑推荐"};

	public String[] paihangbang=new String[]{"月票榜","点击榜","收藏版","更新榜","推荐榜","订阅榜","新书月票榜","书友打赏榜","新书点击榜","新书推荐榜","新书收藏榜","完结精品榜"};
	
	public String[] dashangType=new String[]{"推荐票","催更票","月票","鲜花","仕女扇","手镯","玉佩","凤冠","M9军刺","葵花宝典","星际母舰","鲲鹏","麒麟",""};
	/**
	 * 优惠类型(0-本周免费 1-限时免费 2-完本优惠 3-红文折扣区)
	 */
	public String[] discountedType=new String[]{"本周免费","限时免费","完本优惠","红文折扣区"};
	
	public String[] discountedTypeTypeDate=new String[]{"0,本周免费","1,限时免费","2,完本优惠","3,红文折扣区"};
	
	/*
	 * 福利类型
	 */
	public String[] benefitTypeTypeData=new String[]{"上架申请以及上架福利申请","签约作品完结奖励","全勤奖","打赏奖","订阅奖","签约文、签约作者的新书福利","买断福利","平台签约","道具分成","精英奖","道具分成"};
	
	public String[] experienceTypeArr=new String[]{"签到获得","每日动态","每日投票","每日充值(已废)","每日订阅","每日收藏","每日评论","每日打赏(已废)","每日点赞","每日打赏100安之币","每日打赏1000安之币","每日打赏2500安之币","每日打赏5000安之币","每日打赏10000安之币","每日充值1元","每日充值5元","每日充值20元","每日充值50元"};
	
	public String[] novelStateArr=new String[]{"未发表","已下架","连载中","已完结","删除中","下架申请中","上架申请中","签约申请中","解约处理中"};
	
	public String[] pictureType=new String[]{"首页头部","首页排行榜","首页福利","首页推荐","合作渠道头部","编辑专区头部","版权维护头部","活动专区图片","用户指南头部","作者投稿头部","诚聘英才头部","联系我们头部","新闻公告头部","在线充值头部","作家福利头部"};
	
	public String[] danweiArr=new String[]{"张","张","张","朵","把","只","块","顶","把","本","架","只","头",""};
	
	public String[] paihangbangType=new String[]{"月票","点击","收藏","更新数","推荐","订阅","月票","打赏","点击","推荐","收藏","完结"};
	
	public String[] dashangtubiaoArr=new String[]{"recommanddan.png","urgedan.png","moon-ticketdan.png","dashang/1.png","dashang/2.png","dashang/3.png","dashang/4.png","dashang/5.png","dashang/6.png","dashang/7.png","dashang/8.png","dashang/9.png","dashang/10.png",""};
	
	public String[] thirdRecommandTypeData=new String[]{"UC","畅读书城","360","2345","爱书课","爱阅读","当当","豆丁网豆丁书房","书香云集","掌阅","苏宁阅读","塔读原创","网易","迅雷阅读","阅读星","醉蝶"};

	/**
	 * 根据传入的用户经验获得他的等级
	 * @param jingyan
	 * @return
	 */
	public int getDuzhejingyanLevel(int jingyan){
		int level=0;
		for(int i=duzhejingyan.length-1;i>=0;i--){
			if(jingyan>=Integer.parseInt(duzhejingyan[i])){
				level=i+1;
				break;
			}
		}
		return level;
	}
	
	/**
	 * 根据用户经验等级获得他拥有多少推荐票
	 * @param jingyanLevel
	 * @return
	 */
	public int getTuijianPiao(int jingyanLevel){
		int tuijianpiao=1;
		for(int i=duzhedengji.length-1;i>=0;i--){
			String[] arr=duzhedengji[i].split(",");
			if(jingyanLevel>=Integer.parseInt(arr[0])){
				tuijianpiao=Integer.parseInt(arr[1]);
				break;
			}
		}
		return tuijianpiao;
	}
	
	public static void recordChongZhi(String path,String content){
		try {
			content+="\r\n"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())+"\r\n\r\n\r\n";
			File f=new File(path+"/recordChongZhi.txt");
			if(!f.exists()){
				f.createNewFile();
			}
			FileOutputStream fos=new FileOutputStream(f,true);
			fos.write(content.getBytes());
			fos.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
