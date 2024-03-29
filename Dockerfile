FROM docker.io/tiredofit/nginx-php-fpm:debian-7.3-buster as kopano-webservices-builder
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

ARG KOPANO_WEBAPP_VERSION
ARG KOPANO_WEBAPP_PLUGIN_FILES_OWNCLOUD_REPO_URL
ARG KOPANO_WEBAPP_PLUGIN_FILES_OWNCLOUD_VERSION
ARG KOPANO_WEBAPP_PLUGIN_FILES_REPO_URL
ARG KOPANO_WEBAPP_PLUGIN_FILES_SEAFILE_REPO_URL
ARG KOPANO_WEBAPP_PLUGIN_FILES_SEAFILE_VERSION
ARG KOPANO_WEBAPP_PLUGIN_FILES_SMB_REPO_URL
ARG KOPANO_WEBAPP_PLUGIN_FILES_SMB_VERSION
ARG KOPANO_WEBAPP_PLUGIN_FILES_VERSION
ARG KOPANO_WEBAPP_PLUGIN_HTMLEDITOR_MINIMALTINY_REPO_URL
ARG KOPANO_WEBAPP_PLUGIN_HTMLEDITOR_MINIMALTINY_VERSION
ARG KOPANO_WEBAPP_PLUGIN_HTMLEDITOR_JODIT_REPO_URL
ARG KOPANO_WEBAPP_PLUGIN_HTMLEDITOR_JODIT_VERSION
ARG KOPANO_WEBAPP_PLUGIN_HTMLEDITOR_QUILL_REPO_URL
ARG KOPANO_WEBAPP_PLUGIN_HTMLEDITOR_QUILL_VERSION
ARG KOPANO_WEBAPP_PLUGIN_INTRANET_REPO_URL
ARG KOPANO_WEBAPP_PLUGIN_INTRANET_VERSION
ARG KOPANO_WEBAPP_PLUGIN_MATTERMOST_REPO_URL
ARG KOPANO_WEBAPP_PLUGIN_MATTERMOST_VERSION
ARG KOPANO_WEBAPP_PLUGIN_MDM_REPO_URL
ARG KOPANO_WEBAPP_PLUGIN_MDM_VERSION
ARG KOPANO_WEBAPP_PLUGIN_ROCKETCHAT_REPO_URL
ARG KOPANO_WEBAPP_PLUGIN_ROCKETCHAT_VERSION
ARG KOPANO_WEBAPP_PLUGIN_SMIME_REPO_URL
ARG KOPANO_WEBAPP_PLUGIN_SMIME_VERSION
ARG KOPANO_WEBAPP_REPO_URL
ARG KOPANO_KDAV_VERSION
ARG Z_PUSH_VERSION

