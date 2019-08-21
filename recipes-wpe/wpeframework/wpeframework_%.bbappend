# enable compositor
WPE_COMPOSITOR_IMPL         = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland',   'Westeros', 'Nexus', d)}"
WPE_COMPOSITOR_DEP          = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland',   'westeros', 'broadcom-refsw', d)}"
PACKAGECONFIG_append 		= " compositorclient"
WPEFRAMEWORK_EXTERN_EVENTS += " Platform"
