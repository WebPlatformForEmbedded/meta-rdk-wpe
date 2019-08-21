SUMMARY = "Thunder RDK 4.0 image"
DESCRIPTION = "RDK image with Thunde and WPE enabled"
LICENSE = "CLOSED"

inherit core-image distro_features_check

CORE_IMAGE_BASE_INSTALL += "\
    packagegroup-wpewebkit \
    packagegroup-wpeframework \
    wpebackend-rdk \
    rdk-splash-ui \
    ${@bb.utils.contains('DISTRO_FEATURES', 'netflix',  'wpeframework-netflix', '', d)} \
    "


CORE_IMAGE_BASE_INSTALL += " \
    dropbear \
    "


CORE_IMAGE_BASE_INSTALL += " \
    packagegroup-rdk-thunder-wpe \
    "