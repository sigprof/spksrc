SPK_NAME = node-exporter
SPK_VERS = 0.18.1
SPK_REV = 2
SPK_ICON = src/node-exporter.png

DEPENDS = cross/$(SPK_NAME)

UNSUPPORTED_ARCHS = $(PPC_ARCHS)

MAINTAINER = chiehmin
DESCRIPTION = Prometheus exporter for hardware and OS metrics exposed by *NIX kernels
STARTABLE = yes
DISPLAY_NAME = Node Exporter
CHANGELOG = "Build generic ARMv7 packages"
BETA = 1

HOMEPAGE = https://github.com/prometheus/node_exporter
LICENSE  = Apache License 2.0

SERVICE_SETUP = src/service-setup.sh

include ../../mk/spksrc.spk.mk
