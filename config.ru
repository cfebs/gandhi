# This is for testing using Rack

use Rack::Static,
  :urls => ["/img", "/js", "/css", "/data", "/fonts", "/vendor"],
  :root => "./"

run lambda { |env|
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'public, max-age=0'
    },
    File.open('./index.html', File::RDONLY)
  ]
}
