import gleam/option        . {type Option}
import http/header         . {type Header}
import hyposelenia/handler . {type Method}

pub type Protocol {
  HTTP
  HTTPS
}

pub type Query = List(#(String, String))
pub type Uri {
  Uri(
    scheme   : Protocol,
    host     : String,
    port     : Option(Int),
    path     : String,
    query    : Option(Query),
    fragment : Option(String),
  )
}

pub type Request(body) {
  Request(
    method  : Method,
    headers : List(Header),
    body    : body,
    url     : Uri
  )
}
