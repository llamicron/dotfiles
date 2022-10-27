{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE Arrows #-}

import XMonad
import Graphics.X11.ExtraTypes.XF86
import qualified Data.Map as M
import qualified XMonad.StackSet as W
import XMonad.Hooks.DynamicLog
--
import XMonad.Layout.NoBorders
--
import Data.Ratio
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Spacing
import XMonad.Layout.Grid
import XMonad.Layout.IM

-- Default programs
myBrowser :: String
myBrowser = "firefox"

myMusic :: String
myMusic = "spotify"

-- Startup
main :: IO ()
main = do 
    xmonad =<< xmobar myConf

-- |Main configuration
myConf = defaultConfig
   {
     modMask = mod4Mask
   , terminal = "alacritty"
   , layoutHook = smartBorders $ myLayouts
   , workspaces = myWorkspaces
   , borderWidth = 2
   , focusedBorderColor = "#7fbbb3"
   , keys = myKeys
   }

-- | Keyboard keys
homeMask :: KeyMask
homeMask =  133 -- from the xev data

-- Custom keyboard shortcuts
keysToAdd x =
    [ ((mod4Mask, xK_F4 ), kill)
    , ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
    -- Programs
    , ((mod4Mask, xK_f), spawn myBrowser)
    , ((mod4Mask, xK_s), spawn myMusic)
    , ((mod4Mask, xK_d), spawn "discord")
    , ((mod4Mask, xK_a), spawn "firefox --new-window https://app.asana.com/")
    , ((mod4Mask, xK_g), spawn "firefox --new-tab https://github.com/")
    -- Volume Controls
    , ((mod4Mask .|. shiftMask, xK_comma), spawn "amixer -D pulse sset Master 10%-")
    , ((mod4Mask .|. shiftMask, xK_period), spawn "amixer -D pulse sset Master 10%+")
    , ((mod4Mask .|. shiftMask, xK_m), spawn "amixer -D pulse sset Master toggle")
    ]
    ++
    [((m .|. homeMask, k), windows $ f i) 
       | (i, k) <- zip (XMonad.workspaces defaultConfig) [10 .. 19]
       , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)] ]

keysToDel x = [] -- to delete the unused keys

myKeys x = foldr M.delete (keysToAdd' x) (keysToDel x)
  where
    -- to include new keys to existing keys
    keysToAdd' x = M.union (keys defaultConfig x) (M.fromList (keysToAdd x))

-- |Workspaces listing
myWorkspaces = ["1:work", "2:web", "3:org", "4:coms", "5:music"]

myLayouts = spacing 25 $ Tall 1 (3/100) (1/2) ||| Full
