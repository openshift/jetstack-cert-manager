FROM brew.registry.redhat.io/rh-osbs/openshift-golang-builder:rhel_9_golang_1.22 AS builder
WORKDIR /go/src/github.com/openshift/jetstack-cert-manager
COPY . .

ENV GO_BUILD_TAGS "strictfipsruntime,openssl"
ENV GOEXPERIMENT strictfipsruntime 
ENV CGO_ENABLED 1

RUN go mod tidy && go mod download && go mod vendor && go mod verify
RUN go build -tags $GO_BUILD_TAGS -o _output/acmesolver cmd/acmesolver/main.go
RUN go build -tags $GO_BUILD_TAGS -o _output/cainjector cmd/cainjector/main.go
RUN go build -tags $GO_BUILD_TAGS -o _output/controller cmd/controller/main.go
RUN go build -tags $GO_BUILD_TAGS -o _output/webhook cmd/webhook/main.go

FROM registry.redhat.io/rhel9-2-els/rhel:9.2-1327.1725390050

COPY --from=builder /go/src/github.com/openshift/jetstack-cert-manager_output/acmesolver /app/cmd/acmesolver/acmesolver
COPY --from=builder /go/src/github.com/openshift/jetstack-cert-manager_output/cainjector /app/cmd/cainjector/cainjector
COPY --from=builder /go/src/github.com/openshift/jetstack-cert-manager_output/controller /app/cmd/controller/controller
COPY --from=builder /go/src/github.com/openshift/jetstack-cert-manager_output/webhook /app/cmd/webhook/webhook

USER 65534:65534

LABEL com.redhat.component="jetstack-cert-manager-container" \
      name="cert-manager/jetstack-cert-manager-rhel9" \
      version="v${CI_JETSTACK_CERT_MANAGER_UPSTREAM_VERSION_SANITIZED}" \
      summary="cert-manager" \
      maintainer="Red Hat, Inc." \
      description="jetstack-cert-manager-container" \
      io.openshift.expose-services="" \
      io.openshift.tags="data,images,cert-manager" \
      io.openshift.build.commit.id="${CI_JETSTACK_CERT_MANAGER_UPSTREAM_COMMIT}" \
      io.openshift.build.source-location="${CI_JETSTACK_CERT_MANAGER_UPSTREAM_URL}" \
      io.openshift.build.commit.url="${CI_JETSTACK_CERT_MANAGER_UPSTREAM_URL}/commit/${CI_JETSTACK_CERT_MANAGER_UPSTREAM_COMMIT}" \
      io.k8s.display-name="cert-manager-controller" \
      io.k8s.description="jetstack-cert-manager-container"
