# 〇、纯血鸿蒙HarmonyOS NEXT鸿蒙星河版-鸿蒙基础

# 第1章 华为鸿蒙系统概述

## 1.1 HarmonyOS简介

鸿蒙OS是华为公司开发的一款基于微内核、 耗时10年、4000多名研发人员投入开发、面向5G物联网、面向全场景的分布式操作系统。鸿蒙的英文名是HarmonyOS，意为和谐。 这个新的操作系统将打通手机、电脑、平板、电视、工业自动化控制、无人驾驶、车机设备 、智能穿戴统一成一个操作系统，并且该系统是面向下一代技术而设计的，能兼容全部安卓应用的所有Web应用。



> 系统兼容

2023年 9 月份，余承东正式宣布鸿蒙下一个版本HarmonyOSNEXT 蓄势待发，鸿蒙原生应用全面启动。其系统底座全栈自研，去掉了传统的 AOSP 代码，仅支持鸿蒙内核和鸿蒙系统的应用。此外，HarmonyOS NEXT 只能使用 Hap 格式的安装包，这就代表着 HarmonyOS 将不再适配Android应用。

2023年11月20日，针对华为可能推出不兼容安卓的鸿蒙版本，一华为相关人士向澎湃新闻表示：推出时间还不确定，未来[IOS](https://baike.baidu.com/item/IOS/45705?fromModule=lemma_inlink)、鸿蒙、[安卓](https://baike.baidu.com/item/安卓/61750934?fromModule=lemma_inlink)将为三个各自独立的系统。 



<img src="http://tmp00002.zhaodashen.cn/0c711b4658975724c33b32870e83943f.jpg" /> 



## 1.2 HarmonyOS的发展历程

https://baike.baidu.com/starmap/view?nodeId=dfbc67e96b15581aaff83c28&lemmaTitle=%E5%8D%8E%E4%B8%BA%E9%B8%BF%E8%92%99%E7%B3%BB%E7%BB%9F&lemmaId=23500650&starMapFrom=lemma_starMap&fromModule=lemma_starMap

- 2019年8月9日   华为鸿蒙系统        HUAWEI HarmonyOS
- 2020年9月10日  Harmony 2.0    （鸿蒙2.0     代表API6 FA模型支持JS、JAVA）  
- 2022年7月27日  Harmony 3        （鸿蒙3        代表API9 专注ArkTS开发）          23年10月
- 2023年8月04日  Harmony 4        （鸿蒙4        代表API10/11  NEXT Preview  星河预览版）
- 2024年1月18日  Harmony Next （鸿蒙5         代表API12~17 ）

> 2023年8月4日，华为推出HarmonyOS NEXT开发者预览版 ；
>
> 2023年9月25日，华为在秋季全场景发布会上对外宣布启动“HarmonyOS NEXT计划”。
>
> 2024年1月18日，HarmonyOS NEXT星河版正式面向开发者开放申请。
>
> 2024年第四季度，HarmonyOS NEXT将推出商用版本。
>
> ```
>HarmonyOS NEXT减少40%冗余代码，提升系统流畅度、能效、安全性。 该系统从编程语言到编译器都是全栈自研，华为称其为“真正的操作系统” ，系统底座采用“盘古”AI大模型、“MindSpore”AI框架、“DevEco Studio”等集成开发环境、“HarmonyOS Design”设计系统、“ArkUI”等编程框架、“方舟编译器”“毕昇编译器”等编译器、“ArkTS”“仓颉”等编程语言、“EROFS”“HMDFS”等分布式文件系统以及鸿蒙内核.
> 华为鸿蒙原生应用版图已经成型，包括但不限于导航、新闻、工具、旅游、金融、便捷生活、美食、游戏等多个领域的企业和开发者陆续宣布加入鸿蒙生态 。
> 
> 中文名： 鸿蒙星河版
> 外文名： HarmonyOS NEXT
> 别  名：“纯血鸿蒙”     
> ```
> 



## 1.3 华为关键战略

**华为的一个关键战略**

“1+8+N”是华为的一个关键战略，这个战略的目的是为了打造全场景智慧生活（万物互联）。

在这个战略中，

“1”指的是智能手机，作为个人便携的算力提供终端，通过不同的方式与其他设备进行连接；

“8”代表华为的八大核心产品，包括[平板](https://www.baidu.com/s?rsv_idx=1&wd=平板&fenlei=256&usm=1&ie=utf-8&rsv_pq=a30c461801bccfc7&oq=1%2B8%2Bn是什么&rsv_t=d176ptoQmbwItzYgF5zB0zWBisJmvGoEem8C1AIIEuol0AlcFmhW1vSjmeE&sa=re_dqa_zy&icon=1)、[智能音箱](https://www.baidu.com/s?rsv_idx=1&wd=智能音箱&fenlei=256&usm=1&ie=utf-8&rsv_pq=a30c461801bccfc7&oq=1%2B8%2Bn是什么&rsv_t=f5132gVwRZz2YijWPzrsEakv%2BZMy%2BchS%2Ftd%2B7qbUQzxrW45nrmCTNEc2Cok&sa=re_dqa_zy&icon=1)、[眼镜](https://www.baidu.com/s?rsv_idx=1&wd=眼镜&fenlei=256&usm=1&ie=utf-8&rsv_pq=a30c461801bccfc7&oq=1%2B8%2Bn是什么&rsv_t=f5132gVwRZz2YijWPzrsEakv%2BZMy%2BchS%2Ftd%2B7qbUQzxrW45nrmCTNEc2Cok&sa=re_dqa_zy&icon=1)、[手表](https://www.baidu.com/s?rsv_idx=1&wd=手表&fenlei=256&usm=1&ie=utf-8&rsv_pq=a30c461801bccfc7&oq=1%2B8%2Bn是什么&rsv_t=f5132gVwRZz2YijWPzrsEakv%2BZMy%2BchS%2Ftd%2B7qbUQzxrW45nrmCTNEc2Cok&sa=re_dqa_zy&icon=1)、[车机](https://www.baidu.com/s?rsv_idx=1&wd=车机&fenlei=256&usm=1&ie=utf-8&rsv_pq=a30c461801bccfc7&oq=1%2B8%2Bn是什么&rsv_t=f5132gVwRZz2YijWPzrsEakv%2BZMy%2BchS%2Ftd%2B7qbUQzxrW45nrmCTNEc2Cok&sa=re_dqa_zy&icon=1)、[耳机](https://www.baidu.com/s?rsv_idx=1&wd=耳机&fenlei=256&usm=1&ie=utf-8&rsv_pq=a30c461801bccfc7&oq=1%2B8%2Bn是什么&rsv_t=f5132gVwRZz2YijWPzrsEakv%2BZMy%2BchS%2Ftd%2B7qbUQzxrW45nrmCTNEc2Cok&sa=re_dqa_zy&icon=1)、[笔记本](https://www.baidu.com/s?rsv_idx=1&wd=笔记本&fenlei=256&usm=1&ie=utf-8&rsv_pq=a30c461801bccfc7&oq=1%2B8%2Bn是什么&rsv_t=494733GZ0W9zW1klkzByv6eUBAyP697VM034E3cf%2Bn9KaLPpmuQJL5NrFRM&sa=re_dqa_zy&icon=1)和PC；

而“N”则涵盖了移动办公、[智能家居](https://www.baidu.com/s?rsv_idx=1&wd=智能家居&fenlei=256&usm=1&ie=utf-8&rsv_pq=a30c461801bccfc7&oq=1%2B8%2Bn是什么&rsv_t=494733GZ0W9zW1klkzByv6eUBAyP697VM034E3cf%2Bn9KaLPpmuQJL5NrFRM&sa=re_dqa_zy&icon=1)、[运动健康](https://www.baidu.com/s?rsv_idx=1&wd=运动健康&fenlei=256&usm=1&ie=utf-8&rsv_pq=a30c461801bccfc7&oq=1%2B8%2Bn是什么&rsv_t=494733GZ0W9zW1klkzByv6eUBAyP697VM034E3cf%2Bn9KaLPpmuQJL5NrFRM&sa=re_dqa_zy&icon=1)、[影音娱乐](https://www.baidu.com/s?rsv_idx=1&wd=影音娱乐&fenlei=256&usm=1&ie=utf-8&rsv_pq=a30c461801bccfc7&oq=1%2B8%2Bn是什么&rsv_t=494733GZ0W9zW1klkzByv6eUBAyP697VM034E3cf%2Bn9KaLPpmuQJL5NrFRM&sa=re_dqa_zy&icon=1)及智能出行等领域的延伸业务，这些业务可能涉及与华为合作的生态企业。

总的来说，“1+8+N”战略体现了华为在5G时代下的全场景智慧生活布局，旨在通过整合各种智能设备和服务，为用户提供更加便捷和智能的生活体验。

> <img src="http://tmp00002.learv.com/ea9b4ae76e7a82730810c7c2d0856141.jpg" width="480" />       
>
> <img src="http://tmp00002.learv.com/eb15cfcd23e9c9700125c75b82582ee8.jpg" width="480" /> 
>
> <img src="http://tmp00002.learv.com/484eeacc0a26061f9b3cec45e6f66df4.jpg" width="480" /> 
>
> <img src="http://tmp00002.learv.com/9a1b37045b4195b95b38aee6a85407a9.jpg" width="480" />  
>
> <img src="http://tmp00002.learv.com/baf58b29f5fc5bfc7ca394ea9180e90a.jpg" width="480" />   
>
> <img src="http://tmp00002.learv.com/ef4242be42b6fe687dfb81af11f724a4.jpg" width="480" /> 
>
> <img src="http://tmp00002.learv.com/ad13566cecfaec178190aa422a110e68.jpg" width="480" /> 
>
> <img src="http://tmp00002.learv.com/aa2d19155adf835aad0eb04f0ed963e9.jpg" width="480" />     



## 1.4 鸿蒙的最新相关信息

- <a href="https://www.baidu.com/s?ie=utf-8&f=8&rsv_bp=1&rsv_idx=1&tn=baidu&wd=%E5%90%84%E5%A4%A7%E4%BA%92%E8%81%94%E7%BD%91%E4%BC%81%E4%B8%9A%E7%BA%B7%E7%BA%B7%E5%8A%A0%E5%85%A5%E9%B8%BF%E8%92%99%E5%8E%9F%E7%94%9F%E5%BA%94%E7%94%A8%E5%BC%80%E5%8F%91&fenlei=256&rsv_pq=0xcf4f7ef7003b8f4b&rsv_t=5b2f3exXdBmwdCmNT9LHnufAzlivipmUCmWO1iDT5tUEjAZ%2FKbE3CbRWwV7c&rqlang=en&rsv_dl=tb&rsv_sug3=1&rsv_enter=1&rsv_sug2=0&rsv_btype=i&inputT=173&rsv_sug4=173">各大互联网企业纷纷加入鸿蒙原生应用开发</a>
- <a href="https://www.baidu.com/s?ie=utf-8&f=8&rsv_bp=1&rsv_idx=1&tn=baidu&wd=%E5%8D%8E%E4%B8%BA%E9%B8%BF%E8%92%99%E8%BF%9B%E5%85%A5%E9%AB%98%E6%A0%A1&fenlei=256&oq=%25E5%258D%258E%25E4%25B8%25BA%25E9%25B8%25BF%25E8%2592%2599%25E8%25BF%259B%25E5%2585%25A51%2526lt%253B5%25E6%2589%2580%25E9%25AB%2598%25E6%25A0%25A1&rsv_pq=e659518c0048ed29&rsv_t=0ddfkHzIqhl3%2BN6V5vkg0As6M2Ec4Du2xXEjL2oos0q7RaReMY77ahaD8BQ&rqlang=cn&rsv_dl=tb&rsv_enter=1&rsv_sug3=10&rsv_sug1=4&rsv_sug7=100&rsv_sug2=0&rsv_btype=t&inputT=1550&rsv_sug4=1777">华为鸿蒙进入135所高校!清华、复旦、哈工大等:共建鸿蒙世界</a> 
- <a href="https://www.baidu.com/s?ie=utf-8&f=8&rsv_bp=1&rsv_idx=1&tn=baidu&wd=%E5%9B%9B%E5%AE%B6%E8%BD%A6%E4%BC%81%E5%AE%98%E5%AE%A3%E5%90%88%E4%BD%9C!%E5%8D%8E%E4%B8%BA%E9%B8%BF%E8%92%99%E7%94%9F%E6%80%81%E5%A3%AE%E5%A4%A7&fenlei=256&oq=%25E9%25B8%25BF%25E8%2592%2599%25E5%2592%258C%25E5%259B%25BD%25E5%2586%2585%25E8%25BD%25A6%25E4%25BC%2581&rsv_pq=e1856a04002481bb&rsv_t=36f3X83TVol8V%2F279hpMydEya0%2BtazB3rIPrI2y67rLmyVH1UqSLqfT8hCI&rqlang=cn&rsv_dl=tb&rsv_enter=1&rsv_btype=t&inputT=337&rsv_sug3=102&rsv_sug1=23&rsv_sug7=100&rsv_sug2=0&rsv_sug4=379">四家车企官宣合作!华为鸿蒙生态壮大</a>  

- [江苏千行万业加速拥抱*鸿蒙*,超两百款应用启动*鸿蒙*原...](http://www.baidu.com/link?url=U0DisjvBAdzjTFZ5gIk0uQFPlxva8kpu3OswoRF764aun3qNyXIjIuNsxkUo040t2uXkjSBmbzSXmAheg7gecYexDMcxqsWNnyVlYUHHQim)  

- [华为*鸿蒙*系统再获深圳官方力挺!全面覆盖政务和公共服务,助...](http://www.baidu.com/link?url=wbbqvGBh-AmmWGAEpFoT1aDc-nah3b1Qqt5vkL43J2-A46nD2RTakk7c9BKwMlQw-gc8DSbBEpUwqiMlw9zjtC0V-GJyE0-xuWOdozJuy7a) 

- 此外，根据Counterpoint Research的最新数据显示，**HarmonyOS在中国的市场份额已经从2023年第一季度的8%，显著增长至2024年第一季度的17%，正式超越了苹果iOS，成为中国市场上的第二大操作系统。**

  **目前，已有超过9亿台设备**装载了**HarmonyOS。** 

> <img src="http://tmp00002.zhaodashen.cn/17b138928a2a9490034d4bd862a2885a.jpg" /> 



## 1.5 鸿蒙开发

<img src="http://tmp00002.zhaodashen.cn/d0a404a132c40e79497f8a8c03e299ba.jpg" />

相同点：1-都是华为研发的，2-都是分布式操作系统 

不同点：1-HarmonyOS商业华为自己用，OpenHarmony开源大家用；2先有HarmonyOS于19年发布，再OpenHarmony于20年发布



<img src="http://tmp00002.zhaodashen.cn/11870fc77850adbc05624e04a285a601.jpg" />

<img src="http://tmp00002.zhaodashen.cn/ec8c40e827d333b2b7d7dc673a86c800.jpg" />



<video src="http://tmp00002.zhaodashen.cn/hm.mp4" controller />



<img src="http://tmp00002.zhaodashen.cn/fb3f5d8b08aa5961e0bb1aec298c6af0.jpg" /> 



## 1.6 知识点小结

鸿蒙HarmonyOS  -  分布式操作系统（23年9月宣传下一个版本不支持安卓）



发展历程（星河版不再支持安卓， Harmony Next   鸿蒙星河版   纯血鸿蒙）

> 23年10月  DevEco3  API9
>
> 24年04月  升级了  DevEco4  API11   星河版预览版
>
> 24年秋季   升级了  DevEco5  API12   星河版预览版



关键战况：1+8+N

鸿蒙开发：上北-应用开发  ArkTS   TypeScript、下南-硬件开发  C、C++



# 第2章 开发环境搭建

## 2.1 HarmonyOS学习前置条件

HarmonyOS NEXT	Developer 5.0.0      

- Window

> 操作系统：Windows10 64位、Windows11 64位
> 内存：16GB及以上
> 硬盘：100GB及以上
> 分辨率：1280*800像素及以上

- Mac

> 操作系统：macOS(X86) 12/13/14 macOS(ARM) 12/13/14
> 内存：8GB及以上
> 硬盘：100GB及以上
> 分辨率：1280*800像素及以上



## 2.2 下载

前往下载中心获取并下载DevEco Studio。

https://developer.huawei.com/consumer/cn/download/



## 2.3 安装DevEco Studio

### Windows环境

1. 下载完成后，双击下载的“deveco-studio-xxxx.exe”，进入DevEco Studio安装向导。在如下界面选择安装路径，默认安装于C:\Program Files路径下，也可以单击**Browse...**指定其他安装路径，然后单击**Next**。

   

   ![img](https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20240624194411.37383532896595609587053062877851:50001231000000:2800:6008AA6004B81CA48FEBC61CF84CCA4CE8F52153659269764C3E5A6587954F11.png?needInitFileName=true?needInitFileName=true) 

   

2. 在如下安装选项界面勾选**DevEco Studio**后，单击**Next**，直至安装完成。

   

   ![img](https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20240624194411.58773765919076920437585088324697:50001231000000:2800:50EA7A0811F70FBEA741AAFCFAE82C90B10DA808B6AFD3229349C7763DCC4F79.png?needInitFileName=true?needInitFileName=true) 

   

3. 安装完成后，单击**Finish**完成安装。

   

   ![img](https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20240624194411.66984086175109354880730435642477:50001231000000:2800:10596BD2E28A18A79C542409CA5AFAE96B4922C52637FC436F15CA4E847085A3.png?needInitFileName=true?needInitFileName=true) 

### macOS环境

1. 在安装界面中，将“**DevEco-Studio.app**”拖拽到“**Applications**”中，等待安装完成。

   

   ![点击放大](https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20240624194411.59967856148143167585576459865346:50001231000000:2800:CBB320B7B82F3E5D12A092DB18EE9D7547D7F9246543106B1BD3C514359ABC5F.png?needInitFileName=true?needInitFileName=true)

   

2. 安装完成后，检查开发环境



### 诊断开发环境

为了您开发应用/服务的良好体验，DevEco Studio提供了开发环境诊断的功能，帮助您识别开发环境是否完备。您可以在欢迎页面单击**Diagnose**进行诊断。如果您已经打开了工程开发界面，也可以在菜单栏单击**Help > Diagnostic Tools > Diagnose Development Environment**进行诊断。

<img src="https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20240624194411.30927464628658732610913866688976:50001231000000:2800:90F547EF281A38BAD9733196176D651DF4200232E6F4041F832F8B32EAAB6105.png?needInitFileName=true?needInitFileName=true" height="400" /> 

DevEco Studio开发环境诊断项包括电脑的配置、网络的连通情况、依赖的工具是否安装等。如果检测结果为未通过，请根据检查项的描述和修复建议进行处理。



### 启用中文化插件



1. 单击**File > Settings > Plugins**，选择**Installed**页签，在搜索框输入“Chinese”，搜索结果里将出现**Chinese(Simplified)**，在右侧单击**Enable**，单击**OK**。

   

   ![img](https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20240624194411.28679334558407723321458783679743:50001231000000:2800:C8001C5B6674D89E9EE23AA4C6D138AB91A2CD4585482C912D5FC0416EB974E5.png?needInitFileName=true?needInitFileName=true)  

   

2. 在弹窗中单击**Restart**，重启DevEco Studio后即可生效。

   

   ![img](https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20240624194411.32857145255049834922846170471298:50001231000000:2800:7461F28D81B391C7ED8D6869366D6F2AE0CB749C7908DCA2A87493947F715180.png?needInitFileName=true?needInitFileName=true)     



# 第3章 牛刀小试——开发第一个HarmonyOS应用

DevEco Studio安装完成后，可以通过运行Hello World工程来验证环境设置是否正确。

接下来以创建一个支持Phone设备的工程为例进行介绍。



## 3.1 创建一个新工程

1. 打开DevEco Studio，在欢迎页单击**Create Project**，创建一个新工程。

2. 根据工程创建向导，选择创建**Application**或**Atomic Service**。选择**Empty Ability**模板，然后单击**Next**。

<img src="https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20240624194411.40514084938173900693963739549577:50001231000000:2800:B1E1BAD83B81EF90616D16B1BBFD7A8E9131CFDFF64D6F117418CE1F0FB64327.png?needInitFileName=true?needInitFileName=true" height="500" /> 

3. 填写工程相关信息，单击**Finish**。

> - **Project name**：工程的名称，可以自定义，由大小写字母、数字和下划线组成。
>
> - Bundle name：标识应用的包名，用于标识应用的唯一性。
>
>   应用包名要求：
>
>   - 必须为以点号（.）分隔的字符串，且至少包含三段，每段中仅允许使用英文字母、数字、下划线（_），如“com.example.myapplication ”。
>   - 首段以英文字母开头，非首段以数字或英文字母开头，每一段以数字或者英文字母结尾，如“com.01example.myapplication”。
>   - 不允许多个点号（.）连续出现，如“com.example..myapplication ”。
>   - 长度为7~128个字符。
>
> - **Save location**：工程文件本地存储路径，由大小写字母、数字和下划线等组成，不能包含中文字符。
>
> - **Compatible SDK**：兼容的最低API Version。
>
> - **Module name**： 模块的名称。
>
> - **Device type：**该工程模板支持的设备类型。

<img src="https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20240624194411.12630090892415266886702826686115:50001231000000:2800:2467A0B8D199878302C52908F8DE7540FCB5CBD78F393DC0DD89E3F84ABD7B51.png?needInitFileName=true?needInitFileName=true" height="500" />  

4. 单击**Finish**，工具会自动生成示例代码和相关资源，等待工程创建完成。



## 3.2 使用DevEco Studio预览器

![](https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20240624194426.32080610767475234666834404730723:50001231000000:2800:5ACAC9D614F3E8A1F948D15FE84740DF2AC5ACD471D8CD780E4805514CBD6511.gif?needInitFileName=true?needInitFileName=true)  



## 3.3  在模拟器中运行应用

### 创建模拟器

> 先创建华为账号，申请参加模拟器活动

手机（包含折叠屏）模拟器、平板模拟器需先[申请参加模拟器Beta活动](https://developer.huawei.com/consumer/cn/activity/201714466699051861/signup)后才可在DevEco Studio的设备管理器界面下载到模拟器镜像，下载后方可使用。

>  接着创建模拟器，操作步骤如下：

1. 单击菜单栏的**Tools > Device Manager**，在**Local Emulator**页签，登录已授权的开发者帐号。

   

   ![img](https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20240624194510.43567524642129986157365106023845:50001231000000:2800:E4366122C35EAAD00B34D0DC7FFD181784DC90D1340A02722886A6165E44F64C.png?needInitFileName=true?needInitFileName=true)

   当前下载模拟器镜像需先[申请参加模拟器Beta活动](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/ide-emulator-create-0000001885957357-V5#section136813459421)。

   若提示该帐号没有权限，请先点击“Submit the application form”完成权限申请。

   ![img](https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20240624194510.60852034592525885168306123905237:50001231000000:2800:0BD963E21A4BA33A5DCC52B564917521348E6F242EF01BC87DA7E45627F0BBD7.png?needInitFileName=true?needInitFileName=true) 

   

2. 单击**Edit**设置模拟器实例的存储路径**Local Emulator Location**，Mac默认存储在~/.Huawei/Emulator/deployed下，Windows默认存储在C:\Users\xxx\AppData\Local\Huawei\Emulator\deployed下。

3. 

   ![点击放大](https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20240624194510.54918466332027959667529605508331:50001231000000:2800:AF9B20B665370E10D114E02FBE4805936B42C76FDC6CA05F5DEA8D5E83507B95.png?needInitFileName=true?needInitFileName=true)

   

4. 在**Local Emulator**页签中，单击右下角的**New Emulator**按钮，创建一个模拟器。

   

   在模拟器配置界面，可以选择一个默认的设备模板。您也可以在该界面下载、更新或删除不同设备的模拟器镜像。单击**Edit**可以设置镜像文件的存储路径。Mac默认存储在~/Library/Sdk下，Windows默认存储在C:\Users\xxx\AppData\Local\Huawei\Sdk下。

   ![img](https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20240624194510.58563280387326498396643629952535:50001231000000:2800:ED3E0742E93035C6656826E7F4ABE87AC3B66E105159A565DC4F2E9237EB56B3.png?needInitFileName=true?needInitFileName=true)

   

5. 单击**Next**，核实确定需要创建的模拟器的名称，内存和存储空间，然后单击**Finish**创建模拟器。

   

   ![img](https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20240624194510.82879504327410705621290850649874:50001231000000:2800:37511BE8B357AAB633C187F7DE6F2C210E4AFA5336716843C5C54276E058B477.png?needInitFileName=true?needInitFileName=true)

   

6. 在设备管理器页面，单击![img](https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20240624194510.55879782842264289825364503127649:50001231000000:2800:33BA21EA91C7245302AE8D8E4272F427CC64746B1243EB2E3BD8043871341637.png?needInitFileName=true?needInitFileName=true)启动模拟器。

   

   ![img](https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20240624194510.69534164418046295856536855008320:50001231000000:2800:65DE2FE8CB42B4B76DFBEB893C8B1042F65026274AD0A22DA937D7401539B608.png?needInitFileName=true?needInitFileName=true)

   

7. 单击DevEco Studio的**Run > Run'模块名称'**或![img](https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20240624194510.43192388764364503776034239590952:50001231000000:2800:C446676D9CC1FE3BB05AB5DEF68D3A77995C1499D1EEB105E9C148532F6594A6.png?needInitFileName=true?needInitFileName=true)。

   

   ![img](https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20240624194511.24959142966873984946224455041658:50001231000000:2800:F1FCB78BDE3341D6F3D6DF94C1B4F6886E72F81DCB1527D912D05503BFB156E5.png?needInitFileName=true?needInitFileName=true)

   

8. DevEco Studio会启动应用/服务的编译构建与推包，完成后应用/服务即可运行在模拟器上。

   

   ![img](https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20240624194511.33497640388982060411012446445743:50001231000000:2800:DE76763361535255951377C43C38867221ED87841E19757C53DF6C1C340C9FE0.png?needInitFileName=true?needInitFileName=true)

   

### 启动和关闭模拟器

在设备管理器页面，单击![img](https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20240624194511.14193273178773538363036935713930:50001231000000:2800:A9310DCD8F658997E2C36F28108A9B5E1664D77A10F4A001329D758DACB4D792.png?needInitFileName=true?needInitFileName=true)即可启动模拟器。模拟器启动时会默认携带上一次运行时的用户数据，包括用户上传的文件，安装的应用等。如果是新创建的模拟器，则不会携带用户数据。如果想清除上一次运行时的用户数据，点击**Actions >** ![img](https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20240624194511.11366423933659428423480152200792:50001231000000:2800:3A3CC09E4E284D93395788470E09A7CB4973D159BBA6EFDB8E33DEC230C29CCE.png?needInitFileName=true?needInitFileName=true) **> Wipe User Data**。

![点击放大](https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20240624194511.85721133189555225286222297608842:50001231000000:2800:AC77133B26AC6CB156AD1B51FA32E426B9D8A8EF2DD91C59CC02EE0E559F1FC2.png?needInitFileName=true?needInitFileName=true)

在模拟器运行期间，可以点击**Actions >** ![img](https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20240624194511.40649909730454320659657862425735:50001231000000:2800:2660B331ECEAE40870B623F8B2ABCE19DDC262E39A3464AFD9F376D1D13EDAE5.png?needInitFileName=true?needInitFileName=true) **> Show on Disk**显示模拟器在本地生成的用户数据。点击**Actions >** ![img](https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20240624194511.29088317012082052945386747539832:50001231000000:2800:8E65657B793AF897BB6933D5F39734DDD0AC1EE2EF283284B859EDC1E994D8CF.png?needInitFileName=true?needInitFileName=true) **> Generate logs**可以生成模拟器自启动到此刻的所有日志信息。想要关闭运行时的模拟器，可以在设备管理器页面点击![img](https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20240624194511.03971594144246264071174608231741:50001231000000:2800:81FC04C2A654F5C94313D1C7C7FE0E41EB71DB285577245E57CD8934D2DCDA2F.png?needInitFileName=true?needInitFileName=true)，或者点击模拟器工具栏上的关闭按钮![img](https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20240624194511.30511589563098270682768328947169:50001231000000:2800:9CE13D249A98EE8297D03F5BC3CDB7897321D22DABC074B15ACF05E61D50510C.png?needInitFileName=true?needInitFileName=true)。

![点击放大](https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20240624194511.49017455766837931149170456455098:50001231000000:2800:2CDAF672F96D348509942CE9E584D12D9BA130A0C817DAAF539E535907341DE1.png?needInitFileName=true?needInitFileName=true)

模拟器关闭后，点击**Actions >** ![img](https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20240624194511.66087402259238173574477006484177:50001231000000:2800:3B74AF481BD789AA4601C3C62C30FE4C2FB0BF859DCB9A07F9E799C0EDE56C6A.png?needInitFileName=true?needInitFileName=true) **> Delete**可以删除模拟器，并清除模拟器的用户数据和配置信息。 

 

## 3.4 在真机中运行应用

https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/ide-emulator-specification-0000001839876358-V5 

https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/ide-run-device-0000001670539800-V5





# 第4章 初探HarmonyOS应用

## 4.1 ArkUI 方舟UI框架

- 项目页面的基本结构

<img src="http://tmp00002.zhaodashen.cn/0ca7c7f00596828f9bbb04939934b619.jpg" /> 

- @Entry:  入口组件    简单理解进入该页面渲染的是有@Entry标识的组件
- @Component:  标识组件
- struct 组件名称 {} :  组件基本结构       组件名称强列建议与文件名称保持一致
- build ：build函数内部实现页面结构构建      在组件内部必须存在build函数

小技巧： entry+tab键   快速生成结构



## 4.2.内置组件

### 1.Text文本组件

Text是文本组件，通常用于展示用户视图，如显示文章的文字

```javascript
@Entry
@Component
struct Index {
  build() {
    // Text是文本组件，用于显示一段文本
    // 如何给文本添加样式呢？
    // harmony中没有css的样式，而是通过样式属性方法添加样式的
    // 如：.fontSize() .fontWeight  .fontStyle .fontColor()
    Text("这是一段文本")
      .fontSize(40)
      .fontWeight(FontWeight.Bold)
      .fontStyle(FontStyle.Italic)
      .fontColor("#f00")
  }
}
```



### 2.Column、Row  线性布局组件

harmony约定在组件内部构造页面结构时必须只能有唯一的一个布局容器组件.

现在给大家先介绍两个布局容器组件 Column 与  Row  

- Column组件： 子组件都是在垂直方向排列的
- Row组件： 子组件都是在水平方向排列的
- 主轴：线性布局容器在布局方向上的轴线，子元素默认沿主轴排列。Row容器主轴为水平方向，Column容器主轴为垂直方向。
- 交叉轴：垂直于主轴方向的轴线。Row容器交叉轴为垂直方向，Column容器交叉轴为水平方向。
- 间距：布局子元素的间距。

```javascript
@Entry
@Component
struct Index {
  build() {
    // 一、build中必须有一个根元素
    // Text('学鸿蒙 找千锋1')
    // Text('学鸿蒙 找千锋2')

    // 二、Column包括的元素在垂直方向排列
    // Column() {
    //   Text('学鸿蒙 找千锋1')
    //   Text('学鸿蒙 找千锋2')
    // }

    // 三、Row包括的元素在水平向排列
    // Row() {
    //   Text('学鸿蒙 找千锋1')
    //   Text('学鸿蒙 找千锋2')
    // }

    // 四、子元素排列对齐方式属性
    // - 主轴：子元素默认排列方向， 交叉轴垂直于主轴
    // - 主轴：Column 垂直方向、Row 水平方向
    // - .justifyContent()  主轴方向
    // - .alignItems()      交叉轴方向

    // Row() {
    //   Text('学鸿蒙 找千锋1')
    //   Text('学鸿蒙 找千锋2')
    // }
    // .justifyContent(FlexAlign.Center)
    // .alignItems(VerticalAlign.Center)
  }
}
```



### 3.Image图片组件

> 语法:Image(src: string|Resource)

```javascript
// 本地图片 图片放入 src/main/resources/base/media中
// $r()   r怎么记：resources的首字母
1: Image($r('app.media.test1'))  
2: Image($rawfile('rawfile下的路径'))  

// 网络图片       注意：网络图片在模似器或真机上要配置网络权限
3: Image('互联网地址')  

//与ets和resourec同级的module.json5文件
"requestPermissions": [
  {"name": "ohos.permission.INTERNET"}
],
```

代码演示

```javascript
@Entry
@Component
struct Index {
  build() {
    Column(){
      Image($r("app.media.sa"))
        .width("100%")

      Image("https://img2.baidu.com/it/u=132055822,4081681111&fm=253&fmt=auto?w=143&h=214")
        .width("100%")
    }
  }
}
```



### 4.TextInput文本输入框组件

arkts  写组件/写属性

> 语法：
>
> TextInput( {  名字:数据,  名字:数据   }  )
>
> 留心1：写的是花括号
>
> 留心2：名字:数据 多个之间逗号隔开   名字不是随便写的鸿蒙规定好了  具体有哪些后期带你看手册 今天快速入门 

```javascript
@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column(){
      TextInput({placeholder:'请输入用户名',text:"xiaosa"})
        .border({
          color:Color.Red,
          style:BorderStyle.Solid,
          width:3
        })
        .margin({left:10})
        .borderRadius(0)
    }
  }
}
```

### 5.Button按钮组件

arkts  写组件/写属性

```
Button(label?: ResourceStr)
 .width('100%')
 .height(50)
 .type(ButtonType.Normal)
 .onclick(() => {
 })
```



### 知识点小结

```
1.Harmony系统介绍
2.DevEco studio编辑器安装  下载模拟器
3.UI框架
   Text()
   Colomn与Row组件
   Image()
   TextInput()
   Button()
```



更多语法晚上手册挨个练习

https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/arkts-common-components-button-V5 



## 4.3 综合案例：京东商品详情页

<img src="http://tmp00002.learv.com/5b8f65263a21fd62836c78d252524c59.jpg" /> 

```
@Entry
@Component
struct Index {
  build() {
    // 根组件
    Column() {
      // 图片
      Image('https://m.360buyimg.com/mobilecms/s750x750_jfs/t1/242883/35/13094/88072/66793c5eF62743487/7cd5a7f4392b0c9f.jpg!q80.dpg')
        .width('100%')
        .height(280)
      // 图片
      // 价格
      // Text('￥7？？')
      // Text('登录查看价格')
      Row() {
        Text('￥').fontSize(16).fontColor('#f2270c').fontWeight(700)
        Text('7？？').fontSize(34).fontColor('#f2270c').fontWeight(700)
        Text('登录查看价格')
          .fontSize(12).fontColor('#fff').fontWeight(700)
          .backgroundColor('#f2270c')
          .padding(5)
          .borderRadius({
            topLeft: 10,
            topRight: 10,
            bottomLeft: 0,
            bottomRight: 10
          })
      }
        .width('100%')
        .justifyContent(FlexAlign.Start)
        .padding(10)
      // 价格
      // 标题  TODO  自己百度实现超出2行省略
      Text('海尔冰箱出品 Leader177升双门小冰箱冷藏冷冻两用1-2人小型节能省电低噪')
        .fontSize(20).fontWeight(600)
        .padding(10)
      // 标题
      // 排行榜
      Row() {
        // 元素1 左边
        Row() {
          Image('https://img10.360buyimg.com/img/jfs/t1/20724/31/20118/5100/6386d180Ef7435661/b73a0d4e3f653a22.png')
            .width(70)
            .height(30)
            .margin({right:10})
          Text('白色双门冰箱折扣榜第14名').fontColor('#f2270c')
        }
        // 元素2 右边
        Image('https://m.360buyimg.com/rank/jfs/t1/206038/6/18674/1888/61bc390aE2a46f19b/321efee30a5a8e65.png')
          .width(15)
      }
        .width('94%').backgroundColor('#fdeeec')
        .justifyContent(FlexAlign.SpaceBetween)
        .padding(10)
        .borderRadius(30)
      // 排行榜
      // 按钮组
      Row() {
        Row() {
          Image('https://img11.360buyimg.com/img/jfs/t1/185923/19/38125/325/64fad71dFeef526f9/f11f072077880807.png').width(20)
          Text('分享').margin({left:5})
        }
        Row() {
          Image('https://img10.360buyimg.com/img/jfs/t1/102190/6/45012/397/64fad71dF756823e2/d39f976bcb0a7e1f.png').width(20)
          Text('收藏').margin({left:5})
        }
        Row() {
          Image('https://img11.360buyimg.com/img/jfs/t1/143406/40/38936/332/64fad71dF85fe799a/be862fbe6f0efb0d.png').width(20)
          Text('降价通知').margin({left:5})
        }
      }
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround)
        .margin({top:20})
      // 按钮组
    }
    // 根组件 end
  }
}
```



# 作业：实战案例：京东鸿蒙App密码登录页

京东登录注册

https://plogin.m.jd.com/login/login?risk_jd%5Beid%5D=DBDYEWRHCTSOHKGCWVJQWR33PBUFUPGDUXZLCG5F7JFAOYQV72TSE2DYWKF7CJEZO4EVLNOXFK3JKNDGLVV2QBMX44&risk_jd%5Bfp%5D=c9faef54f7d9d293fde6b7faa914e770&appid=300&returnurl=https%3A%2F%2Fitem.m.jd.com%2Fproduct%2F1453219.html%3F_fd%3Djdm%26cover%3Djfs%2Ft1%2F245576%2F10%2F5562%2F104346%2F65f50d6fF3f71256e%2Fde21ad62b6fe6f86.jpg%26ptag%3D



<img src="http://tmp00002.zhaodashen.cn/f96d6b07ddf08d9da7f4236b93de4d4f.jpg" /> 
