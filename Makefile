
all: lint package

lint:
	helm lint onechart/

kubeval:
	rm -rf manifests && true
	mkdir manifests
	helm template onechart --output-dir manifests
	find manifests/ -name '*.yaml' | xargs kubeval --ignore-missing-schemas -v 1.13.0
	find manifests/ -name '*.yaml' | xargs kubeval --ignore-missing-schemas -v 1.18.0

test:
	helm unittest onechart

package:
	helm package onechart
	mv onechart*.tgz docs
	helm repo index docs --url https://onechart.github.io/onechart
