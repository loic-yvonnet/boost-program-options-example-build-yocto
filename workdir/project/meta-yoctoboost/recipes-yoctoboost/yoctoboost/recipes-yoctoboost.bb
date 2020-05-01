SUMMARY = "Simple C++ program using Boost"
SECTION = "examples"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit cmake

DEPENDS = "boost"
SRCREV = "${AUTOREV}"
SRC_URI = "git://github.com/loic-yvonnet/boost-program-options-example-dev.git"

S = "${WORKDIR}/git"

BBCLASSEXTEND = "native"
