FROM alpine:3.17.2 AS builder


ARG FFMPEG_VERSION=1.0

RUN  echo "info: $( [ "$FFMPEG_VERSION" = "6.0" ] && echo --enable-lcms2 || true )"



RUN \
  ./configure \
  --pkg-config-flags="--static" \
  --extra-cflags="-fopenmp" \
  --extra-ldflags="-fopenmp -Wl,-z,stack-size=2097152" \
  --toolchain=hardened \
  --disable-debug \
  --disable-shared \
  --disable-ffplay \
  --enable-static \
  --enable-gpl \
  --enable-version3 \
  --enable-nonfree \
  --enable-fontconfig \
  --enable-gray \
  --enable-iconv \
  $( [ "$FFMPEG_VERSION" = "6.0" ] && echo --enable-lcms2 || true ) \
  --enable-libaom \
  --enable-libaribb24 \
