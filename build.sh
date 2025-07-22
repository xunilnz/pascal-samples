#!/bin/bash
# Free Pascal build script with explicit release/debug options

# Check if no arguments were provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <output_name> [--release|--debug]"
    echo "  --release  Build optimized release version (default)"
    echo "  --debug    Build with debug information"
    exit 1
fi

# Gets the program from first output parameter. Alternative: Get the first .pas file in the current directory
PAS_FILE=$1.pas #OR(ls *.pas 2>/dev/null | head -n 1)

if [ -z "$PAS_FILE" ]; then
    echo "Error: No .pas file found in current directory"
    exit 1
fi

OUTPUT_NAME="$1"
BUILD_TYPE="${2:---release}"  # Default to release if not specified

case "$BUILD_TYPE" in
    --release)
        echo "Building $PAS_FILE in release mode (optimized for size)..."
        
        fpc -O4 -CX -Xs- -XD \
            -Xs -XX \
            -Ci- -Cr- -Co- \
            -Fu. -Cg \
            -o"$OUTPUT_NAME" \
            "$PAS_FILE"
        ;;
    --debug)
        echo "Building $PAS_FILE in debug mode (with debug information)..."
        
        fpc -gl -gw -godwarfsets \
            -Fu. -Cg \
            -o"$OUTPUT_NAME" \
            "$PAS_FILE"
        ;;
    *)
        echo "Error: Invalid build type '$BUILD_TYPE'"
        echo "Valid options: --release, --debug"
        exit 1
        ;;
esac

if [ $? -eq 0 ]; then
    echo "Successfully built $OUTPUT_NAME ($BUILD_TYPE)"
else
    echo "Build failed"
    exit 1
fi
