# Some commonly function modules

we can easily use them in our own scripts.

## sendmail.sh

- 这是一个发送邮件的模块。

- 要求系统已经安装 mailx 。如果系统没有安装 mailx ，那么会在系统上安装 mailx 。

- 如果没有配置发件账户的信息，那么会自动在系统配置发送邮件的用户信息。默认情况下使用 163 邮箱进行发送邮件。

- 包括五个参数。分别是发件账户、发送账户的密码、收件人邮箱、邮件主题、邮件正文的文件路径。

- 使用示例。在脚本 memory_usage.sh 引用该模块。

memory_usage.sh 内容如下：
  
```bash
#!/bin/bash
. $(pwd)/sendmail.sh my_account my_passwd dst_mail@163.com Memory_usage /tmp/mail.text
```

执行结果：

![执行结果](https://raw.githubusercontent.com/mrivandu/ops/master/images/sendmail.jpg)