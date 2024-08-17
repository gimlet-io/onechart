
.PHONY: all lint kubeval test package debug debug-ui

all: lint kubeval test package

lint:
	helm lint charts/onechart/
	helm lint charts/cron-job/
	helm lint charts/static-site

kubeval:
	rm -rf manifests && true
	mkdir manifests
	helm template charts/onechart --output-dir manifests
	find manifests/ -name '*.yaml' | xargs kubeval --ignore-missing-schemas -v 1.20.0
	find manifests/ -name '*.yaml' | xargs kubeval --ignore-missing-schemas -v 1.24.0

	rm -rf manifests && true
	mkdir manifests
	helm template charts/cron-job --output-dir manifests
	find manifests/ -name '*.yaml' | xargs kubeval --ignore-missing-schemas -v 1.20.0
	find manifests/ -name '*.yaml' | xargs kubeval --ignore-missing-schemas -v 1.24.0

	rm -rf manifests && true
	mkdir manifests
	helm template charts/static-site --output-dir manifests
	find manifests/ -name '*.yaml' | xargs kubeval --ignore-missing-schemas -v 1.20.0
	find manifests/ -name '*.yaml' | xargs kubeval --ignore-missing-schemas -v 1.24.0

test:
	helm dependency update charts/onechart
	helm unittest charts/onechart

	helm dependency update charts/cron-job
	helm unittest charts/cron-job

	helm dependency update charts/static-site
	helm unittest charts/static-site

package:
	helm dependency update charts/onechart
	helm package charts/onechart
	mv onechart*.tgz docs

	helm dependency update charts/cron-job
	helm package charts/cron-job
	mv cron-job*.tgz docs

	helm dependency update charts/static-site
	helm package charts/static-site
	mv static-site*.tgz docs

	helm repo index docs --url https://chart.onechart.dev

debug:
	helm dependency update charts/onechart
	helm template my-release charts/onechart/ -f values.yaml --debug

debug-cron-job:
	helm dependency update charts/cron-job
	helm template charts/cron-job/ -f values-cron-job.yaml --debug
