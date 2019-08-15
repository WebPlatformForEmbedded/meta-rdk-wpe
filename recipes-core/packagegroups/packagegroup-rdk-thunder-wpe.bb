SUMMARY = "Thunder RDK4.0 application package group"

LICENSE = "CLOSED"

inherit packagegroup

PACKAGES = "packagegroup-rdk-thunder-wpe"

# Generic RDK components
RDEPENDS_packagegroup-rdk-thunder-wpe += "\
    broadcom-refsw \
    broadcom-mfrlib \
    gstreamer-plugins-soc \
"

RDEPENDS_packagegroup-rdk-thunder-wpe += "\
    nfs-utils \
    iptables \
"