ENV KOPANO_WEBAPP_VERSION=${KOPANO_WEBAPP_VERSION:-"tags/v5.3.1"} \
    KOPANO_WEBAPP_PLUGIN_FILES_VERSION=${KOPANO_WEBAPP_PLUGIN_FILES_VERSION:-"tags/v4.0.1"} \
    KOPANO_WEBAPP_PLUGIN_FILES_OWNCLOUD_VERSION=${KOPANO_WEBAPP_PLUGIN_FILES_OWNCLOUD_VERSION:-"tags/v4.0.0"} \
    KOPANO_WEBAPP_PLUGIN_FILES_SEAFILE_VERSION=${KOPANO_WEBAPP_PLUGIN_FILES_SEAFILE_VERSION:-"master"} \
    KOPANO_WEBAPP_PLUGIN_FILES_SMB_VERSION=${KOPANO_WEBAPP_PLUGIN_FILES_SMB_VERSION:-"tags/v4.0.0"} \
    KOPANO_WEBAPP_PLUGIN_HTMLEDITOR_JODIT_VERSION=${KOPANO_WEBAPP_PLUGIN_HTMLEDITOR_JODIT_VERSION:-"master"} \
    KOPANO_WEBAPP_PLUGIN_HTMLEDITOR_MINIMALTINY_VERSION=${KOPANO_WEBAPP_PLUGIN_HTMLEDITOR_MINIMALTINY_VERSION:-"tags/v2.0"} \
    KOPANO_WEBAPP_PLUGIN_INTRANET_VERSION=${KOPANO_WEBAPP_PLUGIN_INTRANET_VERSION:-"master"} \
    KOPANO_WEBAPP_PLUGIN_JITSIMEET_VERSION=${KOPANO_WEBAPP_PLUGIN_JITSIMEET_VERSION:-"1.0.2-1"} \
    KOPANO_WEBAPP_PLUGIN_MATTERMOST_VERSION=${KOPANO_WEBAPP_PLUGIN_MATTERMOST_VERSION:-"tags/v1.0.1"} \
    KOPANO_WEBAPP_PLUGIN_MDM_VERSION=${KOPANO_WEBAPP_PLUGIN_MDM_VERSION:-"tags/v3.3.0"} \
    KOPANO_WEBAPP_PLUGIN_MEET_VERSION=${KOPANO_WEBAPP_PLUGIN_MEET_VERSION:-"master"} \
    KOPANO_WEBAPP_PLUGIN_ROCKETCHAT_VERSION=${KOPANO_WEBAPP_PLUGIN_ROCKETCHAT_VERSION:-"1.0.2-1"} \
    KOPANO_WEBAPP_PLUGIN_SMIME_VERSION=${KOPANO_WEBAPP_PLUGIN_SMIME_VERSION:-"tags/v2.2.2"} \
    KOPANO_WEBAPP_PLUGIN_TEXTTEMPLATES_VERSION=${KOPANO_WEBAPP_PLUGIN_TEXTTEMPLATES_VERSION:-"1.0.1-1"} \
    \
    KOPANO_KDAV_VERSION=${KOPANO_KDAV_VERSION:-"master"} \
    Z_PUSH_VERSION=${Z_PUSH_VERSION:-"2.6.4"} \
    \
    KOPANO_KDAV_REPO_URL=${KOPANO_KDAV_REPO_URL:-"https://github.com/Kopano-dev/kdav"} \
    KOPANO_WEBAPP_REPO_URL=${KOPANO_WEBAPP_REPO_URL:-"https://stash.kopano.io/scm/kw/kopano-webapp.git"} \
    KOPANO_WEBAPP_PLUGIN_FILES_OWNCLOUD_REPO_URL=${KOPANO_WEBAPP_PLUGIN_FILES_OWNCLOUD_REPO_URL:-"https://stash.kopano.io/scm/kwa/files-owncloud-backend.git"} \
    KOPANO_WEBAPP_PLUGIN_FILES_REPO_URL=${KOPANO_WEBAPP_PLUGIN_FILES_REPO_URL:-"https://stash.kopano.io/scm/kwa/files.git"} \
    KOPANO_WEBAPP_PLUGIN_FILES_SEAFILE_REPO_URL=${KOPANO_WEBAPP_PLUGIN_FILES_SEAFILE_REPO_URL:-"https://github.com/datamate-rethink-it/kopano-seafile-backend.git"} \
    KOPANO_WEBAPP_PLUGIN_FILES_SMB_REPO_URL=${KOPANO_WEBAPP_PLUGIN_FILES_SMB_REPO_URL:-"https://stash.kopano.io/scm/kwa/files-smb-backend.git"} \
    KOPANO_WEBAPP_PLUGIN_HTMLEDITOR_JODIT_REPO_URL=${KOPANO_WEBAPP_PLUGIN_HTMLEDITOR_JODIT_REPO_URL:-"https://stash.kopano.io/scm/kwa/htmleditor-jodit.git"} \
    KOPANO_WEBAPP_PLUGIN_HTMLEDITOR_MINIMALTINY_REPO_URL=${KOPANO_WEBAPP_PLUGIN_HTMLEDITOR_MINIMALTINY_REPO_URL:-"https://stash.kopano.io/scm/kwa/htmleditor-minimaltiny.git"} \
    KOPANO_WEBAPP_PLUGIN_HTMLEDITOR_QUILL_REPO_URL=${KOPANO_WEBAPP_PLUGIN_HTMLEDITOR_QUILL_REPO_URL:-"https://stash.kopano.io/scm/kwa/htmleditor-quill.git"} \
    KOPANO_WEBAPP_PLUGIN_HTMLEDITOR_QUILL_VERSION=${KOPANO_WEBAPP_PLUGIN_HTMLEDITOR_QUILL_VERSION:-"master"} \
    KOPANO_WEBAPP_PLUGIN_INTRANET_REPO_URL=${KOPANO_WEBAPP_PLUGIN_INTRANET_REPO_URL:-"https://stash.kopano.io/scm/kwa/intranet.git"} \
    KOPANO_WEBAPP_PLUGIN_JITSIMEET_REPO_URL=${KOPANO_WEBAPP_PLUGIN_JITSIMEET_REPO_URL:-"https://repo.siedl.net/public/"} \
    KOPANO_WEBAPP_PLUGIN_HTMLEDITOR_JODIT_REPO_URL=${KOPANO_WEBAPP_PLUGIN_HTMLEDITOR_JODIT_REPO_URL:-"https://stash.kopano.io/scm/kwa/htmleditor-jodit.git"} \
    KOPANO_WEBAPP_PLUGIN_MATTERMOST_REPO_URL=${KOPANO_WEBAPP_PLUGIN_MATTERMOST_REPO_URL:-"https://stash.kopano.io/scm/kwa/mattermost.git"} \
    KOPANO_WEBAPP_PLUGIN_MDM_REPO_URL=${KOPANO_WEBAPP_PLUGIN_MDM_REPO_URL:-"https://stash.kopano.io/scm/kwa/mobile-device-management.git"} \
    KOPANO_WEBAPP_PLUGIN_MEET_REPO_URL=${KOPANO_WEBAPP_PLUGIN_MEET_REPO_URL:-"https://stash.kopano.io/scm/kwa/meet.git"} \
    KOPANO_WEBAPP_PLUGIN_ROCKETCHAT_REPO_URL=${KOPANO_WEBAPP_PLUGIN_ROCKETCHAT_REPO_URL:-"https://cloud.siedl.net/nextcloud/index.php/s/3yKYARgGwfSZe2c/download"} \
    KOPANO_WEBAPP_PLUGIN_SMIME_REPO_URL=${KOPANO_WEBAPP_PLUGIN_SMIME_REPO_URL:-"https://stash.kopano.io/scm/kwa/smime.git"} \
    KOPANO_WEBAPP_PLUGIN_TEXTTEMPLATES_REPO_URL=${KOPANO_WEBAPP_PLUGIN_TEXTTEMPLATES_REPO_URL:-"https://repo.siedl.net/public/"} \
    \
    PHP_ENABLE_GETTEXT=TRUE \
    PHP_ENABLE_MBSTRING=TRUE \
    PHP_ENABLE_XML=TRUE \
    PHP_ENABLE_ZIP=TRUE

