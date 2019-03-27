# With the virtual input the keys are routed from the control UI you open on your laptop to the box.
# Select nexus or wpeframework backend dependent on compositor distro feature
WPE_BACKEND = " \
	${@bb.utils.contains('DISTRO_FEATURES', 'compositor',   'wpeframework', 'nexus', d)} \
	virtualinput \
"
