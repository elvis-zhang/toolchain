#!/bin/sh
#
# http://www.maxwit.com
# http://maxwit.googlecode.com
#

../${MWP_BINUTILS}/configure \
	--prefix=/usr \
	--build=${BUILD_PLAT} \
	--host=${BUILD_PLAT} \
	--target=${TARGET_PLAT} \
	--with-sysroot=${ROOTFS_PATH} \
	--disable-nls \
	--disable-werror \
	--disable-multilib \
	${BU_CPU_OPT} \
	|| exit 1

#	--with-gmp=${UTILS_ROOT}/usr \
#	--with-mpfr=${UTILS_ROOT}/usr \

make && \
make DESTDIR=${TOOLCHAIN_PATH} install || exit 1

cp -v ../${MWP_BINUTILS}/include/libiberty.h ${TOOLCHAIN_PATH}/usr/include
