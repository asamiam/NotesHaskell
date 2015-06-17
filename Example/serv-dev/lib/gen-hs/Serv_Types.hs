{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-missing-fields #-}
{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-----------------------------------------------------------------
-- Autogenerated by Thrift Compiler (0.9.2)                      --
--                                                             --
-- DO NOT EDIT UNLESS YOU ARE SURE YOU KNOW WHAT YOU ARE DOING --
-----------------------------------------------------------------

module Serv_Types where
import Prelude (($), (.), (>>=), (==), (++))
import qualified Prelude as P
import qualified Control.Exception as X
import qualified Control.Monad as M ( liftM, ap, when )
import Data.Functor ( (<$>) )
import qualified Data.ByteString.Lazy as LBS
import qualified Data.Hashable as H
import qualified Data.Int as I
import qualified Data.Maybe as M (catMaybes)
import qualified Data.Text.Lazy.Encoding as E ( decodeUtf8, encodeUtf8 )
import qualified Data.Text.Lazy as LT
import qualified Data.Typeable as TY ( Typeable )
import qualified Data.HashMap.Strict as Map
import qualified Data.HashSet as Set
import qualified Data.Vector as Vector
import qualified Test.QuickCheck.Arbitrary as QC ( Arbitrary(..) )
import qualified Test.QuickCheck as QC ( elements )

import qualified Thrift as T
import qualified Thrift.Types as T
import qualified Thrift.Arbitraries as T


data ServArgs = ServArgs  { servArgs_myFlag :: P.Bool
  , servArgs_num1 :: I.Int32
  , servArgs_num2 :: I.Int32
  } deriving (P.Show,P.Eq,TY.Typeable)
instance H.Hashable ServArgs where
  hashWithSalt salt record = salt   `H.hashWithSalt` servArgs_myFlag record   `H.hashWithSalt` servArgs_num1 record   `H.hashWithSalt` servArgs_num2 record  
instance QC.Arbitrary ServArgs where 
  arbitrary = M.liftM ServArgs (QC.arbitrary)
          `M.ap`(QC.arbitrary)
          `M.ap`(QC.arbitrary)
  shrink obj | obj == default_ServArgs = []
             | P.otherwise = M.catMaybes
    [ if obj == default_ServArgs{servArgs_myFlag = servArgs_myFlag obj} then P.Nothing else P.Just $ default_ServArgs{servArgs_myFlag = servArgs_myFlag obj}
    , if obj == default_ServArgs{servArgs_num1 = servArgs_num1 obj} then P.Nothing else P.Just $ default_ServArgs{servArgs_num1 = servArgs_num1 obj}
    , if obj == default_ServArgs{servArgs_num2 = servArgs_num2 obj} then P.Nothing else P.Just $ default_ServArgs{servArgs_num2 = servArgs_num2 obj}
    ]
from_ServArgs :: ServArgs -> T.ThriftVal
from_ServArgs record = T.TStruct $ Map.fromList $ M.catMaybes
  [ (\_v2 -> P.Just (1, ("myFlag",T.TBool _v2))) $ servArgs_myFlag record
  , (\_v2 -> P.Just (2, ("num1",T.TI32 _v2))) $ servArgs_num1 record
  , (\_v2 -> P.Just (3, ("num2",T.TI32 _v2))) $ servArgs_num2 record
  ]
write_ServArgs :: (T.Protocol p, T.Transport t) => p t -> ServArgs -> P.IO ()
write_ServArgs oprot record = T.writeVal oprot $ from_ServArgs record
encode_ServArgs :: (T.Protocol p, T.Transport t) => p t -> ServArgs -> LBS.ByteString
encode_ServArgs oprot record = T.serializeVal oprot $ from_ServArgs record
to_ServArgs :: T.ThriftVal -> ServArgs
to_ServArgs (T.TStruct fields) = ServArgs{
  servArgs_myFlag = P.maybe (servArgs_myFlag default_ServArgs) (\(_,_val4) -> (case _val4 of {T.TBool _val5 -> _val5; _ -> P.error "wrong type"})) (Map.lookup (1) fields),
  servArgs_num1 = P.maybe (servArgs_num1 default_ServArgs) (\(_,_val4) -> (case _val4 of {T.TI32 _val6 -> _val6; _ -> P.error "wrong type"})) (Map.lookup (2) fields),
  servArgs_num2 = P.maybe (servArgs_num2 default_ServArgs) (\(_,_val4) -> (case _val4 of {T.TI32 _val7 -> _val7; _ -> P.error "wrong type"})) (Map.lookup (3) fields)
  }
to_ServArgs _ = P.error "not a struct"
read_ServArgs :: (T.Transport t, T.Protocol p) => p t -> P.IO ServArgs
read_ServArgs iprot = to_ServArgs <$> T.readVal iprot (T.T_STRUCT typemap_ServArgs)
decode_ServArgs :: (T.Protocol p, T.Transport t) => p t -> LBS.ByteString -> ServArgs
decode_ServArgs iprot bs = to_ServArgs $ T.deserializeVal iprot (T.T_STRUCT typemap_ServArgs) bs
typemap_ServArgs :: T.TypeMap
typemap_ServArgs = Map.fromList [(1,("myFlag",T.T_BOOL)),(2,("num1",T.T_I32)),(3,("num2",T.T_I32))]
default_ServArgs :: ServArgs
default_ServArgs = ServArgs{
  servArgs_myFlag = P.False,
  servArgs_num1 = 0,
  servArgs_num2 = 0}
