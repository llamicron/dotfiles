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
import XMonad.Layout.Gaps
import XMonad.Layout.Spiral
import XMonad.Layout.Grid
import XMonad.Layout.IM

-- Default programs
myBrowser :: String
myBrowser = "firefox"

myMusic :: String
myMusic = "spotify"

myFileManager :: String
myFileManager = "nautilus"

-- Startup
main :: IO ()
main = do 
    xmonad =<< xmobar myConf


myLayouts = spacing 25 $
            layoutTall ||| layoutGrid ||| layoutMirror ||| layoutFull
    where
      layoutTall = Tall 1 (3/100) (1/2)
      layoutSpiral = spiral (125 % 146)
      layoutGrid = Grid
      layoutMirror = Mirror (Tall 1 (3/100) (3/5))
      layoutFull = Full

-- myLayouts = spacing 0 $ Tall 1 (3/100) (1/2) ||| Full
-- myLayouts = gaps [(U, 25), (D, 25), (R, 25), (L, 25)] $ Tall 1 (3/100) (1/2) ||| Full


-- |Main configuration
myConf = defaultConfig
   {
     modMask = mod4Mask
   , terminal = "alacritty"
   -- , layoutHook = smartBorders $ myLayouts
   , layoutHook = smartBorders $ myLayouts
   , workspaces = myWorkspaces
   , borderWidth = 2
   -- Color taken from the kanagawa theme (blue)
   , focusedBorderColor = "#7e9cd8"
   , keys = myKeys
   }

-- | Keyboard keys
homeMask :: KeyMask
homeMask =  133 -- from the xev data

-- Custom keyboard shortcuts
keysToAdd x =
    [ ((mod4Mask, xK_F4 ), kill)
    , ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
    -- Grow/shrink the main window
    , ((mod4Mask, xK_h), sendMessage Shrink)
    , ((mod4Mask, xK_l), sendMessage Expand)
    -- Programs
    , ((mod4Mask, xK_f), spawn myBrowser)
    , ((mod4Mask, xK_s), spawn myMusic)
    , ((mod4Mask, xK_d), spawn "discord")
    , ((mod4Mask, xK_a), spawn "firefox --new-window https://app.asana.com/")
    , ((mod4Mask, xK_g), spawn "firefox --new-tab https://github.com/")
    , ((mod4Mask, xK_x), spawn "obsidian")
    , ((mod4Mask .|. shiftMask, xK_f), spawn myFileManager)
    -- Volume Controls
    , ((mod4Mask .|. shiftMask, xK_comma), spawn "amixer -D pulse sset Master 5%-")
    , ((mod4Mask .|. shiftMask, xK_period), spawn "amixer -D pulse sset Master 5%+")
    , ((mod4Mask .|. shiftMask, xK_m), spawn "amixer -D pulse sset Master toggle")
    -- Screenshot stuff
    -- mod+shift+[ will screenshot a rectangular area
    , ((mod4Mask .|. shiftMask, xK_bracketleft), spawn "ksnip -r")
    -- mod+shift+] will screenshot the current focused window 
    , ((mod4Mask .|. shiftMask, xK_bracketright), spawn "ksnip -a")

    ]
    ++
    [((m .|. homeMask, k), windows $ f i) 
       | (i, k) <- zip (XMonad.workspaces defaultConfig) [10 .. 19]
       , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
       ]

keysToDel x = [] -- to delete the unused keys

myKeys x = foldr M.delete (keysToAdd' x) (keysToDel x)
  where
    -- to include new keys to existing keys
    keysToAdd' x = M.union (keys defaultConfig x) (M.fromList (keysToAdd x))

-- |Workspaces listing
myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

