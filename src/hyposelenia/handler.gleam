import gleam/dict
import http/response .{type Response}

pub type Action = fn (Context) -> Response

pub type Context {
  Context(
    url: String,
    params: dict.Dict(String, String)
  )
}

pub type Path {
  Static(String)
  Slug(String)
  Wildcard
}

pub type Method {
  Get     Post    Head
  Put     Delete  Trace
  Connect Options Patch
}

pub type Handler {
  Handler(
    method : Method,
    route  : List(Path),
    action : Action
  )
}
