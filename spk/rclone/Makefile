SPK_NAME = rclone
SPK_VERS = 1.58.0
SPK_REV = 0
SPK_ICON = src/rclone.png

DEPENDS = cross/$(SPK_NAME)

UNSUPPORTED_ARCHS = $(PPC_ARCHS)

MAINTAINER = sigprof
DESCRIPTION = Rclone is a command-line program to sync files and directories to and from different cloud storage providers.
DISPLAY_NAME = Rclone
CHANGELOG = "Initial package release."
LICENSE_FILE = $(WORK_DIR)/$(SPK_NAME)-v$(SPK_VERS)/COPYING
HOMEPAGE = https://rclone.org
LICENSE = MIT

STARTABLE = no

SPK_COMMANDS = bin/rclone

include ../../mk/spksrc.spk.mk
