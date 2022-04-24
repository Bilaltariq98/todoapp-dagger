package todoapp

import (
	"dagger.io/dagger"
	"universe.dagger.io/netlify"
	"github.com/Bilaltariq98/yarn"
)

dagger.#Plan & {

	client: {
		filesystem: {
			"./": read: {
				contents: dagger.#FS
				exclude: [
					"README.md",
					"_build",
					"todoapp.cue",
					"node_modules",
				]
			}
			"./_build": write: contents: actions.build.build.contents.output
		}
		env: {
			APP_NAME:      string
			NETLIFY_TEAM:  string
			NETLIFY_TOKEN: dagger.#Secret
		}
	}
	actions: {
		build: yarn.#build & { clientFileSystem: client.filesystem."./".read.contents}

		deploy: netlify.#Deploy & {
			contents: build.output
			site:     client.env.APP_NAME
			token:    client.env.NETLIFY_TOKEN
			team:     client.env.NETLIFY_TEAM
		}
	}
}
