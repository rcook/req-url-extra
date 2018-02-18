{-# LANGUAGE QuasiQuotes #-}

module Main (main) where

import           Data.Aeson (Value)
import           Data.Default.Class (def)
import           Network.HTTP.Req (GET(..), NoReqBody(..), jsonResponse, req, responseBody, runReq)
import           Network.HTTP.Req.Url.Extra (toUrlHttps)
import           Text.URI.QQ (uri)

main :: IO ()
main = do
    let Just (url, opts) = toUrlHttps [uri|https://httpbin.org/get?a=value0&a=value1&b=value3#fragment|]
    v <- runReq def $ req GET url NoReqBody jsonResponse opts
    print (responseBody v :: Value)
