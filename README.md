# How to install OpenBaton

## OS
* ubuntu 16.04

## install curl
* sudo apt-get install curl

## install OpenBatonb
* install: sh <(curl -s http://get.openbaton.org/bootstrap) release
* step:
 * 1. 選擇Open Baton NFVO版本，推薦5.1.1 for ubuntu 16.04
 * 2. 選擇RabbitMQ broker IP，此IP必須是VIM中VM能夠PING通的位置
 * 3. 選擇RabbitMQ broker PORT，用預設值即可(15672)
 * 4. 設定登入GUI帳戶"admin"的密碼
 * 5. 重複登入GUI帳戶"admin"的密碼
 * 6. 使否使用MySQL，不使用選NO，使用選YES，此後安裝任何套件皆需要設定MySQL的使用者和密碼
 * 7. 選擇啟動HTTPS
 * 8. 選擇安裝OpenStack VIM Driver Plugin，版本5.1.1
 * 9. 選擇安裝VNFM Generic，版本5.1.1
 * 10. Fault Management System可不安裝，有需要再安裝即可，版本1.4.0
 * 11. Auto Scaling Engine可不安裝，有需要再安裝即可，需要給Zabbix IP/usernmae/password/nfvo IP <-- 作者沒有試過這個功能
 * 12. Network Slicing Engine可不安裝，有需要再安裝即可，版本1.1.2 
 * 13. 重開機
 * 若出現此訊息，直接忽略: This is nc from the netcat-openbsd package. An alternative nc is available in the netcat-traditional package.
 * configure檔案會記錄剛剛設定的IP/PORT/PASSWORD... 之類的參數，若要修改任何參數即修改此configure檔案即可
 * configure檔案位置: /etc/openbaton/openbaton-nfvo.properties

## configure檔案參數
* nfvo.rabbit.brokerIp: RabbitMQ broker IP
* nfvo.rabbit.management.port: RabbitMQ broker PORT
* nfvo.delete.all-status: 任何狀態的VM都能被移除(True/False)
* nfvo.security.admin.password: 登入GUI帳戶"admin"的密碼
* nfvo.monitoring.ip: the Zabbix server ip

## 啟動與停止OpenBaton
* 啟動/停止OpenBaton需要啟動/停止nfvo和vnfm
 * nfvo

 ~~~
啟動: sudo openbaton-nfvo start
停止: sudo openbaton-nfvo stop
 ~~~
 * vnfm

 ~~~
啟動: sudo openbaton-vnfm-generic start
停止: sudo openbaton-vnfm-generic stop
 ~~~

## 確認OpenBaton是否正常運作
* 在瀏覽器上輸入"安裝OpenBaton機器的網址:8080"，進入GUI介面
* 完成OpenBaton Tutorial: Dummy Network Service Record --> http://openbaton.github.io/documentation/dummy-NSR/
* 若缺少Test vim driver，到 https://github.com/openbaton/test-plugin 中安裝driver，然後重開機
* 若執行完上述步驟，看Network Service Records List of NSRs中，若State為ACTIVE 即為成功

