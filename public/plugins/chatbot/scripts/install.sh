#! /bin/bash
###########################################
# Install Plugin
# Copyright (2019-2020) 铁塔能源有限公司北京市分公司
###########################################

# constants
## for windows platform
export MSYS=winsymlinks:nativestrict

baseDir=$(cd `dirname "$0"`;pwd)
rootDir=$(cd -P $baseDir/..;pwd)
upperDir=$(cd -P $rootDir/..;pwd)
CSKEFU_ROOT=$(cd -P $upperDir/../..;pwd)
pluginName=$(basename $rootDir)

# functions

# main 
[ -z "${BASH_SOURCE[0]}" -o "${BASH_SOURCE[0]}" = "$0" ] || return
cd $rootDir/..
echo "[plugins] path" `pwd`

if [ -d $CSKEFU_ROOT ]; then
    PLUGINS_DIR=$CSKEFU_ROOT/contact-center/app/src/main/java/com/chatopera/cc/plugins
    echo "[plugin] link" $rootDir "as" $pluginName "..."
    if [ ! -d $PLUGINS_DIR ]; then
        mkdir -p $PLUGINS_DIR
    fi

    cd $PLUGINS_DIR
    pwd
    if [ -e $pluginName ]; then
        rm -rf $pluginName
    fi

    echo "[plugin] link source codes"
    ln -s $rootDir/classes $pluginName

    # Install channel views
    if [ -d $rootDir/views/channel/$pluginName ]; then
        echo "[plugin] unlink views for channel"
        VIEW_ADMIN_CHANNEL=$CSKEFU_ROOT/contact-center/app/src/main/resources/templates/admin/channel

        if [ -d $VIEW_ADMIN_CHANNEL/$pluginName ]; then
            rm -rf $VIEW_ADMIN_CHANNEL/$pluginName
        fi

        cd $VIEW_ADMIN_CHANNEL
        ln -s $rootDir/views/channel/$pluginName .
    else
        echo "[plugin] channel views not present"
    fi

    # Install apps view
    if [ -d $rootDir/views/apps/$pluginName ]; then
        echo "[plugin] unlink views for apps"
        VIEW_ADMIN_APPS=$CSKEFU_ROOT/contact-center/app/src/main/resources/templates/apps

        if [ -d $VIEW_ADMIN_APPS/$pluginName ]; then
            rm -rf $VIEW_ADMIN_APPS/$pluginName
        fi

        cd $VIEW_ADMIN_APPS
        ln -s $rootDir/views/apps/$pluginName .
    else
        echo "[plugin] apps views not present"
    fi    

    # Install admin/system view
    if [ -d $rootDir/views/system/$pluginName ]; then
        echo "[plugin] unlink views for system"
        VIEW_ADMIN_SYSTEM=$CSKEFU_ROOT/contact-center/app/src/main/resources/templates/admin/system

        if [ -d $VIEW_ADMIN_SYSTEM/$pluginName ]; then
            rm -rf $VIEW_ADMIN_SYSTEM/$pluginName
        fi

        cd $VIEW_ADMIN_SYSTEM
        ln -s $rootDir/views/system/$pluginName .
        echo "[note] remember to ignore src/main/resources/templates/admin/system/chatbot in contact-center/app/.gitignore"
    else
        echo "[plugin] system views not present"
    fi 


    echo "[plugin] install done."
else
    echo "[error] not found cosinee dir."
    exit 2
fi