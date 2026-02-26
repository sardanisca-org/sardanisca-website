.PHONY: run1 run2

run:
	hugo server --buildDrafts --buildFuture --noHTTPCache

run-bind:
	hugo server --buildDrafts --buildFuture --noHTTPCache --bind 0.0.0.0 --baseURL http://10.0.0.100:1313
