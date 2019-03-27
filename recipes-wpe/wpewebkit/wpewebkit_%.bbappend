WPE_PLATFORM = "${@bb.utils.contains('DISTRO_FEATURES', 'compositor',   'wpeframework', 'nexus', d)}"

# Enable native audio
PACKAGECONFIG_append = " nativeaudio"
