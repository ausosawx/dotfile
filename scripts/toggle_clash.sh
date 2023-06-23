a=$(pgrep clash-meta)
if [ -z "$a" ]; then
	clash-meta -d "$XDG_CONFIG_HOME"/clash-meta &
	notify-send "clash-meta" "启动" -u critical -i "$XDG_CONFIG_HOME"/waybar/icons/meta.png
	exit 0
fi

pgrep clash-meta | xargs kill -9
notify-send "clash-meta" "停止" -u critical -i "$XDG_CONFIG_HOME"/waybar/icons/meta.png
exit 0
