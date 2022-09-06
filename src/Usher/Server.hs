module Usher.Server (main) where

import Network.HTTP.Types (StdMethod (GET), ok200)
import Network.Wai.Handler.Warp qualified as Warp
import Relude
import WebGear.Server (RequestHandler, ServerHandler, respondA, route, toApplication, unlinkA)

main :: IO ()
main = Warp.run 3000 (toApplication routes)

routes :: RequestHandler (ServerHandler IO) '[]
routes = [route| GET / |] $
  proc _request ->
    unlinkA <<< respondA ok200 "text/plain" -< "Hello world!" :: String
