-- phpMyAdmin SQL Dump
-- http://www.phpmyadmin.net
--
-- 生成日期: 2018 年 08 月 30 日 11:43

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `HUqGrtBBnKTNBuxhJQSc`
--

-- --------------------------------------------------------

--
-- 表的结构 `del_wx_p`
--

CREATE TABLE IF NOT EXISTS `del_wx_p` (
  `id` int(11) NOT NULL DEFAULT '0',
  `xm` varchar(20) DEFAULT NULL,
  `wxh` varchar(20) DEFAULT NULL,
  `sfz` varchar(20) DEFAULT NULL,
  `kh` varchar(20) DEFAULT NULL,
  `pged` varchar(20) DEFAULT NULL,
  `cxjg` varchar(20) DEFAULT NULL,
  `cjz` varchar(20) DEFAULT NULL,
  `cjsj` varchar(20) DEFAULT NULL,
  `xgz` varchar(20) DEFAULT NULL,
  `xgsj` varchar(20) DEFAULT NULL,
  `desc` varchar(20) DEFAULT NULL,
  `p12` varchar(20) DEFAULT NULL,
  `p13` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `del_wx_p`
--

INSERT INTO `del_wx_p` (`id`, `xm`, `wxh`, `sfz`, `kh`, `pged`, `cxjg`, `cjz`, `cjsj`, `xgz`, `xgsj`, `desc`, `p12`, `p13`) VALUES
(16, '测试', '', '', '', '', '', 'xl', '2017-09-10 14:45:33', NULL, NULL, '', '', NULL),
(18, '刘青呀', 'liuqingya', '420982388899884884', '622020123000413042', '30000', '信用良好，可以开通', 'hc', '2017-09-11 10:23:35', NULL, NULL, '', '1', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `DEMO`
--

CREATE TABLE IF NOT EXISTS `DEMO` (
  `A` varchar(50) DEFAULT NULL,
  `B` varchar(50) DEFAULT NULL,
  `C` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `h_content`
--

CREATE TABLE IF NOT EXISTS `h_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `h_content`
--

INSERT INTO `h_content` (`id`, `name`, `text`) VALUES
(2, '公司简介', '<span style="line-height:21px;background-color:#ffffff;font-family:宋体, 新宋体, sans-serif;color:#494949;">&nbsp; <span style="font-size:14px;">&nbsp; 湖北华聚工程质量检测有限公司是经湖北省质量技术监督局计量认证，湖北省住房和城乡建设厅资格认可后，批准成立的从事建筑工程质量检测的专职机构，公司拥有独立的法人资格。位于襄阳市邓城大道新五中正对面国际创新产业基地，交通便利，环境优越。我公司具备完整的质量管理体系，检测工作严格遵循质量管理八大基本原则：以顾客为关注焦点、领导作用、全员参与、过程方法、体系方法、持续改进、基于事实的决策方法、与供方互利的关系。&nbsp;</span></span><br />\r\n<p>\r\n	<span style="line-height:21px;background-color:#ffffff;font-family:宋体, 新宋体, sans-serif;color:#494949;font-size:14px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公司一贯坚持方法科学、行为公正、结果准确、客户满意的质量方针，坚定不移地执行”以客户为中心”的服务宗旨，不折不扣地贯彻执行“科学公正、准确可靠、优质高效、方便客户”的服务方针，使客户的满意率达98%以上。公司每年投入大量资金用于完善和发展新项目、新技术以及职工的培训工作，并以严谨的科学质量管理体系，保护国家和消费者及工程建设单位的合法权益，确保为社会提供检测数据的公证性、准确性、可靠性、科学性。 湖北华聚质量检测有限公司竭诚用“一流的服务、一流的管理、一流的质量、一流的人才”为您提供科学、公正、满意的服务！</span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img src="/attached/image/20141215/20141215191123_37.jpg" alt="" /> \r\n</p>\r\n<p>\r\n	<img src="/attached/image/20141215/20141215191152_352.jpg" width="700" height="483" alt="" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img src="/attached/image/20141215/20141215191215_661.jpg" width="696" height="483" alt="" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img src="/attached/image/20141215/20141215191231_79.jpg" alt="" /> \r\n</p>\r\n<p>\r\n	<img src="/attached/image/20141215/20141215191244_270.jpg" alt="" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>'),
(3, '服务指南', '<span style="font-size:14px;">&nbsp; &nbsp;\r\n<p class="p0">\r\n	&nbsp; &nbsp; &nbsp; &nbsp; 主要经营范围：建设工程质量检测见证取样和设备安装两大项共<span>97</span><span>个参数。</span>\r\n</p>\r\n</span>'),
(4, '招贤纳士', '<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	暂无招聘信息，如有我们将第一时间在本网站发布。\r\n</p>'),
(5, '联系我们', '&nbsp;\r\n<p style="color:#494949;font-family:宋体, 新宋体, sans-serif;background-color:#FFFFFF;">\r\n	联系人：吉先生\r\n</p>\r\n<p style="color:#494949;font-family:宋体, 新宋体, sans-serif;background-color:#FFFFFF;">\r\n	电　话：0710-3629977\r\n</p>\r\n<p style="color:#494949;font-family:宋体, 新宋体, sans-serif;background-color:#FFFFFF;">\r\n	邮　箱：1657365348@qq.com\r\n</p>\r\n<p style="color:#494949;font-family:宋体, 新宋体, sans-serif;background-color:#FFFFFF;">\r\n	地　址：<span style="line-height:1.5;">湖北省襄阳市樊城区邓城大道49号国际创新产业基地5号106室</span>\r\n</p>\r\n<p style="color:#494949;font-family:宋体, 新宋体, sans-serif;background-color:#FFFFFF;">\r\n	<span style="line-height:1.5;">\r\n	<iframe src="http://121.41.44.54/hjgs/js/kindeditor/plugins/baidumap/index.html?center=112.126799%2C32.095738&zoom=18&width=558&height=360&markers=112.126799%2C32.095738&markerStyles=l%2CA" frameborder="0" style="width:560px;height:362px;">\r\n	</iframe>\r\n<br />\r\n</span>\r\n</p>'),
(6, '资料下载', '<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	暂无资料下载\r\n</p>');

-- --------------------------------------------------------

--
-- 表的结构 `h_images`
--

CREATE TABLE IF NOT EXISTS `h_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `url_max` varchar(100) NOT NULL,
  `url_min` varchar(100) NOT NULL,
  `pid` varchar(20) DEFAULT NULL,
  `type` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=94 ;

--
-- 转存表中的数据 `h_images`
--

INSERT INTO `h_images` (`id`, `name`, `url_max`, `url_min`, `pid`, `type`) VALUES
(22, 'GPS测量.jpg', '1418043859046.jpg', 'min1418043859046.jpg', NULL, '2'),
(23, '钢筋试验操作2.png', '1418043859598.png', 'min1418043859598.png', NULL, '2'),
(24, '钢筋试验操作.JPG', '1418043859678.JPG', 'min1418043859678.JPG', NULL, '2'),
(25, '湖北省设备安装培训.jpg', '1418043859759.jpg', 'min1418043859759.jpg', NULL, '2'),
(26, '湖北省室内环境培训.jpg', '1418043859825.jpg', 'min1418043859825.jpg', NULL, '2'),
(27, '会议.JPG', '1418043919397.JPG', 'min1418043919397.JPG', NULL, '2'),
(28, '机耕桥强度回弹检测.JPG', '1418043920547.JPG', 'min1418043920547.JPG', NULL, '2'),
(29, '例会.jpg', '1418043921719.jpg', 'min1418043921719.jpg', NULL, '2'),
(30, '轮式测距仪测量.jpg', '1418043921793.jpg', 'min1418043921793.jpg', NULL, '2'),
(31, '内部环境.png', '1418043922708.png', 'min1418043922708.png', NULL, '2'),
(32, '10T电子式万能试验机.JPG', '1418043963801.JPG', 'min1418043963801.JPG', NULL, '1'),
(33, '30T万能试验机.JPG', '1418043964674.JPG', 'min1418043964674.JPG', NULL, '1'),
(34, '100T电液式万能试验机.JPG', '1418043992877.JPG', 'min1418043992877.JPG', NULL, '1'),
(35, 'YAW-300型压力试验机.JPG', '1418043994742.JPG', 'min1418043994742.JPG', NULL, '1'),
(36, 'YES-2000型压力试验机.JPG', '1418044026758.JPG', 'min1418044026758.JPG', NULL, '1'),
(37, '比表测定仪.JPG', '1418044028560.JPG', 'min1418044028560.JPG', NULL, '1'),
(38, '程控抗渗机主机.JPG', '1418092843293.JPG', 'min1418092843293.JPG', NULL, '1'),
(39, '防水卷不透水仪.JPG', '1418092844153.JPG', 'min1418092844153.JPG', NULL, '1'),
(40, '沸煮箱.JPG', '1418092844855.JPG', 'min1418092844855.JPG', NULL, '1'),
(41, '骨料室.JPG', '1418092937329.JPG', 'min1418092937329.JPG', NULL, '1'),
(42, '恒温干燥箱.JPG', '1418092938847.JPG', 'min1418092938847.JPG', NULL, '1'),
(43, '恒温恒湿养护箱.JPG', '1418092939544.JPG', 'min1418092939544.JPG', NULL, '1'),
(44, '日常学习.jpg', '1418092989392.jpg', 'min1418092989392.jpg', NULL, '2'),
(45, '水泥路取芯检测2.JPG', '1418092989479.JPG', 'min1418092989479.JPG', NULL, '2'),
(46, '水泥路取芯检测.JPG', '1418258643605.JPG', 'min1418258643605.JPG', NULL, '2'),
(47, '水泥试验操作.JPG', '1418258644910.JPG', 'min1418258644910.JPG', NULL, '2'),
(48, '田间路宽度复核.JPG', '1418258645885.JPG', 'min1418258645885.JPG', NULL, '2'),
(49, '土地整理复核.JPG', '1418477345588.JPG', 'min1418477345588.JPG', NULL, '2'),
(50, '硬化沟护坡厚度检测.JPG', '1418477346702.JPG', 'min1418477346702.JPG', NULL, '2'),
(51, '硬化沟深度测量.JPG', '1418477347914.JPG', 'min1418477347914.JPG', NULL, '2'),
(52, '证书.png', '1418477349073.png', 'min1418477349073.png', NULL, '2'),
(53, '质量方针.png', '1418477349157.png', 'min1418477349157.png', NULL, '2'),
(54, '综合业务办公大厅.png', '1418477363308.png', 'min1418477363308.png', NULL, '2'),
(55, '检测仪器.JPG', '1418477430081.JPG', 'min1418477430081.JPG', NULL, '1'),
(56, '角强度试验机.JPG', '1418477430810.JPG', 'min1418477430810.JPG', NULL, '1'),
(57, '接地电阻测试仪.png', '1418477431434.png', 'min1418477431434.png', NULL, '1'),
(58, '绝缘电阻表.png', '1418477431515.png', 'min1418477431515.png', NULL, '1'),
(59, '路面弯沉仪.png', '1418477431591.png', 'min1418477431591.png', NULL, '1'),
(60, '耐压测试仪.png', '1418477481879.png', 'min1418477481879.png', NULL, '1'),
(61, '南方GPS.png', '1418477482052.png', 'min1418477482052.png', NULL, '1'),
(62, '取芯机.JPG', '1418477482134.JPG', 'min1418477482134.JPG', NULL, '1'),
(63, '砂浆搅拌机.JPG', '1418477482880.JPG', 'min1418477482880.JPG', NULL, '1'),
(64, '试配室.JPG', '1418477483615.JPG', 'min1418477483615.JPG', NULL, '1'),
(65, '水泥电动抗折试验机.JPG', '1418477540072.JPG', 'min1418477540072.JPG', NULL, '1'),
(66, '水泥胶砂流动度测定仪.JPG', '1418477540855.JPG', 'min1418477540855.JPG', NULL, '1'),
(67, '水泥胶砂振实台.JPG', '1418477542248.JPG', 'min1418477542248.JPG', NULL, '1'),
(68, '水泥净浆搅拌机.JPG', '1418477543062.JPG', 'min1418477543062.JPG', NULL, '1'),
(69, '水泥压力试验机.png', '1418477544544.png', 'min1418477544544.png', NULL, '1'),
(70, '振筛机.JPG', '1418477566630.JPG', 'min1418477566630.JPG', NULL, '1'),
(71, '直流电阻电桥.png', '1418477567402.png', 'min1418477567402.png', NULL, '1'),
(72, '设备安装培训2.png', '1456231757921.png', 'min1456231757921.png', NULL, '2'),
(73, '设备安装培训3.png', '1456231758921.png', 'min1456231758921.png', NULL, '2'),
(74, '设备安装培训4.png', '1456231759093.png', 'min1456231759093.png', NULL, '2'),
(75, '设备安装培训5.png', '1456231759343.png', 'min1456231759343.png', NULL, '2'),
(76, '设备安装培训.png', '1456231760203.png', 'min1456231760203.png', NULL, '2'),
(77, '室环培训2.png', '1456231777828.png', 'min1456231777828.png', NULL, '2'),
(78, '室环培训3.png', '1456231778468.png', 'min1456231778468.png', NULL, '2'),
(79, '室环培训4.png', '1456231778531.png', 'min1456231778531.png', NULL, '2'),
(80, '室环培训5.png', '1456231778937.png', 'min1456231778937.png', NULL, '2'),
(81, '室环培训.png', '1456231779500.png', 'min1456231779500.png', NULL, '2'),
(82, '便携式测氡仪.png', '1456231803515.png', 'min1456231803515.png', NULL, '1'),
(83, '冰箱.png', '1456231804078.png', 'min1456231804078.png', NULL, '1'),
(84, '大泡吸收管.png', '1456231804468.png', 'min1456231804468.png', NULL, '1'),
(85, '氮气.png', '1456231805000.png', 'min1456231805000.png', NULL, '1'),
(86, '档案柜.png', '1456231805140.png', 'min1456231805140.png', NULL, '1'),
(87, '电子天平.png', '1456231821453.png', 'min1456231821453.png', NULL, '1'),
(88, '分光光度计.png', '1456231821609.png', 'min1456231821609.png', NULL, '1'),
(89, '甲醛、氨现场快速测定仪.png', '1456231822312.png', 'min1456231822312.png', NULL, '1'),
(90, '气相色谱仪.png', '1456231822890.png', 'min1456231822890.png', NULL, '1'),
(91, '双通道大气恒流采样器.png', '1456231823343.png', 'min1456231823343.png', NULL, '1'),
(92, '蒸馏水器.png', '1456231828421.png', 'min1456231828421.png', NULL, '1');

-- --------------------------------------------------------

--
-- 表的结构 `h_index`
--

CREATE TABLE IF NOT EXISTS `h_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `addr` varchar(100) DEFAULT NULL,
  `jszy` varchar(500) DEFAULT NULL,
  `gd` varchar(100) DEFAULT NULL,
  `kfname1` varchar(50) DEFAULT NULL,
  `kfname2` varchar(50) DEFAULT NULL,
  `kfqq1` varchar(50) DEFAULT NULL,
  `kfqq2` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `h_index`
--

INSERT INTO `h_index` (`id`, `name`, `email`, `addr`, `jszy`, `gd`, `kfname1`, `kfname2`, `kfqq1`, `kfqq2`, `phone`) VALUES
(1, '吉先生', '1657365348@qq.com', '湖北省襄阳市樊城区邓城大道49号国际创新产业基地5号106室', '公司现有检测人员28人,工程师10人,助理工程师３人，经上级专业部门培训的工作人员12人， 落实全员持证上岗，人、证合一。实验室使用面积900平方，其中恒温面积13平方，非恒温面积887平方。固定资产原值 160万,仪器设备90台(套)。 可承担见证取样、设备安装两大项共97个参数。', '欢迎访问湖北华聚工程质量检测有限公司公司主页，祝愿大家开心工作每一天', '客服一', '客服二', '258506508', '258506508', '0710-3629977');

-- --------------------------------------------------------

--
-- 表的结构 `h_lyb`
--

CREATE TABLE IF NOT EXISTS `h_lyb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `text` varchar(500) DEFAULT NULL,
  `active` varchar(2) DEFAULT NULL,
  `recover` varchar(500) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `h_lyb`
--

INSERT INTO `h_lyb` (`id`, `name`, `email`, `phone`, `text`, `active`, `recover`, `date`) VALUES
(5, '路人甲', '345443294@qq.com', '156072222', '  路过，打个酱油', '1', ':）', '2014-12-08 20:48:56'),
(6, '廖先生', '726765521@qq.com', '15172378785', '你们公司怎么不招聘人呀，我觉得你们公司特别有前途', '1', '请留意我们网站的公告', '2016-01-22 17:24:45'),
(7, 'Sinyer', '1683177346@qq.com', '', '贵站存在安全漏洞，尽快修复', '1', '谢谢建议，我们会反映情况的，请问是什么漏洞', '2016-06-19 18:27:46');

-- --------------------------------------------------------

--
-- 表的结构 `h_title`
--

CREATE TABLE IF NOT EXISTS `h_title` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `orders` int(2) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `h_title`
--

INSERT INTO `h_title` (`id`, `name`, `orders`, `url`, `type`) VALUES
(1, '投诉建议', 6, 'index!selectHLyb.action', '0'),
(2, '2', 2, NULL, '1'),
(4, '3', 3, NULL, '1'),
(5, '4', 7, NULL, '1'),
(7, '6', 8, NULL, '1'),
(8, '员工风采', 4, 'index!selectHImages.action?name=2', '0'),
(9, '新闻动态', 5, 'index!selectHXwList.action', '0');

-- --------------------------------------------------------

--
-- 表的结构 `h_user`
--

CREATE TABLE IF NOT EXISTS `h_user` (
  `id` int(10) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `h_xw`
--

CREATE TABLE IF NOT EXISTS `h_xw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `text` mediumtext,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `h_xw`
--

INSERT INTO `h_xw` (`id`, `title`, `text`, `time`) VALUES
(3, '湖北华聚工程质量检测有限公司网站正式上线', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 湖北华聚工程质量检测有限公司网站正式上线', '2014-12-06 16:29:49'),
(4, '关于国有及国有控股企业“小金库”专项治理工作的文件资料汇编', '&nbsp; &nbsp; &nbsp; &nbsp;<span style="color:#333333;font-family:arial;font-size:13px;line-height:20px;background-color:#FFFFFF;">设备安装、见证取样检测资质核准不同意设备安...</span>&nbsp;<span style="color:#333333;font-family:arial;font-size:13px;line-height:20px;background-color:#FFFFFF;">罗田县广宇建设工程质量检测有限公司地基基础检测资质延续同意地基基础检测资质延续。 11&nbsp;</span><span style="color:#CC0000;font-family:arial;font-size:13px;line-height:20px;background-color:#FFFFFF;">湖北华聚工程质量检测有限公司</span>', '2014-12-06 16:31:53'),
(5, '工程质量检查要点', '<div class="result c-container " id="2" style="font-size:13px;color:#333333;font-family:arial;background-color:#FFFFFF;">\r\n	<h3 class="t" style="font-weight:normal;font-size:medium;">\r\n		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">一、质量行为</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">1、建设（开发）单位</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">&nbsp;&nbsp;&nbsp;&nbsp; 开发单位资质；开工前建设单位办理工程质量监督、施工图设计文件审查、</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">施工许可（开工报告）以及有重大变更施工图设计文件的重新报审手续，与勘察、设计、施工、监理单位签定的承包合同及相关责任主体的资质等级，组织图纸会审、设计交底情况。</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">2、勘察、设计单位</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 勘察、设计单位资质和人员资格，按照工程建设强制性标准和有关规定进行勘察、设计，责任人及注册师签字，参加地基验槽、单位工程质量验收；设计单位根据勘察文件进行设计，签发设计修改变更、技术洽商记录，基础、主体结构及有关重要部位工程质量验收，进行设计交底、参与建设工程质量事故分析、处理等。</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">3、施工单位</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 施工企业资质、项目经理部管理人员的资格与配备；分包单位资质与对分包单位的管理；施工组织设计或施工方案审批及执行；施工现场施工操作技术规程及有关技术标准的配备；质量检验制度及执行；对建筑材料、构配件、设备及预拌混凝土的进场检验，试块、试件及有关材料的现场取样、送检；按工程技术标准及经审查批准的施工图设计文件施工等。</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">4、监理单位</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 监理单位资质、项目监理机构的人员资格与配备；监理规划、监理细则、旁站监理方案的编制及执行，对施工质量实施的监理；对施工企业的资质、项目经理部人员资格、质量保证体系和质量管理体系的审查，对施工组织设计和施工方案的审批；对材料、构配件、设备检验等。</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">二、勘察、设计文件质量</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1、勘察方案或勘察纲要、原始记录、勘察报告。依据的技术标准，地基设计等级、岩土工程勘察等级的评价；勘探孔的类型设置、数量、深度、间距；钻探工艺；取土（岩）设备、取样数量、质量；室内及原位测试数量、质量、测试手段；各种原位测试数据、图表的可靠性和完整性；对场地地形、地貌、地层构造、岩土性质及其均匀性描述和分析；各项岩土性质指标，岩土的强度参数、变形参数、地基承载力、桩基设计参数建议值的取值依据、准确性和合理性；对地基基础方案、基坑工程、降水工程、桩基工程等提出的分析建议以及所需设计参数的合理性和准确性；地下水埋藏情况、类型、水位、变化规律以及土</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">和水对建筑材料腐蚀性的分析评价；建筑抗震地段的划分、场地土类别、场地类型、液化性评价与计算； 对特殊性岩土的勘察、取样和测试；对不良地质条件的调查和勘探。</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2、设计文件满足强制性标准和《省建筑工程施工图设计文件结构专业审查要点》的要求。荷载取值，抗震设防烈度、设计地震分组，建筑结构的安全等级，建筑节能设计；地基基础方案，室内地坪标高与绝对标高的关系，地基基础设计等级，基础持力层的确定，桩基础桩型的确定，承载力特征值的确定，基础埋深，地基及基础的计算，沉降变形验算及软弱下卧层的验算，地基与边坡的稳定验算；结构型式的选择，建筑物高度、高宽比，结构伸缩缝、沉降缝、抗震缝的设置；结构的构造，混凝土的强度等级；结构构件的保护层厚度，构件裂缝宽度及挠度的验算，构件的配筋率，柱的轴压比，抗震墙的轴压比，边缘构件的设置，高层建筑中的周期比，结构位移，剪重比；砌体结构中构造柱、圈梁的设置，墙垛的尺寸，女儿墙高度，预制构件搁置长度，阳台、雨蓬、檐口、女儿墙的锚固构造措施，高度及层数的限值，横墙间距限值，软土地区建筑物的长高比限值，底框结构层间刚度比限值，砌体材料强度指标的选择；结构分析计算，计算的结构模型，上机计算数据，采用程序的名称和版本。</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">三、施工质量</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">&nbsp; 1、技术档案资料</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 施工组织设计（施工方案）及技术交底、技术措施、质量保证措施，图纸会审、设计变更、工程洽商记录，工程定位测量、放线记录；原材料、设备、器具出厂合格证及进场检（试）验报告及验收记录；地基承载力复查记录，地基处理质量验收记录，桩基施工、验收记录，桩基检测报告，复合地基检测报告，地基复查记录，地下防水混凝土抗渗试块和地下防水工程防水效果检查记录；混凝土及砂浆配合比通知单，混凝土、砂浆试件的试验报告，装配式结构预制构件的合格证和安装验收记录；管道试验记录，设备单机试运转记录，系统无生产负荷联合试运转与调试记录；电气工程接地电阻、绝缘电阻测试记录，电气设备交接试验记录，空载运行和负荷试运行记录，建筑照明通电试运行记录；施工日记，隐蔽工程检查验收记录，沉降观测记录工程质量事故调查处理资料，各检验批、分项、分部、单位工程质量验收记录等；（市政工程还包括土质的干密度与最佳含水量试验报告，测量复核记录，道路各层压实度试验记录，基础强度试验记录，路面弯沉试验报告；无损检测资料，混凝土取芯资料等。）</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">&nbsp; 2、原材料质量和计量控制</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 原材料（产品）、成品、半成品、构配件、设备、器具的品种、规格、质量、性能及存放条件；钢筋的直径和外观质量，水泥品种、强度等级、出厂日期，普通烧结砖、多孔砖、砌块的外形尺寸和外观质量，砂、石料外观质量、规格；混凝土、砂浆配合比，原材料计量、拌制控制，计量器具设置位置，运行灵活、准确性以及混凝土、砂浆的投料顺序、搅拌时间控制，预拌混凝土的坍落度、砂浆的稠度；混凝土、砂浆标养及混凝土同条件养护试块留置、数量。</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">&nbsp;&nbsp; 3、实体质量</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ⑴房屋建筑工程</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">&nbsp;&nbsp; ①地基基础：天然地基承载力取值是否合理；人工地基的施工方法、质量控</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">制与检测；灰土地基、砂和砂石地基的原材料、配合比，分层铺设的厚度、分段施工时上下两层的搭接长度、夯实时加水量、夯压遍数、压实系数，土工合成材料地基清基、回填料铺设厚度及平整度、铺设方向、接缝搭接长度、或缝接状况及与结构的连接状况，粉煤灰地基的铺筑厚度、碾压遍数、施工含水量控制、搭接区碾压程度、压实系数，强夯地基的锤落距、夯击遍数及顺序、注浆地基的注浆孔位、孔深、压力，预压地基的堆载高度、沉降速率，振冲地基的各种施工参数，高压喷射注浆地基和水泥土搅拌桩地基的平均直径、桩身中心位置及质量，水泥粉煤灰碎石桩复合地基和夯实水泥土复合地基的桩顶标高、桩位，砂桩地基的桩位、灌砂量、标高、垂直度，地基强度，承载力；基础定位、标高、几何尺寸，桩基础的数量、桩身中心位置及质量，混凝土浇注，钢筋制作安装，混凝土强度、钢筋保护层厚度检测，毛石基础的材质、砌体灰缝厚度、搭接长度、垂</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">直度及第一皮石块、转角处、交接处、洞口处的施工工艺；施工中各检验批质量。</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">&nbsp;&nbsp;&nbsp;&nbsp; ②主体结构：模板材质、种类，模板隔离剂涂刷，用于模板的低坪、胎模应平整光洁，其支架可靠、稳定、便于调节，混凝土构件的拆模时间控制；主要受力钢筋的级别、种类、直径、根数、间距，受力钢筋和箍筋的弯钩角度、弯弧内径、弯后平直长度，弯起钢筋的弯折位置，加工后截面几何尺寸，钢筋机械连接、焊接接头面积百分率、位置、绑扎接头钢筋横向净距、接头面积百分率、搭接长度、范围及外观质量，连接、锚固、接头位置及同一截面的接头数量，受力钢筋的位置；预应力张拉，预应力筋进场的批次和产品的抽样检验、张拉机具设备及仪表的维护和校验、锚具、夹具和连接器，预应力钢筋混凝土的外观质量及安装，混凝土的运输、浇筑、振捣分层厚度，施工缝的留置位置及处理，混凝土的养护，外加剂使用，混凝土结构外观质量，梁、柱、楼板、阳台现浇混凝土保护层及楼板、阳台厚度和混凝土强度检测；砌筑质量，皮数杆的位置及标注，组砌方法、形式，纵横墙交接及转角处留搓形式，拉结的位置、数量，砌体、构造</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">柱位移、垂直度，砖砌体检测；圈梁、构造柱（芯柱）混凝土及钢筋施工；模板工程、钢筋工程（连接、安装）、钢筋焊接工程（焊接骨架、焊接网）、（电弧焊接头）、（电渣压力焊、气压焊、闪光对焊接头）检验批质量；混凝土工程、现浇结构工程（含设备基础）、装配式结构工程（预制构件）、（安装连接）、型钢混凝土组合结构工程、砌体结构工程、石砌体工程、填充墙砌体工程检验批质量。</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">&nbsp;&nbsp;&nbsp;&nbsp; ③屋面：卷材防水屋面工程的找平层及其强度、转角处的圆弧半径、排水坡度、保温层厚度及含水率、防水层；涂膜防水屋面工程的基层干燥程度、配合比计量、涂料品种分层分遍涂布、防水层；刚性防水屋面工程的细石混凝土防水层、密封材料基层、嵌填、材料表面；瓦屋面工程平瓦屋面铺置牢固程度及坡度，油毡瓦屋面的固定，金属板材屋面连接及密封处理；隔热屋面工程架空屋面的隔热制品，蓄水屋面的溢水口、过水孔、排水管、溢水管大小、位置、标高，种植屋面挡墙泻水孔的留设；屋面工程防水层和细部在天沟、檐沟、檐口、水落管、泛水、变形缝、伸出屋面管道的防水构造，渗漏、积水现象；检验批质量。</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ④建筑地面：整体面层分格条设置，板块面层邻接处缝隙、平整、与管沟、</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">孔洞、检查井等邻接处的处理；厕浴间和有防滑要求的建筑地面的板块材料要符合设计要求，厕浴间、厨房和有排水（或其他液体）要求的建筑地面基层与相连接各类面层的标高差；基层铺设中基土、垫层、找平层、隔离层和填充层的检验批质量，找平层有防水要求建筑地面工程铺设前立管、套管、地漏与楼板间的密封处理、排水坡度；厕浴间和有防水要求建筑地面设置的防水隔离层楼层结构形式、混凝土强度等级、楼板四周高度、结构层标高、预留孔位置；整体面层铺设中不发火（防爆的）面层采用的原材料；板块面层铺设的砖面层、大理石面层、花岗岩面层、预制板块面层、料石面层、塑料板面层、活动地板面层和地毯面层的基层强度、板块间填缝、覆盖养护、有腐蚀要求棉层所采用材料的材质。&nbsp;</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">&nbsp;&nbsp;&nbsp;&nbsp; ⑤装饰装修（含二次高级装饰装修）：水刷石、斩假石、干粘石、假面砖粘结牢固，无脱层、空鼓、裂缝，表面平整光滑，棱角整齐、方正，装饰抹灰分格条（缝的设置）；门窗、玻璃安装及在砌体的固定形式、牢固程度；明、暗龙骨吊顶工程的吊杆、龙骨和饰面材料安装的牢固程度，金属吊</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">杆、龙骨的表面防腐处理，木吊杆、龙骨的防火、防腐处理；饰面板安装工程的预埋件（或后置埋件）、连接件的数量、规格、位置、连接方法、防腐处理、安装及饰面砖粘贴牢固程度；明框、隐框或半隐框玻璃幕墙工程的硅酮结构密封胶（隐框、半隐框幕墙为中性硅酮结构密封胶）的使用有效期，主体结构与幕墙连接的各种预埋件数量、规格、位置和防腐处理，幕墙的金属框架与主体结构预埋件的连接、立柱与横梁的连接及幕墙板的安装；（高级、普通级）水性涂料涂饰工程、溶剂型涂料涂饰工程、美术涂饰工程的涂饰、粘结；裱糊工程的各幅拼接、粘结，软包工程的龙骨、衬板、边框安装；细部工程的制作与安装，其预埋件或后置埋件的数量、规格、位置、造型、尺寸、固定方法和防腐处理，护栏和扶手高度、栏杆间距、安装位置的准确、牢固及花饰制作与安装；检验批质量；二次高级装饰装修是否有擅自变动房屋建筑主体和承重结构；涉及房屋建筑主体</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">和承重结构变动的，有无原设计单位或者具有相应资质等级的设计单位提出的设计方案。&nbsp;</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">&nbsp;&nbsp;&nbsp; ⑥电气安全</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">成套配电柜、控制柜和电力配电箱及照明配电箱（盘）的安装；线路敷设，</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">穿线管口的处理，管与管、管与盒（箱）等器件的连接，电线、电缆穿管、电线管敷设、线槽敷设和线槽敷线分项工程检验批质量；金属导管、箱、盘的接地、接零，接地装置安装分项工程检验批质量；灯具、开关、插座固定牢固可靠，照明开关安装、插座安装接线分项工程检验批质量；重型灯具安装情况；棚内电气管线敷设及导线的型号、规格；火灾自动报警装置；避雷带的安装、接地，防雷引下线的敷设分项工程检验批质量等。</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">&nbsp;&nbsp;&nbsp;&nbsp; ⑵市政道路和桥梁工程</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">①路基：天然地基原地面在填土前的技术处理、局部软弱地基处理；软土路</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">基软土的沉降量、固结度及软土路基的处理；填土压实分层厚度、含水量、压实机具和碾压原则、速度及遍数；材料摊铺的均匀度、松铺厚度、纵横坡度；路基完成面后的道路中线（位置标高）、压实度。</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">②路面：基层各结构层中混合料、水泥混凝土、沥青混凝土混合料的设计配</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">合比和施工配合比；路面各结构层中基层和面层的厚度、密实度（压实度）、强度（基层：稳定土类基层为无侧抗压强度、其他类型基层为抗弯拉强度）、平整度和宽度；碾压轮迹、井框与路面高差、路边石靠背混凝土等细部的处理。</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">③桥梁基础：墩、台基础的平面位置和高程；基坑的尺寸、标高和天然地基</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">的承载力特征值（或桩基础的成孔质量和持力层强度极限值）；桩基础成桩后桩身混凝土质量。</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">④桥梁墩、台、柱等主体构筑物：平面位置和控制点（面）的高程；模板支</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">撑质量、钢筋骨架的制作与安装质量、混凝土浇注质量。</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">⑤桥梁桥跨结构：模板支架的强度、刚度和稳定性；混凝土配合比；钢筋和</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">预应力钢筋的制作与安装，包括品种、规格、数量、长度、安装位置；混凝土拌和、输送、振捣和养护；现场预应力施加张拉设备和锚、夹具质量；按规定的检验频率和标定周期进行抽样检查和定期送检；大型预制构件制作与安装质量，预制构件混凝土施工工艺的控制，预应力钢筋和普通钢筋骨架制作安装质量，平面位置和高程的控制，平 、立面安装位置。</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">&nbsp; 四、存在问题工程的施工图审查机构、检测（试验）单位和预拌混凝土生产</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">企业工作质量</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">&nbsp;&nbsp;&nbsp;&nbsp; 1、施工图审查机构图审机构的资质，按核准的等级和范围从事施工图审查业务；按照有关规定进行审查，无错审、漏审；审查时限符合要求；审查合格书（批准书）完整有效，并在施工图上加盖节能审查专用章。</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2、检测（试验）单位</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 单位资质及相关责任人员资格，在资质范围内承揽任务；掌握、执行现行有关技术标准、规范、规程，并配备齐全；仪器设备按规定进行计量检定；试验委托单、试验记录、试验报告符合省统一规定的格式，编号一致，原始资料、原始记录、试验报告的填写和审查记录做到三级审核，章戳俱全，出具的试验报告真实、数据可靠、字迹工整清晰，填写齐全，结论准确；检测数据和试验报告使用法定计量单位；有不合格试验报告台帐并按规定及时返馈、上报。</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3、预拌混凝土生产企业</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 企业资质及相关人员资料，在资质范围内承揽任务；建立、健全质量保证体系和质量管理体系，掌握、执行现行有关技术标准、规范、规程，并配备齐全；仪器设备按规定进行计量检定；原材料进厂的归类、仓储情况，品种、规格是否符合产品标准要求；搅拌过程质量控制，按配合比进行计量</span><br />\r\n<span style="color:#444444;font-family:Verdana;font-size:14px;line-height:24px;background-color:#FFFFFF;">，验证混凝土的工作性检验，留置标养试件，封闭的搅拌站机房，密闭状态下进行粉料的运输及称量，收尘装置和防止扬尘措施；运输过程质量控制，运输车有混凝土强度等级及特殊要求的标识，装、卸料时是否随意加水，搅拌筒保持转动，混凝土保塑时间是否超过规定，对混凝土超过初凝时间，产生离析、泌水现象后的处理；验收过程质量控制，在交货地点按规定制作与送检试件，提供出厂质量合格证及质量检验报告，有完整的质量证明资料。&nbsp;</span>\r\n	</h3>\r\n</div>\r\n<div class="result c-container " id="4" style="font-size:13px;color:#333333;font-family:arial;background-color:#FFFFFF;">\r\n	<h3 class="t" style="font-weight:normal;font-size:medium;">\r\n		<span><b></b></span><a href="http://www.baidu.com/link?url=R7yCUsyjTu5Xc9TuBqb7y7Hc59rfFCmXgFvkm_g49i6pc5VKvG4lP9eNYCYLDC-AKwh0I1oezkzFV9iI23ST0TdKLrVR88MUZCuUN7h-Nda" target="_blank"><span style="color:#CC0000;"></span></a> \r\n	</h3>\r\n</div>', '2014-12-06 16:32:22'),
(7, '工程检测', '<h1 class="title maintitle" id="" style="text-align:left;">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;为保障已建、在建、将建的建筑工程安全，在建设全过程中对与建筑物有关的地基、建筑材料、施工工艺、建筑结构进行测试的一项重要工作。<br />\r\n</h1>', '2014-12-06 16:33:11'),
(8, '湖北华聚工程质量检测有限公司', '&nbsp;&nbsp;&nbsp;&nbsp;湖北华聚工程质量检测有限公司', '2014-12-06 19:43:47');
INSERT INTO `h_xw` (`id`, `title`, `text`, `time`) VALUES
(9, '中华人民共和国特种设备安全法', '<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	<strong>&nbsp; 编者按：</strong>6月29日，全国人大常委会第三次会议通过了《中华人民共和国特种设备安全法》，国家主席习近平签署第四号主席令予以公布。《中华人民共和国特种设备安全法》将于2014年1月1日起施行，这部法律在进一步完善特种设备安全监察制度的基础上，创造性地建立了对特种设备整个生命周期完整信息记录的可追溯制度、缺陷特种设备召回制度和存在严重事故隐患特种设备的报废制度。现将该法的部分内容刊登如下，供读者学习参考。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp;<strong>&nbsp;第一章 总　则</strong>\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第一条 为了加强特种设备安全工作，预防特种设备事故，保障人身和财产安全，促进经济社会发展，制定本法。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第二条 特种设备的生产（包括设计、制造、安装、改造、修理）、经营、使用、检验、检测和特种设备安全的监督管理，适用本法。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 本法所称特种设备，是指对人身和财产安全有较大危险性的锅炉、压力容器（含气瓶）、压力管道、电梯、起重机械、客运索道、大型游乐设施、场（厂）内专用机动车辆，以及法律、行政法规规定适用本法的其他特种设备。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 国家对特种设备实行目录管理。特种设备目录由国务院负责特种设备安全监督管理的部门制定，报国务院批准后执行。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第三条 特种设备安全工作应当坚持安全第一、预防为主、节能环保、综合治理的原则。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第四条 国家对特种设备的生产、经营、使用，实施分类的、全过程的安全监督管理。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第五条 国务院负责特种设备安全监督管理的部门对全国特种设备安全实施监督管理。县级以上地方各级人民政府负责特种设备安全监督管理的部门对本行政区域内特种设备安全实施监督管理。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第六条 国务院和地方各级人民政府应当加强对特种设备安全工作的领导，督促各有关部门依法履行监督管理职责。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 县级以上地方各级人民政府应当建立协调机制，及时协调、解决特种设备安全监督管理中存在的问题。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第七条 特种设备生产、经营、使用单位应当遵守本法和其他有关法律、法规，建立、健全特种设备安全和节能责任制度，加强特种设备安全和节能管理，确保特种设备生产、经营、使用安全，符合节能要求。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第八条 特种设备生产、经营、使用、检验、检测应当遵守有关特种设备安全技术规范及相关标准。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 特种设备安全技术规范由国务院负责特种设备安全监督管理的部门制定。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第九条 特种设备行业协会应当加强行业自律，推进行业诚信体系建设，提高特种设备安全管理水平。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第十条 国家支持有关特种设备安全的科学技术研究，鼓励先进技术和先进管理方法的推广应用，对做出突出贡献的单位和个人给予奖励。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第十一条 负责特种设备安全监督管理的部门应当加强特种设备安全宣传教育，普及特种设备安全知识，增强社会公众的特种设备安全意识。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第十二条 任何单位和个人有权向负责特种设备安全监督管理的部门和有关部门举报涉及特种设备安全的违法行为，接到举报的部门应当及时处理。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;<strong>&nbsp; 第二章 生产、经营、使用</strong>\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp;<strong>&nbsp;第一节 一般规定</strong>\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第十三条 特种设备生产、经营、使用单位及其主要负责人对其生产、经营、使用的特种设备安全负责。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 特种设备生产、经营、使用单位应当按照国家有关规定配备特种设备安全管理人员、检测人员和作业人员，并对其进行必要的安全教育和技能培训。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第十四条 特种设备安全管理人员、检测人员和作业人员应当按照国家有关规定取得相应资格，方可从事相关工作。特种设备安全管理人员、检测人员和作业人员应当严格执行安全技术规范和管理制度，保证特种设备安全。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第十五条 特种设备生产、经营、使用单位对其生产、经营、使用的特种设备应当进行自行检测和维护保养，对国家规定实行检验的特种设备应当及时申报并接受检验。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第十六条 特种设备采用新材料、新技术、新工艺，与安全技术规范的要求不一致，或者安全技术规范未作要求、可能对安全性能有重大影响的，应当向国务院负责特种设备安全监督管理的部门申报，由国务院负责特种设备安全监督管理的部门及时委托安全技术咨询机构或者相关专业机构进行技术评审，评审结果经国务院负责特种设备安全监督管理的部门批准，方可投入生产、使用。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 国务院负责特种设备安全监督管理的部门应当将允许使用的新材料、新技术、新工艺的有关技术要求，及时纳入安全技术规范。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第十七条 国家鼓励投保特种设备安全责任保险。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;<strong>第二节 生产</strong>\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第十八条 国家按照分类监督管理的原则对特种设备生产实行许可制度。特种设备生产单位应当具备下列条件，并经负责特种设备安全监督管理的部门许可，方可从事生产活动：\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; （一）有与生产相适应的专业技术人员；\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; （二）有与生产相适应的设备、设施和工作场所；\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; （三）有健全的质量保证、安全管理和岗位责任等制度。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第十九条 特种设备生产单位应当保证特种设备生产符合安全技术规范及相关标准的要求，对其生产的特种设备的安全性能负责。不得生产不符合安全性能要求和能效指标以及国家明令淘汰的特种设备。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第二十条 锅炉、气瓶、氧舱、客运索道、大型游乐设施的设计文件，应当经负责特种设备安全监督管理的部门核准的检验机构鉴定，方可用于制造。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 特种设备产品、部件或者试制的特种设备新产品、新部件以及特种设备采用的新材料，按照安全技术规范的要求需要通过型式试验进行安全性验证的，应当经负责特种设备安全监督管理的部门核准的检验机构进行型式试验。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第二十一条 特种设备出厂时，应当随附安全技术规范要求的设计文件、产品质量合格证明、安装及使用维护保养说明、监督检验证明等相关技术资料和文件，并在特种设备显著位置设置产品铭牌、安全警示标志及其说明。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第二十二条 电梯的安装、改造、修理，必须由电梯制造单位或者其委托的依照本法取得相应许可的单位进行。电梯制造单位委托其他单位进行电梯安装、改造、修理的，应当对其安装、改造、修理进行安全指导和监控，并按照安全技术规范的要求进行校验和调试。电梯制造单位对电梯安全性能负责。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第二十三条 特种设备安装、改造、修理的施工单位应当在施工前将拟进行的特种设备安装、改造、修理情况书面告知直辖市或者设区的市级人民政府负责特种设备安全监督管理的部门。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第二十四条 特种设备安装、改造、修理竣工后，安装、改造、修理的施工单位应当在验收后三十日内将相关技术资料和文件移交特种设备使用单位。特种设备使用单位应当将其存入该特种设备的安全技术档案。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第二十五条 锅炉、压力容器、压力管道元件等特种设备的制造过程和锅炉、压力容器、压力管道、电梯、起重机械、客运索道、大型游乐设施的安装、改造、重大修理过程，应当经特种设备检验机构按照安全技术规范的要求进行监督检验；未经监督检验或者监督检验不合格的，不得出厂或者交付使用。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第二十六条 国家建立缺陷特种设备召回制度。因生产原因造成特种设备存在危及安全的同一性缺陷的，特种设备生产单位应当立即停止生产，主动召回。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 国务院负责特种设备安全监督管理的部门发现特种设备存在应当召回而未召回的情形时，应当责令特种设备生产单位召回。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp;<strong>&nbsp;第三节 经营</strong>\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第二十七条 特种设备销售单位销售的特种设备，应当符合安全技术规范及相关标准的要求，其设计文件、产品质量合格证明、安装及使用维护保养说明、监督检验证明等相关技术资料和文件应当齐全。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 特种设备销售单位应当建立特种设备检查验收和销售记录制度。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 禁止销售未取得许可生产的特种设备，未经检验和检验不合格的特种设备，或者国家明令淘汰和已经报废的特种设备。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第二十八条 特种设备出租单位不得出租未取得许可生产的特种设备或者国家明令淘汰和已经报废的特种设备，以及未按照安全技术规范的要求进行维护保养和未经检验或者检验不合格的特种设备。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第二十九条 特种设备在出租期间的使用管理和维护保养义务由特种设备出租单位承担，法律另有规定或者当事人另有约定的除外。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第三十条　进口的特种设备应当符合我国安全技术规范的要求，并经检验合格；需要取得我国特种设备生产许可的，应当取得许可。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 进口特种设备随附的技术资料和文件应当符合本法第二十一条的规定，其安装及使用维护保养说明、产品铭牌、安全警示标志及其说明应当采用中文。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 特种设备的进出口检验，应当遵守有关进出口商品检验的法律、行政法规。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第三十一条 进口特种设备，应当向进口地负责特种设备安全监督管理的部门履行提前告知义务。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	<strong>&nbsp;&nbsp;&nbsp; 第四节 使用</strong>\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第三十二条 特种设备使用单位应当使用取得许可生产并经检验合格的特种设备。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 禁止使用国家明令淘汰和已经报废的特种设备。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第三十三条 特种设备使用单位应当在特种设备投入使用前或者投入使用后三十日内，向负责特种设备安全监督管理的部门办理使用登记，取得使用登记证书。登记标志应当置于该特种设备的显著位置。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第三十四条 特种设备使用单位应当建立岗位责任、隐患治理、应急救援等安全管理制度，制定操作规程，保证特种设备安全运行。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第三十五条 特种设备使用单位应当建立特种设备安全技术档案。安全技术档案应当包括以下内容：\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; （一）特种设备的设计文件、产品质量合格证明、安装及使用维护保养说明、监督检验证明等相关技术资料和文件；\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; （二）特种设备的定期检验和定期自行检查记录；\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; （三）特种设备的日常使用状况记录；\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; （四）特种设备及其附属仪器仪表的维护保养记录；\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; （五）特种设备的运行故障和事故记录。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第三十六条 电梯、客运索道、大型游乐设施等为公众提供服务的特种设备的运营使用单位，应当对特种设备的使用安全负责，设置特种设备安全管理机构或者配备专职的特种设备安全管理人员；其他特种设备使用单位，应当根据情况设置特种设备安全管理机构或者配备专职、兼职的特种设备安全管理人员。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第三十七条 特种设备的使用应当具有规定的安全距离、安全防护措施。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 与特种设备安全相关的建筑物、附属设施，应当符合有关法律、行政法规的规定。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第三十八条 特种设备属于共有的，共有人可以委托物业服务单位或者其他管理人管理特种设备，受托人履行本法规定的特种设备使用单位的义务，承担相应责任。共有人未委托的，由共有人或者实际管理人履行管理义务，承担相应责任。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第三十九条 特种设备使用单位应当对其使用的特种设备进行经常性维护保养和定期自行检查，并作出记录。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 特种设备使用单位应当对其使用的特种设备的安全附件、安全保护装置进行定期校验、检修，并作出记录。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第四十条 特种设备使用单位应当按照安全技术规范的要求，在检验合格有效期届满前一个月向特种设备检验机构提出定期检验要求。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 特种设备检验机构接到定期检验要求后，应当按照安全技术规范的要求及时进行安全性能检验。特种设备使用单位应当将定期检验标志置于该特种设备的显著位置。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 未经定期检验或者检验不合格的特种设备，不得继续使用。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第四十一条 特种设备安全管理人员应当对特种设备使用状况进行经常性检查，发现问题应当立即处理；情况紧急时，可以决定停止使用特种设备并及时报告本单位有关负责人。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 特种设备作业人员在作业过程中发现事故隐患或者其他不安全因素，应当立即向特种设备安全管理人员和单位有关负责人报告；特种设备运行不正常时，特种设备作业人员应当按照操作规程采取有效措施保证安全。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第四十二条 特种设备出现故障或者发生异常情况，特种设备使用单位应当对其进行全面检查，消除事故隐患，方可继续使用。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第四十三条 客运索道、大型游乐设施在每日投入使用前，其运营使用单位应当进行试运行和例行安全检查，并对安全附件和安全保护装置进行检查确认。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 电梯、客运索道、大型游乐设施的运营使用单位应当将电梯、客运索道、大型游乐设施的安全使用说明、安全注意事项和警示标志置于易于为乘客注意的显著位置。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 公众乘坐或者操作电梯、客运索道、大型游乐设施，应当遵守安全使用说明和安全注意事项的要求，服从有关工作人员的管理和指挥；遇有运行不正常时，应当按照安全指引，有序撤离。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第四十四条 锅炉使用单位应当按照安全技术规范的要求进行锅炉水（介）质处理，并接受特种设备检验机构的定期检验。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 从事锅炉清洗，应当按照安全技术规范的要求进行，并接受特种设备检验机构的监督检验。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第四十五条 电梯的维护保养应当由电梯制造单位或者依照本法取得许可的安装、改造、修理单位进行。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 电梯的维护保养单位应当在维护保养中严格执行安全技术规范的要求，保证其维护保养的电梯的安全性能，并负责落实现场安全防护措施，保证施工安全。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 电梯的维护保养单位应当对其维护保养的电梯的安全性能负责；接到故障通知后，应当立即赶赴现场，并采取必要的应急救援措施。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第四十六条 电梯投入使用后，电梯制造单位应当对其制造的电梯的安全运行情况进行跟踪调查和了解，对电梯的维护保养单位或者使用单位在维护保养和安全运行方面存在的问题，提出改进建议，并提供必要的技术帮助；发现电梯存在严重事故隐患时，应当及时告知电梯使用单位，并向负责特种设备安全监督管理的部门报告。电梯制造单位对调查和了解的情况，应当作出记录。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第四十七条 特种设备进行改造、修理，按照规定需要变更使用登记的，应当办理变更登记，方可继续使用。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第四十八条 特种设备存在严重事故隐患，无改造、修理价值，或者达到安全技术规范规定的其他报废条件的，特种设备使用单位应当依法履行报废义务，采取必要措施消除该特种设备的使用功能，并向原登记的负责特种设备安全监督管理的部门办理使用登记证书注销手续。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 前款规定报废条件以外的特种设备，达到设计使用年限可以继续使用的，应当按照安全技术规范的要求通过检验或者安全评估，并办理使用登记证书变更，方可继续使用。允许继续使用的，应当采取加强检验、检测和维护保养等措施，确保使用安全。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第四十九条 移动式压力容器、气瓶充装单位，应当具备下列条件，并经负责特种设备安全监督管理的部门许可，方可从事充装活动：\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; （一）有与充装和管理相适应的管理人员和技术人员；\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; （二）有与充装和管理相适应的充装设备、检测手段、场地厂房、器具、安全设施；\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; （三）有健全的充装管理制度、责任制度、处理措施。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 充装单位应当建立充装前后的检查、记录制度，禁止对不符合安全技术规范要求的移动式压力容器和气瓶进行充装。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 气瓶充装单位应当向气体使用者提供符合安全技术规范要求的气瓶，对气体使用者进行气瓶安全使用指导，并按照安全技术规范的要求办理气瓶使用登记，及时申报定期检验。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;<strong>第三章 检验、检测</strong>\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第五十条 从事本法规定的监督检验、定期检验的特种设备检验机构，以及为特种设备生产、经营、使用提供检测服务的特种设备检测机构，应当具备下列条件，并经负责特种设备安全监督管理的部门核准，方可从事检验、检测工作：\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; （一）有与检验、检测工作相适应的检验、检测人员；\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; （二）有与检验、检测工作相适应的检验、检测仪器和设备；\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; （三）有健全的检验、检测管理制度和责任制度。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第五十一条 特种设备检验、检测机构的检验、检测人员应当经考核，取得检验、检测人员资格，方可从事检验、检测工作。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 特种设备检验、检测机构的检验、检测人员不得同时在两个以上检验、检测机构中执业；变更执业机构的，应当依法办理变更手续。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第五十二条 特种设备检验、检测工作应当遵守法律、行政法规的规定，并按照安全技术规范的要求进行。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 特种设备检验、检测机构及其检验、检测人员应当依法为特种设备生产、经营、使用单位提供安全、可靠、便捷、诚信的检验、检测服务。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第五十三条 特种设备检验、检测机构及其检验、检测人员应当客观、公正、及时地出具检验、检测报告，并对检验、检测结果和鉴定结论负责。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 特种设备检验、检测机构及其检验、检测人员在检验、检测中发现特种设备存在严重事故隐患时，应当及时告知相关单位，并立即向负责特种设备安全监督管理的部门报告。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 负责特种设备安全监督管理的部门应当组织对特种设备检验、检测机构的检验、检测结果和鉴定结论进行监督抽查，但应当防止重复抽查。监督抽查结果应当向社会公布。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第五十四条 特种设备生产、经营、使用单位应当按照安全技术规范的要求向特种设备检验、检测机构及其检验、检测人员提供特种设备相关资料和必要的检验、检测条件，并对资料的真实性负责。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第五十五条 特种设备检验、检测机构及其检验、检测人员对检验、检测过程中知悉的商业秘密，负有保密义务。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 特种设备检验、检测机构及其检验、检测人员不得从事有关特种设备的生产、经营活动，不得推荐或者监制、监销特种设备。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 第五十六条 特种设备检验机构及其检验人员利用检验工作故意刁难特种设备生产、经营、使用单位的，特种设备生产、经营、使用单位有权向负责特种设备安全监督管理的部门投诉，接到投诉的部门应当及时进行调查处理。\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp;<strong>&nbsp;以下略</strong>\r\n</p>\r\n<p style="font-size:14px;font-family:Verdana, Arial, Helvetica, sans-serif;color:#505050;">\r\n	&nbsp;&nbsp;&nbsp; 《中国质量技术监督》2013年7月刊\r\n</p>', '2014-12-08 09:40:53');

-- --------------------------------------------------------

--
-- 表的结构 `wx_p`
--

CREATE TABLE IF NOT EXISTS `wx_p` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xm` varchar(20) DEFAULT NULL,
  `wxh` varchar(20) DEFAULT NULL,
  `sfz` varchar(20) DEFAULT NULL,
  `kh` varchar(20) DEFAULT NULL,
  `pged` varchar(20) DEFAULT NULL,
  `cxjg` varchar(20) DEFAULT NULL,
  `cjz` varchar(20) DEFAULT NULL,
  `cjsj` varchar(20) DEFAULT NULL,
  `xgz` varchar(20) DEFAULT NULL,
  `xgsj` varchar(20) DEFAULT NULL,
  `desc` varchar(20) DEFAULT NULL,
  `p12` varchar(20) DEFAULT NULL,
  `p13` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=57 ;

--
-- 转存表中的数据 `wx_p`
--

INSERT INTO `wx_p` (`id`, `xm`, `wxh`, `sfz`, `kh`, `pged`, `cxjg`, `cjz`, `cjsj`, `xgz`, `xgsj`, `desc`, `p12`, `p13`) VALUES
(15, '张三', 'zhangsan', '420984199008010101', '62220202012030123', '20000-30000', '符合条件，可以开通', 'xl', '2017-09-10 14:45:05', 'xl', '2017-09-10 14:45:15', '无', '1', NULL),
(17, '向略', 'xianglve', '42193821982321', '6222220020200202', '100000000', '符合条件，可以开通', 'hc', '2017-09-10 14:47:09', 'xl', '2017-09-10 22:46:06', '', '1', NULL),
(19, '张琪', 'zhangqi19890727', '320722198907271659', '6228480039047313273', '80000-150000', '符合开通条件', 'xl', '2017-09-11 16:33:34', NULL, NULL, '', '', NULL),
(20, '刘堂书', '13668852537', '370281198310065715', '6227002395130182137', '70000-120000', '符合开通条件', 'xl', '2017-09-12 11:02:21', 'xl', '2017-09-12 11:02:48', '', '', NULL),
(21, '陈勇', '15178845343', '500381198803017818', '6212263100032113149', '70000-110000', '符合开通条件', 'xl', '2017-09-12 11:09:03', NULL, NULL, '', '', NULL),
(22, '顾晨城', '13655693264', '340121198806225826', '6222021302020492103', '70000-90000', '符合开通条件', 'xl', '2017-09-12 11:25:16', NULL, NULL, '', '', NULL),
(23, '林正盛', '15980228539', '350321198607143919', '6225885918570532', '90000-120000', '符合开通条件', 'xl', '2017-09-12 17:44:16', NULL, NULL, '', '', NULL),
(24, '云恒恒', '15872235999', '420621199001200033', '6217995200175579157', '120000-150000', '符合开通条件', 'xl', '2017-09-14 14:05:54', NULL, NULL, '', '', NULL),
(25, '易军', 'yijun123520', '500236199410050657', '6217995200003512875', '70000-90000', '符合开通条件', 'xl', '2017-09-15 18:58:52', NULL, NULL, '', '', NULL),
(26, '张宇', '15258599771', '511525198501256090', '6212261404003657320', '190000-220000', '符合开通条件', 'xl', '2017-09-21 12:02:43', NULL, NULL, '', '1', NULL),
(27, '吴雪朋', '15919995528', '441423199110084429', '6226620409322617', '120000-140000', '符合开通条件', 'xl', '2017-09-22 15:32:43', NULL, NULL, '', '', NULL),
(28, '朱利争', 'Tj435543895', '4331127198803235827', '', '103000', '开通成功', 'xl', '2017-09-23 11:01:00', 'xl', '2017-10-24 17:15:38', '', '1', NULL),
(29, '徐慧芳', '18535586590', '140481197703152821', '', '100000-110000', '符合开通条件', 'xl', '2017-09-23 11:05:44', NULL, NULL, '', '', NULL),
(30, '王娜', 'wangna20110512', '120107198405104822', '6212260302004496980', '110000-120000', '符合开通条件', 'xl', '2017-09-30 11:36:21', NULL, NULL, '', '', NULL),
(31, '崔伟光', '15937066959', '412301197209280510', '6227075230210987', '80000-90000', '符合开通条件', 'xl', '2017-10-04 11:39:26', NULL, NULL, '', '', NULL),
(32, '张彦', 'wszokm12', '51120419790910213X', '6222023100064743342', '110000-120000', '符合开通条件', 'xl', '2017-10-04 11:51:03', NULL, NULL, '', '', NULL),
(33, '黄朝华', '15157903533', '330724196812227634', '6228410380441979714', '90000-100000', '符合开通条件', 'xl', '2017-10-06 14:43:07', NULL, NULL, '', '', NULL),
(34, '肖永安', 'xiaoyongan001', '362426199005088479', '6228480031708323311', '64000', '开通成功', 'xl', '2017-10-24 17:07:18', NULL, NULL, '', '', NULL),
(35, '吴彪', 'wb787918', '522224198207175011', '', '63000', '开通成功', 'xl', '2017-10-24 17:11:34', NULL, NULL, '', '1', NULL),
(36, '刘堂书', '13668852537', '370281198310065715', '6227002395130182137', '14000', '开通成功', 'xl', '2017-10-24 17:13:25', 'xl', '2017-10-24 17:25:57', '', '1', NULL),
(37, '吴丽利', '15031308208', '130802198207140644', '6228482128736414373', '103000', '开通成功', 'xl', '2017-10-24 17:18:30', NULL, NULL, '', '1', NULL),
(38, '高正正', 'z13753751607', '142601198501027630', '6212260510001115110', '审核中', '符合开通条件', 'xl', '2017-10-25 20:13:58', NULL, NULL, '', '', NULL),
(39, '尹子睿', 'y289864516', '150105198705297331', '6222020602006207875', '210000', '开通成功', 'xl', '2017-10-25 20:26:39', NULL, NULL, '', '1', NULL),
(40, '李元琛', 'lyc872558199', '210502199603041814', '6210810600001918750', '15000', '开通成功', 'xl', '2017-10-25 20:29:16', NULL, NULL, '', '1', NULL),
(41, '李坤玉', '13661555598', '410781197305199781', '6228480039004974877', '113000', '符合开通条件', 'xl', '2017-10-25 20:32:00', NULL, NULL, '', '', NULL),
(42, '张海隆', '15991161628', '612321198505113319', '62284800171729979', '72000', '符合开通条件', 'xl', '2017-11-11 12:00:15', NULL, NULL, '', '', NULL),
(43, '崔鹏', 'cuipengaimawanning', '622421199401081916', '6217002870048596017', '210000', '开通成功', 'xl', '2017-11-13 19:04:15', NULL, NULL, '', '', NULL),
(44, '余军辉', '15981832362', '420921198702054413', '6228480718402608076', '83000', '开通成功', 'xl', '2017-11-14 23:10:35', NULL, NULL, '', '', NULL),
(45, '陈惠兰', 'ch353986351', '441425197706043103', '6222002007100074167', '15000', '开通成功', 'xl', '2017-11-14 23:13:42', NULL, NULL, '', '', NULL),
(46, '张国尉', '18070425020', '3604271996092000016', '6236682030002386080', '16000', '开通成功', 'xl', '2017-11-14 23:15:19', NULL, NULL, '', '', NULL),
(47, '黄钟周', 'zhou15889102253', '445224199202250614', '6212262019003417969', '18000', '开通成功', 'xl', '2017-11-14 23:18:12', NULL, NULL, '', '', NULL),
(48, '陈海', '15938233111', '413025198301053011', '6212261817003913676', '87000', '开通成功', 'xl', '2017-11-14 23:19:51', NULL, NULL, '', '', NULL),
(49, '陈康兵', 'yladay', '330727199307130017', '6212251208000219097', '123000', '开通成功', 'xl', '2017-11-14 23:22:01', NULL, NULL, '', '', NULL),
(50, '吴丽君', 'wulijun8191', '460002198607144620', '6228480158050016373', '17000', '开通成功', 'xl', '2017-11-14 23:24:36', NULL, NULL, '', '', NULL),
(51, '梁培文', '13659742470', '440881198905301036', '6228480628303820573', '19000', '开通成功', 'xl', '2017-11-14 23:26:19', NULL, NULL, '', '', NULL),
(52, '陆华雪', 'w543804360', '45033019891219021x', '6228410144523419571', '18000', '开通成功', 'xl', '2017-11-14 23:28:15', NULL, NULL, '', '', NULL),
(53, '弈永博', 'yiyb1129', '210111199311291015', '6210810730012475878', '19000', '开通成功', 'xl', '2017-11-14 23:30:13', NULL, NULL, '', '', NULL),
(54, '付小禹', 'fxy05272418', '342426199305272418', '6217231314000521328', '19000', '开通成功', 'xl', '2017-11-14 23:32:04', NULL, NULL, '', '', NULL),
(55, '张建汉', 'z13959800783', '350521197910251097', '6226192380630624', '130000', '符合开通条件', 'xl', '2018-01-21 20:30:49', NULL, NULL, '', '', NULL),
(56, '王艳飞', 'qa563388', '320623196411081917', '62284804281877433076', '153000', '通过审核', 'xl', '2018-02-13 13:31:45', NULL, NULL, '', '1', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
