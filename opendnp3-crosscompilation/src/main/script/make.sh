#!/bin/bash
# Compile opendpn3 lib for x86_64 or ARM (Sierra FX30S)

cd $(dirname $0)/../../..
projectDirectory=$(pwd)
projectBuildDirectory=${projectDirectory}/target

if [[ $# != 2 ]] || [[ $1 != "--arch" ]]
then
    echo "Invalid params calling to $0"
    echo "Usage: make.sh --arch [x86_64 | arm]"
    exit 1
fi

if [[ $2 != "arm" ]] && [[ $2 != "x86_64" ]]
then
    echo "Invalid params calling to $0"
    echo "Unknown architecture $2. Only x86_64 and arm are possible"
    exit 2
fi

arch="$2"
echo "Compiling Open DNP 3.0 library for ${arch} architecture"

# Create build folder for build (inside target folder to be cleaned by Maven)
mkdir -p target/build/${arch}
cd target/build/${arch}

# If is for ARM architecture get the compiler programs and options from the toolchain file
if [[ ${arch} == "arm" ]]
then
    # Source Sierra FX30S toolchain file to cross-compile (Legato should be installed at USER home)
    toolchainfile=${HOME}/legato/packages/resources/legato.sdk.latest/configlegatoenv

    if [[ -z $toolchainfile ]]
    then
        echo "Legato it's not install or it's not located at ${HOME}/legato. Legato is needed to cross-compile native libs."
        exit 3
    fi

    source "${toolchainfile}"
fi

# Compile opendnp3 lib in target/opendnp3/${arch} with JAVA option
cmake ${projectBuildDirectory}/checkout -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${projectBuildDirectory} -DDNP3_JAVA=ON
make
make install
