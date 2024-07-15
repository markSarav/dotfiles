# if type "xrandr"; then
#   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#     MONITOR=$m polybar --reload mark &
#   done
# else
#   polybar --reload mark &
# fi
killall -q polybar
polybar mark 2>&1 | tee -a /tmp/polybar.log & disown
echo "Polybar launched..."
