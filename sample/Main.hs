{-# LANGUAGE QuasiQuotes #-}

module Main (main) where

import           Data.Aeson (Value)
import           Network.HTTP.Req
                    ( GET(..)
                    , NoReqBody(..)
                    , defaultHttpConfig
                    , jsonResponse
                    , req
                    , responseBody
                    , runReq
                    )
import           Network.HTTP.Req.Url.Extra (toUrlHttps)
import           Text.URI.QQ (uri)

main :: IO ()
main = do
    let Just (url, opts) = toUrlHttps [uri|https://httpbin.org/get?a=value0&a=value1&b=value3#fragment|]
    v <- runReq defaultHttpConfig $ req GET url NoReqBody jsonResponse opts
    print (responseBody v :: Value)
