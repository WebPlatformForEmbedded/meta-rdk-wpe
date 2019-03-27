SUMMARY = "Generic RDK WPE image"
DESCRIPTION = "Generic RDK image with WPE components"
LICENSE = "CLOSED"

inherit core-image distro_features_check

CORE_IMAGE_BASE_INSTALL += "\
    packagegroup-wpewebkit \
    packagegroup-wpeframework \
    wpebackend-rdk \
    ${@bb.utils.contains('DISTRO_FEATURES', 'netflix',  'wpeframework-netflix', '', d)} \
    "

CORE_IMAGE_BASE_INSTALL_remove = "wpe-launcher wpelauncher"

CORE_IMAGE_BASE_INSTALL += " \
    network-hotplug \
    dropbear \
    "
