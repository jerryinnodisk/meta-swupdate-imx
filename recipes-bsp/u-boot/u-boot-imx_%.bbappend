FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

FILES:${PN} += "/etc/*"
SRC_URI += " file://0001-imx8mp-asbc-3m80-default-env-lf-6.1.55.patch"

SWU_HW_REV ?= "1.0"

do_install:append: () {

    echo "/dev/mmcblk1 0x700000 0x4000" > ${D}/${sysconfdir}/fw_env.config
    echo "/dev/mmcblk1 0x704000 0x4000" >> ${D}/${sysconfdir}/fw_env.config
    echo "${MACHINE} ${SWU_HW_REV}" > ${D}/${sysconfdir}/hwrevision
    install -D -m 644  ${D}/${sysconfdir}/fw_env.config  ${DEPLOYDIR}
    install -D -m 644  ${D}/${sysconfdir}/hwrevision  ${DEPLOYDIR}

}