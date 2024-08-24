diff --git a/Dockerfile b/Dockerfile
index 21473f1..7a11bba 100644
 b/Dockerfile
@@ -5,13 +5,13 @@
 #
 
 # Pull base image.
 FROM jlesage/baseimage-gui:alpine-3.8-v3.5.3
 
 # Docker image version is provided via build arg.
 ARG DOCKER_IMAGE_VERSION=unknown
 
 # Define software versions.
 ARG FIREFOX_VERSION=52.9.0-r0
 ARG JSONLZ4_VERSION=c4305b8
 ARG LZ4_VERSION=1.8.1.2
 #ARG PROFILE_CLEANER_VERSION=2.36
@@ -26,9 +26,7 @@ WORKDIR /tmp
 
 # Install Firefox.
 RUN \
     add-pkg firefox-esr=${FIREFOX_VERSION}
 
 # Install extra packages.
 RUN \
@@ -42,7 +40,7 @@ RUN \
 
 # Set default settings.
 RUN \
     CFG_FILE="$(ls /usr/lib/firefox-*/browser/defaults/preferences/firefox-branding.js)" && \
     echo '' >> "$CFG_FILE" && \
     echo '// Default download directory.' >> "$CFG_FILE" && \
     echo 'pref("browser.download.dir", "/config/downloads");' >> "$CFG_FILE" && \