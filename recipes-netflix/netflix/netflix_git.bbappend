NETFLIX_BACKEND = "${@bb.utils.contains('DISTRO_FEATURES', 'compositor',   'wpeframework', 'nexus', d)}"
