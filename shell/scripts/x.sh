#!/bin/bash
# Create By NueXini

CONFIG_VERSION_NUMBER_NX=$(cat feeds/x/rom/lede/config.ramips-mt7621 | grep  'CONFIG_VERSION_NUMBER' | cut -d '"' -f 2)
CONFIG_VERSION_NUMBER_NX=`echo ${CONFIG_VERSION_NUMBER_NX:0:15}`
sed -i "s/CONFIG_VERSION_NUMBER=\".*\"/CONFIG_VERSION_NUMBER=\"$CONFIG_VERSION_NUMBER_NX\"/" .config

CONFIG_VERSION_CODE_NX=$(cat feeds/x/rom/lede/config.ramips-mt7621 | grep  'CONFIG_VERSION_CODE=' | cut -d '"' -f 2)
sed -i "s/CONFIG_VERSION_CODE=\".*\"/CONFIG_VERSION_CODE=\"$CONFIG_VERSION_CODE_NX\"/" .config

sed -i 's,192\.168\.15,192\.168\.3,g' feeds/x/natflow/files/natflow.config

sed -i 's?fs.access(\"/etc/config/wizard\") and ??g' feeds/luci/modules/luci-base/luasrc/dispatcher.lua
sed -i 's,admin/initsetup,admin/status/overview,g' feeds/luci/modules/luci-base/luasrc/dispatcher.lua

# sed -i 's/-hidden//g' feeds/luci/applications/luci-app-opkg/root/usr/share/luci/menu.d/luci-app-opkg.json
# sed -i 's/-hidden//g' feeds/luci/modules/luci-mod-system/root/usr/share/luci/menu.d/luci-mod-system.json
# sed -i 's/-hidden//g' feeds/luci/modules/luci-mod-status/root/usr/share/luci/menu.d/luci-mod-status.json

# change web luci user to root
sed -i 's#\"admin\"#\"root\"#g' feeds/luci/modules/luci-base/luasrc/dispatcher.lua
sed -i 's#\"admin\"#\"root\"#g' feeds/luci/modules/luci-base/root/usr/libexec/rpcd/luci
sed -i 's#\"admin\"#\"root\"#g' feeds/luci/modules/luci-mod-admin-mini/luasrc/controller/mini/index.lua
sed -i 's#\"admin\"#\"root\"#g' feeds/luci/modules/luci-mod-admin-mini/luasrc/model/cbi/mini/passwd.lua
sed -i 's#\"admin\"#\"root\"#g' feeds/luci/modules/luci-mod-rpc/luasrc/controller/rpc.lua
sed -i "s#'admin'#'root'#g" feeds/luci/modules/luci-mod-system/htdocs/luci-static/resources/view/system/password.js

rm -rf ./feeds/NueXini_Packages/ntfs3-oot

sed -i '/exit 0/d' feeds/x/base-config-setting/files/uci.defaults
cat $GITHUB_WORKSPACE/shell/scripts/x.defaults.sh | while read line
do
    echo $line >> feeds/x/base-config-setting/files/uci.defaults
done

cd feeds/NueXini_Packages
bash $GITHUB_WORKSPACE/shell/scripts/language_fix.sh

