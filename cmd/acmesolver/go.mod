module github.com/cert-manager/cert-manager/acmesolver-binary

go 1.24.0

// Do not remove this comment:
// please place any replace statements here at the top for visibility and add a
// comment to it as to when it can be removed

replace github.com/cert-manager/cert-manager => ../../

// CVE-2026-39821, CVE-2026-25681: Upstream fix is in golang.org/x/net >= v0.55.0, which
// requires Go 1.25+. release-1.18 is pinned to Go 1.24.x, so we use an OpenShift sustaining
// backport that applies the security fix while remaining compatible with Go 1.24.
// Remove this replace when release-1.18 bumps to Go 1.25+ and adopts golang.org/x/net >= v0.55.0.
replace golang.org/x/net => github.com/openshift-sustaining/net v0.50.0-sec.2

// CVE-2026-33186: Upstream fix is in google.golang.org/grpc >= v1.79.3, which requires
// Go 1.25+. release-1.18 is pinned to Go 1.24.x, so we use an OpenShift sustaining backport.
// Remove this replace when release-1.18 bumps to Go 1.25+ and adopts google.golang.org/grpc >= v1.79.3.
replace google.golang.org/grpc => github.com/openshift-sustaining/grpc-go v1.75.1-sec.1

// CVE-2026-46597: Upstream fix is in golang.org/x/crypto >= v0.52.0, which requires Go 1.25+.
// release-1.18 is pinned to Go 1.24.x, so we use an OpenShift sustaining backport.
// Remove this replace when release-1.18 bumps to Go 1.25+ and adopts golang.org/x/crypto >= v0.52.0.
replace golang.org/x/crypto => github.com/openshift-sustaining/crypto v0.48.0-sec.1

require (
	github.com/cert-manager/cert-manager v0.0.0-00010101000000-000000000000
	github.com/spf13/cobra v1.8.1
	k8s.io/component-base v0.32.0
)

require (
	github.com/beorn7/perks v1.0.1 // indirect
	github.com/blang/semver/v4 v4.0.0 // indirect
	github.com/cespare/xxhash/v2 v2.3.0 // indirect
	github.com/fxamacker/cbor/v2 v2.7.0 // indirect
	github.com/go-logr/logr v1.4.3 // indirect
	github.com/go-logr/zapr v1.3.0 // indirect
	github.com/gogo/protobuf v1.3.2 // indirect
	github.com/google/go-cmp v0.7.0 // indirect
	github.com/google/gofuzz v1.2.0 // indirect
	github.com/inconshreveable/mousetrap v1.1.0 // indirect
	github.com/json-iterator/go v1.1.12 // indirect
	github.com/klauspost/compress v1.17.11 // indirect
	github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd // indirect
	github.com/modern-go/reflect2 v1.0.2 // indirect
	github.com/munnerz/goautoneg v0.0.0-20191010083416-a7dc8b61c822 // indirect
	github.com/prometheus/client_golang v1.20.5 // indirect
	github.com/prometheus/client_model v0.6.1 // indirect
	github.com/prometheus/common v0.61.0 // indirect
	github.com/prometheus/procfs v0.15.1 // indirect
	github.com/spf13/pflag v1.0.5 // indirect
	github.com/x448/float16 v0.8.4 // indirect
	go.opentelemetry.io/otel v1.37.0 // indirect
	go.opentelemetry.io/otel/trace v1.37.0 // indirect
	go.uber.org/multierr v1.11.0 // indirect
	go.uber.org/zap v1.27.0 // indirect
	golang.org/x/net v0.49.0 // indirect
	golang.org/x/sys v0.41.0 // indirect
	golang.org/x/text v0.34.0 // indirect
	google.golang.org/protobuf v1.36.6 // indirect
	gopkg.in/inf.v0 v0.9.1 // indirect
	k8s.io/api v0.32.0 // indirect
	k8s.io/apiextensions-apiserver v0.32.0 // indirect
	k8s.io/apimachinery v0.32.0 // indirect
	k8s.io/klog/v2 v2.130.1 // indirect
	k8s.io/utils v0.0.0-20241210054802-24370beab758 // indirect
	sigs.k8s.io/gateway-api v1.1.0 // indirect
	sigs.k8s.io/json v0.0.0-20241014173422-cfa47c3a1cc8 // indirect
	sigs.k8s.io/structured-merge-diff/v4 v4.5.0 // indirect
	sigs.k8s.io/yaml v1.4.0 // indirect
)
