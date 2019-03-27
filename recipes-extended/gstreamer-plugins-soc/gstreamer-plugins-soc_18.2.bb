SUMMARY = "Gstreamer SOC specific plugins for Broadcom"
LICENSE = "CLOSED"
PV = "18.2+git${SRCPV}"

DEPENDS = "broadcom-refsw gstreamer1.0 gstreamer1.0-plugins-base mpg123 curl"
RDEPENDS_${PN} = "mpg123"

PROVIDES = "virtual/gst-plugins-playersinkbin"
RPROVIDES_${PN} = "virtual/gst-plugins-playersinkbin"

SRC_URI = "git://git@github.com/Metrological/gstreamer-plugins-soc.git;protocol=ssh;branch=18.2-rdkv-20180727"
SRCREV = "25005705a69a840b881a61d517e05837190372ec"

DEFAULT_PREFERENCE = "-1"

S = "${WORKDIR}/git"

inherit autotools pkgconfig

#PACKAGECONFIG ?= "${@base_contains('WITH_SVP', 'y', 'svp', ' ', d)}"
#PACKAGECONFIG[svp]  = "--enable-svp,,"

EXTRA_OECONF += " \
	--enable-gstreamer1 \
	--enable-shared \
	--with-pic \
	--disable-static \
	--enable-audfilter \
	--enable-audiodecode \
	--enable-audiosink \
	--enable-videodecode \
	--enable-videosink \
	--enable-vidfilter \
	--disable-mp3swdecode \
	--disable-pcmsink \
	--disable-transcode \
	--disable-tsdemux \
	--disable-playersinkbin \
	--disable-gfxsink \
"

EXTRA_OECONF += 'REFSW_DIR="refsw"'

PACKAGES_DYNAMIC = "^libgst.*"

FILES_SOLIBSDEV = ""
SOLIBS = ".so"
INSANE_SKIP_${PN} += "dev-so"

FILES_${PN} += "${libdir}/gstreamer-*/*.so ${libdir}/*.so"
FILES_${PN}-dev += "${libdir}/gstreamer-*/*.la"
FILES_${PN}-dbg += "${libdir}/gstreamer-*/.debug/*"
FILES_${PN}-staticdev += "${libdir}/gstreamer-*/*.a "
FILES_${PN}-dbg += "/usr/bin/gst-unittests/.debug/*"

CFLAGS += "-std=gnu99"
CFLAGS += "-Wall"
