pub type ImageType {
  PNG
  JPG
  GIF
}

pub type MimeType {
  PlainText
  HTML
  JSON
  XML
  Image(ImageType)
}

pub type Cookie = List(#(String, String))

pub type Connection {
  KeepAlive
}

pub type Auth {
  Bearer
  Basic
}

pub type Header {
  Accept(String)
  AcceptCharset(String)
  AcceptEncoding(String)
  AcceptLanguage(String)
  Authorization(Auth, String)
  CacheControl(String)
  Connection(Connection)
  Cookie(Cookie)
  ContentLength(Int)
  ContentType(MimeType)
  Date(String)
  Expect(Int)
  From(String)
  Host(String)
  IfModifiedSince(String)
  IfNoneMatch(String)
  Referer(String)
  UserAgent(String)
  UpgradeInsecureRequests(Bool)
  XRequestedWith(String)
  Range(Int, Int)
}
