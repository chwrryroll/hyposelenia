import gleam/list
import gleam/string

import hyposelenia . {
  type Hyposelenia,
  Hyposelenia
}
import hyposelenia/handler . {
  type Action, type Path, type Method,
  Static, Slug, Wildcard, Handler
}

fn route(
  self   : Hyposelenia,
  path   : String,
  action : Action,
  method : Method
) -> Hyposelenia {
  let route: List(Path) = path
  |> string.split("/")
  |> list.map(fn (path) {
    case path {
      ":" <> rest -> Slug(rest)
      "*"  -> Wildcard
      path -> Static("/" <> path)
    }
  })
  |> list.drop(1) // I'll work on this later

  Hyposelenia(
    handlers: [
      Handler(method, route, action),
      ..self.handlers
    ]
  )
}

pub fn get(self: Hyposelenia, path: String, action: Action) {
  route(self, path, action, handler.Get)
}
pub fn post(self: Hyposelenia, path: String, action: Action) {
  route(self, path, action, handler.Post)
}
pub fn head(self: Hyposelenia, path: String, action: Action) {
  route(self, path, action, handler.Head)
}
pub fn put(self: Hyposelenia, path: String, action: Action) {
  route(self, path, action, handler.Put)
}
pub fn delete(self: Hyposelenia, path: String, action: Action) {
  route(self, path, action, handler.Delete)
}
pub fn trace(self: Hyposelenia, path: String, action: Action) {
  route(self, path, action, handler.Trace)
}
pub fn connect(self: Hyposelenia, path: String, action: Action) {
  route(self, path, action, handler.Connect)
}
pub fn options(self: Hyposelenia, path: String, action: Action) {
  route(self, path, action, handler.Connect)
}
pub fn patch(self: Hyposelenia, path: String, action: Action) {
  route(self, path, action, handler.Connect)
}
