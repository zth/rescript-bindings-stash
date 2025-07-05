// Installed version: "@sentry/react": "9.5.0",

type t

type options = {dsn: string}

@module("@sentry/react")
external init: options => unit = "init"
