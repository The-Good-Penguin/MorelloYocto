

COMPATIBLE_MACHINE = "morello"
SUMMARY            = "Board firmware for Morello"
DESCRIPTION        = "The SD card image from ARM that contains non compile-able binaries."
HOMEPAGE           = "https://git.morello-project.org/morello/board-firmware"
LICENSE            = "STMicroelectronics&BSD-3 & BDS-2"
OUTPUTS_NAME       = "board-firmware"
SECTION            = "firmware"

PROVIDES += "virtual/${OUTPUTS_NAME}"

SRC_URI = "git://git.morello-project.org/morello/board-firmware;protocol=https;branch=${SRCBRANCH}"
SRCREV  = "20e3e673f13e854109a069dd719f49e06336142d"

SRCBRANCH        = "morello/release-1.4"
LIC_FILES_CHKSUM = "file://LICENSES/MB/STM.TXT;md5=15054b089e974faf5fb98db442a7415a \
                    file://LICENSES/LIB/sensor.txt;md5=7ba201f1f1e4959d3505d9c59c6cfdfa \
                    "

S                      = "${WORKDIR}/git"
FILES:${PN}           += "/${OUTPUTS_NAME}"
FILES:${PN}-staticdev += "/${OUTPUTS_NAME}/LIB/sensor.a"
SYSROOT_DIRS          += "/${OUTPUTS_NAME}"

do_install() {
    install -d "${D}/${OUTPUTS_NAME}"
    cp -rf ${S}/* "${D}/${OUTPUTS_NAME}/"
}