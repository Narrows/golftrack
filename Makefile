JS_SOURCE_FILES := $(shell find ./src/js -type f)
SCSS_SOURCE_FILES := $(shell find ./src/scss -type f)

.PHONY: css js watch

all: css js

css: build/app.css

js: build/app.js

build/app.js: $(JS_SOURCE_FILES) index.html
	mkdir -p build
	$(shell npm bin)/browserify src/js/index.es6 -t [ babelify --presets [ es2015 react ] ] -o build/app.js

build/app.css: $(SCSS_SOURCE_FILES)
	mkdir -p build
	$(shell npm bin)/node-sass ./src/scss/main.scss ./build/app.css

watch-js:
	mkdir -p build
	$(shell npm bin)/watchify src/js/index.es6 -t [ babelify --presets [ es2015 react ] ] -o build/app.js -v

watch-css:
	mkdir -p build
	$(shell npm bin)/node-sass -w ./src/scss/main.scss ./build/app.css

clean:
	rm -rf ./build/*
