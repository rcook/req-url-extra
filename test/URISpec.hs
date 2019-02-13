{-|
Module      : URISpec
Description : Tests for 'URI' module
Copyright   : (C) Richard Cook, 2018-2019
Licence     : MIT
Maintainer  : rcook@rcook.org
Stability   : stable
Portability : portable
-}

{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}

module URISpec (spec) where

import           Data.Maybe (isNothing)
import           Network.HTTP.Req (parseUrlHttp, parseUrlHttps)
import           Network.HTTP.Req.Url.Extra
import           Text.URI.QQ (uri)
import           Test.Hspec

-- | Variant of 'shouldSatisfy' where 'a' does not have to have a 'Show'
-- instance
shouldSatisfy' :: HasCallStack => a -> (a -> Bool) -> Expectation
v `shouldSatisfy'` p = let result = p v in result `shouldBe` True

spec :: Spec
spec = do
    describe "toUrlHttp" $ do
        it "parses HTTP URI" $ do
            -- 'Option' is opaque so there is no way to validate the query parameters
            let Just (actualUrl, _) = toUrlHttp [uri|http://httpbin.org/|]
                Just (expectedUrl, _) = parseUrlHttp "http://httpbin.org/"
            actualUrl `shouldBe` expectedUrl
        it "fails to parse HTTPS URI" $
            toUrlHttp [uri|https://httpbin.org/|] `shouldSatisfy'` isNothing
    describe "toUrlHttps" $ do
        it "parses HTTPS URI" $ do
            -- 'Option' is opaque so there is no way to validate the query parameters
            let Just (actualUrl, _) = toUrlHttps [uri|https://httpbin.org/|]
                Just (expectedUrl, _) = parseUrlHttps "https://httpbin.org/"
            actualUrl `shouldBe` expectedUrl
        it "fails to parse HTTPS URI" $
            toUrlHttps [uri|http://httpbin.org/|] `shouldSatisfy'` isNothing
