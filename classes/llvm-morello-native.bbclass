LLVM_PATH   = "${STAGING_LIBDIR_NATIVE}/llvm-morello-native/bin"
TOOLCHAIN   = "clang"

COMPILER_RT = "-rtlib=libgcc ${UNWINDLIB}"
UNWINDLIB   = "--unwindlib=libgcc"

CXXFLAGS:append:toolchain-clang = " -stdlib=libstdc++"
LDFLAGS:append:toolchain-clang  = " ${COMPILER_RT} ${LIBCPLUSPLUS}"

DEPENDS             += "virtual/llvm-morello-native"
do_compile[depends] += "llvm-morello-native:do_populate_sysroot"

export CC     = "${LLVM_PATH}/clang"
export CXX    = "${LLVM_PATH}/clang++"
export CPP    = "${LLVM_PATH}/clang"
export CCLD   = "${LLVM_PATH}/clang"
export RANLIB = "${LLVM_PATH}/llvm-ranlib"
export AR     = "${LLVM_PATH}/llvm-ar"
export NM     = "${LLVM_PATH}/llvm-nm"
export OBJDUMP= "${LLVM_PATH}/llvm-objdump"
export OBJCOPY= "${LLVM_PATH}/llvm-objcopy"
export STRIP  = "${LLVM_PATH}/llvm-strip"
export STRINGS= "${LLVM_PATH}/llvm-strings"
export READELF= "${LLVM_PATH}/llvm-readelf"
export LTO    = "-fuse-ld=lld"
export HOSTCC = "${LLVM_PATH}/clang"

CCACHE_COMPILERCHECK:toolchain-clang ?= "%compiler% -v"
HOST_CC_ARCH:prepend:toolchain-clang = "-target ${HOST_SYS} "
CC:toolchain-clang      = "${LLVM_PATH}/clang"
CXX:toolchain-clang     = "${LLVM_PATH}/clang++"
CPP:toolchain-clang     = "${LLVM_PATH}/clang"
CCLD:toolchain-clang    = "${LLVM_PATH}/clang"
RANLIB:toolchain-clang  = "${LLVM_PATH}/llvm-ranlib"
AR:toolchain-clang      = "${LLVM_PATH}/llvm-ar"
NM:toolchain-clang      = "${LLVM_PATH}/llvm-nm"
OBJDUMP:toolchain-clang = "${LLVM_PATH}/llvm-objdump"
OBJCOPY:toolchain-clang = "${LLVM_PATH}/llvm-objcopy"
STRIP:toolchain-clang   = "${LLVM_PATH}/llvm-strip"
STRINGS:toolchain-clang = "${LLVM_PATH}/llvm-strings"
READELF:toolchain-clang = "${LLVM_PATH}/llvm-readelf"
LTO:toolchain-clang     = "-fuse-ld=lld"