# Set external events accordingly if compositor is enabled
WPEFRAMEWORK_EXTERN_EVENTS += "${@bb.utils.contains('DISTRO_FEATURES', 'compositor',   ' Platform', '', d)}"
