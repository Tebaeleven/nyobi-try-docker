# 構築するDockerイメージの元となるイメージを指定
# --platform=linux/x86_64はApple Silicon Macでもx86向けのイメージを動かすため
FROM --platform=linux/x86_64 ubuntu:22.04
# Docker イメージの構築（Docker コンテナの初期設定）で実行するコマンドを記述
#Ubuntu の機能をカットせずに使うため
RUN yes | unminimize 
# locale-gen を使うため
RUN apt-get update && \
    apt-get install -y locales
# 環境変数DEBIAN_FRONTENDを一時的にnoninteractive (非対話型)モードに
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata 
#  Ubuntu を日本語化するため
RUN locale-gen ja_JP.UTF-8
# 環境変数LANGを設定し、Ubuntuを日本語化
ENV LANG=ja_JP.UTF-8
ENV TZ=Asia/Tokyo
# 作業ディレクトリを指定
WORKDIR /try-docker