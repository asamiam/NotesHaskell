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

module Serv_Client(ping,myOp) where
import qualified Data.IORef as R
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


import Serv_Types
import Serv
seqid = R.newIORef 0
ping (ip,op) = do
  send_ping op
  recv_ping ip
send_ping op = do
  seq <- seqid
  seqn <- R.readIORef seq
  T.writeMessageBegin op ("ping", T.M_CALL, seqn)
  write_Ping_args op (Ping_args{})
  T.writeMessageEnd op
  T.tFlush (T.getTransport op)
recv_ping ip = do
  (fname, mtype, rseqid) <- T.readMessageBegin ip
  M.when (mtype == T.M_EXCEPTION) $ do { exn <- T.readAppExn ip ; T.readMessageEnd ip ; X.throw exn }
  res <- read_Ping_result ip
  T.readMessageEnd ip
  P.return ()
myOp (ip,op) arg_a arg_other = do
  send_myOp op arg_a arg_other
  recv_myOp ip
send_myOp op arg_a arg_other = do
  seq <- seqid
  seqn <- R.readIORef seq
  T.writeMessageBegin op ("myOp", T.M_CALL, seqn)
  write_MyOp_args op (MyOp_args{myOp_args_a=arg_a,myOp_args_other=arg_other})
  T.writeMessageEnd op
  T.tFlush (T.getTransport op)
recv_myOp ip = do
  (fname, mtype, rseqid) <- T.readMessageBegin ip
  M.when (mtype == T.M_EXCEPTION) $ do { exn <- T.readAppExn ip ; T.readMessageEnd ip ; X.throw exn }
  res <- read_MyOp_result ip
  T.readMessageEnd ip
  P.return $ myOp_result_success res
