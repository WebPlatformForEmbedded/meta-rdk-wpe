FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
   file://nxserver_wpe.service \
   file://nexus_wpe_arm \
   file://nexus_wpe_mips \
"

# TODO switch based on ARM vs MIPS architecture
NEXUSFILE = "nexus_wpe_arm"

do_install_append() {
  if ${@bb.utils.contains('DISTRO_FEATURES', 'compositor', 'true', 'false', d)}
  then
    install -m 0644 ${WORKDIR}/nxserver_wpe.service ${D}${systemd_unitdir}/system/nxserver.service
    # Copy lixnserver, needed by the compositor plugins to sysroot
    # FIXME: figure out what the path is for MIPS (since the name implies arm-linux?)
    install -m 0644 ${S}/obj.${NEXUS_PLATFORM}/nexus/nxclient/arm-linux/server/libnxserver.a ${STAGING_LIBDIR}
  fi

# If you turn off DirectFB the nexus_dfb file is no longer installed. Which is required to insmod the nexus modules.
# Overriding manual install of nexus_dfb
  install -m 0755 ${WORKDIR}/${NEXUSFILE} ${D}${D_BRCM_SDK}/bin/nexus_dfb

  mkdir -p ${D}${systemd_unitdir}/system/multi-user.target.wants
  ln -s ${D}${systemd_unitdir}/system/nxserver.service ${D}${systemd_unitdir}/system/multi-user.target.wants/nxserver.service
}

FILES_${PN} += "${D_BRCM_SDK}/bin/nexus_dfb ${systemd_unitdir}/system/multi-user.target.wants/nxserver.service"
