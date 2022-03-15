FROM ubuntu:latest AS builder

ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y bash \
    curl \
    file \
    git \
    unzip \
    wget \
    xz-utils \
    zip \
    libglu1-mesa \
    openjdk-11-jdk

ARG ANDROID_SDK_VERSION=8092744
ENV ANDROID_SDK_ROOT=/opt/android-sdk
RUN mkdir -p ${ANDROID_SDK_ROOT}/cmdline-tools && \
    wget -q https://dl.google.com/android/repository/commandlinetools-linux-${ANDROID_SDK_VERSION}_latest.zip && \
    unzip *tools*linux*.zip -d ${ANDROID_SDK_ROOT}/cmdline-tools && \
    mv ${ANDROID_SDK_ROOT}/cmdline-tools/cmdline-tools ${ANDROID_SDK_ROOT}/cmdline-tools/tools && \
    rm *tools*linux*.zip

ARG FLUTTER_VERSION=2.10.3
RUN curl -o flutter.tar.xz https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz
RUN tar xf flutter.tar.xz -C /usr/local

ADD license_accepter.sh /opt/
RUN chmod +x /opt/license_accepter.sh && /opt/license_accepter.sh $ANDROID_SDK_ROOT

ENV PATH="/usr/local/flutter/bin:${PATH}"

RUN flutter config --no-analytics && flutter channel stable && flutter upgrade

WORKDIR /app
COPY . /app
RUN flutter build web --web-renderer html --release --dart-define="SERVER_API_URL=http://localhost:8080/"
RUN flutter build apk --release --dart-define="SERVER_API_URL=http://localhost:8080/"

FROM nginx:mainline-alpine
COPY --from=builder /app/build/web /usr/share/nginx/html
COPY --from=builder /app/build/app/outputs/flutter-apk/app-release.apk /usr/share/nginx/html/client.apk
