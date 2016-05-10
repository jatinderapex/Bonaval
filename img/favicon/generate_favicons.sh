#!/bin/sh
# Edited:
# - use favicon_base.png
# - generate 152x152
# - generate 96x96
# - don't optimize base
#
#===============================================================================
#         FILE: generate_favicons.sh
#
#        USAGE: generate_favicons.sh (inside the directory with favicon-152.png)
#
#  DESCRIPTION: Resizes favicon-152.png to create the rest of the required
#               favicons. Does not overwrite if a favicon already exists.
#
#      OPTIONS: ---
# REQUIREMENTS: optipng, imagemagik, favicon-152.png (with size 152x152).
#         BUGS: ---
#        NOTES: From suggestion https://github.com/audreyr/favicon-cheat-sheet.
#               Probably overkill. Produces a large favicon.ico.
#       AUTHOR: Joseph Preiss <joseph.preiss@gmail.com>
#      COMPANY: ---
#      Version: 1.0
#      CREATED: 04.27.2014
#     REVISION: ---
#===============================================================================
OPTIPNG_ARGS="-o7"

# RESIZE_FROM : largest and the touch icon for iOS 2.0+ and Android 2.1+.
RESIZE_FROM="favicon_base.png"

# Verify dependencies exist.
command -v convert >/dev/null 2>&1 || \
  { echo >&2 "Missing dependency imagemagik. Aborting."; exit 1; }
command -v optipng >/dev/null 2>&1 || \
  { echo >&2 "Missing dependency optipng. Aborting."; exit 1; }

# Check if the file to resize from exists.
if [ ! -e "${RESIZE_FROM}" ]; then
  echo "File to resize from ${RESIZE_FROM} does not exist!. Aborting."
  exit 1
fi

# Optimize RESIZE_FROM.
# optipng ${OPTIPNG_ARGS} "${RESIZE_FROM}"

ANDROID152="favicon-152.png"
if [ ! -e "${ANDROID152}" ]; then
  echo "Resizing file ${RESIZE_FROM} to ${ANDROID152}."
  convert "${RESIZE_FROM}" -resize 152x152 "${ANDROID152}"
  optipng ${OPTIPNG_ARGS} "${ANDROID152}"
fi

# Produce resized, optimized images if file is missing.
METRO_TEN_PLUS="favicon-144.png"
if [ ! -e "${METRO_TEN_PLUS}" ]; then
  echo "Resizing file ${RESIZE_FROM} to ${METRO_TEN_PLUS}."
  convert "${RESIZE_FROM}" -resize 144x144 "${METRO_TEN_PLUS}"
  optipng ${OPTIPNG_ARGS} "${METRO_TEN_PLUS}"
fi

IPHONE_HIGH_RES_SEVEN_PLUS="favicon-120.png"
if [ ! -e "${IPHONE_HIGH_RES_SEVEN_PLUS}" ]; then
  echo "Resizing file ${RESIZE_FROM} to ${IPHONE_HIGH_RES_SEVEN_PLUS}."
  convert "${RESIZE_FROM}" -resize 120x120 "${IPHONE_HIGH_RES_SEVEN_PLUS}"
  optipng ${OPTIPNG_ARGS} "${IPHONE_HIGH_RES_SEVEN_PLUS}"
fi

IPHONE_HIGH_RES_SIX_LESS="favicon-114.png"
if [ ! -e "${IPHONE_HIGH_RES_SIX_LESS}" ]; then
  echo "Resizing file ${RESIZE_FROM} to ${IPHONE_HIGH_RES_SIX_LESS}."
  convert "${RESIZE_FROM}" -resize 114x114 "${IPHONE_HIGH_RES_SIX_LESS}"
  optipng ${OPTIPNG_ARGS} "${IPHONE_HIGH_RES_SIX_LESS}"
fi

IPAD_FIRST_AND_SECOND_GEN="favicon-72.png"
if [ ! -e "${IPAD_FIRST_AND_SECOND_GEN}" ]; then
  echo "Resizing file ${RESIZE_FROM} to ${IPAD_FIRST_AND_SECOND_GEN}."
  convert "${RESIZE_FROM}" -resize 72x72 "${IPAD_FIRST_AND_SECOND_GEN}"
  optipng ${OPTIPNG_ARGS} "${IPAD_FIRST_AND_SECOND_GEN}"
fi

NON_RETINA_IPHONE_ANDROID_TWO_ONE="favicon-57.png"
if [ ! -e "${NON_RETINA_IPHONE_ANDROID_TWO_ONE}" ]; then
  echo "Resizing file ${RESIZE_FROM} to ${NON_RETINA_IPHONE_ANDROID_TWO_ONE}."
  convert "${RESIZE_FROM}" -resize 57x57 "${NON_RETINA_IPHONE_ANDROID_TWO_ONE}"
  optipng ${OPTIPNG_ARGS} "${NON_RETINA_IPHONE_ANDROID_TWO_ONE}"
fi

DEFAULT_CHROME_SIZE="favicon-96.png"
if [ ! -e "${DEFAULT_CHROME_SIZE}" ]; then
  echo "Resizing file ${RESIZE_FROM} to ${DEFAULT_CHROME_SIZE}."
  convert "${RESIZE_FROM}" -resize 96x96 "${DEFAULT_CHROME_SIZE}"
  optipng ${OPTIPNG_ARGS} "${DEFAULT_CHROME_SIZE}"
fi

#  Create the favicon dependencies.
SOME_OLD_CHROME="favicon-32.png"
if [ ! -e "${SOME_OLD_CHROME}" ]; then
  echo "Resizing file ${RESIZE_FROM} to ${SOME_OLD_CHROME}."
  convert "${RESIZE_FROM}" -resize 32x32 "${SOME_OLD_CHROME}"
  optipng ${OPTIPNG_ARGS} "${SOME_OLD_CHROME}"
fi

if [ ! -e "favicon-16.png" ]; then
  echo "Creating dependency 16x16 for favicon.ico."
  convert "${RESIZE_FROM}" -resize 16x16 "favicon-16.png"
  optipng ${OPTIPNG_ARGS} "favicon-16.png"
fi

if [ ! -e "favicon-48.png" ]; then
  echo "Creating dependency 48x48 for favicon.ico."
  convert "${RESIZE_FROM}" -resize 48x48 "favicon-48.png"
  optipng ${OPTIPNG_ARGS} "favicon-48.png"
fi

if [ ! -e "favicon-24.png" ]; then
  echo "Creating dependency 24x24 for favicon.ico."
  convert "${RESIZE_FROM}" -resize 24x24 "favicon-24.png"
  optipng ${OPTIPNG_ARGS} "favicon-24.png"
fi

if [ ! -e "favicon-64.png" ]; then
  echo "Creating dependency 64x64 for favicon.ico."
  convert "${RESIZE_FROM}" -resize 64x64 "favicon-64.png"
  optipng ${OPTIPNG_ARGS} "favicon-64.png"
fi

# Create the favicon from the dependencies.
if [ ! -e "favicon.ico" ]; then
  echo "Creating the favicon.ico."
  convert favicon-16.png favicon-32.png favicon-64.png \
          favicon-48.png favicon-16.png favicon.ico
fi
