JS_SOURCE_FILES := $(shell find ./src -type f)

.PHONY: watch

build/app.js: $(JS_SOURCE_FILES) index.html
	$(shell npm bin)/browserify src/index.es6 -t [ babelify --presets [ es2015 react ] ] -o build/app.js

watch:
	$(shell npm bin)/watchify src/index.es6 -t [ babelify --presets [ es2015 react ] ] -o build/app.js -v
