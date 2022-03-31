SPK_NAME = restic
SPK_VERS = 0.13.0
SPK_REV = 0
SPK_ICON = src/restic.png

DEPENDS = cross/$(SPK_NAME)

UNSUPPORTED_ARCHS = $(PPC_ARCHS)

MAINTAINER = sigprof
DESCRIPTION = Restic is a fast, secure, efficient backup program.
DISPLAY_NAME = Restic
CHANGELOG = "Initial package release."
LICENSE_FILE = $(WORK_DIR)/$(SPK_NAME)-$(SPK_VERS)/LICENSE
HOMEPAGE = https://restic.net
LICENSE = BSD

STARTABLE = no

SPK_COMMANDS = bin/restic

include ../../mk/spksrc.spk.mk
