PKG_NAME = rclone
PKG_VERS = 1.58.0
PKG_RELEASE_TAG = v$(PKG_VERS)
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_RELEASE_TAG).$(PKG_EXT)
PKG_DIST_SITE = https://github.com/rclone/rclone/releases/download/$(PKG_RELEASE_TAG)
PKG_DIST_FILE = $(PKG_DIST_NAME)
PKG_DIR = $(PKG_NAME)-$(PKG_RELEASE_TAG)

BUILD_DEPENDS = native/go

HOMEPAGE = https://rclone.org/
COMMENT  = Rclone is a command-line program to sync files and directories to and from different cloud storage providers.
LICENSE  = MIT

GO_SRC_DIR = $(WORK_DIR)/$(PKG_DIR)
GO_BIN_DIR = $(GO_SRC_DIR)/$(PKG_NAME)

GO_LDFLAGS  = -s -w

include ../../mk/spksrc.cross-go.mk
