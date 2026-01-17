import http/header.{type Header}

pub type Response {
  Response(
    status   : Int,
    headers  : List(Header),
    body     : String
  )
}
