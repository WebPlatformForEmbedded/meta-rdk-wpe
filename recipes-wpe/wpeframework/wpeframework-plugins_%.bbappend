# Set to rdk splash ui
WEBKITBROWSER_STARTURL = "http://127.0.0.1:8080/RDKSplashScreen/index.html"

PACKAGECONFIG_append = " remote-ir"

# Compositor settings, if Wayland is in the distro set the implementation to Wayland with Westeros dependency
WPE_COMPOSITOR_IMPL         = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland',   'Westeros', 'Nexus', d)}"
WPE_COMPOSITOR_DEP          = "broadcom-refsw"
WPE_COMPOSITOR_EXTRAFLAGS   = ""
WPE_COMPOSITOR_HW_READY     = "3"

# Additional flags
WPE_COMPOSITOR_EXTRAFLAGS = ' \
    -DPLUGIN_COMPOSITOR_AUTOSTART=true \
    -DPLUGIN_COMPOSITOR_OUTOFPROCESS=true \
    -DPLUGIN_COMPOSITOR_RESOLUTION=1080p60hz \
    -DPLUGIN_COMPOSITOR_MEMORY_GFX="350" \
    -DPLUGIN_COMPOSITOR_IRMODE="18" \
    -DPLUGIN_COMPOSITOR_VIRTUALINPUT=ON \
    -DPLUGIN_COMPOSITOR_SVP="None" \
    -DPLUGIN_COMPOSITOR_PAK_PATH="/usr/bin/" \
    -DPLUGIN_COMPOSITOR_DRM_PATH="/usr/bin/" \
    -DPLUGIN_COMPOSITOR_ALLOW_UNAUTHENTICATED_CLIENTS=false \
    -DPLUGIN_COMPOSITOR_NXSERVER=ON \
    -DNEXUS_SERVER_HAS_EXTENDED_INIT=false \
    -DPLUGIN_COMPOSITOR_BOXMODE="2" \
'
