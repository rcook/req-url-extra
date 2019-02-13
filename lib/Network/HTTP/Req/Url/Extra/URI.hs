{-|
Module      : Network.HTTP.Req.Url.Extra.URI
Description : Functions for converting 'URI' to 'Url'
Copyright   : (C) Richard Cook, 2018-2019
Licence     : MIT
Maintainer  : rcook@rcook.org
Stability   : stable
Portability : portable

This module provides functions to convert from 'URI' (defined in
<https://hackage.haskell.org/package/modern-uri modern-uri>) to 'Url'
defined in <https://hackage.haskell.org/package/req Req>.
-}

{-# LANGUAGE DataKinds #-}

module Network.HTTP.Req.Url.Extra.URI
    ( toUrlHttp
    , toUrlHttps
    ) where

import           Network.HTTP.Req (Option, Scheme(..), Url, parseUrlHttp, parseUrlHttps)
import           Text.URI (URI, renderBs)

-- | 'toUrlHttp' converts an instance of 'URI' to an instance of 'Url' and
-- 'Option'. If the @URI@ is not a valid @http@ URI, then this function
-- will return 'Nothing'.
--
-- This function parses scheme, host and path, returned as part of 'Url',
-- and optional query parameters, returned in 'Option'. It does not parse
-- method name or authentication info from the given 'URI'.
toUrlHttp ::
    URI                                 -- ^ URI
    -> Maybe (Url 'Http, Option scheme) -- ^ Combination of 'Url' and 'Option', 'Nothing' on failure
toUrlHttp = parseUrlHttp . renderBs

-- | 'toUrlHttp' converts an instance of 'URI' to an instance of 'Url' and
-- 'Option'. If the @URI@ is not a valid @https@ URI, then this function
-- will return 'Nothing'.
--
-- This function parses scheme, host and path, returned as part of 'Url',
-- and optional query parameters, returned in 'Option'. It does not parse
-- method name or authentication info from the given 'URI'.
toUrlHttps ::
    URI                                     -- ^ URI
    -> Maybe (Url 'Https, Option scheme)    -- ^ Combination of 'Url' and 'Option', 'Nothing' on failure
toUrlHttps = parseUrlHttps . renderBs