ADD build-assets/ /build-assets

RUN set -ex && \
    curl -sSLk https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    echo "deb https://deb.nodesource.com/node_14.x buster main" > /etc/apt/sources.list.d/nodejs.list && \
    WEBAPP_BUILD_DEPS=" \
                        ant \
                        ant-optional \
                        gettext \
                        git \
                        libxml2-utils \
      	                make \
                  	openjdk-11-jdk \
                        nodejs \
                        python \
                        rsync \
                        unzip \
                        " && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
                ${WEBAPP_BUILD_DEPS} \
                && \
    php-ext enable core && \
    \
    ### Fetch Source
    git clone ${KOPANO_WEBAPP_REPO_URL} /usr/src/kopano-webapp && \
    cd /usr/src/kopano-webapp && \
    git checkout ${KOPANO_WEBAPP_VERSION} && \
    \
    set +e && \
    if [ -d "/build-assets/src" ] ; then cp -Rp /build-assets/src/* /usr/src/kopano-webapp ; fi; \
    if [ -d "/build-assets/scripts" ] ; then for script in /build-assets/scripts/*.sh; do echo "** Applying $script"; bash $script; done && \ ; fi ; \
    set -e && \
    \
    # Translations are a source of problems, so we remove for time being other than English
    cd /usr/src/kopano-webapp/server/language && \
    find . -mindepth 1 -maxdepth 1 -type d -not -name en_US* -exec rm -rf '{}' \; && \
    \
    ### Build
    cd /usr/src/kopano-webapp && \
    ant deploy && \
    ant deploy-plugins && \
    make all && \
    \
    ### Setup RootFS
    mkdir -p /rootfs/assets/.changelogs && \
    mkdir -p /rootfs/usr/share/kopano-webapp && \
    mkdir -p /rootfs/assets/kopano/config/webapp && \
    mkdir -p /rootfs/assets/kopano/plugins/webapp && \
    \
    ### Build Plugins
    ## Files
    git clone ${KOPANO_WEBAPP_PLUGIN_FILES_REPO_URL} /usr/src/kopano-webapp/plugins/files && \
    cd /usr/src/kopano-webapp/plugins/files && \
    git checkout ${KOPANO_WEBAPP_PLUGIN_FILES_VERSION} && \
    set +e && \
    if [ -d "/build-assets/plugins/files" ] ; then cp -Rp /build-assets/plugins/files/* /usr/src/kopano-webapp/plugins/files/ ; fi; \
    if [ -d "/build-assets/scripts/plugin-files" ] ; then for script in /build-assets/scripts/plugin-files/*.sh; do echo "** Applying $script"; bash $script; done && \ ; fi ; \
    set -e && \
    ant deploy && \
    cp /usr/src/kopano-webapp/deploy/plugins/files/config.php /rootfs/assets/kopano/config/webapp/config-files.php && \
    ln -sf /etc/kopano/webapp/config-files.php /usr/src/kopano-webapp/deploy/plugins/files/config.php && \
    \
    ## Files Backend: Owncloud
    git clone ${KOPANO_WEBAPP_PLUGIN_FILES_OWNCLOUD_REPO_URL} /usr/src/kopano-webapp/plugins/filesbackendOwncloud && \
    cd /usr/src/kopano-webapp/plugins/filesbackendOwncloud && \
    git checkout ${KOPANO_WEBAPP_PLUGIN_FILES_OWNCLOUD_VERSION} && \
    set +e && \
    if [ -d "/build-assets/plugins/filesbackendOwncloud" ] ; then cp -Rp /build-assets/plugins/filesbackendOwncloud/* /usr/src/kopano-webapp/plugins/filesbackendOwncloud/ ; fi; \
    if [ -d "/build-assets/scripts/plugin-filesbackendOwncloud" ] ; then for script in /build-assets/scripts/plugin-filesbackendOwncloud/*.sh; do echo "** Applying $script"; bash $script; done && \ ; fi ; \
    set -e && \
    ant deploy && \
    \
    ## Files Backend: SeaFile
    git clone ${KOPANO_WEBAPP_PLUGIN_FILES_SEAFILE_REPO_URL} /usr/src/kopano-webapp/plugins/filesbackendSeafile && \
    cd /usr/src/kopano-webapp/plugins/filesbackendSeafile && \
    git checkout ${KOPANO_WEBAPP_PLUGIN_FILES_SEAFILE_VERSION} && \
    set +e && \
    if [ -d "/build-assets/plugins/filesbackendSeafile" ] ; then cp -Rp /build-assets/plugins/filesbackendSeafile/* /usr/src/kopano-webapp/plugins/filesbackendSeafile/ ; fi; \
    if [ -d "/build-assets/scripts/plugin-filesbackendSeafile" ] ; then for script in /build-assets/scripts/plugin-filesbackendSeafile/*.sh; do echo "** Applying $script"; bash $script; done && \ ; fi ; \
    set -e && \
    cp -Rp php src && \
    make && \
    make deploy && \
    cp /usr/src/kopano-webapp/deploy/plugins/filesbackendSeafile/config.php /rootfs/assets/kopano/config/webapp/config-files-backend-seafile.php && \
    ln -sf /etc/kopano/webapp/config-files-backend-seafile.php /usr/src/kopano-webapp/deploy/plugins/filesbackendSeafile/config.php && \
    \
    ## Files Backend: SMB
    git clone ${KOPANO_WEBAPP_PLUGIN_FILES_SMB_REPO_URL} /usr/src/kopano-webapp/plugins/filesbackendSMB && \
    cd /usr/src/kopano-webapp/plugins/filesbackendSMB && \
    git checkout ${KOPANO_WEBAPP_PLUGIN_FILES_SMB_VERSION} && \
    set +e && \
    if [ -d "/build-assets/plugins/filesbackendSMB" ] ; then cp -Rp /build-assets/plugins/filesbackendSMB/* /usr/src/kopano-webapp/plugins/filesbackendSMB/ ; fi; \
    if [ -d "/build-assets/scripts/plugin-filesbackendSMB" ] ; then for script in /build-assets/scripts/plugin-filesbackendSMB/*.sh; do echo "** Applying $script"; bash $script; done && \ ; fi ; \
    set -e && \
    ant deploy && \
    \
    ## HTML Editor: Minimal
    git clone ${KOPANO_WEBAPP_PLUGIN_HTMLEDITOR_MINIMALTINY_REPO_URL} /usr/src/kopano-webapp/plugins/htmleditor-minimaltiny && \
    cd /usr/src/kopano-webapp/plugins/htmleditor-minimaltiny && \
    set +e && \
    if [ -d "/build-assets/plugins/htmleditor-minimaltiny" ] ; then cp -Rp /build-assets/plugins/htmleditor-minimaltiny/* /usr/src/kopano-webapp/plugins/htmleditor-minimaltiny/ ; fi; \
    if [ -d "/build-assets/scripts/plugin-htmleditor-minimaltiny" ] ; then for script in /build-assets/scripts/plugin-htmleditorminimaltiny/*.sh; do echo "** Applying $script"; bash $script; done && \ ; fi ; \
    set -e && \
    ant deploy && \
    \
    ## HTML Editor: Jodit
    git clone ${KOPANO_WEBAPP_PLUGIN_HTMLEDITOR_JODIT_REPO_URL} /usr/src/kopano-webapp/plugins/htmleditor-jodit && \
    cd /usr/src/kopano-webapp/plugins/htmleditor-jodit && \
    git checkout ${KOPANO_WEBAPP_PLUGIN_HTMLEDITOR_JODIT_VERSION} && \
    set +e && \
    if [ -d "/build-assets/plugins/htmleditor-jodit" ] ; then cp -Rp /build-assets/plugins/htmleditor-jodit/* /usr/src/kopano-webapp/plugins/htmleditor-jodit/ ; fi; \
    if [ -d "/build-assets/scripts/plugin-htmleditor-jodit" ] ; then for script in /build-assets/scripts/plugin-htmleditorjodit/*.sh; do echo "** Applying $script"; bash $script; done && \ ; fi ; \
    set -e && \
    ant deploy && \
    \
    ## HTML Editor: Quill
    git clone ${KOPANO_WEBAPP_PLUGIN_HTMLEDITOR_QUILL_REPO_URL} /usr/src/kopano-webapp/plugins/htmleditor-quill && \
    cd /usr/src/kopano-webapp/plugins/htmleditor-quill && \
    set +e && \
    if [ -d "/build-assets/plugins/htmleditor-quill" ] ; then cp -Rp /build-assets/plugins/htmleditor-quill/* /usr/src/kopano-webapp/plugins/htmleditor-quill/ ; fi; \
    if [ -d "/build-assets/scripts/plugin-htmleditor-quill" ] ; then for script in /build-assets/scripts/plugin-htmleditorquill/*.sh; do echo "** Applying $script"; bash $script; done && \ ; fi ; \
    set -e && \
    ant deploy && \
    \
    ## Intranet
    git clone ${KOPANO_WEBAPP_PLUGIN_INTRANET_REPO_URL} /usr/src/kopano-webapp/plugins/intranet && \
    cd /usr/src/kopano-webapp/plugins/intranet && \
    git checkout ${KOPANO_WEBAPP_PLUGIN_INTRANET_VERSION} && \
    set +e && \
    if [ -d "/build-assets/plugins/intranet" ] ; then cp -Rp /build-assets/plugins/intranet/* /usr/src/kopano-webapp/plugins/intranet/ ; fi; \
    if [ -d "/build-assets/scripts/plugin-htmleditor-intranet" ] ; then for script in /build-assets/scripts/plugin-intranet/*.sh; do echo "** Applying $script"; bash $script; done && \ ; fi ; \
    set -e && \
    ant deploy && \
    cp /usr/src/kopano-webapp/deploy/plugins/intranet/config.php /rootfs/assets/kopano/config/webapp/config-intranet.php && \
    ln -sf /etc/kopano/webapp/config-intranet.php /usr/src/kopano-webapp/deploy/plugins/intranet/config.php && \
    \
    ## Jitsi Meet
    mkdir -p /usr/src/jitsimeet && \
    cd /usr/src/jitsimeet && \
    curl -sSLk -o jitsimeet.deb ${KOPANO_WEBAPP_PLUGIN_JITSIMEET_REPO_URL}kopano-webapp-plugin-jitsi-${KOPANO_WEBAPP_PLUGIN_JITSIMEET_VERSION}.deb && \
    ar x jitsimeet.deb && \
    tar xfJ data.tar.xz && \
    cp etc/kopano/webapp/config-sin_jitsi.php /rootfs/assets/kopano/config/webapp/config-jitsimeet.php && \
    mkdir /usr/src/kopano-webapp/deploy/plugins/jitsimeet && \
    cp -Rp usr/share/kopano-webapp/plugins/sin_jitsi/* /usr/src/kopano-webapp/deploy/plugins/jitsimeet/ && \
    ln -sf /etc/kopano/webapp/config-jitsimeet.php /usr/src/kopano-webapp/deploy/plugins/jitsimeet/config.php && \
    set +e && \
    if [ -d "/build-assets/plugins/jitsimeet" ] ; then cp -Rp /build-assets/plugins/jitsimeet/* /usr/src/kopano-webapp/deploy/plugins/jitsimeet/ ; fi; \
    if [ -d "/build-assets/scripts/plugin-jitsimeet" ] ; then for script in /build-assets/scripts/plugin-jitsimeet/*.sh; do echo "** Applying $script"; bash $script; done && \ ; fi ; \
    set -e && \
    \
    ## Meet
    git clone ${KOPANO_WEBAPP_PLUGIN_MEET_REPO_URL} /usr/src/kopano-webapp/plugins/meet && \
    cd /usr/src/kopano-webapp/plugins/meet && \
    git checkout ${KOPANO_WEBAPP_PLUGIN_MEET_VERSION} && \
    set +e && \
    if [ -d "/build-assets/plugins/meet" ] ; then cp -Rp /build-assets/plugins/meet/* /usr/src/kopano-webapp/plugins/meet/ ; fi; \
    if [ -d "/build-assets/scripts/plugin-meet" ] ; then for script in /build-assets/scripts/plugin-meet/*.sh; do echo "** Applying $script"; bash $script; done && \ ; fi ; \
    set -e && \
    make && \
    mkdir -p /usr/src/kopano-webapp/deploy/plugins/meet && \
    cp -Rp dist/kopano-webapp-plugin-*/* /usr/src/kopano-webapp/deploy/plugins/meet/ && \
    cp /usr/src/kopano-webapp/deploy/plugins/meet/config.php.dist /rootfs/assets/kopano/config/webapp/config-meet.php && \
    ln -sf /etc/kopano/webapp/config-meet.php /usr/src/kopano-webapp/deploy/plugins/meet/config.php && \
    rm -rf /usr/src/kopano-webapp/deploy/plugins/meet/config.php.dist && \
    \
    ## Mobile Device Management
    git clone ${KOPANO_WEBAPP_PLUGIN_MDM_REPO_URL} /usr/src/kopano-webapp/plugins/mdm && \
    cd /usr/src/kopano-webapp/plugins/mdm && \
    git checkout ${KOPANO_WEBAPP_PLUGIN_MDM_VERSION} && \
    set +e && \
    if [ -d "/build-assets/plugins/mdm" ] ; then cp -Rp /build-assets/plugins/mdm/* /usr/src/kopano-webapp/plugins/mdm/ ; fi; \
    if [ -f "/build-assets/scripts/plugin-mdm.sh" ] ; then /build-assets/scripts/plugin-mdm.sh ; fi; \
    ant deploy && \
    set -e && \
    cp /usr/src/kopano-webapp/deploy/plugins/mdm/config.php /rootfs/assets/kopano/config/webapp/config-mdm.php && \
    ln -sf /etc/kopano/webapp/config-mdm.php /usr/src/kopano-webapp/deploy/plugins/mdm/config.php && \
    \
    ## Mattermost
    git clone ${KOPANO_WEBAPP_PLUGIN_MATTERMOST_REPO_URL} /usr/src/kopano-webapp/plugins/mattermost && \
    cd /usr/src/kopano-webapp/plugins/mattermost && \
    git checkout ${KOPANO_WEBAPP_PLUGIN_MATTERMOST_VERSION} && \
    set +e && \
    if [ -d "/build-assets/plugins/mattermost" ] ; then cp -Rp /build-assets/plugins/mattermost/* /usr/src/kopano-webapp/plugins/mattermost/ ; fi; \
    if [ -d "/build-assets/scripts/plugin-mattermost" ] ; then for script in /build-assets/scripts/plugin-mattermost/*.sh; do echo "** Applying $script"; bash $script; done && \ ; fi ; \
    set -e && \
    ant deploy && \
    cp /usr/src/kopano-webapp/deploy/plugins/mattermost/config.php /rootfs/assets/kopano/config/webapp/config-mattermost.php && \
    ln -sf /etc/kopano/webapp/config-mattermost.php /usr/src/kopano-webapp/deploy/plugins/mattermost/config.php && \
    \
    ## Rocketchat
    cd /usr/src/ && \
    curl -sSLk -o /usr/src/rocketchat.zip "${KOPANO_WEBAPP_PLUGIN_ROCKETCHAT_REPO_URL}" && \
    unzip -d . rocketchat.zip && \
    cd Rocket.Chat && \
    ar x kopano-rocketchat-${KOPANO_WEBAPP_PLUGIN_ROCKETCHAT_VERSION}.deb && \
    tar xfJ data.tar.xz && \
    cp etc/kopano/webapp/config-rchat.php /rootfs/assets/kopano/config/webapp/config-rchat.php && \
    cp -Rp usr/share/kopano-webapp/plugins/rchat /usr/src/kopano-webapp/deploy/plugins/ && \
    ln -sf /etc/kopano/webapp/config-rchat.php /usr/src/kopano-webapp/deploy/plugins/rchat/config.php && \
    sed -i "/\/\/ The tab in the top tabbar/a \ \ \ \ \ \ site.tabOrderIndex = 30 + i;" /usr/src/kopano-webapp/deploy/plugins/rchat/js/RChatPlugin.js && \
    sed -i "/site: site,/a \ \ \ \ \ \ tabOrderIndex: site.tabOrderIndex," /usr/src/kopano-webapp/deploy/plugins/rchat/js/RChatPlugin.js && \
    set +e && \
    if [ -d "/build-assets/plugins/rocketchat" ] ; then cp -Rp /build-assets/plugins/rocketchat/* /usr/src/kopano-webapp/deploy/plugins/rchat/ ; fi; \
    if [ -d "/build-assets/scripts/plugin-rocketchat" ] ; then for script in /build-assets/scripts/plugin-rocketchat/*.sh; do echo "** Applying $script"; bash $script; done && \ ; fi ; \
    \
    ## S/MIME
    git clone ${KOPANO_WEBAPP_PLUGIN_SMIME_REPO_URL} /usr/src/kopano-webapp/plugins/smime && \
    cd /usr/src/kopano-webapp/plugins/smime && \
    git checkout ${KOPANO_WEBAPP_PLUGIN_SMIME_VERSION} && \
    set +e && \
    if [ -d "/build-assets/plugins/smime" ] ; then cp -Rp /build-assets/plugins/smime/* /usr/src/kopano-webapp/plugins/smime/ ; fi; \
    if [ -d "/build-assets/scripts/plugin-smime" ] ; then for script in /build-assets/scripts/plugin-smime/*.sh; do echo "** Applying $script"; bash $script; done && \ ; fi ; \
    set -e && \
    ant deploy && \
    cp /usr/src/kopano-webapp/deploy/plugins/smime/config.php /rootfs/assets/kopano/config/webapp/config-smime.php && \
    ln -sf /etc/kopano/webapp/config-smime.php /usr/src/kopano-webapp/deploy/plugins/smime/config.php && \
    \
    ## Text Templates
    mkdir -p /usr/src/texttemplates && \
    cd /usr/src/texttemplates && \
    curl -sSLk -o texttemplates.deb ${KOPANO_WEBAPP_PLUGIN_TEXTTEMPLATES_REPO_URL}/kopano-text-templates-${KOPANO_WEBAPP_PLUGIN_TEXTTEMPLATES_VERSION}.deb && \
    ar x texttemplates.deb && \
    tar xfJ data.tar.xz && \
    mkdir /usr/src/kopano-webapp/deploy/plugins/texttemplates && \
    cp -Rp usr/share/kopano-webapp/plugins/sikwtemplates/* /usr/src/kopano-webapp/deploy/plugins/texttemplates/ && \
    set +e && \
    if [ -d "/build-assets/plugins/texttemplates" ] ; then cp -Rp /build-assets/plugins/texttemplates/* /usr/src/kopano-webapp/deploy/plugins/texttemplates/ ; fi; \
    if [ -d "/build-assets/scripts/plugin-texttemplates" ] ; then for script in /build-assets/scripts/plugin-texttemplates/*.sh; do echo "** Applying $script"; bash $script; done && \ ; fi ; \
    set -e && \
    \
    ### Move files to RootFS
    cp -Rp /usr/src/kopano-webapp/deploy/* /rootfs/usr/share/kopano-webapp/ && \
    cd /rootfs/usr/share/kopano-webapp/ && \
    mv *.dist /rootfs/assets/kopano/config/webapp && \
    ln -sf /etc/kopano/webapp/config.php config.php && \
    mv plugins/* /rootfs/assets/kopano/plugins/webapp/ && \
    cp /rootfs/assets/kopano/plugins/webapp/contactfax/config.php /rootfs/assets/kopano/config/webapp/contactfax.php && \
    ln -sf /etc/kopano/webapp/config-contactfax.php /rootfs/assets/kopano/plugins/webapp/contactfax/config.php && \
    cp /rootfs/assets/kopano/plugins/webapp/gmaps/config.php /rootfs/assets/kopano/config/webapp/gmaps.php && \
    ln -sf /etc/kopano/webapp/config-gmaps.php /rootfs/assets/kopano/plugins/webapp/gmaps/config.php && \
    cp /rootfs/assets/kopano/plugins/webapp/pimfolder/config.php /rootfs/assets/kopano/config/webapp/pimfolder.php && \
    ln -sf /etc/kopano/webapp/config-pimfolder.php /rootfs/assets/kopano/plugins/webapp/pimfolder/config.php && \
    \
    chown -R ${NGINX_USER}:${NGINX_GROUP} /rootfs/assets/kopano/plugins/webapp && \
    chown -R ${NGINX_USER}:${NGINX_GROUP} /rootfs/usr/share/kopano-webapp && \
    \
    ### Fetch Additional Scripts
    mkdir -p /rootfs/assets/kopano/scripts && \
    git clone --depth 1 https://stash.kopano.io/scm/ksc/webapp-tools.git /rootfs/assets/kopano/scripts/webapp-tools && \
    find /rootfs/assets/kopano/scripts -name '*.py' -exec chmod +x {} \; && \
    \
    ### Perform modification on scripts
    mkdir -p /rootfs/usr/sbin && \
    ln -s /assets/kopano/scripts/webapp-tools/files_admin/files_admin.py /rootfs/usr/sbin/files-admin && \
    sed -i "s|\"server_ssl\": ssl,|\"server_ssl\": (ssl.lower() == 'true'),|g" /rootfs/assets/kopano/scripts/webapp-tools/files_admin/files_admin.py && \
    sed -i "s|kopano.Server|kopano.server|g" /rootfs/assets/kopano/scripts/webapp-tools/files_admin/files_admin.py && \
    ### Cleanup some webapp issues
    sed -i "s|kopano.Server|kopano.server|g" /rootfs/assets/kopano/scripts/webapp-tools/webapp_admin/kopano-webapp-admin.py && \
    ln -s /assets/kopano/scripts/webapp-tools/webapp_admin/kopano-webapp-admin.py /rootfs/usr/sbin/webapp-admin && \
    \
    ### KDAV Install
    mkdir -p /rootfs/usr/share/kdav && \
    git clone ${KOPANO_KDAV_REPO_URL} /rootfs/usr/share/kdav && \
    cd /rootfs/usr/share/kdav && \
    git checkout ${KOPANO_KDAV_VERSION} && \
    composer install && \
    \
    mkdir -p /rootfs/assets/kdav/config/ && \
    cp -Rp /rootfs/usr/share/kdav/config.php /rootfs/assets/kdav/config/ && \
    chown -R ${NGINX_USER}:${NGINX_GROUP} /rootfs/usr/share/kdav && \
    chown -R ${NGINX_USER}:${NGINX_GROUP} /rootfs/assets/kdav && \
    \
    ### Z-Push Install
    mkdir -p /rootfs/usr/share/zpush && \
    curl -sSLk https://github.com/Z-Hub/Z-Push/archive/${Z_PUSH_VERSION}.tar.gz | tar xvfz - --strip 1 -C /rootfs/usr/share/zpush && \
    mkdir -p /rootfs/usr/sbin && \
    ln -sf /usr/share/zpush/src/z-push-admin.php /rootfs/usr/sbin/zpush-admin && \
    ln -sf /usr/share/zpush/src/z-push-top.php /rootfs/usr/sbin/zpush-top && \
    mkdir -p /rootfs/assets/zpush/config && \
    cp -Rp /rootfs/usr/share/zpush/src/config.php /rootfs/assets/zpush/config/ && \
    cp -Rp /rootfs/usr/share/zpush/src/autodiscover/config.php /rootfs/assets/zpush/config/config-autodiscover.php && \
    cp -Rp /rootfs/usr/share/zpush/tools/gab2contacts/config.php /rootfs/assets/zpush/config/config-gab2contacts.php && \
    cp -Rp /rootfs/usr/share/zpush/tools/gab-sync/config.php /rootfs/assets/zpush/config/config-gab-sync.php && \
    mkdir -p /rootfs/assets/zpush/config/backend && \
    mkdir -p /rootfs/assets/zpush/config/backend/ipcmemcached && \
    cp -Rp /rootfs/usr/share/zpush/src/backend/ipcmemcached/config.php /rootfs/assets/zpush/config/backend/ipcmemcached/ && \
    mkdir -p /rootfs/assets/zpush/config/backend/kopano && \
    cp -Rp /rootfs/usr/share/zpush/src/backend/kopano/config.php /rootfs/assets/zpush/config/backend/kopano/ && \
    mkdir -p /rootfs/assets/zpush/config/backend/sqlstatemachine && \
    cp -Rp /rootfs/usr/share/zpush/src/backend/sqlstatemachine/config.php /rootfs/assets/zpush/config/backend/sqlstatemachine/ && \
    chown -R ${NGINX_USER}:${NGINX_GROUP} /rootfs/usr/share/zpush && \
    chown -R ${NGINX_USER}:${NGINX_GROUP} /rootfs/assets/zpush && \
    \
    mkdir -p /rootfs/etc/php/${PHP_BASE}/mods-available/ && \
    echo "extension=mapi.so" > /rootfs/etc/php/$(php-fpm -v | head -n 1 | awk '{print $2}' | cut -c 1-3)/mods-available/mapi.ini && \
    echo ";priority=20" >> /rootfs/etc/php/$(php-fpm -v | head -n 1 | awk '{print $2}' | cut -c 1-3)/mods-available/mapi.ini && \
    \
    ### Cleanup and Compress Package
    echo "Kopano KDAV ${KOPANO_KDAV_VERSION} built from ${KOPANO_KDAV_REPO_URL} on $(date +'%Y-%m-%d %H:%M:%S')" > /rootfs/assets/.changelogs/kopano-kdav.version && \
    echo "Commit: $(cd /rootfs/usr/share/kdav ; echo $(git rev-parse HEAD))" >> /rootfs/assets/.changelogs/kopano-kdav.version && \
    echo "Kopano Webapp ${KOPANO_WEBAPP_VERSION} built from ${KOPANO_WEBAPP_REPO_URL} on $(date +'%Y-%m-%d %H:%M:%S')" > /rootfs/assets/.changelogs/kopano-webapp.version && \
    echo "Commit: $(cd /usr/src/kopano-webapp ; echo $(git rev-parse HEAD))" >> /rootfs/assets/.changelogs/kopano-webapp.version && \
    env | grep KOPANO | sort >> /rootfs/assets/.changelogs/kopano-webapp.version && \
    echo "ZPush ${Z_PUSH_VERSION} built on $(date +'%Y-%m-%d %H:%M:%S')" > /rootfs/assets/.changelogs/zpush.version && \
    cd /rootfs/ && \
    find . -name .git -type d -print0|xargs -0 rm -rf -- && \
    mkdir -p /kopano-webservices/ && \
    tar cavf /kopano-webservices/kopano-webservices.tar.zst . &&\
    \
    ### Cleanup
    apt-get purge -y \
                ${WEBAPP_BUILD_DEPS} \
                && \
    \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /usr/src/* /var/cache/apk/*

FROM scratch
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

COPY --from=kopano-webservices-builder /kopano-webservices/* /kopano-webservices/
COPY CHANGELOG.md /tiredofit_docker-kopano-webservices.md
