import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.EZConfig
import XMonad.Layout.Grid
import XMonad.Layout.Spacing
import qualified XMonad.Actions.DynamicWorkspaceOrder as DO
import System.IO

-- Default terminal
myTerminal :: String
myTerminal = "alacritty"

myBrowser :: String
myBrowser = "firefox "

-- Set space between windows
-- For some reason, updating the values here and reloading doesn't work. You have to comment out
-- the layoutHook = line below and reload, then bring it back and reload again. Weird.
myLayouts = spacing 25 $ Tall 1 (3/100) (1/2) ||| Full
-- a change

main = do
    xmproc <- spawnPipe "xmobar"

    xmonad $ defaultConfig
        { manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = myLayouts
        -- , layoutHook = spacingWithEdge 10 $ myLayouts
        , handleEventHook = handleEventHook defaultConfig <+> docksEventHook
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        , borderWidth = 2
        , focusedBorderColor = "#7fbbb3"
        , terminal = myTerminal
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        -- Make alacritty the default terminal on mod+shift+enter
        ]
