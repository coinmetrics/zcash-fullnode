FROM ubuntu:20.04 as builder

ARG DEBIAN_FRONTEND=noninteractive
RUN set -ex; \
	apt-get update; \
	apt-get install -y \
		autoconf \
		automake \
		bsdmainutils \
		build-essential \
		ca-certificates \
		clang-9 \
		curl \
		g++-multilib \
		git \
		libc6-dev \
		libtool \
		libltdl-dev \
		libtinfo5 \
		m4 \
		ncurses-dev \
		pkg-config \
		python \
		unzip \
		zlib1g-dev \
	; \
	rm -rf /var/lib/apt/lists/*

RUN useradd -m -u 1000 -s /bin/bash builder
USER builder
WORKDIR /home/builder

ARG VERSION

RUN git clone --depth=1 --branch=v${VERSION} https://github.com/zcash/zcash.git

RUN set -ex; \
	cd zcash; \
	./zcutil/build.sh -j$(nproc)


FROM ubuntu:20.04

RUN set -ex; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		ca-certificates \
		libgomp1 \
		wget \
	; \
	rm -rf /var/lib/apt/lists/*

COPY --from=builder /home/builder/zcash/src/zcashd /home/builder/zcash/zcutil/fetch-params.sh /usr/bin/

RUN useradd -m -u 1000 -s /bin/bash runner
USER runner

RUN fetch-params.sh

ENTRYPOINT ["zcashd"]
