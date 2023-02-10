# ================================
# Build image
# ================================
FROM swift:5.7-jammy as build

RUN export DEBIAN_FRONTEND=noninteractive \
	&& apt-get update \
	&& apt-get install -y libjemalloc-dev

WORKDIR /build

# Resolve dependencies
COPY ./Package.* ./
RUN swift package resolve

COPY . .

CMD ["swift", "package", "benchmark"]
