FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://0001-WebKitBrowser-Add-Time-to-dependencies.patch \
    file://index.html \
"

# ---- compositor settings ----
WPE_COMPOSITOR_IMPL = "Nexus"
WPE_COMPOSITOR_DEP = "broadcom-refsw"

WPE_COMPOSITOR_EXTRAFLAGS = ' \
    -DPLUGIN_COMPOSITOR_SERVICE="internal" \
    -DPLUGIN_COMPOSITOR_AUTOTRACE=ON \
    -DPLUGIN_COMPOSITOR_AUTOSTART=true \
    -DPLUGIN_COMPOSITOR_OUTOFPROCESS=true \
    -DPLUGIN_COMPOSITOR_RESOLUTION=720p \
    -DPLUGIN_COMPOSITOR_GRAPHICS_HEAP_SIZE="192" \
    -DPLUGIN_COMPOSITOR_MEMORY_GFX="192" \
    -DNEXUS_SERVER_HAS_EXTENDED_INIT=OFF \
    -DNEXUS_SERVER_EXTERNAL=false \
    -DPLUGIN_COMPOSITOR_IRMODE=4 \
    -DPLUGIN_COMPOSITOR_NXSERVER=ON \
    -DPLUGIN_COMPOSITOR_ALLOW_UNAUTHENTICATED_CLIENTS=false \
    -DPLUGIN_COMPOSITOR_VIRTUALINPUT=ON \
    -DPLUGIN_COMPOSITOR_SVP="None" \
'

do_install_append() {
    install -d ${D}${WPEFRAMEWORK_PLUGIN_WEBSERVER_PATH}
    install -d ${D}/var/www
    install -m 0755 ${WORKDIR}/index.html ${D}/var/www/
}

FILES_${PN}_append = "/var/www/index.html"
