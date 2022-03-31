PKG_NAME = restic
PKG_VERS = 0.13.0
PKG_RELEASE_TAG = v$(PKG_VERS)
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = https://github.com/restic/restic/releases/download/$(PKG_RELEASE_TAG)
PKG_DIST_FILE = $(PKG_DIST_NAME)
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

BUILD_DEPENDS = native/go

HOMEPAGE = https://restic.net/
COMMENT  = Restic is a fast, secure, efficient backup program.
LICENSE  = BSD

GO_SRC_DIR = $(WORK_DIR)/$(PKG_DIR)/cmd/restic
GO_BIN_DIR = $(GO_SRC_DIR)/$(PKG_NAME)

GO_LDFLAGS  = -s -w

include ../../mk/spksrc.cross-go.mk
