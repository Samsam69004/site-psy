import { application } from "./application"

const context = require.context(".", true, /\.controller\.js$/)
context.keys().forEach((filename) => {
  const controllerModule = context(filename)
  if (controllerModule.default) {
    application.register(controllerModule.default.name, controllerModule.default)
  }
})
