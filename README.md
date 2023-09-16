# tiny11builder

原作者写的是英文的对英文不好的朋友来说不太友好，我在第一次使用遇到了问题，当时不明白第二项要输入图像索引是什么东西，后来看了bat代码才知道要输入的值已经在前面提示了“索引：1”，只需要输入1即可，说明的第5条看不懂，所以我才对这个进行了翻译帮助英文不好的朋友不踩这个坑
修改点：1、翻译了tiny11 creator.bat为中文
修改点：2、edge浏览器和onedrive网盘可自行选择保留或删除

用于构建精简的Windows 11映像的脚本。
这是一个用于自动构建精简的Windows 11映像的脚本，类似于tiny11。
我的主要目标是只使用像DISM这样的Microsoft实用程序，而不使用任何外部工具。唯一包含的可执行文件是oscdimg.exe，它在Windows ADK中提供，用于创建可引导的ISO映像。还包括一个无人参与的应答文件，用于绕过OOBE上的MS帐户，并使用/compact标志部署映像。
它是开源的，所以可以随意添加或删除任何您想要的内容！我们也非常感谢您的反馈。

截至目前，仅支持版本22621.525（可从Microsoft网站下载的版本）、22621.1265（最新的公共版本）和25300（截至目前的最新Insider版本）。

说明：
1.从UUPDump下载Windows 11 22621.1265，或从Microsoft网站下载22621.525或25300(<https://www.microsoft.com/software-download/windows11>)
2.使用Windows资源管理器装载下载的ISO映像。
3.对于.1265，请以管理员身份运行tiny11 creator.bat。对于.255或25300，请使用名称恰当的脚本（以管理员运行）。
4.选择安装映像的驱动器号（只有驱动器号的字母，没有冒号（：））
5.选择您希望图像所基于的SKU。（不明白他这个意思），按照这个提示来【选择索引，会提示“索引：”，输入：后面的数字】
6.中文版的添加了保留egde浏览器和onedrive网盘，输入y保留其余任何键都不保留
7.图像完成后，您将在提取脚本的文件夹中看到它，名称为tiny11.iso

删除的内容:
Clipchamp,
News,
Weather,
Xbox (although Xbox Identity provider is still here, so it should be possible to be reinstalled with no issues),
GetHelp,
GetStarted,
Office Hub,
Solitaire,
PeopleApp,
PowerAutomate,
ToDo,
Alarms,
Mail and Calendar,
Feedback Hub,
Maps,
Sound Recorder,
Your Phone,
Media Player,
QuickAssist,
Internet Explorer,
LA57 support,
OCR for en-us,
Speech support,
TTS for en-us,
Media Player Legacy,
Tablet PC Math,
Wallpapers,
Edge,
OneDrive

已知问题：
1.微软团队（个人）和Cortana仍在这里。如果你在我找到之前找到了移除它们的方法，请随时提供帮助！
2.尽管Edge已被删除，但图标及其任务栏引脚的重影仍然可用。此外，“设置”中还有一些残留物。但该应用程序本身已被删除。
3.脚本相当不灵活，因为只有指定的内部版本才能修改。这是因为每一个新版本，微软都会更新收件箱中包含的应用程序。如果尝试使用其他版本，它将获得不同程度的成功，但一些事情，如删除Edge和OneDrive，以及绕过系统要求或其他补丁，将始终适用。
4.截至目前，仅支持en-us x64。最终用户可以很容易地解决这一问题，只需用所需的语言（如ro ro等）替换en-us的每个实例，并用arm64替换每个x64实例。
现在就差不多了！
谢谢你的尝试，让我知道你有多喜欢它！
