# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, aeson, async, blazeBuilder, bloomfilter, bup, byteable
, caseInsensitive, clientsession, cryptoApi, cryptohash, curl
, dataDefault, dataenc, DAV, dbus, dlist, dns, editDistance
, exceptions, fdoNotify, feed, filepath, git, gnupg1, gnutls
, hamlet, hinotify, hS3, hslogger, httpClient, httpConduit
, httpTypes, IfElse, json, lsof, MissingH, monadControl, mtl
, network, networkInfo, networkMulticast, networkProtocolXmpp
, networkUri, openssh, optparseApplicative, pathPieces, perl
, QuickCheck, random, regexTdfa, rsync, SafeSemaphore, securemem
, SHA, shakespeare, stm, tasty, tastyHunit, tastyQuickcheck
, tastyRerun, text, time, transformers, unixCompat, utf8String
, uuid, wai, waiExtra, warp, warpTls, which, xmlTypes, yesod
, yesodCore, yesodDefault, yesodForm, yesodStatic
}:

cabal.mkDerivation (self: {
  pname = "git-annex";
  version = "5.20140927";
  sha256 = "02zmg8pcrdavfna2xy51n6chn6i5g0b8p20rba1vj29rlfj3cask";
  isLibrary = false;
  isExecutable = true;
  buildDepends = [
    aeson async blazeBuilder bloomfilter byteable caseInsensitive
    clientsession cryptoApi cryptohash dataDefault dataenc DAV dbus
    dlist dns editDistance exceptions fdoNotify feed filepath gnutls
    hamlet hinotify hS3 hslogger httpClient httpConduit httpTypes
    IfElse json MissingH monadControl mtl network networkInfo
    networkMulticast networkProtocolXmpp networkUri optparseApplicative
    pathPieces QuickCheck random regexTdfa SafeSemaphore securemem SHA
    shakespeare stm tasty tastyHunit tastyQuickcheck tastyRerun text
    time transformers unixCompat utf8String uuid wai waiExtra warp
    warpTls xmlTypes yesod yesodCore yesodDefault yesodForm yesodStatic
  ];
  buildTools = [ bup curl git gnupg1 lsof openssh perl rsync which ];
  configureFlags = "-fAssistant -fProduction";
  preConfigure = ''
    sed -i 's/Extensions: PackageImports/Extensions: PackageImports, ViewPatterns/' git-annex.cabal
    sed -i 's/{-# LANGUAGE TemplateHaskell, MultiParamTypeClasses #-}/{-# LANGUAGE TemplateHaskell, MultiParamTypeClasses, OverloadedStrings #-}/' Assistant/Threads/WebApp.hs

    export HOME=$TEMPDIR
  '';
  installPhase = "./Setup install";
  checkPhase = ''
    cp dist/build/git-annex/git-annex git-annex
    ./git-annex test
  '';
  propagatedUserEnvPkgs = [git lsof];
  meta = {
    homepage = "http://git-annex.branchable.com/";
    description = "manage files with git, without checking their contents into git";
    license = self.stdenv.lib.licenses.gpl3;
    platforms = self.ghc.meta.platforms;
    maintainers = with self.stdenv.lib.maintainers; [ simons ];
    broken = true;
  };
})
