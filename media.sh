#!/bin/sh

echo Hello! What are you creating today?
echo Type one of the following:  Video  Music  MusicVideo
read user_input

if [ $user_input == "Video" ]; then
	open -a imovie
	open -a messages

elif [ $user_input == "Music"  ]; then
	open -a garageband
	open -a messages
	open -a Music

else 
	open -a imovie
	open -a messages
	open -a Music
	open -a Users/dylantremmel/Downloads
fi

echo Type Stop when you're done or if you'd like to take a break
read user_answer

if [ $user_answer == "Stop" ]; then
	killall iMovie
	killall Messages
	killall Garageband
	killall Music
	echo Great work today!

end
