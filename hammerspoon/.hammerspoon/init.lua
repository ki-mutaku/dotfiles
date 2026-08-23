local open_wezterm = function()
	local appName = "WezTerm"
	local app = hs.application.get(appName)

	-- アプリが起動していない場合は起動、非表示なら表示、
	-- すでに前面にいるなら隠す（トグル動作）
	if app == nil or app:isHidden() or not (app:isFrontmost()) then
		hs.application.launchOrFocus(appName)
	else
		app:hide()
	end
end
-- 「Ctrl+j」のショートカットで表示／非表示を切り替える設定
hs.hotkey.bind({ "ctrl" }, "j", open_wezterm)
